.class public Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
.super Lcom/vladsch/flexmark/util/builder/BuilderBase;
.source "HtmlRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/RendererBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/HtmlRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/builder/BuilderBase<",
        "Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;",
        ">;",
        "Lcom/vladsch/flexmark/html/RendererBuilder;"
    }
.end annotation


# instance fields
.field attributeProviderFactories:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class;",
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

.field nodeRendererFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 276
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>()V

    .line 270
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    .line 271
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactories:Ljava/util/List;

    .line 272
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactories:Ljava/util/List;

    const/4 v0, 0x0

    .line 273
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;)V
    .locals 2

    .line 285
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>(Lcom/vladsch/flexmark/util/builder/BuilderBase;)V

    .line 270
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    .line 271
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactories:Ljava/util/List;

    .line 272
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactories:Ljava/util/List;

    const/4 v0, 0x0

    .line 273
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    .line 287
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    iget-object v1, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 289
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactories:Ljava/util/List;

    iget-object v1, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactories:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 290
    iget-object p1, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 294
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;)V

    .line 295
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 280
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 270
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    .line 271
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactories:Ljava/util/List;

    .line 272
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactories:Ljava/util/List;

    const/4 p1, 0x0

    .line 273
    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    .line 281
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->loadExtensions()V

    return-void
.end method


# virtual methods
.method public attributeProviderFactory(Lcom/vladsch/flexmark/html/AttributeProviderFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 2

    .line 414
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method public bridge synthetic attributeProviderFactory(Lcom/vladsch/flexmark/html/AttributeProviderFactory;)Lcom/vladsch/flexmark/html/RendererBuilder;
    .locals 0

    .line 269
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactory(Lcom/vladsch/flexmark/html/AttributeProviderFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    move-result-object p1

    return-object p1
.end method

.method public build()Lcom/vladsch/flexmark/html/HtmlRenderer;
    .locals 1

    .line 338
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;)V

    return-object v0
.end method

.method public escapeHtml(Z)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 1

    .line 378
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-object p0
.end method

.method public htmlIdGeneratorFactory(Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 3

    .line 459
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    if-nez v0, :cond_0

    .line 462
    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    .line 463
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0

    .line 460
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "custom header id factory is already set to "

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

.method public bridge synthetic htmlIdGeneratorFactory(Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;)Lcom/vladsch/flexmark/html/RendererBuilder;
    .locals 0

    .line 269
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory(Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    move-result-object p1

    return-object p1
.end method

.method public indentSize(I)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 1

    .line 364
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->INDENT_SIZE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-object p0
.end method

.method public isRendererType(Ljava/lang/String;)Z
    .locals 1

    .line 383
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->TYPE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 384
    invoke-static {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer;->isCompatibleRendererType(Lcom/vladsch/flexmark/util/options/MutableDataHolder;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public linkResolverFactory(Lcom/vladsch/flexmark/html/LinkResolverFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 1

    .line 446
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 447
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method public bridge synthetic linkResolverFactory(Lcom/vladsch/flexmark/html/LinkResolverFactory;)Lcom/vladsch/flexmark/html/RendererBuilder;
    .locals 0

    .line 269
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactory(Lcom/vladsch/flexmark/html/LinkResolverFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    move-result-object p1

    return-object p1
.end method

.method protected loadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)Z
    .locals 2

    .line 322
    instance-of v0, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 323
    check-cast p1, Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;

    .line 324
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->TYPE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, p0, v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;->extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V

    return v1

    .line 326
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/html/RendererExtension;

    if-eqz v0, :cond_1

    .line 327
    check-cast p1, Lcom/vladsch/flexmark/html/RendererExtension;

    .line 328
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->TYPE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, p0, v0}, Lcom/vladsch/flexmark/html/RendererExtension;->extend(Lcom/vladsch/flexmark/html/RendererBuilder;Ljava/lang/String;)V

    return v1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 1

    .line 430
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 431
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->addExtensionApiPoint(Ljava/lang/Object;)V

    return-object p0
.end method

.method public percentEncodeUrls(Z)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 1

    .line 403
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->PERCENT_ENCODE_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-object p0
.end method

.method protected preloadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)V
    .locals 1

    .line 311
    instance-of v0, p1, Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;

    if-eqz v0, :cond_0

    .line 312
    check-cast p1, Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;

    .line 313
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;->rendererOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V

    return-void

    .line 314
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/html/RendererExtension;

    if-eqz v0, :cond_1

    .line 315
    check-cast p1, Lcom/vladsch/flexmark/html/RendererExtension;

    .line 316
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/html/RendererExtension;->rendererOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V

    :cond_1
    return-void
.end method

.method protected removeApiPoint(Ljava/lang/Object;)V
    .locals 3

    .line 300
    instance-of v0, p1, Lcom/vladsch/flexmark/html/AttributeProviderFactory;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->attributeProviderFactories:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 301
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 302
    :cond_1
    instance-of v0, p1, Lcom/vladsch/flexmark/html/LinkResolverFactory;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->linkResolverFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    .line 303
    :cond_2
    instance-of v0, p1, Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    if-eqz v0, :cond_3

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->htmlIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HeaderIdGeneratorFactory;

    return-void

    .line 305
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

.method public softBreak(Ljava/lang/String;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;
    .locals 1

    .line 353
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOFT_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-object p0
.end method
