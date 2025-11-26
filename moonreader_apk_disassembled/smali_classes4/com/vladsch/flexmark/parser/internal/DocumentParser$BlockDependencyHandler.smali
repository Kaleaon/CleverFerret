.class Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;
.super Lcom/vladsch/flexmark/util/dependency/DependencyHandler;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockDependencyHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/DependencyHandler<",
        "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
        "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;",
        "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 315
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;)V
    .locals 0

    .line 315
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;"
        }
    .end annotation

    .line 323
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .locals 0

    .line 315
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    move-result-object p1

    return-object p1
.end method

.method protected createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;"
        }
    .end annotation

    .line 328
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createStage(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 315
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;->createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;

    move-result-object p1

    return-object p1
.end method

.method protected getDependentClass(Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ")",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;"
        }
    .end annotation

    .line 318
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;
    .locals 0

    .line 315
    check-cast p1, Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;->getDependentClass(Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
