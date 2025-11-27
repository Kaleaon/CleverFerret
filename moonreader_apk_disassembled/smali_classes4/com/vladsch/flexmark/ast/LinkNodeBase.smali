.class public abstract Lcom/vladsch/flexmark/ast/LinkNodeBase;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "LinkNodeBase.java"


# instance fields
.field protected anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    .line 7
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 8
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 9
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 7
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 8
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 9
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAnchorMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getAnchorRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getPageRef()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTitleClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTitleOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getUrlClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getUrlOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public setAnchorMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setAnchorRef(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setPageRef(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTitle(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 125
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTitleChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 3

    if-eqz p1, :cond_0

    .line 25
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq p1, v0, :cond_0

    .line 26
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 27
    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/lit8 v1, v0, -0x1

    .line 28
    invoke-interface {p1, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 29
    invoke-interface {p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void

    .line 31
    :cond_0
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 32
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->title:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 33
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTitleClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTitleOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->titleOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrl(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrlChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 3

    if-eqz p1, :cond_2

    .line 38
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq p1, v0, :cond_2

    .line 40
    const-string v0, "<"

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, ">"

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 41
    invoke-interface {p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 42
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 43
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    goto :goto_0

    .line 45
    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 49
    :goto_0
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/16 v0, 0x23

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result p1

    if-gez p1, :cond_1

    .line 51
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, v1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->pageRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 54
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/lit8 v1, p1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 55
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->anchorRef:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void

    .line 58
    :cond_2
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 59
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->url:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 60
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrlClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setUrlOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/LinkNodeBase;->urlOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
