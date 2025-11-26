.class final Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;
.super Ljava/lang/Object;
.source "TableCellOffsetInfo.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/format/TableRowManipulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getStopOffset(ILcom/vladsch/flexmark/util/format/MarkdownTable;Ljava/util/Map;Z)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

.field final synthetic val$result:[Ljava/lang/Integer;

.field final synthetic val$table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field final synthetic val$useStopPointsMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;Ljava/util/Map;[Ljava/lang/Integer;Lcom/vladsch/flexmark/util/BiFunction;)V
    .locals 0

    .line 324
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$useStopPointsMap:Ljava/util/Map;

    iput-object p3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$result:[Ljava/lang/Integer;

    iput-object p4, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vladsch/flexmark/util/format/TableRow;ILjava/util/ArrayList;I)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            "I",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;I)I"
        }
    .end annotation

    .line 332
    iget-object p3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$table:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRowsSection(I)Lcom/vladsch/flexmark/util/format/TableSection;

    move-result-object p2

    .line 333
    iget-object p3, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p3

    const/4 p4, 0x0

    if-nez p3, :cond_4

    iget-object p3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$useStopPointsMap:Ljava/util/Map;

    iget-object v0, p2, Lcom/vladsch/flexmark/util/format/TableSection;->sectionType:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-interface {p3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 334
    iget-object p3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$useStopPointsMap:Ljava/util/Map;

    iget-object p2, p2, Lcom/vladsch/flexmark/util/format/TableSection;->sectionType:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    if-eqz p2, :cond_4

    .line 337
    iget-object p3, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/vladsch/flexmark/util/format/TableCell;

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result p3

    .line 338
    iget-object v1, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget-object v2, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getEndOffset()I

    move-result v1

    .line 340
    invoke-static {p2}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->access$000(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 341
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$result:[Ljava/lang/Integer;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    aget-object v4, v2, p4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {v3, v4, p3}, Lcom/vladsch/flexmark/util/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    aput-object p3, v2, p4

    :cond_0
    const/4 p3, 0x6

    .line 343
    invoke-static {p2, p3}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->access$100(II)Z

    move-result p3

    if-eqz p3, :cond_3

    .line 345
    iget-object p1, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 346
    invoke-static {p2}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->access$200(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 347
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v2

    .line 348
    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$result:[Ljava/lang/Integer;

    iget-object v4, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    aget-object v5, v3, p4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    aput-object v2, v3, p4

    .line 351
    :cond_1
    invoke-static {p2}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->access$300(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 352
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextEndOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    .line 353
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$result:[Ljava/lang/Integer;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    aget-object v4, v2, p4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v3, v4, v0}, Lcom/vladsch/flexmark/util/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    aput-object v0, v2, p4

    :cond_2
    move-object v0, p3

    goto :goto_0

    .line 359
    :cond_3
    invoke-static {p2}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->access$400(I)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$result:[Ljava/lang/Integer;

    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo$1;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    aget-object p3, p1, p4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p2, p3, v0}, Lcom/vladsch/flexmark/util/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    aput-object p2, p1, p4

    :cond_4
    return p4
.end method
