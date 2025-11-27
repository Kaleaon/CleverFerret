.class public abstract Lcom/vladsch/flexmark/util/ast/ContentNode;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "ContentNode.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Content;


# instance fields
.field protected lineSegments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 1

    .line 30
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getSpanningChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLines()Ljava/util/List;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_LIST:Ljava/util/List;

    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

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

    .line 21
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_LIST:Ljava/util/List;

    .line 22
    iput-object p2, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 26
    invoke-static {p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;->getSpanningChars(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method

.method private static getSpanningChars(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;"
        }
    .end annotation

    .line 54
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p0

    invoke-interface {v1, v0, p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getContentChars(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 84
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/ContentNode;->getContentLines(II)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public getContentLines()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    return-object v0
.end method

.method public getContentLines(II)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getLineChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method public getLineCount()I
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSpanningChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/ast/ContentNode;->getSpanningChars(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 1

    .line 44
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getSpanningChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/ast/ContentNode;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 45
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLines()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    return-void
.end method

.method public setContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V
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

    .line 34
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 35
    iput-object p2, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    return-void
.end method

.method public setContent(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 39
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    .line 40
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/ContentNode;->getSpanningChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/ContentNode;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method public setContentLine(ILcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 2

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 93
    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 94
    iput-object v0, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    .line 95
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/ContentNode;->setCharsFromContent()V

    return-void
.end method

.method public setContentLines(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 88
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/ContentNode;->lineSegments:Ljava/util/List;

    return-void
.end method
