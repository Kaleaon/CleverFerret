.class public Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "FootnoteBlock.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/ReferenceNode;
.implements Lcom/vladsch/flexmark/ast/ParagraphItemContainer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/Block;",
        "Lcom/vladsch/flexmark/util/ast/ReferenceNode<",
        "Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;",
        "Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;",
        "Lcom/vladsch/flexmark/ext/footnotes/Footnote;",
        ">;",
        "Lcom/vladsch/flexmark/ast/ParagraphItemContainer;"
    }
.end annotation


# instance fields
.field protected closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private firstReferenceOffset:I

.field protected footnote:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private footnoteOrdinal:I

.field private footnoteReferences:I

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 80
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 18
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 19
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnote:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteOrdinal:I

    const v1, 0x7fffffff

    .line 21
    iput v1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->firstReferenceOffset:I

    .line 22
    iput v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteReferences:I

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 84
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 16
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 18
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 19
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnote:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteOrdinal:I

    const v0, 0x7fffffff

    .line 21
    iput v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->firstReferenceOffset:I

    .line 22
    iput p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteReferences:I

    return-void
.end method


# virtual methods
.method public addFirstReferenceOffset(I)V
    .locals 1

    .line 51
    iget v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->firstReferenceOffset:I

    if-ge v0, p1, :cond_0

    iput p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->firstReferenceOffset:I

    :cond_0
    return-void
.end method

.method public compareTo(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;)I
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object p1, p1, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 15
    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->compareTo(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;)I

    move-result p1

    return p1
.end method

.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 2

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " ordinal: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteOrdinal:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "open"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 70
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "text"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "close"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnote:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "footnote"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getFirstReferenceOffset()I
    .locals 1

    .line 43
    iget v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->firstReferenceOffset:I

    return v0
.end method

.method public getFootnote()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnote:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getFootnoteOrdinal()I
    .locals 1

    .line 59
    iget v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteOrdinal:I

    return v0
.end method

.method public getFootnoteReferences()I
    .locals 1

    .line 30
    iget v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteReferences:I

    return v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/ext/footnotes/Footnote;
    .locals 1

    .line 39
    instance-of v0, p1, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 0

    .line 15
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    move-result-object p1

    return-object p1
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x4

    .line 77
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnote:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isItemParagraph(Lcom/vladsch/flexmark/ast/Paragraph;)Z
    .locals 1

    .line 121
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isParagraphWrappingDisabled(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/util/options/DataHolder;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public isReferenced()Z
    .locals 2

    .line 55
    iget v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->firstReferenceOffset:I

    const v1, 0x7fffffff

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setFirstReferenceOffset(I)V
    .locals 0

    .line 47
    iput p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->firstReferenceOffset:I

    return-void
.end method

.method public setFootnote(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 116
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnote:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setFootnoteOrdinal(I)V
    .locals 0

    .line 63
    iput p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteOrdinal:I

    return-void
.end method

.method public setFootnoteReferences(I)V
    .locals 0

    .line 34
    iput p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->footnoteReferences:I

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
