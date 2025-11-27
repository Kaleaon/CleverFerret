.class Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;
.super Lcom/vladsch/flexmark/util/dependency/DependencyHandler;
.source "PostProcessorManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PostProcessDependencyHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/DependencyHandler<",
        "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
        "Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;",
        "Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 192
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$1;)V
    .locals 0

    .line 192
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;"
        }
    .end annotation

    .line 200
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .locals 0

    .line 192
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

    move-result-object p1

    return-object p1
.end method

.method protected createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;"
        }
    .end annotation

    .line 205
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createStage(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 192
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;->createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;

    move-result-object p1

    return-object p1
.end method

.method protected getDependentClass(Lcom/vladsch/flexmark/parser/PostProcessorFactory;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ")",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;"
        }
    .end annotation

    .line 195
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;
    .locals 0

    .line 192
    check-cast p1, Lcom/vladsch/flexmark/parser/PostProcessorFactory;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;->getDependentClass(Lcom/vladsch/flexmark/parser/PostProcessorFactory;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method protected prioritize(Lcom/vladsch/flexmark/util/dependency/DependentItemMap;)Lcom/vladsch/flexmark/util/dependency/DependentItemMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/dependency/DependentItemMap<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/util/dependency/DependentItemMap<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;"
        }
    .end annotation

    .line 211
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->entries()Ljava/util/List;

    move-result-object v0

    .line 212
    new-instance v1, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler$1;

    invoke-direct {v1, p0}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler$1;-><init>(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 221
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->keySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->keyDifferenceBitSet(Ljava/lang/Iterable;)Ljava/util/BitSet;

    move-result-object v1

    .line 222
    invoke-virtual {v1}, Ljava/util/BitSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object p1

    .line 226
    :cond_0
    new-instance p1, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {p1, v1}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;-><init>(I)V

    .line 227
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/dependency/DependentItemMap;->addAll(Ljava/util/Collection;)V

    return-object p1
.end method
