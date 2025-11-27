.class Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencyHandler;
.super Lcom/vladsch/flexmark/util/dependency/DependencyHandler;
.source "InlineParserImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InlineParserExtensionDependencyHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/DependencyHandler<",
        "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
        "Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;",
        "Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/dependency/DependencyHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;"
        }
    .end annotation

    .line 56
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencyHandler;->createResolvedDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;

    move-result-object p1

    return-object p1
.end method

.method protected createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;"
        }
    .end annotation

    .line 61
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected bridge synthetic createStage(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencyHandler;->createStage(Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;

    move-result-object p1

    return-object p1
.end method

.method protected getDependentClass(Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ")",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;"
        }
    .end annotation

    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic getDependentClass(Lcom/vladsch/flexmark/util/dependency/Dependent;)Ljava/lang/Class;
    .locals 0

    .line 48
    check-cast p1, Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencyHandler;->getDependentClass(Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
