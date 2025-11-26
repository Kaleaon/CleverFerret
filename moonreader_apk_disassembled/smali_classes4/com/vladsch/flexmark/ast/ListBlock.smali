.class public abstract Lcom/vladsch/flexmark/ast/ListBlock;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "ListBlock.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/BlankLineContainer;


# instance fields
.field private tight:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

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

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 1

    .line 53
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;->getAstExtra(Ljava/lang/StringBuilder;)V

    .line 54
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListBlock;->isTight()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, " isTight"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 55
    :cond_0
    const-string v0, " isLoose"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public getLastBlankLineChild()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 48
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListBlock;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public isLoose()Z
    .locals 1

    .line 35
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListBlock;->tight:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isTight()Z
    .locals 1

    .line 31
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/ListBlock;->tight:Z

    return v0
.end method

.method public setLoose(Z)V
    .locals 0

    xor-int/lit8 p1, p1, 0x1

    .line 43
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListBlock;->tight:Z

    return-void
.end method

.method public setTight(Z)V
    .locals 0

    .line 39
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/ListBlock;->tight:Z

    return-void
.end method
