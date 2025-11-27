.class public Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;
.super Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
.source "HtmlRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/HtmlRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RendererDependencies"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies<",
        "Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;",
        ">;"
    }
.end annotation


# instance fields
.field private final nodeRendererFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;",
            ">;)V"
        }
    .end annotation

    .line 510
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;-><init>(Ljava/util/List;)V

    .line 511
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 512
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;

    .line 513
    invoke-static {v1}, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;->access$100(Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 515
    :cond_0
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;->nodeRendererFactories:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getNodeRendererFactories()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
            ">;"
        }
    .end annotation

    .line 519
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencies;->nodeRendererFactories:Ljava/util/List;

    return-object v0
.end method
