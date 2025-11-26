.class public abstract Lcom/vladsch/flexmark/ast/InlineLinkNode;
.super Lcom/vladsch/flexmark/ast/LinkNode;
.source "InlineLinkNode.java"


# instance fields
.field protected linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>()V

    .line 6
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 7
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 8
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 9
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 6
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 7
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 8
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 9
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 95
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>()V

    .line 6
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 7
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 8
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 9
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 96
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 97
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 98
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 99
    iput-object p4, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 100
    iput-object p5, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 101
    iput-object p6, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 105
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 6
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 7
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 8
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 9
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 106
    iput-object p2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 107
    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 108
    iput-object p4, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 109
    iput-object p5, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 110
    iput-object p6, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 111
    iput-object p7, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 70
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>()V

    .line 6
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 7
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 8
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 9
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 71
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 72
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 73
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 74
    iput-object p4, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 75
    iput-object p5, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 76
    iput-object p6, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 77
    iput-object p7, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 78
    iput-object p8, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 79
    iput-object p9, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 83
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 6
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 7
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 8
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 9
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 84
    iput-object p2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 85
    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 86
    iput-object p4, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 87
    iput-object p5, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 88
    iput-object p6, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 89
    iput-object p7, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 90
    iput-object p8, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 91
    iput-object p9, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 92
    iput-object p10, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "text"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "linkOpen"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "url"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "pageRef"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "anchorMarker"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "anchorRef"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 59
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "title"

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 60
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "linkClose"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getLinkClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getLinkOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/16 v0, 0xe

    .line 14
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getSegmentsForChars()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/16 v0, 0xd

    .line 34
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTextClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTextOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public setLinkClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 159
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setLinkOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 151
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 135
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public abstract setTextChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
.end method

.method public setTextClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 143
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTextOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 131
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrl(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 116
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->setUrlChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 117
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->linkClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method protected toStringAttributes()Ljava/lang/String;
    .locals 2

    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", title="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/InlineLinkNode;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
