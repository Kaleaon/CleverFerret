.class public Lcom/vladsch/flexmark/ast/AutoLink;
.super Lcom/vladsch/flexmark/ast/DelimitedLinkNode;
.source "AutoLink.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ast/DelimitedLinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 41
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/ast/AutoLink;->setUrlChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 2

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "open"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/AutoLink;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "text"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/AutoLink;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 29
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "pageRef"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/AutoLink;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "anchorMarker"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/AutoLink;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 31
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "anchorRef"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/AutoLink;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 32
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/AutoLink;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "close"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/AutoLink;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x5

    .line 11
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getSegmentsForChars()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x5

    .line 16
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/AutoLink;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method
