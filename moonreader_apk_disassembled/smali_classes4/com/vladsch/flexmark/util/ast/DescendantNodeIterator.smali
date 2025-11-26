.class public Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;
.super Ljava/lang/Object;
.source "DescendantNodeIterator.java"

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


# instance fields
.field private final isReversed:Z

.field private iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field

.field private iteratorStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;>;"
        }
    .end annotation
.end field

.field private result:Lcom/vladsch/flexmark/util/ast/Node;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;->isReversed()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->isReversed:Z

    .line 21
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iteratorStack:Ljava/util/Stack;

    .line 23
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

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

    .line 74
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public hasNext()Z
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public isReversed()Z
    .locals 1

    .line 28
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->isReversed:Z

    return v0
.end method

.method public next()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 2

    .line 38
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    .line 40
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 42
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 43
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iteratorStack:Ljava/util/Stack;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iteratorStack:Ljava/util/Stack;

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iteratorStack:Ljava/util/Stack;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    :cond_1
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->isReversed:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getReversedChildIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChildIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    goto :goto_1

    .line 50
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iteratorStack:Ljava/util/Stack;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_4

    .line 52
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iteratorStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    .line 56
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public peek()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->iterator:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->peek()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    const/4 v0, 0x0

    .line 69
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/DescendantNodeIterator;->result:Lcom/vladsch/flexmark/util/ast/Node;

    return-void

    .line 66
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Either next() was not called yet or the node was removed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
