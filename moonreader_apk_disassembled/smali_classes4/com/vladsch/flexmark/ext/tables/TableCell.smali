.class public Lcom/vladsch/flexmark/ext/tables/TableCell;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "TableCell.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/DelimitedNode;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;
    }
.end annotation


# instance fields
.field private alignment:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

.field protected closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private header:Z

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private span:I

.field protected text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 127
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 18
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x1

    .line 22
    iput v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->span:I

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 131
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 16
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 18
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x1

    .line 22
    iput p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->span:I

    return-void
.end method


# virtual methods
.method public getAlignment()Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->alignment:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    return-object v0
.end method

.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 121
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->alignment:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    if-eqz v0, :cond_0

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->alignment:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 122
    :cond_0
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->header:Z

    if-eqz v0, :cond_1

    const-string v0, " header"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    :cond_1
    iget v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->span:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " span="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->span:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "text"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ext/tables/TableCell;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x3

    .line 116
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getSpan()I
    .locals 1

    .line 107
    iget v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->span:I

    return v0
.end method

.method public getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isHeader()Z
    .locals 1

    .line 138
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->header:Z

    return v0
.end method

.method public mergeWhiteSpace()V
    .locals 5

    .line 50
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    const/4 v1, 0x0

    .line 52
    :goto_0
    instance-of v2, v0, Lcom/vladsch/flexmark/ast/WhiteSpace;

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 53
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 54
    new-instance v2, Lcom/vladsch/flexmark/ast/Text;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 55
    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 56
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    move-object v0, v1

    const/4 v1, 0x1

    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 62
    :goto_1
    instance-of v2, v0, Lcom/vladsch/flexmark/ast/WhiteSpace;

    if-eqz v2, :cond_1

    .line 63
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 64
    new-instance v2, Lcom/vladsch/flexmark/ast/Text;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 65
    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 66
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    move-object v0, v1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    .line 72
    invoke-static {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->mergeTextNodes(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_2
    return-void
.end method

.method public setAlignment(Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;)V
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->alignment:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    return-void
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 103
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setHeader(Z)V
    .locals 0

    .line 142
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->header:Z

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setSpan(I)V
    .locals 0

    .line 111
    iput p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->span:I

    return-void
.end method

.method public setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 93
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public trimWhiteSpace()V
    .locals 4

    .line 25
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    move-object v1, v0

    .line 28
    :goto_0
    instance-of v2, v1, Lcom/vladsch/flexmark/ast/WhiteSpace;

    if-eqz v2, :cond_0

    .line 29
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    .line 30
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    move-object v1, v2

    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 35
    :goto_1
    instance-of v2, v1, Lcom/vladsch/flexmark/ast/WhiteSpace;

    if-eqz v2, :cond_1

    .line 36
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    .line 37
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    move-object v1, v2

    goto :goto_1

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    if-nez v1, :cond_2

    if-eqz v0, :cond_2

    .line 43
    new-instance v1, Lcom/vladsch/flexmark/ast/Text;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 44
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_2
    return-void
.end method
