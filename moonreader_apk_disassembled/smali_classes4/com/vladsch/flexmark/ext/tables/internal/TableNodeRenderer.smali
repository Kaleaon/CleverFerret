.class public Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;
.super Ljava/lang/Object;
.source "TableNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$Factory;
    }
.end annotation


# instance fields
.field private final options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->render(Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method private static getAlignValue(Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;)Ljava/lang/String;
    .locals 3

    .line 142
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$13;->$SwitchMap$com$vladsch$flexmark$ext$tables$TableCell$Alignment:[I

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 148
    const-string p0, "right"

    return-object p0

    .line 150
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

    .line 146
    :cond_1
    const-string p0, "center"

    return-object p0

    .line 144
    :cond_2
    const-string p0, "left"

    return-object p0
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->className:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->className:Ljava/lang/String;

    const-string v1, "class"

    invoke-virtual {p3, v1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 78
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$8;

    invoke-direct {v0, p0, p2, p1}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$8;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ext/tables/TableBlock;)V

    const-string p1, "table"

    invoke-virtual {p3, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLineIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 100
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withCondLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p3

    check-cast p3, Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$10;

    invoke-direct {v0, p0, p2, p1}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$10;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ext/tables/TableBody;)V

    const-string p1, "tbody"

    invoke-virtual {p3, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 118
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$12;

    invoke-direct {v0, p0, p2, p1}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$12;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ext/tables/TableCaption;)V

    const-string p1, "caption"

    invoke-virtual {p3, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 3

    .line 127
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->isHeader()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "th"

    goto :goto_0

    :cond_0
    const-string v0, "td"

    .line 128
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getAlignment()Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 129
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getAlignment()Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    move-result-object v1

    invoke-static {v1}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->getAlignValue(Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "align"

    invoke-virtual {p3, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 132
    :cond_1
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v1, v1, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->columnSpans:Z

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getSpan()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_2

    .line 133
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getSpan()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "colspan"

    invoke-virtual {p3, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 136
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 137
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 138
    const-string p1, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 87
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withCondLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p3

    check-cast p3, Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$9;

    invoke-direct {v0, p0, p2, p1}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$9;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ext/tables/TableHead;)V

    const-string p1, "thead"

    invoke-virtual {p3, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 109
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableRow;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$11;

    invoke-direct {v0, p0, p2, p1}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$11;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ext/tables/TableRow;)V

    const-string p1, "tr"

    invoke-virtual {p3, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

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

    const/4 v1, 0x7

    new-array v1, v1, [Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$1;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableHead;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$2;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$3;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$3;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableBody;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$4;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$4;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableRow;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$5;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$5;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableCell;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$6;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$6;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$7;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$7;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x6

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
