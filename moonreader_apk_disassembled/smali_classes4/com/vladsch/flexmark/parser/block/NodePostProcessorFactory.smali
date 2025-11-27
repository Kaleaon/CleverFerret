.class public abstract Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;
.super Ljava/lang/Object;
.source "NodePostProcessorFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/PostProcessorFactory;


# instance fields
.field private final NODE_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;->NODE_MAP:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method protected final varargs addNodeWithExclusions(Ljava/lang/Class;[Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;[",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 32
    array-length v0, p2

    if-lez v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;->NODE_MAP:Ljava/util/HashMap;

    new-instance v1, Ljava/util/HashSet;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    const/4 p2, 0x1

    .line 36
    new-array p2, p2, [Ljava/lang/Class;

    const/4 v0, 0x0

    aput-object p1, p2, v0

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;->addNodes([Ljava/lang/Class;)V

    return-void
.end method

.method protected final varargs addNodes([Ljava/lang/Class;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 41
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 43
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;->NODE_MAP:Ljava/util/HashMap;

    sget-object v4, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final affectsGlobalScope()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/PostProcessor;
    .locals 0

    .line 9
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;

    move-result-object p1

    return-object p1
.end method

.method public abstract create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 9
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Document;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;

    move-result-object p1

    return-object p1
.end method

.method public getAfterDependents()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getBeforeDependents()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getNodeTypes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;>;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;->NODE_MAP:Ljava/util/HashMap;

    return-object v0
.end method
