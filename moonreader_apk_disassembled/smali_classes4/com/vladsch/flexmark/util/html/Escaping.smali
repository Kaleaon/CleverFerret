.class public Lcom/vladsch/flexmark/util/html/Escaping;
.super Ljava/lang/Object;
.source "Escaping.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/util/html/Escaping$Replacer;
    }
.end annotation


# static fields
.field private static final AMP_ONLY:Ljava/util/regex/Pattern;

.field private static final BACKSLASH_ONLY:Ljava/util/regex/Pattern;

.field private static final BACKSLASH_OR_AMP:Ljava/util/regex/Pattern;

.field private static final COLLAPSE_WHITESPACE:Ljava/util/regex/Pattern;

.field private static final COLLAPSE_WHITESPACE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

.field private static final ENTITY:Ljava/lang/String; = "&(?:#x[a-f0-9]{1,8}|#[0-9]{1,8}|[a-z][a-z0-9]{1,31});"

.field private static final ENTITY_ONLY:Ljava/util/regex/Pattern;

.field private static final ENTITY_OR_ESCAPED_CHAR:Ljava/util/regex/Pattern;

.field private static final ENTITY_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

.field public static final ESCAPABLE:Ljava/lang/String; = "[!\"#$%&\'()*+,./:;<=>?@\\[\\\\\\]^_`{|}~-]"

.field private static final ESCAPED_CHAR:Ljava/util/regex/Pattern;

.field private static final ESCAPE_IN_URI:Ljava/util/regex/Pattern;

