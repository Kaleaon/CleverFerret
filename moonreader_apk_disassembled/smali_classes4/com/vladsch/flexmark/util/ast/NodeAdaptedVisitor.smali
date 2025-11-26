.class public abstract Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;
.super Ljava/lang/Object;
.source "NodeAdaptedVisitor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<H:",
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler<",
        "**>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final myCustomHandlersMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;TH;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "TH;>;)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->myCustomHandlersMap:Ljava/util/Map;

    .line 30
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->addHandlers(Ljava/util/Collection;)Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;

    return-void
.end method

.method public varargs constructor <init>([Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TH;)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->myCustomHandlersMap:Ljava/util/Map;

    .line 22
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->addHandlers([Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;

    return-void
.end method

.method public varargs constructor <init>([[Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[TH;)V"
        }
    .end annotation

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->myCustomHandlersMap:Ljava/util/Map;

    .line 26
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->addHandlers([[Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;

    return-void
.end method


# virtual methods
.method public addHandlers(Ljava/util/Collection;)Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "TH;>;)",
            "Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor<",
            "TH;>;"
        }
    .end annotation

    .line 50
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;

    .line 51
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->myCustomHandlersMap:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->getNodeType()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public varargs addHandlers([Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TH;)",
            "Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor<",
            "TH;>;"
        }
    .end annotation

    .line 34
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 35
    iget-object v3, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->myCustomHandlersMap:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->getNodeType()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public varargs addHandlers([[Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;)Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[TH;)",
            "Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor<",
            "TH;>;"
        }
    .end annotation

    .line 41
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 42
    array-length v4, v3

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_0

    aget-object v6, v3, v5

    .line 43
    iget-object v7, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptedVisitor;->myCustomHandlersMap:Ljava/util/Map;

    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->getNodeType()Ljava/lang/Class;

    move-result-object v8

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method
