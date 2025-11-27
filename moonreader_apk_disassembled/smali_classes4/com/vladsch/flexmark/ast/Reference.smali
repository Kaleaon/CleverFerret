.class public Lcom/vladsch/flexmark/ast/Reference;
.super Lcom/vladsch/flexmark/ast/LinkNodeBase;
.source "Reference.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/ReferenceNode;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/ast/LinkNodeBase;",
        "Lcom/vladsch/flexmark/util/ast/ReferenceNode<",
        "Lcom/vladsch/flexmark/ast/util/ReferenceRepository;",
        "Lcom/vladsch/flexmark/ast/Reference;",
        "Lcom/vladsch/flexmark/ast/RefNode;",
        ">;"
    }
.end annotation


# instance fields
.field protected closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 4

    .line 68
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/ast/LinkNodeBase;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 70
    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 71
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 72
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    invoke-interface {p1, v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 74
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/ast/Reference;->setUrlChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    if-eqz p3, :cond_0

    .line 77
    invoke-interface {p3, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 78
    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    sub-int/2addr p1, v1

    invoke-interface {p3, v1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 79
    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    sub-int/2addr p1, v1

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p2

    invoke-interface {p3, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 81
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/Reference;->setCharsFromContent()V

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/vladsch/flexmark/ast/Reference;)I
    .locals 1

    .line 52
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/Reference;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Reference;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 9
    check-cast p1, Lcom/vladsch/flexmark/ast/Reference;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/Reference;->compareTo(Lcom/vladsch/flexmark/ast/Reference;)I

    move-result p1

    return p1
.end method

.method public getAnchorMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getAnchorRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 62
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Reference;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "ref"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/Reference;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Reference;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "url"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/Reference;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 64
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Reference;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "title"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/Reference;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getPageRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/ast/RefNode;
    .locals 1

    .line 57
    instance-of v0, p1, Lcom/vladsch/flexmark/ast/RefNode;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/vladsch/flexmark/ast/RefNode;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 0

    .line 9
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/Reference;->getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/ast/RefNode;

    move-result-object p1

    return-object p1
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/16 v0, 0xc

    .line 16
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getSegmentsForChars()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/16 v0, 0xc

    .line 34
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Reference;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 38
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    const-string v2, " "

    invoke-static {v2, v1}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Reference;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTitleClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTitleOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getUrlClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getUrlOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Reference;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public setAnchorMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 161
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setAnchorRef(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 89
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setPageRef(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setReference(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 137
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTitle(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 177
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTitleClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 129
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTitleOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrl(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 145
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrlClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrlOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Reference;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method protected toStringAttributes()Ljava/lang/String;
    .locals 2

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "reference="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Reference;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Reference;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
