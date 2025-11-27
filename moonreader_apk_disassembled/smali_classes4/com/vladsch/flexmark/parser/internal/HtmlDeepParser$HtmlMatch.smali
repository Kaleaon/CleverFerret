.class public final enum Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;
.super Ljava/lang/Enum;
.source "HtmlDeepParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HtmlMatch"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum CDATA:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum CLOSE_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum COMMENT:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum NONE:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum NON_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum SCRIPT:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum STYLE:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final enum TEMPLATE:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;


# instance fields
.field public final caseInsentive:Z

.field public final close:Ljava/util/regex/Pattern;

.field public final open:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 9
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v1, "NONE"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->NONE:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 10
    new-instance v1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const-string v5, "</script>"

    const/4 v6, 0x1

    const-string v2, "SCRIPT"

    const/4 v3, 0x1

    const-string v4, "<(script)(?:\\s|>|$)"

    invoke-direct/range {v1 .. v6}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->SCRIPT:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 11
    new-instance v2, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const-string v6, "</style>"

    const/4 v7, 0x1

    const-string v3, "STYLE"

    const/4 v4, 0x2

    const-string v5, "<(style)(?:\\s|>|$)"

    invoke-direct/range {v2 .. v7}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v2, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->STYLE:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 12
    new-instance v3, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const-string v7, "<|/>|\\s/>|>"

    const/4 v8, 0x1

    const-string v4, "OPEN_TAG"

    const/4 v5, 0x3

    const-string v6, "<([A-Za-z][A-Za-z0-9-]*)"

    invoke-direct/range {v3 .. v8}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v3, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 13
    new-instance v4, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const/4 v8, 0x0

    const/4 v9, 0x1

    const-string v5, "CLOSE_TAG"

    const/4 v6, 0x4

    const-string v7, "</([A-Za-z][A-Za-z0-9-]*)>"

    invoke-direct/range {v4 .. v9}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v4, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->CLOSE_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 14
    new-instance v5, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const-string v9, ">"

    const/4 v10, 0x0

    const-string v6, "NON_TAG"

    const/4 v7, 0x5

    const-string v8, "<(![A-Z])"

    invoke-direct/range {v5 .. v10}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v5, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->NON_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 15
    new-instance v6, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const-string v10, "\\?>"

    const/4 v11, 0x0

    const-string v7, "TEMPLATE"

    const/4 v8, 0x6

    const-string v9, "<([?])"

    invoke-direct/range {v6 .. v11}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v6, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->TEMPLATE:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 16
    new-instance v7, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const-string v11, "-->"

    const/4 v12, 0x0

    const-string v8, "COMMENT"

    const/4 v9, 0x7

    const-string v10, "<(!--)"

    invoke-direct/range {v7 .. v12}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v7, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->COMMENT:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 17
    new-instance v8, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const-string v12, "\\]\\]>"

    const/4 v13, 0x0

    const-string v9, "CDATA"

    const/16 v10, 0x8

    const-string v11, "<!\\[(CDATA)\\["

    invoke-direct/range {v8 .. v13}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    sput-object v8, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->CDATA:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const/16 v9, 0x9

    .line 8
    new-array v9, v9, [Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const/4 v10, 0x0

    aput-object v0, v9, v10

    const/4 v0, 0x1

    aput-object v1, v9, v0

    const/4 v0, 0x2

    aput-object v2, v9, v0

    const/4 v0, 0x3

    aput-object v3, v9, v0

    const/4 v0, 0x4

    aput-object v4, v9, v0

    const/4 v0, 0x5

    aput-object v5, v9, v0

    const/4 v0, 0x6

    aput-object v6, v9, v0

    const/4 v0, 0x7

    aput-object v7, v9, v0

    const/16 v0, 0x8

    aput-object v8, v9, v0

    sput-object v9, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->$VALUES:[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x2

    const/4 p2, 0x0

    const/4 v0, 0x0

    if-nez p3, :cond_0

    move-object p3, v0

    goto :goto_1

    :cond_0
    if-eqz p5, :cond_1

    const/4 v1, 0x2

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 25
    :goto_0
    invoke-static {p3, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p3

    :goto_1
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->open:Ljava/util/regex/Pattern;

    if-nez p4, :cond_2

    goto :goto_3

    :cond_2
    if-eqz p5, :cond_3

    goto :goto_2

    :cond_3
    const/4 p1, 0x0

    .line 26
    :goto_2
    invoke-static {p4, p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    :goto_3
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->close:Ljava/util/regex/Pattern;

    .line 27
    iput-boolean p5, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->caseInsentive:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;
    .locals 1

    .line 8
    const-class v0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;
    .locals 1

    .line 8
    sget-object v0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->$VALUES:[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    return-object v0
.end method