.field static final HEX_DIGITS:[C

.field private static final REMOVE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

.field private static final UNESCAPE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

.field private static final UNSAFE_CHAR_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

.field private static final URI_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

.field private static final WHITESPACE:Ljava/util/regex/Pattern;

.field private static final XML_SPECIAL:Ljava/lang/String; = "[&<>\"]"

.field private static final XML_SPECIAL_OR_ENTITY:Ljava/util/regex/Pattern;

.field private static final XML_SPECIAL_RE:Ljava/util/regex/Pattern;

.field private static random:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    const-string v0, "[\\\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->BACKSLASH_ONLY:Ljava/util/regex/Pattern;

    .line 21
    const-string v0, "\\\\[!\"#$%&\'()*+,./:;<=>?@\\[\\\\\\]^_`{|}~-]"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ESCAPED_CHAR:Ljava/util/regex/Pattern;

    .line 23
    const-string v0, "[\\\\&]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->BACKSLASH_OR_AMP:Ljava/util/regex/Pattern;

    .line 25
    const-string v0, "[\\&]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->AMP_ONLY:Ljava/util/regex/Pattern;

    .line 27
    const-string v0, "\\\\[!\"#$%&\'()*+,./:;<=>?@\\[\\\\\\]^_`{|}~-]|&(?:#x[a-f0-9]{1,8}|#[0-9]{1,8}|[a-z][a-z0-9]{1,31});"

    .line 28
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_OR_ESCAPED_CHAR:Ljava/util/regex/Pattern;

    .line 30
    const-string v0, "&(?:#x[a-f0-9]{1,8}|#[0-9]{1,8}|[a-z][a-z0-9]{1,31});"

    .line 31
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_ONLY:Ljava/util/regex/Pattern;

    .line 35
    const-string v0, "[&<>\"]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->XML_SPECIAL_RE:Ljava/util/regex/Pattern;

    .line 37
    const-string v0, "&(?:#x[a-f0-9]{1,8}|#[0-9]{1,8}|[a-z][a-z0-9]{1,31});|[&<>\"]"

    .line 38
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->XML_SPECIAL_OR_ENTITY:Ljava/util/regex/Pattern;

    .line 41
    const-string v0, "(%[a-fA-F0-9]{0,2}|[^:/?#@!$&\'()*+,;=a-zA-Z0-9\\-._~])"

    .line 42
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ESCAPE_IN_URI:Ljava/util/regex/Pattern;

    const/16 v0, 0x10

    .line 44
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->HEX_DIGITS:[C

    .line 47
    const-string v0, "[ \t\r\n]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->WHITESPACE:Ljava/util/regex/Pattern;

    .line 49
    const-string v0, "[ \t]{2,}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->COLLAPSE_WHITESPACE:Ljava/util/regex/Pattern;

    .line 51
    new-instance v0, Lcom/vladsch/flexmark/util/html/Escaping$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Escaping$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->UNSAFE_CHAR_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    .line 84
    new-instance v0, Lcom/vladsch/flexmark/util/html/Escaping$2;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Escaping$2;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->COLLAPSE_WHITESPACE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    .line 96
    new-instance v0, Lcom/vladsch/flexmark/util/html/Escaping$3;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Escaping$3;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->UNESCAPE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    .line 116
    new-instance v0, Lcom/vladsch/flexmark/util/html/Escaping$4;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Escaping$4;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->REMOVE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    .line 128
    new-instance v0, Lcom/vladsch/flexmark/util/html/Escaping$5;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Escaping$5;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    .line 140
    new-instance v0, Lcom/vladsch/flexmark/util/html/Escaping$6;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Escaping$6;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->URI_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    .line 479
    new-instance v0, Ljava/util/Random;

    const-wide/16 v1, 0x2626

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->random:Ljava/util/Random;

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collapseWhitespace(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 561
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->COLLAPSE_WHITESPACE:Ljava/util/regex/Pattern;

    sget-object v1, Lcom/vladsch/flexmark/util/html/Escaping;->COLLAPSE_WHITESPACE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {v0, p0, v1, p1}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method public static collapseWhitespace(Ljava/lang/CharSequence;Z)Ljava/lang/String;
    .locals 8

    .line 542
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 543
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const/16 v5, 0x20

    if-ge v3, v1, :cond_4

    .line 547
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    if-eq v6, v5, :cond_3

    const/16 v7, 0x9

    if-eq v6, v7, :cond_3

    const/16 v7, 0xa

    if-eq v6, v7, :cond_3

    const/16 v7, 0xd

    if-ne v6, v7, :cond_0

    goto :goto_1

    :cond_0
    if-eqz v4, :cond_2

    if-eqz p1, :cond_1

    .line 551
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_2

    :cond_1
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 552
    :cond_2
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v4, 0x1

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    if-eqz v4, :cond_5

    if-nez p1, :cond_5

    .line 556
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 557
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static encode(C)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x22

    if-eq p0, v0, :cond_4

    const/16 v0, 0x3c

    if-eq p0, v0, :cond_3

    const/16 v0, 0x3e

    if-eq p0, v0, :cond_2

    const/16 v0, 0x26

    if-eq p0, v0, :cond_1

    const/16 v0, 0x27

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 474
    :cond_0
    const-string p0, "&#39;"

    return-object p0

    .line 466
    :cond_1
    const-string p0, "&amp;"

    return-object p0

    .line 470
    :cond_2
    const-string p0, "&gt;"

    return-object p0

    .line 468
    :cond_3
    const-string p0, "&lt;"

    return-object p0

    .line 472
    :cond_4
    const-string p0, "&quot;"

    return-object p0
.end method

.method public static escapeHtml(Lcom/vladsch/flexmark/util/sequence/BasedSequence;ZLcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    if-eqz p1, :cond_0

    .line 194
    sget-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->XML_SPECIAL_OR_ENTITY:Ljava/util/regex/Pattern;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->XML_SPECIAL_RE:Ljava/util/regex/Pattern;

    .line 195
    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->UNSAFE_CHAR_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {p1, p0, v0, p2}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method public static escapeHtml(Ljava/lang/CharSequence;Z)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_0

    .line 189
    sget-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->XML_SPECIAL_OR_ENTITY:Ljava/util/regex/Pattern;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->XML_SPECIAL_RE:Ljava/util/regex/Pattern;

    .line 190
    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->UNSAFE_CHAR_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {p1, p0, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static normalizeEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x0

    .line 384
    invoke-static {p0, p1, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method public static normalizeEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 9

    .line 399
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    .line 404
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->isModified()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->startNestedReplacement(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v2, v0, :cond_6

    .line 407
    invoke-interface {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v6

    const/16 v7, 0xd

    const/4 v8, 0x1

    if-ne v6, v7, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/16 v7, 0xa

    if-ne v6, v7, :cond_3

    if-eqz v3, :cond_5

    add-int/lit8 v3, v2, -0x1

    if-ge v4, v3, :cond_2

    .line 413
    invoke-virtual {p1, v4, v3}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addOriginalText(II)V

    :cond_2
    move v4, v2

    const/4 v3, 0x0

    const/4 v5, 0x1

    goto :goto_1

    :cond_3
    if-eqz v3, :cond_5

    add-int/lit8 v3, v2, -0x1

    if-ge v4, v3, :cond_4

    add-int/lit8 v5, v2, 0x1

    .line 420
    invoke-virtual {p1, v4, v5}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addOriginalText(II)V

    .line 421
    :cond_4
    sget-object v4, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1, v3, v2, v4}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    move v4, v2

    const/4 v3, 0x0

    const/4 v5, 0x0

    :cond_5
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    if-nez v3, :cond_8

    if-ge v4, v0, :cond_7

    .line 434
    invoke-virtual {p1, v4, v0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addOriginalText(II)V

    :cond_7
    if-nez v5, :cond_8

    if-eqz p2, :cond_8

    add-int/lit8 p0, v0, -0x1

    .line 435
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1, p0, v0, p2}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addReplacedText(IILcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 438
    :cond_8
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->getReplacedSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method public static normalizeEOL(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 325
    invoke-static {p0, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEOL(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static normalizeEOL(Ljava/lang/CharSequence;Z)Ljava/lang/String;
    .locals 10

    .line 337
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 338
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    const/16 v6, 0xa

    if-ge v3, v1, :cond_3

    .line 343
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    const/16 v8, 0xd

    const/4 v9, 0x1

    if-ne v7, v8, :cond_0

    const/4 v5, 0x1

    goto :goto_2

    :cond_0
    if-ne v7, v6, :cond_1

    .line 347
    const-string v4, "\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    :goto_1
    const/4 v5, 0x0

    goto :goto_2

    :cond_1
    if-eqz v5, :cond_2

    .line 351
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 352
    :cond_2
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    goto :goto_1

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    if-eqz p1, :cond_4

    if-nez v4, :cond_4

    .line 357
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 358
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static normalizeEndWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    const/4 v0, 0x1

    .line 372
    invoke-static {p0, p1, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method public static normalizeEndWithEOL(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 314
    invoke-static {p0, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEOL(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static normalizeReference(Ljava/lang/CharSequence;Z)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 459
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->collapseWhitespace(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 460
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->collapseWhitespace(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static normalizeReferenceChars(Ljava/lang/CharSequence;Z)Ljava/lang/String;
    .locals 5

    .line 525
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    .line 526
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v2, 0x3a

    const/4 v3, 0x2

    if-ne v0, v2, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const/4 v2, 0x0

    .line 527
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/16 v4, 0x21

    if-ne v2, v4, :cond_1

    const/4 v1, 0x2

    .line 528
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-interface {p0, v1, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeReference(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 530
    :cond_2
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static obfuscate(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 5

    if-nez p1, :cond_0

    .line 490
    new-instance p1, Ljava/util/Random;

    const-wide/16 v0, 0x0

    invoke-direct {p1, v0, v1}, Ljava/util/Random;-><init>(J)V

    sput-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->random:Ljava/util/Random;

    .line 492
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v0, 0x0

    .line 493
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 494
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 495
    sget-object v2, Lcom/vladsch/flexmark/util/html/Escaping;->random:Ljava/util/Random;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    const/16 v3, 0x3b

    if-eqz v2, :cond_4

    const/4 v4, 0x1

    if-eq v2, v4, :cond_4

    const/4 v4, 0x2

    if-eq v2, v4, :cond_3

    const/4 v4, 0x3

    if-eq v2, v4, :cond_3

    const/4 v3, 0x4

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 505
    :cond_1
    invoke-static {v1}, Lcom/vladsch/flexmark/util/html/Escaping;->encode(C)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 506
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 507
    :cond_2
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 502
    :cond_3
    const-string v2, "&#x"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 498
    :cond_4
    const-string v2, "&#"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 510
    :cond_5
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static percentEncodeUrl(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    .line 447
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ESCAPE_IN_URI:Ljava/util/regex/Pattern;

    sget-object v1, Lcom/vladsch/flexmark/util/html/Escaping;->URI_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {v0, p0, v1}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static removeAll(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 264
    invoke-interface {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(Ljava/lang/CharSequence;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 266
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\\Q"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\\E"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->REMOVE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {p1, p0, v0, p2}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method private static replaceAll(Ljava/util/regex/Pattern;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 586
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 588
    invoke-virtual {p3}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->isModified()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 589
    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->startNestedReplacement(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 592
    :cond_0
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 593
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p0

    invoke-virtual {p3, v1, p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addOriginalText(II)V

    return-object p1

    .line 599
    :cond_1
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->start()I

    move-result v0

    invoke-virtual {p3, v1, v0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addOriginalText(II)V

    .line 600
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->start()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    invoke-interface {p2, p1, v0, v1, p3}, Lcom/vladsch/flexmark/util/html/Escaping$Replacer;->replace(Lcom/vladsch/flexmark/util/sequence/BasedSequence;IILcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)V

    .line 601
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    .line 602
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_1

    .line 604
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p0

    if-eq v1, p0, :cond_2

    .line 605
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p0

    invoke-virtual {p3, v1, p0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->addOriginalText(II)V

    .line 608
    :cond_2
    invoke-virtual {p3}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->getReplacedSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method

.method private static replaceAll(Ljava/util/regex/Pattern;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;)Ljava/lang/String;
    .locals 3

    .line 565
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 567
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_0

    .line 568
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 571
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x10

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    .line 574
    :cond_1
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 575
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1, v0}, Lcom/vladsch/flexmark/util/html/Escaping$Replacer;->replace(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 576
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    .line 577
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_1

    .line 579
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-eq v1, p0, :cond_2

    .line 580
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p0

    invoke-virtual {v0, p1, v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 582
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static unescape(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/16 v0, 0x5c

    const/16 v1, 0x26

    .line 246
    invoke-interface {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOfAny(CC)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 248
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_OR_ESCAPED_CHAR:Ljava/util/regex/Pattern;

    sget-object v1, Lcom/vladsch/flexmark/util/html/Escaping;->UNESCAPE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {v0, p0, v1, p1}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static unescapeHtml(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    const/16 v0, 0x26

    .line 296
    invoke-interface {p0, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 298
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_ONLY:Ljava/util/regex/Pattern;

    sget-object v1, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {v0, p0, v1, p1}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static unescapeHtml(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    .line 280
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->AMP_ONLY:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 281
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_ONLY:Ljava/util/regex/Pattern;

    sget-object v1, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {v0, p0, v1}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 283
    :cond_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static unescapeString(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    .line 206
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->BACKSLASH_OR_AMP:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_OR_ESCAPED_CHAR:Ljava/util/regex/Pattern;

    sget-object v1, Lcom/vladsch/flexmark/util/html/Escaping;->UNESCAPE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {v0, p0, v1}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 209
    :cond_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static unescapeString(Ljava/lang/CharSequence;Z)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_1

    .line 223
    sget-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->BACKSLASH_OR_AMP:Ljava/util/regex/Pattern;

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 224
    sget-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->ESCAPED_CHAR:Ljava/util/regex/Pattern;

    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->UNESCAPE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {p1, p0, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 226
    :cond_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 229
    :cond_1
    sget-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->BACKSLASH_ONLY:Ljava/util/regex/Pattern;

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 230
    sget-object p1, Lcom/vladsch/flexmark/util/html/Escaping;->ENTITY_OR_ESCAPED_CHAR:Ljava/util/regex/Pattern;

    sget-object v0, Lcom/vladsch/flexmark/util/html/Escaping;->UNESCAPE_REPLACER:Lcom/vladsch/flexmark/util/html/Escaping$Replacer;

    invoke-static {p1, p0, v0}, Lcom/vladsch/flexmark/util/html/Escaping;->replaceAll(Ljava/util/regex/Pattern;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Escaping$Replacer;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 232
    :cond_2
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
