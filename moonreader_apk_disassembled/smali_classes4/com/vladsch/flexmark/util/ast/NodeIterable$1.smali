.class final Lcom/vladsch/flexmark/util/ast/NodeIterable$1;
.super Ljava/lang/Object;
.source "NodeIterable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/ast/NodeIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public forEach(Lcom/vladsch/flexmark/util/collection/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/Consumer<",
            "-",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public isReversed()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 1

    .line 47
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable$1;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 50
    sget-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 47
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable$1;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 1

    .line 47
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable$1;->reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    return-object v0
.end method

.method public reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    return-object p0
.end method

.method public bridge synthetic reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 1

    .line 47
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterable$1;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 69
    sget-object v0, Lcom/vladsch/flexmark/util/ast/NodeIterator;->EMPTY:Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    return-object v0
.end method
