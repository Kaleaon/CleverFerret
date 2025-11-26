.class public abstract Lcom/vladsch/flexmark/util/ast/Block;
.super Lcom/vladsch/flexmark/util/ast/ContentNode;
.source "Block.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/ContentNode;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/ContentNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;-><init>(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getParent()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 28
    invoke-super {p0}, Lcom/vladsch/flexmark/util/ast/ContentNode;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Block;

    return-object v0
.end method

.method public bridge synthetic getParent()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    return-object v0
.end method

.method protected setParent(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 33
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz v0, :cond_0

    .line 36
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;->setParent(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void

    .line 34
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Parent of block must also be block (can not be inline)"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
