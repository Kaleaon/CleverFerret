.class Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;
.super Lcom/vladsch/flexmark/html/NodeRendererSubContext;
.source "HtmlRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
.implements Lcom/vladsch/flexmark/html/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/HtmlRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainNodeRenderer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;
    }
.end annotation


# instance fields
.field private attributeProviders:[Lcom/vladsch/flexmark/html/AttributeProvider;

.field private document:Lcom/vladsch/flexmark/util/ast/Document;

.field private htmlIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

.field private myLinkResolvers:[Lcom/vladsch/flexmark/html/LinkResolver;

.field private options:Lcom/vladsch/flexmark/util/options/DataHolder;

.field private phase:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field private phasedRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;",
            ">;"
        }
    .end annotation
.end field

.field private renderers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private renderingPhases:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/RenderingPhase;",
            ">;"
        }
    .end annotation
.end field

.field private resolvedLinkMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/html/renderer/LinkType;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/html/renderer/ResolvedLink;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vladsch/flexmark/html/HtmlRenderer;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/html/HtmlRenderer;Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 4

    .line 576
    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->this$0:Lcom/vladsch/flexmark/html/HtmlRenderer;

    .line 577
    invoke-direct {p0, p3}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;-><init>(Lcom/vladsch/flexmark/html/HtmlWriter;)V

    .line 549
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->resolvedLinkMap:Ljava/util/HashMap;

    .line 578
    new-instance v0, Lcom/vladsch/flexmark/util/options/ScopedDataSet;

    invoke-direct {v0, p4, p2}, Lcom/vladsch/flexmark/util/options/ScopedDataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    .line 579
    iput-object p4, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->document:Lcom/vladsch/flexmark/util/ast/Document;

    .line 580
    new-instance p2, Ljava/util/HashMap;

    const/16 p4, 0x20

    invoke-direct {p2, p4}, Ljava/util/HashMap;-><init>(I)V

    iput-object p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderers:Ljava/util/Map;

    .line 581
    new-instance p2, Ljava/util/HashSet;

    invoke-static {}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->values()[Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    move-result-object p4

    array-length p4, p4

    invoke-direct {p2, p4}, Ljava/util/HashSet;-><init>(I)V

    iput-object p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingPhases:Ljava/util/Set;

    .line 582
    new-instance p2, Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$200(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p4

    invoke-direct {p2, p4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->phasedRenderers:Ljava/util/List;

    .line 583
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$300(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    new-array p2, p2, [Lcom/vladsch/flexmark/html/LinkResolver;

    iput-object p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->myLinkResolvers:[Lcom/vladsch/flexmark/html/LinkResolver;

    .line 584
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$400(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p2

    iget-boolean p2, p2, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->doNotRenderLinksInDocument:Z

    xor-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->doNotRenderLinksNesting:I

    .line 585
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$500(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$500(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    move-result-object p2

    invoke-interface {p2, p0}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;->create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    move-result-object p2

    goto :goto_0

    .line 586
    :cond_0
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$400(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p2

    iget-boolean p2, p2, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->renderHeaderId:Z

    if-nez p2, :cond_1

    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$400(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p2

    iget-boolean p2, p2, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->generateHeaderIds:Z

    if-nez p2, :cond_1

    sget-object p2, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;->NULL:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    goto :goto_0

    :cond_1
    new-instance p2, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$Factory;-><init>()V

    invoke-virtual {p2, p0}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$Factory;->create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    move-result-object p2

    :goto_0
    iput-object p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->htmlIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    .line 588
    invoke-virtual {p3, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->setContext(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    .line 590
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$200(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    :goto_1
    if-ltz p2, :cond_4

    .line 591
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$200(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    .line 592
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;

    move-result-object p4

    invoke-interface {p3, p4}, Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/renderer/NodeRenderer;

    move-result-object p3

    .line 593
    invoke-interface {p3}, Lcom/vladsch/flexmark/html/renderer/NodeRenderer;->getNodeRenderingHandlers()Ljava/util/Set;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :goto_2
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    .line 595
    new-instance v1, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderers:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;->getNodeType()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    invoke-direct {v1, v0, v2}, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;-><init>(Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;)V

    .line 596
    iget-object v2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderers:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;->getNodeType()Ljava/lang/Class;

    move-result-object v0

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 599
    :cond_2
    instance-of p4, p3, Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;

    if-eqz p4, :cond_3

    .line 600
    iget-object p4, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingPhases:Ljava/util/Set;

    check-cast p3, Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;

    invoke-interface {p3}, Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;->getRenderingPhases()Ljava/util/Set;

    move-result-object v0

    invoke-interface {p4, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 601
    iget-object p4, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->phasedRenderers:Ljava/util/List;

    invoke-interface {p4, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    :cond_4
    const/4 p2, 0x0

    const/4 p3, 0x0

    .line 605
    :goto_3
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$300(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p4

    if-ge p3, p4, :cond_5

    .line 606
    iget-object p4, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->myLinkResolvers:[Lcom/vladsch/flexmark/html/LinkResolver;

    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$300(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/LinkResolverFactory;

    invoke-interface {v0, p0}, Lcom/vladsch/flexmark/html/LinkResolverFactory;->create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/LinkResolver;

    move-result-object v0

    aput-object v0, p4, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_3

    .line 609
    :cond_5
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$600(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    new-array p3, p3, [Lcom/vladsch/flexmark/html/AttributeProvider;

    iput-object p3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->attributeProviders:[Lcom/vladsch/flexmark/html/AttributeProvider;

    .line 610
    :goto_4
    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$600(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    if-ge p2, p3, :cond_6

    .line 611
    iget-object p3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->attributeProviders:[Lcom/vladsch/flexmark/html/AttributeProvider;

    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$600(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object p4

    invoke-interface {p4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/vladsch/flexmark/html/AttributeProviderFactory;

    invoke-interface {p4, p0}, Lcom/vladsch/flexmark/html/AttributeProviderFactory;->create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/AttributeProvider;

    move-result-object p4

    aput-object p4, p3, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_4

    :cond_6
    return-void
.end method


# virtual methods
.method public delegateRender()V
    .locals 0

    .line 728
    invoke-virtual {p0, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderByPreviousHandler(Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V

    return-void
.end method

.method public dispose()V
    .locals 7

    const/4 v0, 0x0

    .line 554
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->document:Lcom/vladsch/flexmark/util/ast/Document;

    .line 555
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderers:Ljava/util/Map;

    .line 556
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->phasedRenderers:Ljava/util/List;

    .line 558
    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->myLinkResolvers:[Lcom/vladsch/flexmark/html/LinkResolver;

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    .line 559
    instance-of v6, v5, Lcom/vladsch/flexmark/html/Disposable;

    if-eqz v6, :cond_0

    check-cast v5, Lcom/vladsch/flexmark/html/Disposable;

    invoke-interface {v5}, Lcom/vladsch/flexmark/html/Disposable;->dispose()V

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 561
    :cond_1
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->myLinkResolvers:[Lcom/vladsch/flexmark/html/LinkResolver;

    .line 563
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingPhases:Ljava/util/Set;

    .line 564
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    .line 566
    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->htmlIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    instance-of v2, v1, Lcom/vladsch/flexmark/html/Disposable;

    if-eqz v2, :cond_2

    check-cast v1, Lcom/vladsch/flexmark/html/Disposable;

    invoke-interface {v1}, Lcom/vladsch/flexmark/html/Disposable;->dispose()V

    .line 567
    :cond_2
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->htmlIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    .line 568
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->resolvedLinkMap:Ljava/util/HashMap;

    .line 570
    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->attributeProviders:[Lcom/vladsch/flexmark/html/AttributeProvider;

    array-length v2, v1

    :goto_1
    if-ge v3, v2, :cond_4

    aget-object v4, v1, v3

    .line 571
    instance-of v5, v4, Lcom/vladsch/flexmark/html/Disposable;

    if-eqz v5, :cond_3

    check-cast v4, Lcom/vladsch/flexmark/html/Disposable;

    invoke-interface {v4}, Lcom/vladsch/flexmark/html/Disposable;->dispose()V

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 573
    :cond_4
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->attributeProviders:[Lcom/vladsch/flexmark/html/AttributeProvider;

    return-void
.end method

.method public encodeUrl(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    .line 696
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->this$0:Lcom/vladsch/flexmark/html/HtmlRenderer;

    invoke-static {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$400(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->percentEncodeUrls:Z

    if-eqz v0, :cond_0

    .line 697
    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/Escaping;->percentEncodeUrl(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 699
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public extendRenderingNodeAttributes(Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;
    .locals 5

    if-eqz p2, :cond_0

    goto :goto_0

    .line 705
    :cond_0
    new-instance p2, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {p2}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>()V

    .line 706
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->attributeProviders:[Lcom/vladsch/flexmark/html/AttributeProvider;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 707
    iget-object v4, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-interface {v3, v4, p1, p2}, Lcom/vladsch/flexmark/html/AttributeProvider;->setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return-object p2
.end method

.method public extendRenderingNodeAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;
    .locals 4

    if-eqz p3, :cond_0

    goto :goto_0

    .line 714
    :cond_0
    new-instance p3, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {p3}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>()V

    .line 715
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->attributeProviders:[Lcom/vladsch/flexmark/html/AttributeProvider;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 716
    invoke-interface {v3, p1, p2, p3}, Lcom/vladsch/flexmark/html/AttributeProvider;->setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return-object p3
.end method

.method public getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 617
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public getDelegatedSubContext(Ljava/lang/Appendable;Z)Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
    .locals 2

    .line 762
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getHtmlWriter()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;-><init>(Lcom/vladsch/flexmark/html/HtmlWriter;Ljava/lang/Appendable;Z)V

    .line 763
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->setContext(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    .line 765
    new-instance p1, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p0, v0, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V

    return-object p1
.end method

.method public getDocument()Lcom/vladsch/flexmark/util/ast/Document;
    .locals 1

    .line 686
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->document:Lcom/vladsch/flexmark/util/ast/Document;

    return-object v0
.end method

.method public getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;
    .locals 1

    .line 681
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->this$0:Lcom/vladsch/flexmark/html/HtmlRenderer;

    invoke-static {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$400(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    return-object v0
.end method

.method public getNodeId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
    .locals 7

    .line 660
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->htmlIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;->getId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object p1

    .line 661
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->this$0:Lcom/vladsch/flexmark/html/HtmlRenderer;

    invoke-static {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$600(Lcom/vladsch/flexmark/html/HtmlRenderer;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_2

    .line 663
    new-instance v0, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>()V

    .line 664
    const-string v1, "id"

    if-eqz p1, :cond_0

    invoke-virtual {v0, v1, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    .line 666
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->attributeProviders:[Lcom/vladsch/flexmark/html/AttributeProvider;

    array-length v2, p1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, p1, v3

    .line 667
    iget-object v5, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    sget-object v6, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->ID:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-interface {v4, v5, v6, v0}, Lcom/vladsch/flexmark/html/AttributeProvider;->setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 669
    :cond_1
    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/html/Attributes;->getValue(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_2
    return-object p1
.end method

.method public getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 1

    .line 676
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    return-object v0
.end method

.method public getRenderingPhase()Lcom/vladsch/flexmark/html/renderer/RenderingPhase;
    .locals 1

    .line 691
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->phase:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    return-object v0
.end method

.method public getSubContext(Ljava/lang/Appendable;Z)Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
    .locals 2

    .line 754
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getHtmlWriter()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;-><init>(Lcom/vladsch/flexmark/html/HtmlWriter;Ljava/lang/Appendable;Z)V

    .line 755
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->setContext(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    .line 757
    new-instance p1, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p0, v0, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V

    return-object p1
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 723
    invoke-virtual {p0, p1, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V

    return-void
.end method

.method renderByPreviousHandler(Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V
    .locals 5

    .line 732
    iget-object v0, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_1

    .line 733
    iget-object v0, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    iget-object v0, v0, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;->myPreviousRenderingHandler:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    if-eqz v0, :cond_0

    .line 735
    iget-object v1, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 736
    iget v2, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 737
    iget-object v3, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 739
    :try_start_0
    iput-object v0, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 740
    iget-object v0, v0, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;->myRenderingHandler:Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    iget-object v4, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0, v1, p1, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;->render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 742
    iput-object v1, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 743
    iput v2, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 744
    iput-object v3, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    return-void

    :catchall_0
    move-exception v0

    .line 742
    iput-object v1, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 743
    iput v2, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 744
    iput-object v3, p1, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 745
    throw v0

    :cond_0
    return-void

    .line 748
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "renderingByPreviousHandler called outside node rendering code"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 828
    invoke-virtual {p0, p1, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderChildrenNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V

    return-void
.end method

.method protected renderChildrenNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V
    .locals 1

    .line 833
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_0

    .line 835
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 836
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method renderNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V
    .locals 11

    .line 769
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/Document;

    if-eqz v0, :cond_4

    .line 771
    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->getDoNotRenderLinksNesting()I

    move-result v0

    .line 772
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->doNotRenderLinksInDocument:Z

    .line 773
    iget-object v2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->htmlIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->document:Lcom/vladsch/flexmark/util/ast/Document;

    invoke-interface {v2, v3}, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;->generateIds(Lcom/vladsch/flexmark/util/ast/Document;)V

    .line 775
    invoke-static {}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->values()[Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_5

    aget-object v5, v2, v4

    .line 776
    sget-object v6, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    if-eq v5, v6, :cond_0

    iget-object v6, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingPhases:Ljava/util/Set;

    invoke-interface {v6, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_2

    .line 777
    :cond_0
    iput-object v5, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->phase:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 781
    iget-object v6, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->phasedRenderers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;

    .line 782
    invoke-interface {v7}, Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;->getRenderingPhases()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 783
    iput v1, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 784
    iput-object p1, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 785
    iget-object v9, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    move-object v10, p1

    check-cast v10, Lcom/vladsch/flexmark/util/ast/Document;

    invoke-interface {v7, p2, v9, v10, v5}, Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;->renderDocument(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/html/renderer/RenderingPhase;)V

    .line 786
    iput-object v8, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 787
    iput v0, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    goto :goto_1

    .line 791
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getRenderingPhase()Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    move-result-object v5

    sget-object v6, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    if-ne v5, v6, :cond_3

    .line 792
    iget-object v5, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderers:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    if-eqz v5, :cond_3

    .line 794
    iput v1, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 795
    iget-object v6, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 797
    :try_start_0
    iput-object p1, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 798
    iput-object v5, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 799
    iget-object v5, v5, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;->myRenderingHandler:Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    iget-object v7, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v5, p1, p2, v7}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;->render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 801
    iput-object v6, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 802
    iput-object v8, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 803
    iput v0, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 801
    iput-object v6, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 802
    iput-object v8, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 803
    iput v0, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 804
    throw p1

    :cond_3
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 809
    :cond_4
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderers:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    if-eqz v0, :cond_5

    .line 811
    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 812
    iget v2, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 813
    iget-object v3, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 815
    :try_start_1
    iput-object p1, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 816
    iput-object v0, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 817
    iget-object v0, v0, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;->myRenderingHandler:Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    iget-object v4, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0, p1, p2, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;->render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 819
    iput-object v1, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 820
    iput v2, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 821
    iput-object v3, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    return-void

    :catchall_1
    move-exception p1

    .line 819
    iput-object v1, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 820
    iput v2, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    .line 821
    iput-object v3, p2, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    .line 822
    throw p1

    :cond_5
    return-void
.end method

.method public resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 6

    .line 627
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->resolvedLinkMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 629
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 630
    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->resolvedLinkMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 634
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    if-nez v1, :cond_6

    .line 636
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    invoke-direct {v1, p1, p2, p3}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;)V

    .line 638
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_5

    .line 639
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    .line 641
    iget-object p3, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->myLinkResolvers:[Lcom/vladsch/flexmark/html/LinkResolver;

    array-length v2, p3

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, p3, v3

    .line 642
    invoke-interface {v4, p1, p0, v1}, Lcom/vladsch/flexmark/html/LinkResolver;->resolveLink(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object v1

    .line 643
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getStatus()Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->UNKNOWN:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    if-eq v4, v5, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-nez p4, :cond_3

    .line 646
    iget-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->this$0:Lcom/vladsch/flexmark/html/HtmlRenderer;

    invoke-static {p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->access$400(Lcom/vladsch/flexmark/html/HtmlRenderer;)Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p1

    iget-boolean p1, p1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->percentEncodeUrls:Z

    if-nez p1, :cond_4

    :cond_3
    if-eqz p4, :cond_5

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 647
    :cond_4
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/Escaping;->percentEncodeUrl(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->withUrl(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object v1

    .line 652
    :cond_5
    invoke-virtual {v0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    return-object v1
.end method

.method public resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 2

    const/4 v0, 0x0

    .line 622
    move-object v1, v0

    check-cast v1, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object p1

    return-object p1
.end method
