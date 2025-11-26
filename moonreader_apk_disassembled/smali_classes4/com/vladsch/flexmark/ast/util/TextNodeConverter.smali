.class public Lcom/vladsch/flexmark/ast/util/TextNodeConverter;
.super Ljava/lang/Object;
.source "TextNodeConverter.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field

.field private final nodeChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    .line 16
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->nodeChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method private mergeList()V
    .locals 3

    .line 95
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    new-instance v1, Lcom/vladsch/flexmark/ast/Text;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-direct {v1, v2}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :cond_0
    return-void
.end method

.method public static mergeTextNodes(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 4

    .line 71
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p0

    const/4 v0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    .line 73
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 74
    instance-of v2, v0, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v2, :cond_0

    instance-of v2, p0, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isContinuedBy(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 76
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->spliceAtEnd(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 77
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    :cond_0
    move-object v0, p0

    move-object p0, v1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public addChildrenOf(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 38
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_0

    .line 40
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 41
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 6

    .line 21
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 24
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 25
    instance-of v1, p1, Lcom/vladsch/flexmark/ast/Text;

    if-nez v1, :cond_1

    .line 26
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 28
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    new-instance v2, Lcom/vladsch/flexmark/ast/Text;

    iget-object v3, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v4

    iget-object v5, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v5

    sub-int/2addr v4, v5

    const/4 v5, 0x0

    invoke-interface {v3, v5, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method public appendMergedTo(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 47
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->mergeList()V

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 49
    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->clear()V

    return-void
.end method

.method public clear()V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 56
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->remainingChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

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

    .line 102
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->mergeList()V

    .line 103
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    return-object v0
.end method

.method public insertMergedAfter(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 86
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->mergeList()V

    .line 87
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 88
    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/ast/Node;->insertAfter(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v1

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->clear()V

    return-void
.end method

.method public insertMergedBefore(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 61
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->mergeList()V

    .line 62
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 63
    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->clear()V

    return-void
.end method
