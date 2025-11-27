.class public Lcom/vladsch/flexmark/ext/tables/TableRow;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "TableRow.java"


# instance fields
.field private rowNumber:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Node;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 1

    .line 17
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getAstExtra(Ljava/lang/StringBuilder;)V

    .line 18
    iget v0, p0, Lcom/vladsch/flexmark/ext/tables/TableRow;->rowNumber:I

    if-eqz v0, :cond_0

    const-string v0, " rowNumber="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/vladsch/flexmark/ext/tables/TableRow;->rowNumber:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_0
    return-void
.end method

.method public getRowNumber()I
    .locals 1

    .line 34
    iget v0, p0, Lcom/vladsch/flexmark/ext/tables/TableRow;->rowNumber:I

    return v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 23
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TableRow;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public setRowNumber(I)V
    .locals 0

    .line 38
    iput p1, p0, Lcom/vladsch/flexmark/ext/tables/TableRow;->rowNumber:I

    return-void
.end method
