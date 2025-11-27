.class public Lcom/vladsch/flexmark/ast/FencedCodeBlock;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "FencedCodeBlock.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/DoNotDecorate;


# instance fields
.field private closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private fenceIndent:I

.field private info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ")V"
        }
    .end annotation

    .line 39
    invoke-direct {p0, p1, p4}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 40
    iput-object p2, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 41
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 42
    iput-object p5, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 4

    .line 17
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 18
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentLines()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 19
    iget-object v2, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "open"

    invoke-static {p1, v2, v3}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 20
    iget-object v2, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v3, "info"

    invoke-static {p1, v2, v3}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 21
    const-string v2, "content"

    invoke-static {p1, v0, v2}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->segmentSpan(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 22
    const-string v0, " lines["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "close"

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->segmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getClosingFence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getFenceIndent()I
    .locals 1

    .line 99
    iget v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->fenceIndent:I

    return v0
.end method

.method public getFenceLength()I
    .locals 1

    .line 95
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getInfo()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    return v0
.end method

.method public getInfo()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getInfoDelimitedByAny(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 78
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 79
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v1

    if-nez v1, :cond_1

    .line 80
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOfAny(Ljava/lang/CharSequence;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 82
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    return-object v0
.end method

.method public getOpeningFence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x4

    .line 28
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->closingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setFenceIndent(I)V
    .locals 0

    .line 103
    iput p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->fenceIndent:I

    return-void
.end method

.method public setInfo(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->info:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->openingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method
