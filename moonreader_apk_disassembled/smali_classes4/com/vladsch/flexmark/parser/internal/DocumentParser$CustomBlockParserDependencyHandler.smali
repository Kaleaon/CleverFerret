.class Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;
.super Lcom/vladsch/flexmark/util/dependency/DependencyHandler;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CustomBlockParserDependencyHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/DependencyHandler<",
        "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
        "Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;",
        "Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 256
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;)V
    .locals 0

    .line 256
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;"
        }
    .end annotation

    .line 264
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .locals 0

    .line 256
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;

    move-result-object p1

    return-object p1
.end method

.method protected createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;"
        }
    .end annotation

    .line 269
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createStage(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 256
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;->createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;

    move-result-object p1

    return-object p1
.end method

.method protected getDependentClass(Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ")",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;"
        }
    .end annotation

    .line 259
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;
    .locals 0

    .line 256
    check-cast p1, Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;->getDependentClass(Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
