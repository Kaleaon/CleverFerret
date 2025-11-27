.class public Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;
.super Ljava/lang/Object;
.source "PostProcessorManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PostProcessorDependencyStage"
.end annotation


# instance fields
.field private final dependents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final myNodeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;>;"
        }
    .end annotation
.end field

.field private final myWithExclusions:Z


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;)V"
        }
    .end annotation

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x1

    .line 132
    new-array v2, v1, [Z

    const/4 v3, 0x0

    aput-boolean v3, v2, v3

    .line 134
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/parser/PostProcessorFactory;

    .line 135
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/PostProcessorFactory;->getNodeTypes()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 136
    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_2

    :cond_1
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/PostProcessorFactory;->affectsGlobalScope()Z

    move-result v7

    if-eqz v7, :cond_5

    :cond_2
    if-eqz v6, :cond_0

    .line 141
    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 142
    const-class v7, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Class;

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 144
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Set;

    .line 145
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Set;

    if-nez v7, :cond_4

    .line 148
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7, v8}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 150
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Class;

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 153
    :cond_4
    :try_start_0
    invoke-interface {v7, v8}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 155
    :catch_0
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 156
    invoke-interface {v6, v8}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    move-object v7, v6

    .line 160
    :goto_1
    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3

    aput-boolean v1, v2, v3

    goto :goto_0

    .line 137
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PostProcessorFactory "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " is not document post processor and has empty node map, does nothing, should not be registered."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 166
    :cond_6
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->dependents:Ljava/util/List;

    .line 167
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->myNodeMap:Ljava/util/Map;

    .line 168
    aget-boolean p1, v2, v3

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->myWithExclusions:Z

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;)Ljava/util/List;
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->dependents:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;)Ljava/util/Map;
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->myNodeMap:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;)Z
    .locals 0

    .line 124
    iget-boolean p0, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->myWithExclusions:Z

    return p0
.end method
