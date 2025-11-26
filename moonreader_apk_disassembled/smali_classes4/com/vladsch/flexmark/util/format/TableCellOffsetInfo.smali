.class public Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;
.super Ljava/lang/Object;
.source "TableCellOffsetInfo.java"


# static fields
.field private static final DEFAULT_STOP_POINTS_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/util/format/TableSectionType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROW_END:I = 0x8

.field public static final ROW_START:I = 0x1

.field public static final TEXT_END:I = 0x4

.field public static final TEXT_START:I = 0x2


# instance fields
.field public final column:I

.field public final insideColumn:Ljava/lang/Integer;

.field public final insideOffset:Ljava/lang/Integer;

.field public final offset:I

.field public final row:I

.field public final section:Lcom/vladsch/flexmark/util/format/TableSection;

.field public final table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field public final tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

.field public final tableRow:Lcom/vladsch/flexmark/util/format/TableRow;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->DEFAULT_STOP_POINTS_MAP:Ljava/util/HashMap;

    .line 26
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableSectionType;->HEADER:Lcom/vladsch/flexmark/util/format/TableSectionType;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableSectionType;->SEPARATOR:Lcom/vladsch/flexmark/util/format/TableSectionType;

    const/4 v3, 0x6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableSectionType;->BODY:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableSectionType;->CAPTION:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(ILcom/vladsch/flexmark/util/format/MarkdownTable;Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRow;Lcom/vladsch/flexmark/util/format/TableCell;IILjava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->offset:I

    .line 54
    iput-object p2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    .line 55
    iput-object p3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->section:Lcom/vladsch/flexmark/util/format/TableSection;

    .line 56
    iput-object p4, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    .line 57
    iput-object p5, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    .line 58
    iput p6, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->row:I

    .line 59
    iput p7, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    .line 60
    iput-object p8, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideColumn:Ljava/lang/Integer;

    .line 61
    iput-object p9, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideOffset:Ljava/lang/Integer;

    return-void
.end method

.method static synthetic access$000(I)Z
    .locals 0

    .line 16
    invoke-static {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->haveRowStart(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(II)Z
    .locals 0

    .line 16
    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->haveStopPoint(II)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(I)Z
    .locals 0

    .line 16
    invoke-static {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->haveTextStart(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(I)Z
    .locals 0

    .line 16
    invoke-static {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->haveTextEnd(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(I)Z
    .locals 0

    .line 16
    invoke-static {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->haveRowEnd(I)Z

    move-result p0

    return p0
.end method

.method private static getStopOffset(ILcom/vladsch/flexmark/util/format/MarkdownTable;Ljava/util/Map;Z)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/format/MarkdownTable;",
            "Ljava/util/Map<",
            "Lcom/vladsch/flexmark/util/format/TableSectionType;",
            "Ljava/lang/Integer;",
            ">;Z)I"
        }
    .end annotation

    const/4 v0, 0x1

    .line 319
    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput-object v2, v0, v1

    if-nez p2, :cond_0

    .line 321
    sget-object p2, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->DEFAULT_STOP_POINTS_MAP:Ljava/util/HashMap;

    :cond_0
    if-eqz p3, :cond_1

    .line 322
    new-instance p3, Lcom/vladsch/flexmark/util/collection/BoundedMinAggregator;

    invoke-direct {p3, p0}, Lcom/vladsch/flexmark/util/collection/BoundedMinAggregator;-><init>(I)V

    goto :goto_0

    :cond_1
    new-instance p3, Lcom/vladsch/flexmark/util/collection/BoundedMaxAggregator;

    invoke-direct {p3, p0}, Lcom/vladsch/flexmark/util/collection/BoundedMaxAggregator;-><init>(I)V

    .line 324
    :goto_0
    new-instance p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;-><init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;Ljava/util/Map;[Ljava/lang/Integer;Lcom/vladsch/flexmark/util/BiFunction;)V

    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionRows(Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    .line 366
    aget-object p0, v0, v1

    if-nez p0, :cond_2

    const/4 p0, -0x1

    return p0

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method private static haveRowEnd(I)Z
    .locals 0

    and-int/lit8 p0, p0, 0x8

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static haveRowStart(I)Z
    .locals 1

    const/4 v0, 0x1

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static haveStopPoint(II)Z
    .locals 0

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static haveTextEnd(I)Z
    .locals 0

    and-int/lit8 p0, p0, 0x4

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static haveTextStart(I)Z
    .locals 0

    and-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public canDeleteColumn()Z
    .locals 3

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideColumn:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getMinColumnsWithoutColumns(Z[I)I

    move-result v0

    if-lez v0, :cond_0

    return v2

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public canDeleteRow()Z
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->section:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getInsideColumn()Z
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideColumn:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getPreviousCell()Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 1

    const/4 v0, 0x1

    .line 97
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    return-object v0
.end method

.method public getPreviousCell(I)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell(Lcom/vladsch/flexmark/util/format/TableRow;I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p1

    return-object p1
.end method

.method public getPreviousCell(Lcom/vladsch/flexmark/util/format/TableRow;I)Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 1

    .line 105
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    if-lt v0, p2, :cond_0

    if-eqz p1, :cond_0

    iget-object p1, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    sub-int/2addr v0, p2

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/TableCell;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public isAfterCaption()Z
    .locals 1

    .line 77
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isCaptionLine()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isAfterCells()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isAfterCells()Z
    .locals 2

    .line 113
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideColumn:Ljava/lang/Integer;

    if-nez v1, :cond_0

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v1, v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->offset:I

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isBeforeCaption()Z
    .locals 1

    .line 81
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isCaptionLine()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isBeforeCells()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isBeforeCells()Z
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideColumn:Ljava/lang/Integer;

    if-nez v1, :cond_0

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->offset:I

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v1

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCaptionLine()Z
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    instance-of v0, v0, Lcom/vladsch/flexmark/util/format/TableCaptionRow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->section:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFirstCell()Z
    .locals 1

    .line 125
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getInsideColumn()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInCellSpan()Z
    .locals 3

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideColumn:Ljava/lang/Integer;

    if-nez v1, :cond_0

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->offset:I

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    if-lt v1, v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->offset:I

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInsideCaption()Z
    .locals 1

    .line 73
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isCaptionLine()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getInsideColumn()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInsideCell()Z
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideColumn:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isLastCell()Z
    .locals 3

    .line 129
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getInsideColumn()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ne v0, v2, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isLastRow()Z
    .locals 3

    .line 133
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->row:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRowsCount()I

    move-result v2

    if-ne v0, v2, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSeparatorLine()Z
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->section:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->sectionType:Lcom/vladsch/flexmark/util/format/TableSectionType;

    sget-object v1, Lcom/vladsch/flexmark/util/format/TableSectionType;->SEPARATOR:Lcom/vladsch/flexmark/util/format/TableSectionType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public nextCellOffset(Ljava/lang/Integer;)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;
    .locals 5

    .line 168
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getInsideColumn()Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 169
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    const/4 v1, 0x2

    .line 170
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v1

    const/4 v2, 0x0

    if-nez p1, :cond_1

    .line 172
    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v4, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideOffset:Ljava/lang/Integer;

    if-nez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :goto_0
    invoke-virtual {v3, v4, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->insideToTextOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v3

    invoke-virtual {v0, v3, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->textToInsideOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I

    .line 173
    :cond_1
    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v4

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getCellSize(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v2, p1}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    add-int/2addr v4, p1

    invoke-virtual {v3, v4}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public nextOffsetStop(Ljava/util/Map;)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/vladsch/flexmark/util/format/TableSectionType;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;"
        }
    .end annotation

    .line 248
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->offset:I

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v2, 0x1

    invoke-static {v0, v1, p1, v2}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getStopOffset(ILcom/vladsch/flexmark/util/format/MarkdownTable;Ljava/util/Map;Z)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    .line 254
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllSectionRows()Ljava/util/List;

    move-result-object p1

    .line 255
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 256
    iget-object v1, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, v2

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 257
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result v1

    .line 258
    iget-object p1, p1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 260
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endOfLineAnyEOL(I)I

    move-result v2

    .line 261
    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    if-ne v2, v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->eolLength(I)I

    move-result p1

    add-int v1, v2, p1

    :goto_0
    invoke-virtual {v3, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1
.end method

.method public nextRowOffset(Ljava/lang/Integer;)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;
    .locals 6

    .line 219
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->row:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRowsCount()I

    move-result v2

    const/4 v3, 0x0

    if-ge v0, v2, :cond_4

    .line 220
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRows()Ljava/util/List;

    move-result-object v0

    .line 221
    iget v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->row:I

    add-int/2addr v2, v1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 222
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getInsideColumn()Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_2

    .line 224
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 225
    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell(Lcom/vladsch/flexmark/util/format/TableRow;I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    if-nez p1, :cond_1

    .line 227
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideOffset:Ljava/lang/Integer;

    if-nez v3, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    :goto_0
    invoke-virtual {v1, v3, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->insideToTextOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v1

    invoke-virtual {v2, v1, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->textToInsideOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I

    .line 228
    :cond_1
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v2, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v3

    invoke-virtual {v2, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getCellSize(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v4, p1}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    add-int/2addr v3, p1

    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    .line 230
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isBeforeCells()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 231
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v0, v3}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    .line 233
    :cond_3
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v3
.end method

.method public previousCellOffset(Ljava/lang/Integer;)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;
    .locals 5

    .line 147
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getInsideColumn()Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    if-lez v0, :cond_2

    .line 148
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    const/4 v1, 0x2

    .line 149
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v1

    const/4 v2, 0x0

    if-nez p1, :cond_1

    .line 151
    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v4, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideOffset:Ljava/lang/Integer;

    if-nez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :goto_0
    invoke-virtual {v3, v4, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->insideToTextOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v3

    invoke-virtual {v0, v3, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->textToInsideOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I

    .line 153
    :cond_1
    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v4

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getCellSize(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v2, p1}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    add-int/2addr v4, p1

    invoke-virtual {v3, v4}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public previousOffsetStop(Ljava/util/Map;)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/vladsch/flexmark/util/format/TableSectionType;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;"
        }
    .end annotation

    .line 272
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->offset:I

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, v2}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getStopOffset(ILcom/vladsch/flexmark/util/format/MarkdownTable;Ljava/util/Map;Z)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 274
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    .line 276
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getTableStartOffset()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1
.end method

.method public previousRowOffset(Ljava/lang/Integer;)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;
    .locals 5

    .line 188
    iget v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->row:I

    const/4 v1, 0x0

    if-lez v0, :cond_4

    .line 189
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRows()Ljava/util/List;

    move-result-object v0

    .line 190
    iget v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->row:I

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 191
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getInsideColumn()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 193
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    const/4 v1, 0x2

    .line 194
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getPreviousCell(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v1

    if-nez p1, :cond_1

    .line 196
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v4, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideOffset:Ljava/lang/Integer;

    if-nez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :goto_0
    invoke-virtual {v2, v4, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->insideToTextOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v2

    invoke-virtual {v0, v2, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->textToInsideOffset(ILcom/vladsch/flexmark/util/format/TableCell;)I

    .line 197
    :cond_1
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v4

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getCellSize(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v3, p1}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p1

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result p1

    add-int/2addr v4, p1

    invoke-virtual {v2, v4}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    .line 199
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isBeforeCells()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 200
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    .line 202
    :cond_3
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 371
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CellOffsetInfo{ offset="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->offset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", row="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->row:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", column="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", insideColumn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideColumn:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", insideOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->insideOffset:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
