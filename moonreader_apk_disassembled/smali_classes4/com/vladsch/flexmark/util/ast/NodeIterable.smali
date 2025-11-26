.class public Lcom/vladsch/flexmark/util/ast/NodeIterable;
.super Ljava/lang/Object;
.source "NodeIterable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# static fields
.field public static final EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final firstNode:Lcom/vladsch/flexmark/util/ast/Node;

.field final lastNode:Lcom/vladsch/flexmark/util/ast/Node;

.field final reversed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterable$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/ast/NodeIterable$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->firstNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 15
    iput-object p2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->lastNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 16
    iput-boolean p3, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->reversed:Z

    return-void
.end method


# virtual methods
.method public forEach(Lcom/vladsch/flexmark/util/collection/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/Consumer<",
            "-",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    .line 26
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    .line 27
    :goto_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 28
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public isReversed()Z
    .locals 1

    .line 39
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->reversed:Z

    return v0
.end method

.method public bridge synthetic iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 22
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->firstNode:Lcom/vladsch/flexmark/util/ast/Node;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->lastNode:Lcom/vladsch/flexmark/util/ast/Node;

    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->reversed:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/NodeIterator;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable;->reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    return-object v0
.end method

.method public reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->firstNode:Lcom/vladsch/flexmark/util/ast/Node;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->lastNode:Lcom/vladsch/flexmark/util/ast/Node;

    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->reversed:Z

    xor-int/lit8 v3, v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/NodeIterable;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-object v0
.end method

.method public bridge synthetic reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 44
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->firstNode:Lcom/vladsch/flexmark/util/ast/Node;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->lastNode:Lcom/vladsch/flexmark/util/ast/Node;

    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/ast/NodeIterable;->reversed:Z

    xor-int/lit8 v3, v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/NodeIterator;-><init>(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Z)V

    return-object v0
.end method
