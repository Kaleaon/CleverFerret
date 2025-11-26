.class public Lcom/vladsch/flexmark/ast/OrderedList;
.super Lcom/vladsch/flexmark/ast/ListBlock;
.source "OrderedList.java"


# instance fields
.field private delimiter:C

.field private startNumber:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/ListBlock;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListBlock;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListBlock;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/ast/ListBlock;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 2

    .line 34
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/ast/ListBlock;->getAstExtra(Ljava/lang/StringBuilder;)V

    .line 35
    iget v0, p0, Lcom/vladsch/flexmark/ast/OrderedList;->startNumber:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    const-string v0, " start:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/vladsch/flexmark/ast/OrderedList;->startNumber:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    :cond_0
    const-string v0, " delimiter:\'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-char v0, p0, Lcom/vladsch/flexmark/ast/OrderedList;->delimiter:C

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public getDelimiter()C
    .locals 1

    .line 48
    iget-char v0, p0, Lcom/vladsch/flexmark/ast/OrderedList;->delimiter:C

    return v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/ast/OrderedList;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getStartNumber()I
    .locals 1

    .line 40
    iget v0, p0, Lcom/vladsch/flexmark/ast/OrderedList;->startNumber:I

    return v0
.end method

.method public setDelimiter(C)V
    .locals 0

    .line 52
    iput-char p1, p0, Lcom/vladsch/flexmark/ast/OrderedList;->delimiter:C

    return-void
.end method

.method public setStartNumber(I)V
    .locals 0

    .line 44
    iput p1, p0, Lcom/vladsch/flexmark/ast/OrderedList;->startNumber:I

    return-void
.end method
