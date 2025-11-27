.class public Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;
.super Ljava/lang/Object;
.source "NodeCollectingVisitor.java"


# static fields
.field public static final NODE_CLASSIFIER:Lcom/vladsch/flexmark/util/Computable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/Computable<",
            "Ljava/lang/Class;",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final myClasses:[Ljava/lang/Class;

.field private final myExcluded:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private final myIncluded:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private final myNodes:Lcom/vladsch/flexmark/util/collection/ClassificationBag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/ClassificationBag<",
            "Ljava/lang/Class;",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field

.field private final mySubClassMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class;",
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    new-instance v0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->NODE_CLASSIFIER:Lcom/vladsch/flexmark/util/Computable;

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Class;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Class;

    invoke-interface {p1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myClasses:[Ljava/lang/Class;

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->mySubClassMap:Ljava/util/HashMap;

    .line 26
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myIncluded:Ljava/util/HashSet;

    .line 27
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 29
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 30
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 31
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 35
    :cond_0
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myExcluded:Ljava/util/HashSet;

    .line 37
    new-instance p1, Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    sget-object v0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->NODE_CLASSIFIER:Lcom/vladsch/flexmark/util/Computable;

    invoke-direct {p1, v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;-><init>(Lcom/vladsch/flexmark/util/Computable;)V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myNodes:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 6

    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 50
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myIncluded:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 51
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myNodes:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 52
    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myExcluded:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 54
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myClasses:[Ljava/lang/Class;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, v1, v3

    .line 55
    invoke-virtual {v4, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 57
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myIncluded:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 58
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_1

    .line 60
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 61
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->mySubClassMap:Ljava/util/HashMap;

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 65
    :cond_1
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    :goto_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myNodes:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    .line 69
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 75
    :cond_3
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myExcluded:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_4
    :goto_2
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 81
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_0

    .line 85
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 86
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public collect(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public getSubClassingBag()Lcom/vladsch/flexmark/util/collection/SubClassingBag;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/SubClassingBag<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 45
    new-instance v0, Lcom/vladsch/flexmark/util/collection/SubClassingBag;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->myNodes:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;->mySubClassMap:Ljava/util/HashMap;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/SubClassingBag;-><init>(Lcom/vladsch/flexmark/util/collection/ClassificationBag;Ljava/util/HashMap;)V

    return-object v0
.end method
