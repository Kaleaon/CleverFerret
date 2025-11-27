.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;
.super Ljava/lang/Object;
.source "FootnoteNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$Factory;
    }
.end annotation


# instance fields
.field private final footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

.field private final options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

.field private recheckUndefinedReferences:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    .line 26
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    .line 27
    sget-object v1, Lcom/vladsch/flexmark/html/HtmlRenderer;->RECHECK_UNDEFINED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->recheckUndefinedReferences:Z

    .line 28
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->resolveFootnoteOrdinals()V

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;Lcom/vladsch/flexmark/ext/footnotes/Footnote;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->render(Lcom/vladsch/flexmark/ext/footnotes/Footnote;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->render(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    return-object p0
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    return-object p0
.end method

.method private render(Lcom/vladsch/flexmark/ext/footnotes/Footnote;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 5

    .line 129
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getFootnoteBlock()Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object v0

    if-nez v0, :cond_0

    .line 132
    const-string v0, "[^"

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 133
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 134
    const-string p1, "]"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 136
    :cond_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFootnoteOrdinal()I

    move-result p2

    .line 137
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getReferenceOrdinal()I

    move-result v0

    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "fnref-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    if-nez v0, :cond_1

    const-string v0, ""

    goto :goto_0

    :cond_1
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v2

    const-string v0, "-%d"

    invoke-static {v3, v0, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p3, v1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 139
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;

    invoke-direct {v0, p0, p3, p2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;I)V

    const-string p2, "sup"

    invoke-virtual {p1, p2, v2, v2, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
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

    .line 33
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    new-instance v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$1;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    new-instance v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$2;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getRenderingPhases()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/RenderingPhase;",
            ">;"
        }
    .end annotation

    .line 51
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 52
    sget-object v1, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY_TOP:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 53
    sget-object v1, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY_BOTTOM:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public renderDocument(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/html/renderer/RenderingPhase;)V
    .locals 7

    .line 59
    sget-object v0, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY_TOP:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    if-ne p4, v0, :cond_0

    .line 60
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->recheckUndefinedReferences:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 62
    new-array v1, v0, [Z

    const/4 v2, 0x0

    aput-boolean v2, v1, v2

    .line 63
    new-instance v3, Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    new-array v0, v0, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v4, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v5, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    new-instance v6, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;

    invoke-direct {v6, p0, v1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;[Z)V

    invoke-direct {v4, v5, v6}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    aput-object v4, v0, v2

    invoke-direct {v3, v0}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/VisitHandler;)V

    .line 80
    invoke-virtual {v3, p3}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 81
    aget-boolean p3, v1, v2

    if-eqz p3, :cond_0

    .line 82
    iget-object p3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    invoke-virtual {p3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->resolveFootnoteOrdinals()V

    .line 87
    :cond_0
    sget-object p3, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY_BOTTOM:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    if-ne p4, p3, :cond_1

    .line 89
    iget-object p3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    invoke-virtual {p3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->getReferencedFootnoteBlocks()Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    if-lez p3, :cond_1

    .line 90
    const-string p3, "class"

    const-string p4, "footnotes"

    invoke-virtual {p2, p3, p4}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p3

    check-cast p3, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance p4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    invoke-direct {p4, p0, p2, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    const-string p1, "div"

    invoke-virtual {p3, p1, p4}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_1
    return-void
.end method
