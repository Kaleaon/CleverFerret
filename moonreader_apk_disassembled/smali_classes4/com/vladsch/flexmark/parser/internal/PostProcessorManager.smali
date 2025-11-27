.class public Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;
.super Ljava/lang/Object;
.source "PostProcessorManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;,
        Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;,
        Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final CORE_POST_PROCESSORS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private allPostProcessNodes:Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field

.field private final postProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->CORE_POST_PROCESSORS:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;)V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->allPostProcessNodes:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    .line 30
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->postProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

    return-void
.end method

.method public static calculatePostProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;"
        }
    .end annotation

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 39
    sget-object p1, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->CORE_POST_PROCESSORS:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 40
    invoke-virtual {v1, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 41
    sget-object v2, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->CORE_POST_PROCESSORS:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/parser/PostProcessorFactory;

    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 46
    :cond_1
    new-instance p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;-><init>(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$1;)V

    .line 47
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;->resolveDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

    return-object p0
.end method

.method public static processDocument(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;)Lcom/vladsch/flexmark/util/ast/Document;
    .locals 1

    .line 51
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 52
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;-><init>(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;)V

    .line 53
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->postProcess(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public postProcess(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/Document;
    .locals 12

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->postProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;->getDependentStages()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;

    .line 68
    invoke-static {v3}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->access$100(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/parser/PostProcessorFactory;

    .line 69
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/PostProcessorFactory;->affectsGlobalScope()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 70
    invoke-interface {v5, p1}, Lcom/vladsch/flexmark/parser/PostProcessorFactory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/PostProcessor;

    move-result-object v2

    invoke-interface {v2, p1}, Lcom/vladsch/flexmark/parser/PostProcessor;->processDocument(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    move-object v2, v1

    goto :goto_0

    :cond_2
    if-nez v2, :cond_3

    .line 82
    new-instance v2, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;

    invoke-static {v3}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->access$200(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;)Ljava/util/Map;

    move-result-object v6

    invoke-direct {v2, v6}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;->classify(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;

    move-result-object v2

    .line 85
    :cond_3
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/PostProcessorFactory;->getNodeTypes()Ljava/util/Map;

    move-result-object v6

    .line 86
    invoke-interface {v5, p1}, Lcom/vladsch/flexmark/parser/PostProcessorFactory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/PostProcessor;

    move-result-object v5

    .line 87
    new-instance v7, Ljava/util/BitSet;

    invoke-direct {v7}, Ljava/util/BitSet;-><init>()V

    .line 88
    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Set;

    .line 89
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getExclusionSet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v10

    invoke-virtual {v10, v9}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexBitSet(Ljava/lang/Iterable;)Ljava/util/BitSet;

    move-result-object v9

    .line 90
    invoke-virtual {v7, v9}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    goto :goto_1

    .line 93
    :cond_4
    const-class v7, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getCategoryItems(Ljava/lang/Class;Ljava/util/Set;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v7

    .line 94
    invoke-interface {v7}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vladsch/flexmark/util/ast/Node;

    .line 95
    invoke-virtual {v8}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v9

    if-nez v9, :cond_5

    goto :goto_2

    .line 100
    :cond_5
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Set;

    if-eqz v9, :cond_6

    .line 102
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getItems()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v10

    invoke-virtual {v10, v8}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_6

    .line 104
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getNodeAncestryMap()Ljava/util/HashMap;

    move-result-object v11

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v11, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/BitSet;

    if-eqz v10, :cond_6

    .line 106
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/ClassifyingNodeTracker;->getExclusionSet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v11

    invoke-virtual {v11, v9}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexBitSet(Ljava/lang/Iterable;)Ljava/util/BitSet;

    move-result-object v9

    .line 107
    invoke-virtual {v9, v10}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    .line 108
    invoke-virtual {v9}, Ljava/util/BitSet;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_6

    goto :goto_2

    .line 115
    :cond_6
    invoke-interface {v5, v2, v8}, Lcom/vladsch/flexmark/parser/PostProcessor;->process(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_2

    :cond_7
    return-object p1
.end method
