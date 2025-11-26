.class Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;
.super Lcom/vladsch/flexmark/util/dependency/DependencyHandler;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ParagraphDependencyHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/DependencyHandler<",
        "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
        "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;",
        "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 224
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;)V
    .locals 0

    .line 224
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;"
        }
    .end annotation

    .line 232
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .locals 0

    .line 224
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    move-result-object p1

    return-object p1
.end method

.method protected createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;"
        }
    .end annotation

    .line 237
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createStage(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 224
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;->createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;

    move-result-object p1

    return-object p1
.end method

.method protected getDependentClass(Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ")",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;"
        }
    .end annotation

    .line 227
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;
    .locals 0

    .line 224
    check-cast p1, Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;->getDependentClass(Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
