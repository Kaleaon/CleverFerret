.class public Lcom/vladsch/flexmark/util/format/TableCell;
.super Ljava/lang/Object;
.source "TableCell.java"


# static fields
.field public static final DEFAULT_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

.field public static final NOT_TRACKED:I = 0x7fffffff

.field public static final NULL:Lcom/vladsch/flexmark/util/format/TableCell;


# instance fields
.field public final afterDelete:Z

.field public final afterSpace:Z

.field public final alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

.field public final closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public final columnSpan:I

.field public final openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public final rowSpan:I

.field public final spanTrackedOffset:I

.field public final text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public final trackedTextAdjust:I

.field public final trackedTextOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 15
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v5, 0x0

    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    const-string v2, " "

    const/4 v4, 0x1

    invoke-direct/range {v0 .. v6}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/TableCell;->NULL:Lcom/vladsch/flexmark/util/format/TableCell;

    .line 16
    new-instance v1, Lcom/vladsch/flexmark/util/format/TableCell;

    sget-object v2, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v4, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v6, 0x1

    sget-object v7, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    const-string v3, " "

    const/4 v5, 0x1

    invoke-direct/range {v1 .. v7}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/TableCell;->DEFAULT_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;II)V
    .locals 7

    .line 32
    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-object v0, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V
    .locals 7

    .line 41
    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-object v0, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)V
    .locals 7

    .line 51
    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V
    .locals 12

    const/4 v10, 0x0

    const/4 v11, 0x0

    const v7, 0x7fffffff

    const v8, 0x7fffffff

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    .line 62
    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V
    .locals 1

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    invoke-static {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 80
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 81
    invoke-static {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p3

    iput-object p3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 82
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    invoke-interface {p3, p1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p3

    invoke-interface {p1, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 83
    :goto_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_1

    sget-object p3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq p2, p3, :cond_1

    const-string p2, " "

    invoke-static {p2, p1}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p2

    :cond_1
    iput-object p2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 84
    iput p4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    .line 85
    iput p5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-eqz p6, :cond_2

    goto :goto_1

    .line 86
    :cond_2
    sget-object p6, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    :goto_1
    iput-object p6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    .line 87
    iput p7, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    .line 88
    iput p8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    .line 89
    iput p9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    .line 90
    iput-boolean p10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    .line 91
    iput-boolean p11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    return-void
.end method

.method private dumpSequence(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Ljava/lang/CharSequence;
    .locals 3

    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    const-string v1, "{ \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    const-string v2, "\\\""

    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    const-string v1, "\" ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "), length="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "}"

    .line 202
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-object v0
.end method


# virtual methods
.method public getCellLength(Lcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 1

    .line 184
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method public getCellPrefixLength(Lcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 1

    .line 195
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method public getCellSize(Lcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 1

    .line 157
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method public getEndOffset()I
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    goto :goto_0
.end method

.method public getInsideEndOffset()I
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    return v0
.end method

.method public getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 0

    if-eqz p1, :cond_0

    .line 135
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result p1

    return p1

    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    return p1

    :cond_1
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    return p1
.end method

.method getLastSegment()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 0

    if-eqz p1, :cond_0

    .line 131
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result p1

    return p1

    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    return p1

    :cond_1
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    goto :goto_0
.end method

.method public getTextEndOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    return p1

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    return p1

    :cond_1
    if-eqz p1, :cond_2

    .line 148
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    return p1

    .line 149
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    return p1
.end method

.method public getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    return p1

    .line 140
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    return p1

    :cond_1
    if-eqz p1, :cond_2

    .line 141
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    return p1

    .line 142
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    return p1
.end method

.method public insideToTextOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 2

    .line 161
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result p2

    add-int/2addr p1, p2

    const/4 p2, 0x0

    filled-new-array {p2}, [I

    move-result-object p2

    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    return p1
.end method

.method public isAtCell(ILcom/vladsch/flexmark/util/format/TableCell;)Z
    .locals 0

    .line 173
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result p2

    if-lt p1, p2, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideEndOffset()I

    move-result p2

    if-gt p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isInsideCell(ILcom/vladsch/flexmark/util/format/TableCell;)Z
    .locals 0

    .line 169
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result p2

    if-lt p1, p2, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideEndOffset()I

    move-result p2

    if-gt p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public textToInsideOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I
    .locals 2

    .line 165
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/format/TableCell;->getCellSize(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result p2

    add-int/2addr p1, p2

    const/4 p2, 0x0

    filled-new-array {p2}, [I

    move-result-object p2

    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{openMarker="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 209
    invoke-direct {p0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->dumpSequence(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", text="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 210
    invoke-direct {p0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->dumpSequence(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", closeMarker="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 211
    invoke-direct {p0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->dumpSequence(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", columnSpan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", rowSpan="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", alignment="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", trackedTextOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", spanTrackedOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", trackedTextAdjust="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", afterSpace="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", afterDelete="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withAfterSpace(Z)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 120
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v7, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget v8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    move v10, p1

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withAlignment(Lcom/vladsch/flexmark/util/html/CellAlignment;)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 106
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget v7, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget v8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    iget-boolean v10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    move-object v6, p1

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withColumnSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 94
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v7, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    const v8, 0x7fffffff

    if-ne v5, v8, :cond_0

    goto :goto_0

    :cond_0
    filled-new-array {p1}, [I

    move-result-object v8

    invoke-static {v5, v8}, Lcom/vladsch/flexmark/util/Utils;->min(I[I)I

    move-result v8

    :goto_0
    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    iget-boolean v10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    move v5, p1

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withRowSpan(I)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 104
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v7, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget v8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    iget-boolean v10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    move v4, p1

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withSpanTrackedOffset(I)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 116
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v7, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    iget-boolean v10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    move v8, p1

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withText(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 96
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    iget-boolean v10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    const v7, 0x7fffffff

    move-object v2, p1

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 102
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    iget-boolean v10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    const v7, 0x7fffffff

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withTrackedOffset(I)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 108
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    iget-boolean v10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    move v7, p1

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withTrackedOffset(IZZ)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 114
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget v9, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    move v7, p1

    move v10, p2

    move v11, p3

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method

.method public withTrackedTextAdjust(I)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 12

    .line 118
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    iget v5, p0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    iget-object v6, p0, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget v7, p0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget v8, p0, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget-boolean v10, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    iget-boolean v11, p0, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    move v9, p1

    invoke-direct/range {v0 .. v11}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;IIIZZ)V

    return-object v0
.end method
