.class public Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;
.super Lcom/vladsch/flexmark/util/dependency/DependencyHandler;
.source "FlatDependencyHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "TT;>;>",
        "Lcom/vladsch/flexmark/util/dependency/DependencyHandler<",
        "TT;",
        "Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage<",
        "TT;>;",
        "Lcom/vladsch/flexmark/util/dependency/FlatDependencies<",
        "TT;>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;-><init>()V

    return-void
.end method

.method public static computeDependencies(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vladsch/flexmark/util/dependency/Dependent<",
            "TT;>;>(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;-><init>()V

    .line 30
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;->resolvedDependencies(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/FlatDependencies;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage<",
            "TT;>;>;)",
            "Lcom/vladsch/flexmark/util/dependency/FlatDependencies<",
            "TT;>;"
        }
    .end annotation

    .line 25
    new-instance v0, Lcom/vladsch/flexmark/util/dependency/FlatDependencies;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/dependency/FlatDependencies;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .locals 0

    .line 5
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/FlatDependencies;

    move-result-object p1

    return-object p1
.end method

.method protected createStage(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)",
            "Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage<",
            "TT;>;"
        }
    .end annotation

    .line 14
    new-instance v0, Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createStage(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 5
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;->createStage(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;

    move-result-object p1

    return-object p1
.end method

.method protected getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/Class<",
            "+TT;>;"
        }
    .end annotation

    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method public resolvedDependencies(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 8
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/dependency/FlatDependencyHandler;->resolveDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/dependency/FlatDependencies;

    .line 9
    iget-object p1, p1, Lcom/vladsch/flexmark/util/dependency/FlatDependencies;->myLinkResolverFactories:Ljava/util/ArrayList;

    return-object p1
.end method
