.class public Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;
.super Ljava/lang/Object;
.source "TableJiraRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$Factory;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method private static getAlignValue(Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;)Ljava/lang/String;
    .locals 3

    .line 104
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$7;->$SwitchMap$com$vladsch$flexmark$ext$tables$TableCell$Alignment:[I

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 110
    const-string p0, "right"

    return-object p0

    .line 112
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown alignment: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_1
    const-string p0, "center"

    return-object p0

    .line 106
    :cond_2
    const-string p0, "left"

    return-object p0
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 68
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 69
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->blankLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 81
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 95
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 96
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    instance-of p2, p2, Lcom/vladsch/flexmark/ext/tables/TableHead;

    if-eqz p2, :cond_0

    .line 97
    const-string p1, "||"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 98
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    instance-of p1, p1, Lcom/vladsch/flexmark/ext/tables/TableBody;

    if-eqz p1, :cond_1

    .line 99
    const-string p1, "|"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_1
    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 73
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 85
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableRow;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/ext/tables/TableHead;

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    const-string v1, "||"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_0

    .line 87
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableRow;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/ext/tables/TableBody;

    if-eqz v0, :cond_1

    .line 88
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 90
    :cond_1
    :goto_0
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 91
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public getNodeRenderingHandlers()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 27
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x6

    new-array v1, v1, [Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$1;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableHead;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$2;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$3;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$3;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableBody;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$4;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$4;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableRow;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$5;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$5;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableCell;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$6;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$6;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
