.class Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;
.super Ljava/lang/Object;
.source "HtmlBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Patterns"
.end annotation


# instance fields
.field public final BLOCK_PATTERNS:[[Ljava/util/regex/Pattern;

.field public final COMMENT_PATTERN_INDEX:I


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 11

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 32
    iput v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->COMMENT_PATTERN_INDEX:I

    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_TAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const-string v3, ""

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 38
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\\Q"

    .line 39
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\\E"

    .line 41
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    const-string v3, "|"

    goto :goto_0

    .line 45
    :cond_0
    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HTML_FOR_TRANSLATOR:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 47
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->TRANSLATION_HTML_BLOCK_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 48
    invoke-virtual {v2, p2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 54
    const-string v1, "^<(?:script|pre|style)(?:\\s|>|$)"

    .line 57
    invoke-static {v1, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    const-string v2, "</(?:script|pre|style)>"

    .line 58
    invoke-static {v2, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    new-array v3, v0, [Ljava/util/regex/Pattern;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v1, 0x1

    aput-object v2, v3, v1

    const-string v2, "^<!--"

    .line 61
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    const-string v5, "-->"

    .line 62
    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    new-array v6, v0, [Ljava/util/regex/Pattern;

    aput-object v2, v6, v4

    aput-object v5, v6, v1

    const-string v2, "^<[?]"

    .line 65
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    const-string v5, "\\?>"

    .line 66
    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    new-array v7, v0, [Ljava/util/regex/Pattern;

    aput-object v2, v7, v4

    aput-object v5, v7, v1

    const-string v2, "^<![A-Z]"

    .line 69
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    const-string v5, ">"

    .line 70
    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    new-array v8, v0, [Ljava/util/regex/Pattern;

    aput-object v2, v8, v4

    aput-object v5, v8, v1

    const-string v2, "^<!\\[CDATA\\["

    .line 73
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    const-string v5, "\\]\\]>"

    .line 74
    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    new-array v9, v0, [Ljava/util/regex/Pattern;

    aput-object v2, v9, v4

    aput-object v5, v9, v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "^</?(?:"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ")(?:\\s|[/]?[>]|$)"

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 77
    invoke-static {p2, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p2

    new-array v2, v0, [Ljava/util/regex/Pattern;

    aput-object p2, v2, v4

    const/4 p2, 0x0

    aput-object p2, v2, v1

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v10, "^(?:"

    invoke-direct {v5, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p1, Lcom/vladsch/flexmark/ast/util/Parsing;->OPENTAG:Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v10, 0x7c

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/vladsch/flexmark/ast/util/Parsing;->CLOSETAG:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")\\s*$"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 81
    invoke-static {p1, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    new-array v5, v0, [Ljava/util/regex/Pattern;

    aput-object p1, v5, v4

    aput-object p2, v5, v1

    const/16 p1, 0x8

    new-array p1, p1, [[Ljava/util/regex/Pattern;

    new-array v10, v0, [Ljava/util/regex/Pattern;

    aput-object p2, v10, v4

    aput-object p2, v10, v1

    aput-object v10, p1, v4

    aput-object v3, p1, v1

    aput-object v6, p1, v0

    const/4 p2, 0x3

    aput-object v7, p1, p2

    const/4 p2, 0x4

    aput-object v8, p1, p2

    const/4 p2, 0x5

    aput-object v9, p1, p2

    const/4 p2, 0x6

    aput-object v2, p1, p2

    const/4 p2, 0x7

    aput-object v5, p1, p2

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->BLOCK_PATTERNS:[[Ljava/util/regex/Pattern;

    return-void
.end method
