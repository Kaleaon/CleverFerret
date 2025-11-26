.class Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;
.super Ljava/lang/Object;
.source "Reverse.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/collection/iteration/Reverse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReversedListIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private index:I

.field private final myIsReversed:Z

.field private final myList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 25
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;-><init>(Ljava/util/List;Z)V

    return-void
.end method

.method constructor <init>(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->myList:Ljava/util/List;

    .line 30
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->myIsReversed:Z

    const/4 v0, -0x1

    if-eqz p2, :cond_1

    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 v0, p1, -0x1

    :goto_0
    iput v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    return-void

    .line 34
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    iput v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 50
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isReversed()Z
    .locals 1

    .line 40
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->myIsReversed:Z

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->myList:Ljava/util/List;

    iget v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 56
    iget v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 57
    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->myIsReversed:Z

    if-eqz v3, :cond_0

    add-int/lit8 v1, v1, -0x1

    .line 58
    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    return-object v0

    .line 60
    :cond_0
    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->myList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v1, v3, :cond_1

    .line 61
    iput v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    return-object v0

    .line 63
    :cond_1
    iget v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;->index:I

    :cond_2
    return-object v0
.end method

.method public remove()V
    .locals 0

    return-void
.end method
