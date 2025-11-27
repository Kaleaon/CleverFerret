.class public Lcom/vladsch/flexmark/util/ast/NodeIterator;
.super Ljava/lang/Object;
.source "NodeIterator.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# static fields
.field public static final EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final firstNode:Lcom/vladsch/flexmark/util/ast/Node;

.field final lastNode:Lcom/vladsch/flexmark/util/ast/Node;

.field node:Lcom/vladsch/flexmark/util/ast/Node;

.field result:Lcom/vladsch/flexmark/util/ast/Node;

.field final reversed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 119
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterator$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/ast/NodeIterator$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 19
    invoke-direct {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/ast/NodeIterator;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/ast/NodeIterator;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->firstNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 50
    iput-object p2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->lastNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 51
    iput-boolean p3, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->reversed:Z

    if-eqz p3, :cond_0

    move-object p1, p2

    .line 52
    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->node:Lcom/vladsch/flexmark/util/ast/Node;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Node;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/ast/NodeIterator;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-void
.end method


# virtual methods
.method public forEachRemaining(Lcom/vladsch/flexmark/util/collection/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/Consumer<",
            "-",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 112
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public hasNext()Z
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->node:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isReversed()Z
    .locals 1

    .line 60
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->reversed:Z

    return v0
.end method

.method public next()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 3

    const/4 v0, 0x0

    .line 76
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    .line 78
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->node:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v1, :cond_4

    .line 82
    iput-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    .line 83
    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->reversed:Z

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->node:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v1, :cond_2

    .line 84
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->reversed:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->firstNode:Lcom/vladsch/flexmark/util/ast/Node;

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->lastNode:Lcom/vladsch/flexmark/util/ast/Node;

    :goto_1
    if-ne v1, v2, :cond_3

    :cond_2
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->node:Lcom/vladsch/flexmark/util/ast/Node;

    .line 85
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0

    .line 79
    :cond_4
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public peek()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->node:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->peek()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    .line 106
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    const/4 v0, 0x0

    .line 107
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    return-void

    .line 104
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Either next() was not called yet or the node was removed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
