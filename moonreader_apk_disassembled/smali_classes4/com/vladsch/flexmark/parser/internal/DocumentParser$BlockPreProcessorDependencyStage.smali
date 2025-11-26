.class public Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;
.super Ljava/lang/Object;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BlockPreProcessorDependencyStage"
.end annotation


# instance fields
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

.field private final dependents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;)V"
        }
    .end annotation

    .line 277
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 281
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;

    .line 282
    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;->getBlockTypes()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 285
    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;->dependents:Ljava/util/List;

    .line 286
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;->blockTypes:Ljava/util/Set;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;)Ljava/util/Set;
    .locals 0

    .line 273
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;->blockTypes:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;)Ljava/util/List;
    .locals 0

    .line 273
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;->dependents:Ljava/util/List;

    return-object p0
.end method
