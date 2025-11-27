.class Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;
.super Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;
.source "Formatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/formatter/Formatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainNodeFormatter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;
    }
.end annotation


# instance fields
.field private final collectedNodes:Lcom/vladsch/flexmark/util/collection/SubClassingBag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/SubClassingBag<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field

.field private final document:Lcom/vladsch/flexmark/util/ast/Document;

.field final myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

.field private final options:Lcom/vladsch/flexmark/util/options/DataHolder;

.field private phase:Lcom/vladsch/flexmark/formatter/FormattingPhase;

.field private final phasedFormatters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;",
            ">;"
        }
    .end annotation
.end field

.field private final renderers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final renderingPhases:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/FormattingPhase;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vladsch/flexmark/formatter/Formatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/formatter/Formatter;Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/TranslationHandler;)V
    .locals 4

    .line 374
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->this$0:Lcom/vladsch/flexmark/formatter/Formatter;

    .line 375
    invoke-direct {p0, p3}, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;-><init>(Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 376
    iput-object p5, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    .line 377
    new-instance p5, Lcom/vladsch/flexmark/util/options/ScopedDataSet;

    invoke-direct {p5, p4, p2}, Lcom/vladsch/flexmark/util/options/ScopedDataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object p5, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    .line 378
    iput-object p4, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->document:Lcom/vladsch/flexmark/util/ast/Document;

    .line 379
    new-instance p2, Ljava/util/HashMap;

    const/16 p5, 0x20

    invoke-direct {p2, p5}, Ljava/util/HashMap;-><init>(I)V

    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderers:Ljava/util/Map;

    .line 380
    new-instance p2, Ljava/util/HashSet;

    invoke-static {}, Lcom/vladsch/flexmark/formatter/FormattingPhase;->values()[Lcom/vladsch/flexmark/formatter/FormattingPhase;

    move-result-object p5

    array-length p5, p5

    invoke-direct {p2, p5}, Ljava/util/HashSet;-><init>(I)V

    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderingPhases:Ljava/util/Set;

    .line 381
    new-instance p2, Ljava/util/HashSet;

    const/16 p5, 0x64

    invoke-direct {p2, p5}, Ljava/util/HashSet;-><init>(I)V

    .line 382
    new-instance p5, Ljava/util/ArrayList;

    iget-object v0, p1, Lcom/vladsch/flexmark/formatter/Formatter;->nodeFormatterFactories:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p5, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p5, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->phasedFormatters:Ljava/util/List;

    .line 384
    invoke-virtual {p3, p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setContext(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)V

    .line 387
    iget-object p3, p1, Lcom/vladsch/flexmark/formatter/Formatter;->nodeFormatterFactories:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    :goto_0
    if-ltz p3, :cond_6

    .line 388
    iget-object p5, p1, Lcom/vladsch/flexmark/formatter/Formatter;->nodeFormatterFactories:Ljava/util/List;

    invoke-interface {p5, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;

    .line 389
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {p5, v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/formatter/NodeFormatter;

    move-result-object p5

    .line 390
    invoke-interface {p5}, Lcom/vladsch/flexmark/formatter/NodeFormatter;->getNodeFormattingHandlers()Ljava/util/Set;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 393
    :cond_0
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    .line 395
    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderers:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;->getNodeType()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 399
    :cond_1
    invoke-interface {p5}, Lcom/vladsch/flexmark/formatter/NodeFormatter;->getNodeClasses()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 401
    invoke-interface {p2, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 404
    :cond_2
    instance-of v0, p5, Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;

    if-eqz v0, :cond_5

    .line 405
    check-cast p5, Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;

    invoke-interface {p5}, Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;->getFormattingPhases()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 407
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 408
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderingPhases:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 409
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->phasedFormatters:Ljava/util/List;

    invoke-interface {v0, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 407
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PhasedNodeFormatter with empty Phases"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 411
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PhasedNodeFormatter with null Phases"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    :goto_2
    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    .line 417
    :cond_6
    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7

    .line 418
    new-instance p1, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;

    invoke-direct {p1, p2}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;-><init>(Ljava/util/Set;)V

    .line 419
    invoke-virtual {p1, p4}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->collect(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 420
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->getSubClassingBag()Lcom/vladsch/flexmark/util/collection/SubClassingBag;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->collectedNodes:Lcom/vladsch/flexmark/util/collection/SubClassingBag;

    return-void

    :cond_7
    const/4 p1, 0x0

    .line 422
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->collectedNodes:Lcom/vladsch/flexmark/util/collection/SubClassingBag;

    return-void
.end method


# virtual methods
.method public customPlaceholderFormat(Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    .line 489
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-eqz v0, :cond_0

    .line 490
    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->customPlaceholderFormat(Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void

    .line 492
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-interface {p2, p0, p1}, Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;->render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 498
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public getDocument()Lcom/vladsch/flexmark/util/ast/Document;
    .locals 1

    .line 513
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->document:Lcom/vladsch/flexmark/util/ast/Document;

    return-object v0
.end method

.method public getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;
    .locals 1

    .line 508
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->this$0:Lcom/vladsch/flexmark/formatter/Formatter;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    return-object v0
.end method

.method public getFormattingPhase()Lcom/vladsch/flexmark/formatter/FormattingPhase;
    .locals 1

    .line 518
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->phase:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    return-object v0
.end method

.method public getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 1

    .line 503
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    return-object v0
.end method

.method public getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;
    .locals 1

    .line 428
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-nez v0, :cond_0

    sget-object v0, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    return-object v0

    :cond_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v0

    return-object v0
.end method

.method public getSubContext(Ljava/lang/Appendable;)Lcom/vladsch/flexmark/formatter/NodeFormatterContext;
    .locals 2

    .line 550
    new-instance v0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->getMarkdown()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getOptions()I

    move-result v1

    invoke-direct {v0, p1, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;-><init>(Ljava/lang/Appendable;I)V

    .line 551
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setContext(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)V

    .line 553
    new-instance p1, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;

    invoke-direct {p1, p0, p0, v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-object p1
.end method

.method public getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 480
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-eqz v0, :cond_0

    .line 481
    invoke-interface {v0}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    return-object v0

    .line 483
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->document:Lcom/vladsch/flexmark/util/ast/Document;

    return-object v0
.end method

.method public isTransformingText()Z
    .locals 1

    .line 433
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final nodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 534
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->collectedNodes:Lcom/vladsch/flexmark/util/collection/SubClassingBag;

    if-nez v0, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/formatter/Formatter;->NULL_ITERABLE:Ljava/lang/Iterable;

    return-object p1

    :cond_0
    const-class v1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v0, v1, p1}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->itemsOfType(Ljava/lang/Class;Ljava/util/Collection;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public final nodesOfType([Ljava/lang/Class;)Ljava/lang/Iterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 528
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->collectedNodes:Lcom/vladsch/flexmark/util/collection/SubClassingBag;

    if-nez v0, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/formatter/Formatter;->NULL_ITERABLE:Ljava/lang/Iterable;

    return-object p1

    :cond_0
    const-class v1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v0, v1, p1}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->itemsOfType(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public nonTranslatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    .line 462
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-eqz v0, :cond_0

    .line 463
    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->nonTranslatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void

    .line 465
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-interface {p1, p0, v0}, Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;->render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 523
    invoke-virtual {p0, p1, p0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;)V

    return-void
.end method

.method public renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 605
    invoke-virtual {p0, p1, p0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderChildrenNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;)V

    return-void
.end method

.method protected renderChildrenNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;)V
    .locals 1

    .line 610
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_0

    .line 612
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 613
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method renderNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;)V
    .locals 9

    .line 557
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/Document;

    if-eqz v0, :cond_6

    .line 559
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-eqz v0, :cond_0

    .line 560
    move-object v1, p1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Document;

    iget-object v2, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-interface {v0, v1, p2, v2}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->beginRendering(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 563
    :cond_0
    invoke-static {}, Lcom/vladsch/flexmark/formatter/FormattingPhase;->values()[Lcom/vladsch/flexmark/formatter/FormattingPhase;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_5

    aget-object v3, v0, v2

    .line 564
    sget-object v4, Lcom/vladsch/flexmark/formatter/FormattingPhase;->DOCUMENT:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    if-eq v3, v4, :cond_1

    iget-object v4, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderingPhases:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_2

    .line 565
    :cond_1
    iput-object v3, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->phase:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    .line 567
    sget-object v4, Lcom/vladsch/flexmark/formatter/FormattingPhase;->DOCUMENT:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    const/4 v5, 0x0

    if-ne v3, v4, :cond_2

    .line 568
    iget-object v3, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderers:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    if-eqz v3, :cond_4

    .line 570
    iput-object p1, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 571
    iget-object v4, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {v3, p1, p2, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;->render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 572
    iput-object v5, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_2

    .line 576
    :cond_2
    iget-object v4, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->phasedFormatters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;

    .line 577
    invoke-interface {v6}, Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;->getFormattingPhases()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 578
    iput-object p1, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 579
    iget-object v7, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-object v8, p1

    check-cast v8, Lcom/vladsch/flexmark/util/ast/Document;

    invoke-interface {v6, p2, v7, v8, v3}, Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;->renderDocument(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/FormattingPhase;)V

    .line 580
    iput-object v5, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_1

    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    return-void

    .line 586
    :cond_6
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderers:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    if-nez v0, :cond_7

    .line 589
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderers:Ljava/util/Map;

    const-class v1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    :cond_7
    if-eqz v0, :cond_8

    .line 593
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 594
    iput-object p1, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 595
    iget-object v2, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {v0, p1, p2, v2}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;->render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 596
    iput-object v1, p2, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    return-void

    .line 599
    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Core Node Formatter should implement generic Node renderer"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final reversedNodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 545
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->collectedNodes:Lcom/vladsch/flexmark/util/collection/SubClassingBag;

    if-nez v0, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/formatter/Formatter;->NULL_ITERABLE:Ljava/lang/Iterable;

    return-object p1

    :cond_0
    const-class v1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v0, v1, p1}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->reversedItemsOfType(Ljava/lang/Class;Ljava/util/Collection;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public final reversedNodesOfType([Ljava/lang/Class;)Ljava/lang/Iterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 539
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->collectedNodes:Lcom/vladsch/flexmark/util/collection/SubClassingBag;

    if-nez v0, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/formatter/Formatter;->NULL_ITERABLE:Ljava/lang/Iterable;

    return-object p1

    :cond_0
    const-class v1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v0, v1, p1}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;->reversedItemsOfType(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object p1

    return-object p1
.end method

.method public transformAnchorRef(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    .line 448
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-nez v0, :cond_0

    return-object p2

    :cond_0
    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->transformAnchorRef(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    .line 438
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-nez v0, :cond_0

    return-object p2

    :cond_0
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public transformTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    .line 443
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-nez v0, :cond_0

    return-object p2

    :cond_0
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->transformTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    .line 471
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-eqz v0, :cond_0

    .line 472
    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void

    .line 474
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-interface {p2, p0, p1}, Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;->render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public translatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    .line 453
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->myTranslationHandler:Lcom/vladsch/flexmark/formatter/TranslationHandler;

    if-eqz v0, :cond_0

    .line 454
    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->translatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void

    .line 456
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-interface {p1, p0, v0}, Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;->render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
