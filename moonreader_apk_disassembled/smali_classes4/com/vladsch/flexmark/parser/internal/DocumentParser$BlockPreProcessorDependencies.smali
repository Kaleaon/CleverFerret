.class public Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;
.super Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BlockPreProcessorDependencies"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies<",
        "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;",
        ">;"
    }
.end annotation


# instance fields
.field private final blockPreProcessorFactories:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final blockTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;",
            ">;)V"
        }
    .end annotation

    .line 295
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;-><init>(Ljava/util/List;)V

    .line 296
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 297
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 298
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;

    .line 299
    invoke-static {v2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;->access$000(Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 300
    invoke-static {v2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;->access$100(Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 302
    :cond_0
    iput-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;->blockPreProcessorFactories:Ljava/util/Set;

    .line 303
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;->blockTypes:Ljava/util/Set;

    return-void
.end method

.method static synthetic access$700(Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;)Ljava/util/Set;
    .locals 0

    .line 290
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;->blockTypes:Ljava/util/Set;

    return-object p0
.end method


# virtual methods
.method public getBlockPreProcessorFactories()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;"
        }
    .end annotation

    .line 311
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;->blockPreProcessorFactories:Ljava/util/Set;

    return-object v0
.end method

.method public getBlockTypes()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ">;>;"
        }
    .end annotation

    .line 307
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;->blockTypes:Ljava/util/Set;

    return-object v0
.end method
