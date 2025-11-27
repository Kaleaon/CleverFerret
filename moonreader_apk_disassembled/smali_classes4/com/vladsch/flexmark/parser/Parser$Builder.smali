.class public Lcom/vladsch/flexmark/parser/Parser$Builder;
.super Lcom/vladsch/flexmark/util/builder/BuilderBase;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/builder/BuilderBase<",
        "Lcom/vladsch/flexmark/parser/Parser$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field private final blockParserFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final blockPreProcessorFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final delimiterProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;"
        }
    .end annotation
.end field

.field private final inlineParserExtensionFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;"
        }
    .end annotation
.end field

.field private inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

.field private final linkRefProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final paragraphPreProcessorFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final postProcessorFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 471
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>()V

    .line 456
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockParserFactories:Ljava/util/List;

    .line 457
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->delimiterProcessors:Ljava/util/List;

    .line 458
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactories:Ljava/util/List;

    .line 459
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->paragraphPreProcessorFactories:Ljava/util/List;

    .line 460
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockPreProcessorFactories:Ljava/util/List;

    .line 461
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->linkRefProcessors:Ljava/util/List;

    .line 462
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserExtensionFactories:Ljava/util/List;

    const/4 v0, 0x0

    .line 463
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 8

    .line 475
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>(Lcom/vladsch/flexmark/util/builder/BuilderBase;)V

    .line 456
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockParserFactories:Ljava/util/List;

    .line 457
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->delimiterProcessors:Ljava/util/List;

    .line 458
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactories:Ljava/util/List;

    .line 459
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->paragraphPreProcessorFactories:Ljava/util/List;

    .line 460
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockPreProcessorFactories:Ljava/util/List;

    .line 461
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->linkRefProcessors:Ljava/util/List;

    .line 462
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserExtensionFactories:Ljava/util/List;

    const/4 v7, 0x0

    .line 463
    iput-object v7, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    .line 477
    iget-object v7, p1, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockParserFactories:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 478
    iget-object v0, p1, Lcom/vladsch/flexmark/parser/Parser$Builder;->delimiterProcessors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 479
    iget-object v0, p1, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactories:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 480
    iget-object v0, p1, Lcom/vladsch/flexmark/parser/Parser$Builder;->paragraphPreProcessorFactories:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 481
    iget-object v0, p1, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockPreProcessorFactories:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 482
    iget-object v0, p1, Lcom/vladsch/flexmark/parser/Parser$Builder;->linkRefProcessors:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 483
    iget-object v0, p1, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    .line 484
    iget-object p1, p1, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserExtensionFactories:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/parser/Parser$Builder;Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 488
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;-><init>(Lcom/vladsch/flexmark/parser/Parser$Builder;)V

    .line 489
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/parser/Parser$Builder;->withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 466
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 456
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockParserFactories:Ljava/util/List;

    .line 457
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->delimiterProcessors:Ljava/util/List;

    .line 458
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactories:Ljava/util/List;

    .line 459
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->paragraphPreProcessorFactories:Ljava/util/List;

    .line 460
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockPreProcessorFactories:Ljava/util/List;

    .line 461
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->linkRefProcessors:Ljava/util/List;

    .line 462
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserExtensionFactories:Ljava/util/List;

    const/4 p1, 0x0

    .line 463
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    .line 467
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->loadExtensions()V

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;
    .locals 0

    .line 455
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockParserFactories:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/parser/Parser$Builder;)Lcom/vladsch/flexmark/parser/InlineParserFactory;
    .locals 0

    .line 455
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    return-object p0
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;
    .locals 0

    .line 455
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->paragraphPreProcessorFactories:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;
    .locals 0

    .line 455
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockPreProcessorFactories:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;
    .locals 0

    .line 455
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->delimiterProcessors:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;
    .locals 0

    .line 455
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->linkRefProcessors:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;
    .locals 0

    .line 455
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactories:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$700(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;
    .locals 0

    .line 455
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserExtensionFactories:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public blockPreProcessorFactory(Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 582
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockPreProcessorFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 583
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method public build()Lcom/vladsch/flexmark/parser/Parser;
    .locals 2

    .line 496
    new-instance v0, Lcom/vladsch/flexmark/parser/Parser;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vladsch/flexmark/parser/Parser;-><init>(Lcom/vladsch/flexmark/parser/Parser$Builder;Lcom/vladsch/flexmark/parser/Parser$1;)V

    return-object v0
.end method

.method public customBlockParserFactory(Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 543
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockParserFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 544
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method public customDelimiterProcessor(Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 564
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->delimiterProcessors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 565
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method public customInlineParserExtensionFactory(Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 549
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserExtensionFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 550
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method public customInlineParserFactory(Lcom/vladsch/flexmark/parser/InlineParserFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 2

    .line 555
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    if-nez v0, :cond_0

    .line 558
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    .line 559
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0

    .line 556
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "custom inline parser factory is already set to "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public linkRefProcessorFactory(Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 588
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->linkRefProcessors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 589
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method protected loadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)Z
    .locals 1

    .line 524
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/Parser$ParserExtension;

    if-eqz v0, :cond_0

    .line 525
    check-cast p1, Lcom/vladsch/flexmark/parser/Parser$ParserExtension;

    .line 526
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/parser/Parser$ParserExtension;->extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public paragraphPreProcessorFactory(Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 576
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->paragraphPreProcessorFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 577
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method public postProcessorFactory(Lcom/vladsch/flexmark/parser/PostProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 570
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 571
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method protected preloadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)V
    .locals 1

    .line 516
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/Parser$ParserExtension;

    if-eqz v0, :cond_0

    .line 517
    check-cast p1, Lcom/vladsch/flexmark/parser/Parser$ParserExtension;

    .line 518
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/parser/Parser$ParserExtension;->parserOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V

    :cond_0
    return-void
.end method

.method protected removeApiPoint(Ljava/lang/Object;)V
    .locals 3

    .line 501
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockParserFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 502
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->delimiterProcessors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 503
    :cond_1
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/PostProcessorFactory;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->postProcessorFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 504
    :cond_2
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->paragraphPreProcessorFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 505
    :cond_3
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->blockPreProcessorFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 506
    :cond_4
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->linkRefProcessors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 507
    :cond_5
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserExtensionFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 508
    :cond_6
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/InlineParserFactory;

    if-eqz v0, :cond_7

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser$Builder;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    return-void

    .line 510
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown data point type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
