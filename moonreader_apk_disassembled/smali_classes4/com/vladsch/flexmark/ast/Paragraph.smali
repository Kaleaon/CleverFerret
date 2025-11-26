.class public Lcom/vladsch/flexmark/ast/Paragraph;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "Paragraph.java"


# static fields
.field private static EMPTY_INDENTS:[I


# instance fields
.field private hasTableSeparator:Z

.field private lineIndents:[I

.field private trailingBlankLine:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [I

    sput-object v0, Lcom/vladsch/flexmark/ast/Paragraph;->EMPTY_INDENTS:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/Block;-><init>()V

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/ast/Paragraph;->EMPTY_INDENTS:[I

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->trailingBlankLine:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 1

    .line 48
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/ast/Paragraph;->EMPTY_INDENTS:[I

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->trailingBlankLine:Z

    .line 49
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLineIndents()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/Paragraph;->setLineIndents(Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/ast/Paragraph;->EMPTY_INDENTS:[I

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->trailingBlankLine:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/ast/Paragraph;->EMPTY_INDENTS:[I

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->trailingBlankLine:Z

    .line 35
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    if-ne p1, p2, :cond_0

    .line 37
    invoke-virtual {p0, p3}, Lcom/vladsch/flexmark/ast/Paragraph;->setLineIndents(Ljava/util/List;)V

    return-void

    .line 36
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "line segments and line indents have to be of the same size"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;[I)V"
        }
    .end annotation

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/ast/Paragraph;->EMPTY_INDENTS:[I

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->trailingBlankLine:Z

    .line 42
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    array-length p2, p3

    if-ne p1, p2, :cond_0

    .line 44
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    return-void

    .line 43
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "line segments and line indents have to be of the same size"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 1

    .line 22
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;->getAstExtra(Ljava/lang/StringBuilder;)V

    .line 23
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->trailingBlankLine:Z

    if-eqz v0, :cond_0

    const-string v0, " isTrailingBlankLine"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    return-void
.end method

.method public getLineIndent(I)I
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    aget p1, v0, p1

    return p1
.end method

.method public getLineIndents()[I
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 17
    sget-object v0, Lcom/vladsch/flexmark/ast/Paragraph;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public hasTableSeparator()Z
    .locals 1

    .line 126
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->hasTableSeparator:Z

    return v0
.end method

.method public isTrailingBlankLine()Z
    .locals 1

    .line 114
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->trailingBlankLine:Z

    return v0
.end method

.method public setContent(Lcom/vladsch/flexmark/ast/Paragraph;II)V
    .locals 2

    .line 91
    invoke-virtual {p1, p2, p3}, Lcom/vladsch/flexmark/ast/Paragraph;->getContentLines(II)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/vladsch/flexmark/util/ast/Block;->setContent(Ljava/util/List;)V

    if-le p3, p2, :cond_0

    sub-int/2addr p3, p2

    .line 93
    new-array v0, p3, [I

    .line 94
    iget-object p1, p1, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 95
    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    return-void

    .line 97
    :cond_0
    sget-object p1, Lcom/vladsch/flexmark/ast/Paragraph;->EMPTY_INDENTS:[I

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    return-void
.end method

.method public setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 81
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;->setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    .line 82
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLineIndents()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/Paragraph;->setLineIndents(Ljava/util/List;)V

    return-void
.end method

.method public setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;II)V
    .locals 1

    .line 86
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLines()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2, p3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/vladsch/flexmark/util/ast/Block;->setContent(Ljava/util/List;)V

    .line 87
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLineIndents()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p2, p3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/Paragraph;->setLineIndents(Ljava/util/List;)V

    return-void
.end method

.method public setContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 63
    invoke-super {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;->setContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    return-void
.end method

.method public setContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 67
    invoke-super {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;->setContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 68
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    if-ne p1, p2, :cond_0

    .line 70
    invoke-virtual {p0, p3}, Lcom/vladsch/flexmark/ast/Paragraph;->setLineIndents(Ljava/util/List;)V

    return-void

    .line 69
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "line segments and line indents have to be of the same size"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setContent(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 76
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;->setContent(Ljava/util/List;)V

    return-void
.end method

.method public setHasTableSeparator(Z)V
    .locals 0

    .line 122
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->hasTableSeparator:Z

    return-void
.end method

.method protected setLineIndents(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 53
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    .line 55
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 56
    iget-object v2, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    add-int/lit8 v3, v0, 0x1

    aput v1, v2, v0

    move v0, v3

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setLineIndents([I)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->lineIndents:[I

    return-void
.end method

.method public setTrailingBlankLine(Z)V
    .locals 0

    .line 118
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/Paragraph;->trailingBlankLine:Z

    return-void
.end method
