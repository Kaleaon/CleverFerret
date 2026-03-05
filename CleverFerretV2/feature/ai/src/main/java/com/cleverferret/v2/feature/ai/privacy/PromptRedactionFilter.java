package com.cleverferret.v2.feature.ai.privacy;

import java.util.regex.Pattern;

public final class PromptRedactionFilter {
    private static final Pattern EMAIL_PATTERN = Pattern.compile("[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+");
    private static final Pattern API_KEY_PATTERN = Pattern.compile("(?i)(api[_-]?key\\s*[:=]\\s*)([A-Za-z0-9-_]{8,})");

    public String redact(String prompt) {
        String noEmail = EMAIL_PATTERN.matcher(prompt).replaceAll("[REDACTED_EMAIL]");
        return API_KEY_PATTERN.matcher(noEmail).replaceAll("$1[REDACTED_SECRET]");
    }
}
