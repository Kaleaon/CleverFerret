.class Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;
.super Ljava/lang/Object;
.source "DelegatingNodeRendererFactoryWrapper.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ComputableFactory;
.implements Lcom/vladsch/flexmark/util/dependency/Dependent;
.implements Lcom/vladsch/flexmark/html/renderer/DelegatingNodeRendererFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "Lcom/vladsch/flexmark/html/renderer/NodeRenderer;",
        "Lcom/vladsch/flexmark/util/options/DataHolder;",
        ">;",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
        ">;",
        "Lcom/vladsch/flexmark/html/renderer/DelegatingNodeRendererFactory;"
    }
.end annotation


# instance fields
.field private myDelegates:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private final nodeRendererFactory:Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

.field private nodeRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
            ">;",
            "Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;",
            ")V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->myDelegates:Ljava/util/Set;

    .line 23
    iput-object p2, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->nodeRendererFactory:Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    .line 24
    iput-object p1, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->nodeRenderers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final affectsGlobalScope()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/renderer/NodeRenderer;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->nodeRendererFactory:Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/renderer/NodeRenderer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 17
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/renderer/NodeRenderer;

    move-result-object p1

    return-object p1
.end method

.method public final getAfterDependents()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "+",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getBeforeDependents()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "+",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->myDelegates:Ljava/util/Set;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->nodeRenderers:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 49
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->getDelegates()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 51
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->myDelegates:Ljava/util/Set;

    .line 52
    iget-object v1, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->nodeRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;

    .line 53
    invoke-virtual {v2}, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->getFactory()Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 54
    iget-object v3, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->myDelegates:Ljava/util/Set;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->getFactory()Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 60
    iput-object v0, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->nodeRenderers:Ljava/util/List;

    .line 62
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->myDelegates:Ljava/util/Set;

    return-object v0
.end method

.method public getDelegates()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;",
            ">;>;"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->nodeRendererFactory:Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    instance-of v1, v0, Lcom/vladsch/flexmark/html/renderer/DelegatingNodeRendererFactory;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/vladsch/flexmark/html/renderer/DelegatingNodeRendererFactory;

    invoke-interface {v0}, Lcom/vladsch/flexmark/html/renderer/DelegatingNodeRendererFactory;->getDelegates()Ljava/util/Set;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFactory()Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;->nodeRendererFactory:Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;

    return-object v0
.end method
