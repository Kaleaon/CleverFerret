.class public Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;
.super Ljava/lang/Object;
.source "HtmlDeepParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;
    }
.end annotation


# static fields
.field public static final BLOCK_TAGS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTIONAL_TAGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final PATTERN_MAP:[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field public static final START_PATTERN:Ljava/util/regex/Pattern;

.field public static final VOID_TAGS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final myBlockTags:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private myClosingPattern:Ljava/util/regex/Pattern;

.field private myHtmlCount:I

.field private myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

.field private final myOpenTags:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 31

    .line 37
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->BLOCK_TAGS:Ljava/util/Set;

    .line 38
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    sput-object v1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->VOID_TAGS:Ljava/util/Set;

    .line 54
    const-string v2, "address|article|aside|base|basefont|blockquote|body|caption|center|col|colgroup|dd|details|dialog|dir|div|dl|dt|fieldset|figcaption|figure|footer|form|frame|frameset|h1|h2|h3|h4|h5|h6|head|header|hr|html|iframe|legend|li|link|main|menu|menuitem|meta|nav|noframes|ol|optgroup|option|p|param|pre|section|source|summary|table|tbody|td|tfoot|th|thead|title|tr|track|ul"

    const-string v3, "\\|"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 55
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 57
    const-string v0, "area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 58
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->OPTIONAL_TAGS:Ljava/util/Map;

    .line 61
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "li"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "dt"

    const-string v3, "dd"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    new-instance v1, Ljava/util/HashSet;

    filled-new-array {v3, v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    new-instance v1, Ljava/util/HashSet;

    const-string v29, "table"

    const-string v30, "ul"

    const-string v2, "address"

    const-string v3, "article"

    const-string v4, "aside"

    const-string v5, "blockquote"

    const-string v6, "details"

    const-string v7, "div"

    const-string v8, "dl"

    const-string v9, "fieldset"

    const-string v10, "figcaption"

    const-string v11, "figure"

    const-string v12, "footer"

    const-string v13, "form"

    const-string v14, "h1"

    const-string v15, "h2"

    const-string v16, "h3"

    const-string v17, "h4"

    const-string v18, "h5"

    const-string v19, "h6"

    const-string v20, "header"

    const-string v21, "hr"

    const-string v22, "main"

    const-string v23, "menu"

    const-string v24, "nav"

    const-string v25, "ol"

    const-string v26, "p"

    const-string v27, "pre"

    const-string v28, "section"

    filled-new-array/range {v2 .. v30}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const-string v2, "p"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "rt"

    const-string v3, "rp"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    new-instance v1, Ljava/util/HashSet;

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "optgroup"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    new-instance v1, Ljava/util/HashSet;

    const-string v3, "option"

    filled-new-array {v3, v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "colgroup"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "tbody"

    const-string v3, "tfoot"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const-string v4, "thead"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    new-instance v1, Ljava/util/HashSet;

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    new-instance v1, Ljava/util/HashSet;

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "tr"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    new-instance v1, Ljava/util/HashSet;

    const-string v2, "td"

    const-string v3, "th"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    new-instance v1, Ljava/util/HashSet;

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    invoke-static {}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->values()[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->PATTERN_MAP:[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    invoke-static {}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->values()[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v5, v1, v3

    .line 82
    sget-object v6, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->NONE:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-eq v5, v6, :cond_2

    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "|"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    :cond_0
    iget-boolean v6, v5, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->caseInsentive:Z

    if-eqz v6, :cond_1

    .line 85
    const-string v6, "(?i:"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    iget-object v6, v5, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->open:Ljava/util/regex/Pattern;

    invoke-virtual {v6}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const-string v6, ")"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 89
    :cond_1
    iget-object v6, v5, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->open:Ljava/util/regex/Pattern;

    invoke-virtual {v6}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    :goto_1
    sget-object v6, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->PATTERN_MAP:[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    aput-object v5, v6, v4

    :cond_2
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 96
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->START_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 106
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;-><init>(Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 111
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    .line 112
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    const/4 v0, 0x0

    .line 113
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    .line 115
    new-instance v0, Ljava/util/HashSet;

    sget-object v1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->BLOCK_TAGS:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myBlockTags:Ljava/util/HashSet;

    .line 116
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method private openTag(Ljava/lang/String;)V
    .locals 3

    .line 153
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 156
    sget-object v1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->OPTIONAL_TAGS:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 157
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public getClosingPattern()Ljava/util/regex/Pattern;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method public getHtmlCount()I
    .locals 1

    .line 132
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    return v0
.end method

.method public getHtmlMatch()Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    return-object v0
.end method

.method public getOpenTags()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    return-object v0
.end method

.method public hadHtml()Z
    .locals 1

    .line 148
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    if-gtz v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->isHtmlClosed()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public haveOpenRawTag()Z
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    sget-object v1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isBlankLineInterruptible()Z
    .locals 3

    .line 140
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    sget-object v2, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v1, :cond_2

    :cond_1
    return v1

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public isHtmlClosed()Z
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public parseHtmlChunk(Ljava/lang/CharSequence;ZZZ)V
    .locals 10

    .line 167
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-eqz v2, :cond_0

    add-int/2addr v0, v1

    .line 168
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v2, v0

    .line 174
    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-eqz v3, :cond_1a

    .line 175
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    const/4 v4, 0x0

    if-eqz v3, :cond_a

    .line 177
    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 178
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-nez v5, :cond_1

    goto/16 :goto_a

    .line 180
    :cond_1
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    sget-object v6, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-ne v5, v6, :cond_8

    .line 181
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v5

    const-string v6, "<"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    if-nez v2, :cond_2

    .line 184
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_3

    :cond_2
    if-eqz p4, :cond_9

    .line 189
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    move-object v2, v0

    goto/16 :goto_a

    .line 195
    :cond_3
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object p4

    const-string v5, "/>"

    invoke-virtual {p4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_5

    if-nez v2, :cond_4

    .line 198
    iget-object p4, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 200
    :cond_4
    iget p4, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    if-nez p4, :cond_7

    add-int/lit8 p4, p4, 0x1

    iput p4, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    goto :goto_2

    :cond_5
    if-eqz v2, :cond_7

    .line 204
    sget-object p4, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->VOID_TAGS:Ljava/util/Set;

    invoke-interface {p4, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_6

    .line 205
    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->openTag(Ljava/lang/String;)V

    .line 207
    :cond_6
    iget p4, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    add-int/2addr p4, v1

    iput p4, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    .line 210
    :cond_7
    :goto_2
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    move-result p4

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-interface {p1, p4, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    const/4 p4, 0x0

    goto :goto_3

    .line 213
    :cond_8
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-interface {p1, v2, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    .line 217
    :cond_9
    :goto_3
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    goto/16 :goto_0

    .line 220
    :cond_a
    sget-object v3, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->START_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 221
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-nez v5, :cond_b

    goto/16 :goto_a

    .line 223
    :cond_b
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v6

    invoke-interface {p1, v5, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v5

    .line 224
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 225
    sget-object v6, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->PATTERN_MAP:[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    array-length v6, v6

    .line 226
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    const/4 v7, 0x1

    :goto_4
    if-ge v7, v6, :cond_19

    .line 229
    invoke-virtual {v3, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_c

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 231
    :cond_c
    invoke-virtual {v3, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 232
    sget-object v8, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->PATTERN_MAP:[Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    aget-object v7, v8, v7

    .line 233
    iget-object v8, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myBlockTags:Ljava/util/HashSet;

    invoke-virtual {v8, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez p2, :cond_d

    if-nez p3, :cond_e

    .line 235
    :cond_d
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->start()I

    move-result v9

    if-lez v9, :cond_e

    .line 237
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->start()I

    move-result v3

    invoke-interface {p1, v4, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 238
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_e

    goto/16 :goto_9

    .line 242
    :cond_e
    sget-object p1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-eq v7, p1, :cond_f

    sget-object p1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->CLOSE_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-eq v7, p1, :cond_f

    .line 244
    iget-object p1, v7, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->close:Ljava/util/regex/Pattern;

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    .line 245
    iput-object v7, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 246
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    const/4 p4, 0x0

    goto/16 :goto_9

    :cond_f
    if-nez p2, :cond_10

    if-nez p3, :cond_11

    :cond_10
    if-nez v8, :cond_11

    goto/16 :goto_9

    .line 260
    :cond_11
    sget-object p1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-ne v7, p1, :cond_13

    sget-object p1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->VOID_TAGS:Ljava/util/Set;

    invoke-interface {p1, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    if-eqz p4, :cond_12

    goto :goto_5

    .line 265
    :cond_12
    iput-object v7, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 266
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    goto :goto_8

    .line 271
    :cond_13
    sget-object p1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-ne v7, p1, :cond_15

    .line 273
    iput-object v7, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 274
    iget-object p1, v7, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->close:Ljava/util/regex/Pattern;

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    if-eqz p4, :cond_14

    :goto_5
    move-object v2, v6

    goto :goto_8

    .line 278
    :cond_14
    invoke-direct {p0, v6}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->openTag(Ljava/lang/String;)V

    .line 279
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    if-eqz p1, :cond_18

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    goto :goto_8

    .line 283
    :cond_15
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    .line 284
    iput-object v7, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    .line 285
    iget p2, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    add-int/2addr p2, v1

    iput p2, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlCount:I

    move p2, p1

    :goto_6
    add-int/lit8 v3, p2, -0x1

    if-lez p2, :cond_18

    .line 287
    iget-object p2, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 288
    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_16

    :goto_7
    add-int/lit8 p2, p1, -0x1

    if-le p1, v3, :cond_18

    .line 291
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myOpenTags:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move p1, p2

    goto :goto_7

    :cond_16
    if-nez v8, :cond_17

    .line 298
    iget-object v7, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myBlockTags:Ljava/util/HashSet;

    invoke-virtual {v7, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_17

    goto :goto_8

    :cond_17
    move p2, v3

    goto :goto_6

    :cond_18
    :goto_8
    const/4 p2, 0x0

    :cond_19
    :goto_9
    move-object p1, v5

    goto/16 :goto_1

    :cond_1a
    :goto_a
    if-eqz v2, :cond_1b

    .line 310
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myHtmlMatch:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    sget-object p2, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-ne p1, p2, :cond_1b

    .line 312
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->myClosingPattern:Ljava/util/regex/Pattern;

    :cond_1b
    return-void
.end method
