.class Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;
.super Lcom/vladsch/flexmark/util/dependency/DependencyHandler;
.source "HtmlRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/HtmlRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RendererDependencyHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/DependencyHandler<",
        "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
        "Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;",
        "Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 523
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/html/HtmlRenderer$1;)V
    .locals 0

    .line 523
    invoke-direct {p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;",
            ">;)",
            "Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;"
        }
    .end annotation

    .line 531
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .locals 0

    .line 523
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;

    move-result-object p1

    return-object p1
.end method

.method protected createStage(Ljava/util/List;)Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
            ">;)",
            "Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;"
        }
    .end annotation

    .line 536
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createStage(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 523
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;->createStage(Ljava/util/List;)Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;

    move-result-object p1

    return-object p1
.end method

.method protected getDependentClass(Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;)Ljava/lang/Class;
    .locals 0

    .line 526
    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->getFactory()Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;
    .locals 0

    .line 523
    check-cast p1, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyHandler;->getDependentClass(Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
