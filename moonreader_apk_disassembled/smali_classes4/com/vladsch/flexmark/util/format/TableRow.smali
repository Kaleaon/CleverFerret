.class public Lcom/vladsch/flexmark/util/format/TableRow;
.super Ljava/lang/Object;
.source "TableRow.java"


# instance fields
.field protected afterOffset:I

.field protected beforeOffset:I

.field protected final cells:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/TableCell;",
            ">;"
        }
    .end annotation
.end field

.field private normalized:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    .line 14
    iput v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    .line 15
    iput v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->normalized:Z

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    return-void
.end method

.method private dumpCells()Ljava/lang/CharSequence;
    .locals 4

    .line 330
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 331
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 332
    const-string v3, "    "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/TableCell;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public addColumn(I)V
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public appendColumns(I)V
    .locals 1

    const/4 v0, 0x0

    .line 78
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/format/TableRow;->appendColumns(ILcom/vladsch/flexmark/util/format/TableCell;)V

    return-void
.end method

.method public appendColumns(ILcom/vladsch/flexmark/util/format/TableCell;)V
    .locals 3

    if-eqz p2, :cond_0

    .line 82
    iget v0, p2, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-nez v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p2

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_2

    .line 86
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1, v2, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public columnOf(I)I
    .locals 0

    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->columnOfOrNull(Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method public columnOfOrNull(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 3

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 68
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    .line 70
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 71
    iget v2, v2, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 74
    :cond_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 3

    .line 91
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    const-string v1, " "

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;II)V

    return-object v0
.end method

.method public deleteColumns(II)V
    .locals 4

    if-lez p2, :cond_4

    if-gez p1, :cond_0

    goto :goto_2

    .line 163
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->normalizeIfNeeded()V

    .line 166
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->indexOf(I)Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;

    move-result-object p1

    .line 167
    iget v0, p1, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->index:I

    .line 168
    iget p1, p1, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->spanOffset:I

    .line 170
    :goto_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    if-lez p2, :cond_4

    .line 171
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 172
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    if-lez p1, :cond_2

    .line 178
    iget v2, v1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    sub-int/2addr v2, p1

    if-le v2, p2, :cond_1

    .line 179
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget v2, v1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    sub-int/2addr v2, p2

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/format/TableCell;->withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void

    .line 183
    :cond_1
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/format/TableCell;->withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 186
    :cond_2
    iget v2, v1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    sub-int/2addr v2, p1

    if-le v2, p2, :cond_3

    .line 188
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v2

    iget v1, v1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    sub-int/2addr v1, p2

    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void

    .line 192
    :cond_3
    :goto_1
    iget v1, v1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    sub-int/2addr v1, p1

    sub-int/2addr p2, v1

    const/4 p1, 0x0

    goto :goto_0

    :cond_4
    :goto_2
    return-void
.end method

.method public expandTo(I)Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    .line 234
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableCell;->NULL:Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/format/TableRow;->expandTo(ILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object p1

    return-object p1
.end method

.method public expandTo(ILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;
    .locals 1

    if-eqz p2, :cond_0

    .line 238
    iget v0, p2, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->normalized:Z

    .line 240
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_2

    .line 241
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object p0
.end method

.method fillMissingColumns(Ljava/lang/Integer;I)V
    .locals 4

    .line 247
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->getSpannedColumns()I

    move-result v0

    if-ge v0, p2, :cond_5

    if-nez p1, :cond_0

    .line 249
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_0
    sub-int/2addr p2, v0

    if-eqz p1, :cond_1

    .line 252
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-lt p1, v0, :cond_2

    .line 253
    :cond_1
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .line 256
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p1

    if-lez v1, :cond_3

    .line 257
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    add-int/lit8 v2, v1, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    goto :goto_1

    :cond_3
    move-object v0, p1

    :goto_1
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_5

    .line 261
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result p2

    .line 263
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getLastSegment()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    const-string v3, " "

    invoke-static {v3, v0, p2, p2}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/format/TableCell;->withText(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    .line 265
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    if-gt v1, p2, :cond_4

    move p2, v1

    goto :goto_2

    :cond_4
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    :goto_2
    invoke-interface {p1, p2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    move-object p1, v0

    move p2, v2

    goto :goto_1

    :cond_5
    return-void
.end method

.method public getAfterOffset()I
    .locals 1

    .line 52
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    return v0
.end method

.method public getBeforeOffset()I
    .locals 1

    .line 44
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    return v0
.end method

.method public getCells()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/TableCell;",
            ">;"
        }
    .end annotation

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    return-object v0
.end method

.method public getColumns()I
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSpannedColumns()I
    .locals 3

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableCell;

    if-nez v2, :cond_0

    goto :goto_0

    .line 38
    :cond_0
    iget v2, v2, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int/2addr v1, v2

    goto :goto_0

    :cond_1
    return v1
.end method

.method public getTotalColumns()I
    .locals 1

    .line 31
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->getSpannedColumns()I

    move-result v0

    return v0
.end method

.method public indexOf(I)Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;
    .locals 0

    .line 290
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->indexOfOrNull(Ljava/lang/Integer;)Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;

    move-result-object p1

    return-object p1
.end method

.method public indexOfOrNull(Ljava/lang/Integer;)Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;
    .locals 5

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 296
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 299
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 300
    iget v4, v3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-le v4, p1, :cond_2

    .line 302
    new-instance v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;

    invoke-direct {v0, v2, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;-><init>(II)V

    return-object v0

    .line 305
    :cond_2
    iget v4, v3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    sub-int/2addr p1, v4

    .line 307
    iget v3, v3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-lez v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 310
    :cond_3
    new-instance p1, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;

    invoke-direct {p1, v2, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;-><init>(II)V

    return-object p1
.end method

.method public insertColumns(II)V
    .locals 1

    const/4 v0, 0x0

    .line 103
    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/format/TableRow;->insertColumns(IILcom/vladsch/flexmark/util/format/TableCell;)V

    return-void
.end method

.method public insertColumns(IILcom/vladsch/flexmark/util/format/TableCell;)V
    .locals 4

    if-lez p2, :cond_7

    if-gez p1, :cond_0

    goto/16 :goto_2

    .line 117
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->normalizeIfNeeded()V

    if-eqz p3, :cond_1

    .line 119
    iget v0, p3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p3

    .line 121
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->getTotalColumns()I

    move-result v0

    if-lt p1, v0, :cond_3

    .line 124
    invoke-virtual {p0, p2, p3}, Lcom/vladsch/flexmark/util/format/TableRow;->appendColumns(ILcom/vladsch/flexmark/util/format/TableCell;)V

    return-void

    .line 127
    :cond_3
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->indexOf(I)Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;

    move-result-object p1

    .line 128
    iget v0, p1, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->index:I

    .line 129
    iget p1, p1, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->spanOffset:I

    if-lez p1, :cond_6

    .line 131
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 133
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 136
    iget-object v2, p3, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v2

    if-nez v2, :cond_5

    const/4 v2, 0x1

    if-le p2, v2, :cond_4

    goto :goto_0

    .line 142
    :cond_4
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 143
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/format/TableCell;->withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v3

    invoke-interface {p2, v0, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 144
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    add-int/2addr v0, v2

    iget v1, v1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    sub-int/2addr v1, p1

    add-int/2addr v1, v2

    filled-new-array {v1}, [I

    move-result-object p1

    invoke-static {v2, p1}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/util/format/TableCell;->withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p1

    invoke-interface {p2, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void

    .line 138
    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 139
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget p3, v1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int/2addr p3, p2

    invoke-virtual {v1, p3}, Lcom/vladsch/flexmark/util/format/TableCell;->withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void

    .line 147
    :cond_6
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/TableCell;

    const/4 p1, 0x0

    :goto_1
    if-ge p1, p2, :cond_7

    .line 150
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1, v0, p3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_7
    :goto_2
    return-void
.end method

.method public isEmpty()Z
    .locals 2

    .line 283
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableCell;

    if-eqz v1, :cond_0

    .line 284
    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public isEmptyColumn(I)Z
    .locals 1

    .line 278
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->indexOf(I)Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;

    move-result-object p1

    iget p1, p1, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->index:I

    .line 279
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public moveColumn(II)V
    .locals 6

    if-ltz p1, :cond_9

    if-gez p2, :cond_0

    goto :goto_2

    .line 200
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->normalizeIfNeeded()V

    .line 202
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->getTotalColumns()I

    move-result v0

    if-lt p1, v0, :cond_1

    goto :goto_2

    :cond_1
    if-lt p2, v0, :cond_2

    add-int/lit8 p2, v0, -0x1

    :cond_2
    if-eq p1, p2, :cond_9

    if-ge p1, v0, :cond_9

    if-ge p2, v0, :cond_9

    .line 208
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->indexOf(I)Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;

    move-result-object v0

    .line 209
    iget v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->index:I

    .line 210
    iget v0, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->spanOffset:I

    .line 211
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableCell;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/util/format/TableCell;->withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v2

    .line 213
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/format/TableRow;->indexOf(I)Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;

    move-result-object v4

    .line 214
    iget v5, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->index:I

    .line 215
    iget v4, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;->spanOffset:I

    if-ne v5, v1, :cond_3

    return-void

    :cond_3
    const/4 v1, 0x0

    if-lez v0, :cond_6

    if-gt p1, p2, :cond_4

    const/4 v0, 0x1

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_0
    add-int/2addr v0, p2

    .line 223
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->defaultCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v2

    invoke-virtual {p0, v0, v3, v2}, Lcom/vladsch/flexmark/util/format/TableRow;->insertColumns(IILcom/vladsch/flexmark/util/format/TableCell;)V

    if-gt p2, p1, :cond_5

    const/4 v1, 0x1

    :cond_5
    add-int/2addr p1, v1

    .line 224
    invoke-virtual {p0, p1, v3}, Lcom/vladsch/flexmark/util/format/TableRow;->deleteColumns(II)V

    return-void

    :cond_6
    if-gt p1, p2, :cond_7

    const/4 v0, 0x1

    goto :goto_1

    :cond_7
    const/4 v0, 0x0

    :goto_1
    add-int/2addr v0, p2

    .line 226
    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/util/format/TableCell;->withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v2

    invoke-virtual {p0, v0, v3, v2}, Lcom/vladsch/flexmark/util/format/TableRow;->insertColumns(IILcom/vladsch/flexmark/util/format/TableCell;)V

    if-gt p2, p1, :cond_8

    const/4 v1, 0x1

    :cond_8
    add-int/2addr p1, v1

    .line 227
    invoke-virtual {p0, p1, v3}, Lcom/vladsch/flexmark/util/format/TableRow;->deleteColumns(II)V

    :cond_9
    :goto_2
    return-void
.end method

.method public normalize()V
    .locals 3

    const/4 v0, 0x0

    .line 321
    :goto_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 322
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableCell;

    if-eqz v1, :cond_1

    .line 323
    sget-object v2, Lcom/vladsch/flexmark/util/format/TableCell;->NULL:Lcom/vladsch/flexmark/util/format/TableCell;

    if-ne v1, v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    .line 326
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->normalized:Z

    return-void
.end method

.method public normalizeIfNeeded()V
    .locals 1

    .line 314
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->normalized:Z

    if-nez v0, :cond_0

    .line 315
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->normalize()V

    :cond_0
    return-void
.end method

.method public set(ILcom/vladsch/flexmark/util/format/TableCell;)V
    .locals 1

    const/4 v0, 0x0

    .line 273
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/format/TableRow;->expandTo(ILcom/vladsch/flexmark/util/format/TableCell;)Lcom/vladsch/flexmark/util/format/TableRow;

    .line 274
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setAfterOffset(I)V
    .locals 0

    .line 56
    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    return-void
.end method

.method public setBeforeOffset(I)V
    .locals 0

    .line 48
    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 339
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{ beforeOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", afterOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", normalized="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableRow;->normalized:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", cells=[\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/format/TableRow;->dumpCells()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "    ]\n  }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
