.class public Lcom/vladsch/flexmark/ast/Image;
.super Lcom/vladsch/flexmark/ast/InlineLinkNode;
.source "Image.java"


# instance fields
.field private urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/InlineLinkNode;-><init>()V

    .line 6
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/InlineLinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 6
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 59
    invoke-direct/range {p0 .. p6}, Lcom/vladsch/flexmark/ast/InlineLinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    move-object p1, p0

    .line 6
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p2, p1, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 63
    invoke-direct/range {p0 .. p7}, Lcom/vladsch/flexmark/ast/InlineLinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    move-object p1, p0

    .line 6
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p2, p1, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 51
    invoke-direct/range {p0 .. p9}, Lcom/vladsch/flexmark/ast/InlineLinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    move-object p1, p0

    .line 6
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p2, p1, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 55
    invoke-direct/range {p0 .. p10}, Lcom/vladsch/flexmark/ast/InlineLinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    move-object p1, p0

    .line 6
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p2, p1, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 32
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Image;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "text"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/Image;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "linkOpen"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/Image;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 34
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Image;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "url"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/Image;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "pageRef"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/Image;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "anchorMarker"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/Image;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 37
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "anchorRef"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/Image;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 38
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "urlContent"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/Image;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 39
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/Image;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "title"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/Image;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 40
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "linkClose"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/Image;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/16 v0, 0x10

    .line 10
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getUrlContent()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public setTextChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 3

    .line 68
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    .line 69
    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/ast/Image;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/lit8 v1, v0, -0x1

    .line 70
    invoke-interface {p1, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/ast/Image;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 71
    invoke-interface {p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Image;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrlContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Image;->urlContent:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
