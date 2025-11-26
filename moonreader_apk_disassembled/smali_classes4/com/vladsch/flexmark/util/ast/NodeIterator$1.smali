.class final Lcom/vladsch/flexmark/util/ast/NodeIterator$1;
.super Ljava/lang/Object;
.source "NodeIterator.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/ast/NodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isReversed()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public next()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 137
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 119
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterator$1;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public peek()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .line 119
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/NodeIterator$1;->peek()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 0

    return-void
.end method
