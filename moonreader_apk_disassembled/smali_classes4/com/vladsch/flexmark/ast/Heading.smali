.class public Lcom/vladsch/flexmark/ast/Heading;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "Heading.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/AnchorRefTarget;


# instance fields
.field protected anchorRefId:Ljava/lang/String;

.field protected closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected level:I

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->anchorRefId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 59
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    const-string p1, ""

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->anchorRefId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    const-string p1, ""

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->anchorRefId:Ljava/lang/String;

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

    .line 55
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    const-string p1, ""

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->anchorRefId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAnchorRefId()Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->anchorRefId:Ljava/lang/String;

    return-object v0
.end method

.method public getAnchorRefSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;-><init>([Ljava/lang/Class;)V

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->collectAndGetSegments(Lcom/vladsch/flexmark/util/ast/Node;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getAnchorRefText()Ljava/lang/String;
    .locals 2

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;-><init>([Ljava/lang/Class;)V

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->collectAndGetText(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 19
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Heading;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "text"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/Heading;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getLevel()I
    .locals 1

    .line 95
    iget v0, p0, Lcom/vladsch/flexmark/ast/Heading;->level:I

    return v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x3

    .line 24
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Heading;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isAtxHeading()Z
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSetextHeading()Z
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAnchorRefId(Ljava/lang/String;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->anchorRefId:Ljava/lang/String;

    return-void
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    if-nez p1, :cond_0

    .line 91
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setLevel(I)V
    .locals 0

    .line 99
    iput p1, p0, Lcom/vladsch/flexmark/ast/Heading;->level:I

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    if-nez p1, :cond_0

    .line 75
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    if-nez p1, :cond_0

    .line 83
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Heading;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
