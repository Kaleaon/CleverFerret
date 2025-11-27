.class public Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "AbbreviationBlock.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/ReferenceNode;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/Block;",
        "Lcom/vladsch/flexmark/util/ast/ReferenceNode<",
        "Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;",
        "Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;",
        "Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;",
        ">;"
    }
.end annotation


# instance fields
.field protected abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 16
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;)I
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 12
    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->compareTo(Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;)I

    move-result p1

    return p1
.end method

.method public getAbbreviation()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 2

    .line 30
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "open"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "text"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 32
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "close"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "abbreviation"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;
    .locals 1

    .line 20
    instance-of v0, p1, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 0

    .line 12
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;

    move-result-object p1

    return-object p1
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x4

    .line 38
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public setAbbreviation(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
