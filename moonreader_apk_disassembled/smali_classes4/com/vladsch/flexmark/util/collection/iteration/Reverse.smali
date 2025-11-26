.class public Lcom/vladsch/flexmark/util/collection/iteration/Reverse;
.super Ljava/lang/Object;
.source "Reverse.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
        "TT;>;"
    }
.end annotation


# instance fields
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

    .line 11
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;-><init>(Ljava/util/List;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myList:Ljava/util/List;

    .line 16
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myIsReversed:Z

    return-void
.end method


# virtual methods
.method public isReversed()Z
    .locals 1

    .line 84
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myIsReversed:Z

    return v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "TT;>;"
        }
    .end annotation

    .line 74
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myList:Ljava/util/List;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myIsReversed:Z

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;-><init>(Ljava/util/List;Z)V

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 5
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversed()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TT;>;"
        }
    .end annotation

    .line 79
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myList:Ljava/util/List;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myIsReversed:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;-><init>(Ljava/util/List;Z)V

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "TT;>;"
        }
    .end annotation

    .line 89
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myList:Ljava/util/List;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->myIsReversed:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/Reverse$ReversedListIterator;-><init>(Ljava/util/List;Z)V

    return-object v0
.end method
