.class public Lcom/vladsch/flexmark/util/dependency/FlatDependencies;
.super Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
.source "FlatDependencies.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies<",
        "Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field myLinkResolverFactories:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TT;>;"
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
            "Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;-><init>(Ljava/util/List;)V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;

    .line 13
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;->getDependents()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 16
    :cond_0
    iput-object v0, p0, Lcom/vladsch/flexmark/util/dependency/FlatDependencies;->myLinkResolverFactories:Ljava/util/ArrayList;

    return-void
.end method
