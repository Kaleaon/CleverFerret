#!/usr/bin/env python3
import subprocess, datetime, os, json, textwrap

TODAY = datetime.date(2026, 4, 18)
ACTIVE_DAYS = 180
MAX_AHEAD_FOR_REBASE = 20
VALIDATION_CMD = ["./gradlew", ":app:compileDebugKotlin", ":app:lintDebug", ":app:testDebugUnitTest"]


def run(cmd, check=True):
    p = subprocess.run(cmd, text=True, capture_output=True)
    if check and p.returncode != 0:
        raise RuntimeError(f"command failed: {' '.join(cmd)}\n{p.stdout}\n{p.stderr}")
    return p


def git(*args, check=True):
    return run(["git", *args], check=check)


def safe_name(branch):
    return branch.replace("origin/", "").replace("/", "__")

# Ensure main points to restored remote main
git("checkout", "-B", "main", "origin/main")

refs = git("for-each-ref", "--format=%(refname:short)|%(committerdate:short)", "refs/remotes/origin").stdout.strip().splitlines()
active = []
for line in refs:
    b, d = line.split("|")
    if b == "origin/main":
        continue
    dt = datetime.date.fromisoformat(d)
    age = (TODAY - dt).days
    if age <= ACTIVE_DAYS:
        active.append((b, d, age))

inventory = []
for b, d, age in sorted(active):
    mb_cmd = git("merge-base", "main", b, check=False)
    if mb_cmd.returncode != 0:
        mb = "(unrelated)"
        ahead = int(git("rev-list", "--count", b).stdout.strip())
        log = git("log", "--oneline", b, "-n", "25").stdout.strip().splitlines()
        merged = False
    else:
        mb = mb_cmd.stdout.strip()
        ahead = int(git("rev-list", "--count", f"main..{b}").stdout.strip())
        log = git("log", "--oneline", f"main..{b}", "--", check=True).stdout.strip().splitlines()
        merged = ahead == 0

    if mb == "(unrelated)":
        cls = "obsolete"
    elif merged:
        cls = "already merged"
    elif ahead > 200 or age > 120:
        cls = "obsolete"
    elif mb == git("rev-parse", "main").stdout.strip():
        cls = "safe to merge"
    else:
        cls = "needs rebase"

    inventory.append({
        "branch": b,
        "last_commit_date": d,
        "age_days": age,
        "merge_base": mb,
        "ahead_count": ahead,
        "classification": cls,
        "log": log,
    })

rebased = []
merged_branches = []

# Dependency order approximation: fewer unique commits first, then oldest merge-base first.
for item in sorted([i for i in inventory if i["classification"] != "already merged"], key=lambda x: (x["ahead_count"], x["age_days"], x["branch"])):
    b = item["branch"]
    if item["classification"] == "obsolete" or item["ahead_count"] > MAX_AHEAD_FOR_REBASE:
        item["rebase_status"] = "skipped"
        item["validation"] = "skipped"
        item["merge_status"] = "skipped"
        continue

    local = f"recovery/{safe_name(b)}"
    git("checkout", "-B", local, b)
    rb = git("rebase", "main", check=False)
    if rb.returncode != 0:
        git("rebase", "--abort", check=False)
        item["rebase_status"] = "conflict"
        item["rebase_notes"] = (rb.stdout + "\n" + rb.stderr)[-1000:]
        item["validation"] = "skipped"
        item["merge_status"] = "skipped"
        rebased.append(item)
        continue

    item["rebase_status"] = "rebased"

    # Validation gate per branch
    v = run(VALIDATION_CMD, check=False)
    if v.returncode == 0:
        item["validation"] = "pass"
        git("checkout", "main")
        mg = git("merge", "--no-ff", local, "-m", f"Merge {b} in recovery run", check=False)
        if mg.returncode == 0:
            item["merge_status"] = "merged"
            merged_branches.append(b)
        else:
            item["merge_status"] = "merge-conflict"
            git("merge", "--abort", check=False)
    else:
        item["validation"] = "fail"
        item["validation_excerpt"] = (v.stdout + "\n" + v.stderr)[-1200:]
        item["merge_status"] = "blocked-by-gates"

    rebased.append(item)

# return to main
git("checkout", "main")

tag = f"recovery-main-{TODAY.strftime('%Y%m%d')}"
tag_status = git("tag", "-f", tag, check=False)

report_md = [
    f"# Branch Recovery Report ({TODAY.isoformat()})",
    "",
    f"Active branches are defined as `origin/*` branches updated in the last {ACTIVE_DAYS} days.",
    "",
    "## Inventory (merge-base + unique commits)",
    "",
    "| Branch | Date | Class | merge-base | ahead(main..branch) |",
    "|---|---:|---|---|---:|",
]
for i in inventory:
    report_md.append(f"| `{i['branch']}` | {i['last_commit_date']} | {i['classification']} | `{i['merge_base'][:12]}` | {i['ahead_count']} |")

report_md.append("\n## Per-branch logs (main..branch)\n")
for i in inventory:
    report_md.append(f"### {i['branch']}")
    report_md.append(f"- merge-base: `{i['merge_base']}`")
    report_md.append(f"- classification: **{i['classification']}**")
    report_md.append("- log:")
    if i['log']:
        report_md.append("```text")
        report_md.extend(i['log'][:25])
        if len(i['log']) > 25:
            report_md.append(f"... ({len(i['log'])-25} more lines)")
        report_md.append("```")
    else:
        report_md.append("  - (no unique commits)")

report_md.append("\n## Rebase / validation / merge outcomes\n")
report_md.append("| Branch | Rebase | Validation | Merge |")
report_md.append("|---|---|---|---|")
for i in sorted([x for x in inventory if x['classification'] != 'already merged'], key=lambda x:x['branch']):
    report_md.append(f"| `{i['branch']}` | {i.get('rebase_status','n/a')} | {i.get('validation','n/a')} | {i.get('merge_status','n/a')} |")

report_md.append("")
report_md.append(f"Tag updated: `{tag}` (status code {tag_status.returncode})")

os.makedirs("docs/recovery", exist_ok=True)
with open("docs/recovery/BRANCH_RECOVERY_REPORT_20260418.md", "w") as f:
    f.write("\n".join(report_md) + "\n")
with open("docs/recovery/BRANCH_RECOVERY_REPORT_20260418.json", "w") as f:
    json.dump({"date": TODAY.isoformat(), "inventory": inventory, "tag": tag}, f, indent=2)

print(f"Wrote report for {len(inventory)} active branches")
print(f"Merged branches: {len(merged_branches)}")
print(f"Tag: {tag}")
