.class public Lcom/vladsch/flexmark/formatter/Formatter$Builder;
.super Lcom/vladsch/flexmark/util/builder/BuilderBase;
.source "Formatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/formatter/Formatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/builder/BuilderBase<",
        "Lcom/vladsch/flexmark/formatter/Formatter$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field attributeProviderFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/AttributeProviderFactory;",
            ">;"
        }
    .end annotation
.end field

.field htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

.field linkResolverFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/LinkResolverFactory;",
            ">;"
        }
    .end annotation
.end field

.field nodeFormatterFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 251
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>()V

    .line 245
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->attributeProviderFactories:Ljava/util/List;

    .line 246
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactories:Ljava/util/List;

    .line 247
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->linkResolverFactories:Ljava/util/List;

    const/4 v0, 0x0

    .line 248
    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V
    .locals 2

    .line 260
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>(Lcom/vladsch/flexmark/util/builder/BuilderBase;)V

    .line 245
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->attributeProviderFactories:Ljava/util/List;

    .line 246
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactories:Ljava/util/List;

    .line 247
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->linkResolverFactories:Ljava/util/List;

    const/4 v0, 0x0

    .line 248
    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    .line 262
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->attributeProviderFactories:Ljava/util/List;

    iget-object v1, p1, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->attributeProviderFactories:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 264
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->linkResolverFactories:Ljava/util/List;

    iget-object p1, p1, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->linkResolverFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 269
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V

    .line 270
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 255
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 245
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->attributeProviderFactories:Ljava/util/List;

    .line 246
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactories:Ljava/util/List;

    .line 247
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->linkResolverFactories:Ljava/util/List;

    const/4 p1, 0x0

    .line 248
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    .line 256
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->loadExtensions()V

    return-void
.end method


# virtual methods
.method public build()Lcom/vladsch/flexmark/formatter/Formatter;
    .locals 2

    .line 277
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vladsch/flexmark/formatter/Formatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;Lcom/vladsch/flexmark/formatter/Formatter$1;)V

    return-object v0
.end method

.method protected loadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)Z
    .locals 1

    .line 301
    instance-of v0, p1, Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;

    if-eqz v0, :cond_0

    .line 302
    check-cast p1, Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;

    .line 303
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;->extend(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public nodeFormatterFactory(Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;)Lcom/vladsch/flexmark/formatter/Formatter$Builder;
    .locals 1

    .line 321
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method protected preloadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)V
    .locals 1

    .line 293
    instance-of v0, p1, Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;

    if-eqz v0, :cond_0

    .line 294
    check-cast p1, Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;

    .line 295
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;->rendererOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V

    :cond_0
    return-void
.end method

.method protected removeApiPoint(Ljava/lang/Object;)V
    .locals 3

    .line 282
    instance-of v0, p1, Lcom/vladsch/flexmark/html/AttributeProviderFactory;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->attributeProviderFactories:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 283
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 284
    :cond_1
    instance-of v0, p1, Lcom/vladsch/flexmark/html/LinkResolverFactory;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->linkResolverFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 285
    :cond_2
    instance-of v0, p1, Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    if-eqz v0, :cond_3

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    return-void

    .line 287
    :cond_3
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
