.class public Lcom/vladsch/flexmark/ext/footnotes/Footnote;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "Footnote.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/DelimitedNode;
.implements Lcom/vladsch/flexmark/util/ast/DoNotDecorate;
.implements Lcom/vladsch/flexmark/util/ast/ReferencingNode;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/Node;",
        "Lcom/vladsch/flexmark/ast/DelimitedNode;",
        "Lcom/vladsch/flexmark/util/ast/DoNotDecorate;",
        "Lcom/vladsch/flexmark/util/ast/ReferencingNode<",
        "Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;",
        "Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;",
        ">;"
    }
.end annotation


# instance fields
.field protected closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected referenceOrdinal:I

.field protected text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 78
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 82
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 16
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 2

    .line 86
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 87
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 88
    iput-object p2, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 89
    iput-object p3, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 74
    const-string v0, " ordinal: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFootnoteOrdinal()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "text"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getFootnoteBlock()Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-object v0
.end method

.method public getFootnoteBlock(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-object p1
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReferenceNode(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getFootnoteBlock(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-object p1

    .line 46
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-object p1
.end method

.method public getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 40
    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getFootnoteBlock(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-object p1

    .line 39
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-object p1
.end method

.method public bridge synthetic getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;
    .locals 0

    .line 14
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getReferenceNode(Lcom/vladsch/flexmark/util/ast/NodeRepository;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;
    .locals 0

    .line 14
    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getReferenceNode(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object p1

    return-object p1
.end method

.method public getReferenceOrdinal()I
    .locals 1

    .line 21
    iget v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->referenceOrdinal:I

    return v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x3

    .line 69
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isDefined()Z
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setFootnoteBlock(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setReferenceOrdinal(I)V
    .locals 0

    .line 25
    iput p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->referenceOrdinal:I

    return-void
.end method

.method public setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
