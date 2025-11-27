.class public Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;
.super Ljava/lang/Object;
.source "TextNodeMergingList.java"


# instance fields
.field private isMerged:Z

.field private list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->isMerged:Z

    return-void
.end method

.method private mergeList()V
    .locals 7

    .line 67
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->isMerged:Z

    if-nez v0, :cond_a

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    move-object v3, v2

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/ast/Node;

    .line 74
    instance-of v5, v4, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v5, :cond_4

    .line 75
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    if-nez v2, :cond_1

    :goto_1
    move-object v2, v4

    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isContinuedBy(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 80
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-interface {v5, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->spliceAtEnd(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_0

    :cond_2
    if-nez v3, :cond_3

    .line 82
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 83
    :cond_3
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    if-nez v3, :cond_5

    .line 88
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :cond_5
    if-eqz v2, :cond_6

    .line 90
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v2, v1

    .line 93
    :cond_6
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_7
    if-eqz v2, :cond_9

    if-nez v3, :cond_8

    .line 99
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 100
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 102
    :cond_8
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9
    :goto_2
    if-eqz v3, :cond_a

    .line 107
    iput-object v3, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    :cond_a
    return-void
.end method


# virtual methods
.method public add(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    instance-of p1, p1, Lcom/vladsch/flexmark/ast/Text;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->isMerged:Z

    :cond_0
    return-void
.end method

.method public add(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 20
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 21
    new-instance v0, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->add(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_0
    return-void
.end method

.method public addChildrenOf(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 26
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_0

    .line 28
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 29
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 30
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->add(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public appendMergedTo(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 36
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->mergeList()V

    .line 37
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 38
    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->isMerged:Z

    return-void
.end method

.method public getMergedList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 113
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->mergeList()V

    .line 114
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    return-object v0
.end method

.method public insertMergedAfter(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 58
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->mergeList()V

    .line 59
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 60
    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/ast/Node;->insertAfter(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v1

    goto :goto_0

    .line 63
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->clear()V

    return-void
.end method

.method public insertMergedBefore(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 49
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->mergeList()V

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 51
    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeMergingList;->clear()V

    return-void
.end method
