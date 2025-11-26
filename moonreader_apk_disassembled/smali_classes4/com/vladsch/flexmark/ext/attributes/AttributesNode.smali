.class public Lcom/vladsch/flexmark/ext/attributes/AttributesNode;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "AttributesNode.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/DelimitedNode;
.implements Lcom/vladsch/flexmark/util/ast/DoNotDecorate;
.implements Lcom/vladsch/flexmark/util/ast/NonRenderingInline;


# instance fields
.field protected closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 2

    .line 36
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 37
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 38
    iput-object p2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 39
    iput-object p3, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 25
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "text"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x3

    .line 20
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
