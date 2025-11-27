.class public Lcom/vladsch/flexmark/util/format/MarkdownTable;
.super Ljava/lang/Object;
.source "MarkdownTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/util/format/MarkdownTable$IndexSpanOffset;,
        Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

.field private final ALL_SECTIONS:[Lcom/vladsch/flexmark/util/format/TableSection;

.field private final ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

.field private alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

.field public final body:Lcom/vladsch/flexmark/util/format/TableSection;

.field public final caption:Lcom/vladsch/flexmark/util/format/TableSection;

.field private columnWidths:[I

.field public final header:Lcom/vladsch/flexmark/util/format/TableSection;

.field private isHeading:Z

.field private isSeparator:Z

.field public options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

.field public final separator:Lcom/vladsch/flexmark/util/format/TableSection;

.field private trackedOffsets:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/format/TableFormatOptions;)V
    .locals 8

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    .line 60
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableSection;

    sget-object v1, Lcom/vladsch/flexmark/util/format/TableSectionType;->HEADER:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/format/TableSection;-><init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    .line 61
    new-instance v1, Lcom/vladsch/flexmark/util/format/TableSeparatorSection;

    sget-object v2, Lcom/vladsch/flexmark/util/format/TableSectionType;->SEPARATOR:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-direct {v1, v2}, Lcom/vladsch/flexmark/util/format/TableSeparatorSection;-><init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V

    iput-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    .line 62
    new-instance v2, Lcom/vladsch/flexmark/util/format/TableSection;

    sget-object v3, Lcom/vladsch/flexmark/util/format/TableSectionType;->BODY:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-direct {v2, v3}, Lcom/vladsch/flexmark/util/format/TableSection;-><init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V

    iput-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    .line 63
    new-instance v3, Lcom/vladsch/flexmark/util/format/TableCaptionSection;

    sget-object v4, Lcom/vladsch/flexmark/util/format/TableSectionType;->CAPTION:Lcom/vladsch/flexmark/util/format/TableSectionType;

    invoke-direct {v3, v4}, Lcom/vladsch/flexmark/util/format/TableCaptionSection;-><init>(Lcom/vladsch/flexmark/util/format/TableSectionType;)V

    iput-object v3, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    const/4 v4, 0x1

    .line 64
    iput-boolean v4, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isHeading:Z

    const/4 v5, 0x0

    .line 65
    iput-boolean v5, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator:Z

    if-nez p1, :cond_0

    .line 66
    new-instance p1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    const/4 v6, 0x0

    invoke-direct {p1, v6}, Lcom/vladsch/flexmark/util/format/TableFormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    const/4 p1, 0x4

    .line 68
    new-array p1, p1, [Lcom/vladsch/flexmark/util/format/TableSection;

    aput-object v0, p1, v5

    aput-object v1, p1, v4

    const/4 v6, 0x2

    aput-object v2, p1, v6

    const/4 v7, 0x3

    aput-object v3, p1, v7

    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_SECTIONS:[Lcom/vladsch/flexmark/util/format/TableSection;

    .line 69
    new-array p1, v7, [Lcom/vladsch/flexmark/util/format/TableSection;

    aput-object v0, p1, v5

    aput-object v1, p1, v4

    aput-object v2, p1, v6

    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    .line 70
    new-array p1, v6, [Lcom/vladsch/flexmark/util/format/TableSection;

    aput-object v0, p1, v5

    aput-object v2, p1, v4

    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 56
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/format/TableFormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;-><init>(Lcom/vladsch/flexmark/util/format/TableFormatOptions;)V

    return-void
.end method

.method private adjustCellAlignment(Lcom/vladsch/flexmark/util/html/CellAlignment;)Lcom/vladsch/flexmark/util/html/CellAlignment;
    .locals 2

    .line 1338
    sget-object v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$DiscretionaryText:[I

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leftAlignMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 1344
    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne p1, v0, :cond_2

    sget-object p1, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object p1

    :cond_1
    if-eqz p1, :cond_3

    .line 1340
    sget-object v0, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne p1, v0, :cond_2

    goto :goto_1

    :cond_2
    :goto_0
    return-object p1

    .line 1341
    :cond_3
    :goto_1
    sget-object p1, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object p1
.end method

.method private varargs aggregateTotalColumnsWithoutColumns([Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/BiFunction;[I)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/vladsch/flexmark/util/format/TableSection;",
            "Lcom/vladsch/flexmark/util/BiFunction<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;[I)I"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1358
    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 1360
    new-instance v2, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;

    invoke-direct {v2, p0, p3, v0, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;-><init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;[I[Ljava/lang/Integer;Lcom/vladsch/flexmark/util/BiFunction;)V

    const p2, 0x7fffffff

    invoke-direct {p0, v1, p2, p1, v2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    .line 1380
    aget-object p1, v0, v1

    if-nez p1, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method private varargs aggregateTotalColumnsWithoutRows([Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/BiFunction;[I)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/vladsch/flexmark/util/format/TableSection;",
            "Lcom/vladsch/flexmark/util/BiFunction<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;[I)I"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1388
    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 1390
    new-instance v2, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;

    invoke-direct {v2, p0, p3, v0, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;-><init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;[I[Ljava/lang/Integer;Lcom/vladsch/flexmark/util/BiFunction;)V

    const p2, 0x7fffffff

    invoke-direct {p0, v1, p2, p1, v2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    .line 1407
    aget-object p1, v0, v1

    if-nez p1, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method private appendColumnSpan(Lcom/vladsch/flexmark/util/html/FormattingAppendable;IIILjava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendable;",
            "III",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    const v0, 0x7fffffff

    const/16 v1, 0x7c

    if-ne p4, v0, :cond_0

    .line 1169
    invoke-interface {p1, v1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void

    :cond_0
    if-nez p4, :cond_2

    if-eqz p5, :cond_1

    add-int/2addr p3, p4

    .line 1173
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result p4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p5, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1174
    :cond_1
    invoke-interface {p1, v1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void

    :cond_2
    if-ge p4, p2, :cond_4

    .line 1176
    invoke-interface {p1, v1, p4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    if-eqz p5, :cond_3

    add-int/2addr p3, p4

    .line 1178
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p5, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    sub-int/2addr p2, p4

    .line 1179
    invoke-interface {p1, v1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void

    .line 1181
    :cond_4
    invoke-interface {p1, v1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    if-eqz p5, :cond_5

    add-int/2addr p3, p4

    .line 1183
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p5, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    return-void
.end method

.method public static appendFormattedCaption(Lcom/vladsch/flexmark/util/html/FormattingAppendable;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/format/TableFormatOptions;)V
    .locals 0

    .line 1024
    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->formattedCaption(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/format/TableFormatOptions;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1026
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p0

    const/16 p2, 0x5b

    invoke-interface {p0, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p0

    const/16 p1, 0x5d

    invoke-interface {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p0

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_0
    return-void
.end method

.method private appendRows(Lcom/vladsch/flexmark/util/html/FormattingAppendable;Ljava/util/List;ZLjava/lang/String;Lcom/vladsch/flexmark/util/Ref;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendable;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;Z",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    .line 1096
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lcom/vladsch/flexmark/util/format/TableRow;

    const/4 v11, 0x0

    .line 1099
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v7, p5

    iput-object v1, v7, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    move-object/from16 v12, p4

    .line 1101
    invoke-interface {v8, v12}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 1103
    iget v1, v10, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    const v13, 0x7fffffff

    if-eq v1, v13, :cond_0

    .line 1104
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v2, v10, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1107
    :cond_0
    iget-object v1, v10, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v14

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v15, 0x0

    :goto_1
    if-ge v2, v14, :cond_c

    .line 1109
    iget-object v3, v10, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/format/TableCell;

    const/16 v4, 0x20

    if-nez v15, :cond_1

    .line 1112
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v5, v5, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    if-eqz v5, :cond_2

    const/16 v5, 0x7c

    .line 1113
    invoke-interface {v8, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 1114
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v5, v5, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    if-eqz v5, :cond_2

    invoke-direct {v0, v3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->pipeNeedsSpaceAfter(Lcom/vladsch/flexmark/util/format/TableCell;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1115
    invoke-interface {v8, v4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    goto :goto_2

    .line 1118
    :cond_1
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v5, v5, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    if-eqz v5, :cond_2

    invoke-direct {v0, v3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->pipeNeedsSpaceAfter(Lcom/vladsch/flexmark/util/format/TableCell;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v8, v4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_2
    :goto_2
    if-eqz p3, :cond_3

    .line 1121
    iget-object v5, v3, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v5, v6, :cond_3

    iget-object v5, v3, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    goto :goto_3

    :cond_3
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    aget-object v5, v5, v1

    :goto_3
    move-object v6, v5

    .line 1123
    iget-object v5, v10, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget v4, v3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    .line 1124
    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->spanWidth(II)I

    move-result v4

    const/16 v16, 0x0

    iget-object v11, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v11, v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spacePad:I

    sub-int/2addr v4, v11

    iget-object v11, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v11, v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->pipeWidth:I

    iget v13, v3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    mul-int v11, v11, v13

    sub-int/2addr v4, v11

    move-object v11, v3

    const/4 v3, 0x1

    move v13, v1

    move-object v1, v5

    move-object/from16 p2, v9

    const/16 v9, 0x20

    move v5, v4

    move/from16 v4, p3

    .line 1123
    invoke-direct/range {v0 .. v7}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->cellText(Ljava/util/List;IZZILcom/vladsch/flexmark/util/html/CellAlignment;Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    move v6, v2

    .line 1127
    iget v2, v11, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    const v3, 0x7fffffff

    if-eq v2, v3, :cond_6

    .line 1128
    iget-object v2, v10, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 1129
    iget v4, v2, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    if-eq v4, v3, :cond_6

    .line 1130
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v3

    .line 1131
    iget-object v4, v11, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, -0x1

    goto :goto_4

    :cond_4
    const/4 v4, 0x0

    .line 1132
    :goto_4
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v7, v11, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    if-nez v6, :cond_5

    const/16 v17, 0x0

    move/from16 v18, v3

    move-object/from16 v3, v17

    goto :goto_5

    :cond_5
    iget-object v9, v10, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    move/from16 v18, v3

    add-int/lit8 v3, v6, -0x1

    invoke-interface {v9, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/format/TableCell;

    :goto_5
    invoke-virtual {v11, v3}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v3

    add-int/2addr v7, v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v7, v2, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    add-int/2addr v7, v4

    filled-new-array/range {v16 .. v16}, [I

    move-result-object v4

    invoke-static {v7, v4}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v4

    add-int v4, v18, v4

    iget v2, v2, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    add-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v5, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1136
    :cond_6
    invoke-interface {v8, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    add-int/lit8 v15, v15, 0x1

    .line 1139
    iget v1, v11, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int v7, v13, v1

    .line 1141
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    array-length v1, v1

    if-ge v15, v1, :cond_8

    .line 1142
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v1, v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    if-eqz v1, :cond_7

    invoke-direct {v0, v11}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->pipeNeedsSpaceBefore(Lcom/vladsch/flexmark/util/format/TableCell;)Z

    move-result v1

    if-eqz v1, :cond_7

    const/16 v9, 0x20

    invoke-interface {v8, v9}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 1143
    :cond_7
    iget v2, v11, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    invoke-virtual {v11}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideEndOffset()I

    move-result v3

    iget v4, v11, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    move-object v1, v8

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->appendColumnSpan(Lcom/vladsch/flexmark/util/html/FormattingAppendable;IIILjava/util/HashMap;)V

    goto :goto_6

    :cond_8
    move-object v1, v8

    .line 1144
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v2, v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    if-eqz v2, :cond_a

    .line 1145
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v2, v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    if-eqz v2, :cond_9

    invoke-direct {v0, v11}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->pipeNeedsSpaceBefore(Lcom/vladsch/flexmark/util/format/TableCell;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/16 v9, 0x20

    invoke-interface {v1, v9}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 1146
    :cond_9
    iget v2, v11, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    invoke-virtual {v11}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideEndOffset()I

    move-result v3

    iget v4, v11, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->appendColumnSpan(Lcom/vladsch/flexmark/util/html/FormattingAppendable;IIILjava/util/HashMap;)V

    goto :goto_6

    .line 1148
    :cond_a
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v2, v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    if-eqz v2, :cond_b

    invoke-direct {v0, v11}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->pipeNeedsSpaceBefore(Lcom/vladsch/flexmark/util/format/TableCell;)Z

    move-result v2

    if-eqz v2, :cond_b

    const/16 v9, 0x20

    invoke-interface {v1, v9}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 1149
    :cond_b
    iget v2, v11, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v11}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideEndOffset()I

    move-result v3

    iget v4, v11, Lcom/vladsch/flexmark/util/format/TableCell;->spanTrackedOffset:I

    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->appendColumnSpan(Lcom/vladsch/flexmark/util/html/FormattingAppendable;IIILjava/util/HashMap;)V

    :goto_6
    add-int/lit8 v2, v6, 0x1

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move v1, v7

    const/4 v11, 0x0

    const v13, 0x7fffffff

    move-object/from16 v7, p5

    goto/16 :goto_1

    :cond_c
    move-object/from16 p2, v9

    .line 1153
    iget v1, v10, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    const v3, 0x7fffffff

    if-eq v1, v3, :cond_d

    .line 1154
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v2, v10, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface/range {p1 .. p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    if-lez v15, :cond_e

    .line 1157
    invoke-interface/range {p1 .. p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_e
    move-object/from16 v8, p1

    move-object/from16 v9, p2

    goto/16 :goto_0

    :cond_f
    return-void
.end method

.method private cellText(Ljava/util/List;IZZILcom/vladsch/flexmark/util/html/CellAlignment;Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/TableCell;",
            ">;IZZI",
            "Lcom/vladsch/flexmark/util/html/CellAlignment;",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;"
        }
    .end annotation

    move/from16 v0, p5

    move-object/from16 v1, p6

    move-object/from16 v2, p7

    .line 1197
    invoke-interface/range {p1 .. p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 1199
    iget-object v4, v3, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1200
    iget v5, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    const/4 v6, 0x0

    const/4 v7, 0x1

    const v8, 0x7fffffff

    if-eq v5, v8, :cond_0

    iget v5, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget-object v9, v3, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v9}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v9

    if-lt v5, v9, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 1204
    :goto_0
    iget v9, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    if-eq v9, v8, :cond_2

    .line 1205
    iget v9, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget-object v10, v3, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v10

    if-le v9, v10, :cond_1

    .line 1207
    iget v9, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget-object v10, v3, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v10

    sub-int/2addr v9, v10

    sub-int/2addr v9, v7

    .line 1208
    new-array v10, v7, [Ljava/lang/CharSequence;

    const/16 v11, 0x20

    invoke-static {v11, v9}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(CI)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object v9

    aput-object v9, v10, v6

    invoke-interface {v4, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->append([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    goto :goto_1

    .line 1209
    :cond_1
    iget v9, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    if-gez v9, :cond_2

    const/4 v9, 0x1

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v9, 0x0

    .line 1217
    :goto_2
    iget-object v10, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v10, v10, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->charWidthProvider:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    invoke-interface {v10, v4}, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->charWidth(Ljava/lang/CharSequence;)I

    move-result v10

    .line 1218
    iget-object v11, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v11, v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->adjustColumnWidth:Z

    if-eqz v11, :cond_14

    if-lt v10, v0, :cond_3

    iget v11, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget-object v12, v3, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v12}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v12

    if-le v11, v12, :cond_14

    .line 1219
    :cond_3
    iget-object v11, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v11, v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->applyColumnAlignment:Z

    if-eqz v11, :cond_5

    if-eqz v1, :cond_5

    sget-object v11, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v1, v11, :cond_4

    goto :goto_3

    :cond_4
    if-eqz p4, :cond_7

    .line 1221
    sget-object v11, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v1, v11, :cond_7

    iget-object v11, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v11, v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leftAlignMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    sget-object v12, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->REMOVE:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    if-ne v11, v12, :cond_7

    .line 1222
    sget-object v1, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    goto :goto_4

    :cond_5
    :goto_3
    if-eqz p4, :cond_6

    .line 1220
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leftAlignMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    sget-object v11, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ADD:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    if-eq v1, v11, :cond_6

    sget-object v1, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    goto :goto_4

    :cond_6
    sget-object v1, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    :cond_7
    :goto_4
    sub-int/2addr v0, v10

    .line 1226
    iget-object v10, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v10, v10, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceWidth:I

    div-int/2addr v0, v10

    .line 1227
    iget-object v10, v2, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/4 v11, 0x2

    mul-int/lit8 v10, v10, 0x2

    iget-object v12, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v12, v12, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceWidth:I

    if-lt v10, v12, :cond_8

    add-int/lit8 v0, v0, 0x1

    .line 1229
    iget-object v10, v2, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    iget-object v12, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v12, v12, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceWidth:I

    sub-int/2addr v10, v12

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    iput-object v10, v2, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 1232
    :cond_8
    sget-object v2, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$html$CellAlignment:[I

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/html/CellAlignment;->ordinal()I

    move-result v1

    aget v1, v2, v1

    const-string v2, " "

    if-eq v1, v7, :cond_12

    if-eq v1, v11, :cond_c

    const/4 v10, 0x3

    if-eq v1, v10, :cond_9

    goto/16 :goto_8

    .line 1265
    :cond_9
    div-int/lit8 v1, v0, 0x2

    if-lez v0, :cond_b

    .line 1267
    invoke-static {v2, v1, v4}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->repeatOf(Ljava/lang/CharSequence;ILcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object v5

    new-array v10, v7, [Ljava/lang/CharSequence;

    sub-int/2addr v0, v1

    invoke-interface {v4, v6, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-static {v2, v0, v4}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->repeatOf(Ljava/lang/CharSequence;ILcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object v0

    aput-object v0, v10, v6

    invoke-virtual {v5, v10}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->append([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    if-eqz p3, :cond_a

    .line 1269
    iget v0, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    if-eq v0, v8, :cond_a

    .line 1270
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    iget v2, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    add-int/2addr v2, v1

    filled-new-array {v2}, [I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result v0

    invoke-virtual {v3, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedOffset(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    goto :goto_5

    :cond_a
    move-object v0, v3

    :goto_5
    if-eqz p3, :cond_15

    if-eqz v9, :cond_15

    .line 1273
    iget-boolean v1, v3, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    if-eqz v1, :cond_15

    .line 1274
    invoke-virtual {v0, v7}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedTextAdjust(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    goto/16 :goto_9

    :cond_b
    if-eqz p3, :cond_14

    if-eqz v5, :cond_14

    .line 1277
    iget-boolean v0, v3, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    if-eqz v0, :cond_14

    .line 1278
    invoke-virtual {v3, v7}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedTextAdjust(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    goto/16 :goto_9

    :cond_c
    if-lez v0, :cond_e

    .line 1247
    invoke-static {v2, v0, v4}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->repeatOf(Ljava/lang/CharSequence;ILcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object v4

    if-eqz p3, :cond_d

    .line 1249
    iget v1, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    if-eq v1, v8, :cond_d

    .line 1250
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    iget v2, v3, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    add-int/2addr v2, v0

    filled-new-array {v2}, [I

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result v1

    invoke-virtual {v3, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedOffset(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v1

    goto :goto_6

    :cond_d
    move-object v1, v3

    :goto_6
    if-eqz p3, :cond_f

    if-eqz v9, :cond_f

    .line 1253
    iget-boolean v2, v3, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    if-eqz v2, :cond_f

    .line 1254
    invoke-virtual {v1, v7}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedTextAdjust(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v1

    goto :goto_7

    :cond_e
    move-object v1, v3

    :cond_f
    :goto_7
    if-eqz p3, :cond_11

    if-eqz v5, :cond_11

    .line 1258
    iget-boolean v2, v3, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    if-eqz v2, :cond_11

    if-lez v0, :cond_10

    .line 1259
    iget-boolean v0, v3, Lcom/vladsch/flexmark/util/format/TableCell;->afterDelete:Z

    if-nez v0, :cond_11

    .line 1260
    :cond_10
    invoke-virtual {v1, v7}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedTextAdjust(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    goto :goto_9

    :cond_11
    move-object v0, v1

    goto :goto_9

    :cond_12
    if-lez v0, :cond_13

    .line 1235
    new-array v1, v7, [Ljava/lang/CharSequence;

    invoke-interface {v4, v6, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v9

    invoke-static {v2, v0, v9}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->repeatOf(Ljava/lang/CharSequence;ILcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object v2

    aput-object v2, v1, v6

    invoke-interface {v4, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->append([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    :cond_13
    if-eqz p3, :cond_14

    if-eqz v5, :cond_14

    .line 1238
    iget-boolean v1, v3, Lcom/vladsch/flexmark/util/format/TableCell;->afterSpace:Z

    if-eqz v1, :cond_14

    if-gtz v0, :cond_14

    .line 1241
    invoke-virtual {v3, v7}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedTextAdjust(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    goto :goto_9

    :cond_14
    :goto_8
    move-object v0, v3

    :cond_15
    :goto_9
    if-eqz p3, :cond_17

    .line 1285
    iget v1, v0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    if-eq v1, v8, :cond_17

    .line 1287
    iget v1, v0, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    if-le v1, v2, :cond_16

    .line 1288
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedOffset(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    :cond_16
    if-eq v0, v3, :cond_17

    .line 1291
    invoke-interface {p1, p2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_17
    return-object v4
.end method

.method private forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 7

    if-gtz p2, :cond_0

    goto :goto_4

    .line 1421
    :cond_0
    array-length v0, p3

    const/4 v1, 0x0

    move v2, p2

    const/4 v3, 0x0

    move p2, p1

    :goto_0
    if-ge v3, v0, :cond_6

    aget-object v4, p3, v3

    .line 1424
    iget-object v5, v4, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt p1, v5, :cond_1

    .line 1425
    iget-object v4, v4, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr p1, v4

    goto :goto_3

    .line 1432
    :cond_1
    :goto_1
    iget-object v5, v4, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge p1, v5, :cond_5

    .line 1433
    iget-object v5, v4, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v6, v4, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-interface {p4, v5, p2, v6, p1}, Lcom/vladsch/flexmark/util/format/TableRowManipulator;->apply(Lcom/vladsch/flexmark/util/format/TableRow;ILjava/util/ArrayList;I)I

    move-result v5

    const/high16 v6, -0x80000000

    if-ne v5, v6, :cond_2

    goto :goto_4

    :cond_2
    if-gez v5, :cond_3

    sub-int/2addr p2, v5

    add-int/2addr v2, v5

    goto :goto_2

    :cond_3
    add-int/lit8 v5, v5, 0x1

    add-int/2addr p1, v5

    add-int/lit8 v2, v2, -0x1

    :goto_2
    if-gtz v2, :cond_4

    goto :goto_4

    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_5
    const/4 p1, 0x0

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_6
    :goto_4
    return-void
.end method

.method public static formattedCaption(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/format/TableFormatOptions;)Ljava/lang/String;
    .locals 6

    .line 1034
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    .line 1036
    sget-object v1, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$TableCaptionHandling:[I

    iget-object v2, p1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableCaption:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v1, v3, :cond_2

    if-eq v1, v2, :cond_1

    const/4 v4, 0x3

    const/4 v5, 0x0

    if-eq v1, v4, :cond_0

    .line 1051
    iget-boolean v1, p1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->removeCaption:Z

    if-eqz v1, :cond_3

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1042
    :cond_1
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v0

    xor-int/2addr v0, v3

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    :cond_3
    :goto_0
    if-eqz v0, :cond_6

    .line 1059
    sget-object v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$DiscretionaryText:[I

    iget-object p1, p1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableCaptionSpaces:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ordinal()I

    move-result p1

    aget p1, v0, p1

    if-eq p1, v3, :cond_5

    if-eq p1, v2, :cond_4

    goto :goto_1

    .line 1066
    :cond_4
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1073
    :goto_1
    const-string p1, ""

    goto :goto_2

    .line 1062
    :cond_5
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1063
    const-string p1, " "

    .line 1073
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_6
    const/4 p0, 0x0

    return-object p0
.end method

.method private varargs getAllSectionsRows([Lcom/vladsch/flexmark/util/format/TableSection;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/vladsch/flexmark/util/format/TableSection;",
            ")",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;"
        }
    .end annotation

    .line 272
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 273
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p1, v2

    .line 274
    iget-object v3, v3, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private insertRows(Ljava/util/ArrayList;III)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;III)V"
        }
    .end annotation

    :goto_0
    add-int/lit8 v0, p3, -0x1

    if-lez p3, :cond_1

    .line 374
    new-instance p3, Lcom/vladsch/flexmark/util/format/TableRow;

    invoke-direct {p3}, Lcom/vladsch/flexmark/util/format/TableRow;-><init>()V

    .line 375
    invoke-virtual {p3, p4}, Lcom/vladsch/flexmark/util/format/TableRow;->appendColumns(I)V

    .line 376
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p2, v1, :cond_0

    .line 377
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 379
    :cond_0
    invoke-virtual {p1, p2, p3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :goto_1
    move p3, v0

    goto :goto_0

    :cond_1
    return-void
.end method

.method private isEmptyRowAt(I[Lcom/vladsch/flexmark/util/format/TableSection;)Z
    .locals 4

    const/4 v0, 0x1

    .line 504
    new-array v1, v0, [Z

    const/4 v2, 0x0

    aput-boolean v2, v1, v2

    .line 505
    new-instance v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$5;

    invoke-direct {v3, p0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable$5;-><init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;[Z)V

    invoke-direct {p0, p1, v0, p2, v3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    .line 520
    aget-boolean p1, v1, v2

    return p1
.end method

.method private pipeNeedsSpaceAfter(Lcom/vladsch/flexmark/util/format/TableCell;)Z
    .locals 2

    .line 1086
    iget-object v0, p1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p1, p1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private pipeNeedsSpaceBefore(Lcom/vladsch/flexmark/util/format/TableCell;)Z
    .locals 2

    .line 1082
    iget-object v0, p1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p1, p1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private spanFixedWidth(Ljava/util/BitSet;II)I
    .locals 4

    const/4 v0, 0x1

    if-le p3, v0, :cond_2

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p3, :cond_1

    .line 1313
    invoke-virtual {p1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1314
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    add-int v3, v0, p2

    aget v2, v2, v3

    add-int/2addr v1, v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1

    .line 1319
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    aget p1, p1, p2

    return p1
.end method

.method private spanWidth(II)I
    .locals 4

    const/4 v0, 0x1

    if-le p2, v0, :cond_1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p2, :cond_0

    .line 1301
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    add-int v3, v0, p1

    aget v2, v2, v3

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1

    .line 1305
    :cond_1
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    aget p1, p2, p1

    return p1
.end method


# virtual methods
.method public addCell(Lcom/vladsch/flexmark/util/format/TableCell;)V
    .locals 7

    .line 558
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator:Z

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    goto :goto_0

    :cond_0
    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isHeading:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    :goto_0
    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 560
    iget v0, p1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-ne v0, v2, :cond_2

    iget v0, p1, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    if-ne v0, v2, :cond_2

    goto :goto_1

    .line 561
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Separator columns cannot span rows/columns"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 563
    :cond_3
    :goto_1
    iget v0, v1, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/format/TableSection;->get(I)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object v0

    .line 566
    :goto_2
    iget v3, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget v4, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 567
    iget v3, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    add-int/2addr v3, v2

    iput v3, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    .line 570
    :goto_3
    iget v3, p1, Lcom/vladsch/flexmark/util/format/TableCell;->rowSpan:I

    if-ge v0, v3, :cond_7

    .line 571
    iget v3, v1, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    add-int/2addr v3, v0

    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/util/format/TableSection;->get(I)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object v3

    iget v4, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    invoke-virtual {v3, v4, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->set(ILcom/vladsch/flexmark/util/format/TableCell;)V

    const/4 v3, 0x1

    .line 575
    :goto_4
    iget v4, p1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-ge v3, v4, :cond_6

    .line 576
    iget v4, v1, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    add-int/2addr v4, v0

    iget v5, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    add-int/2addr v5, v3

    invoke-virtual {v1, v4, v5}, Lcom/vladsch/flexmark/util/format/TableSection;->expandTo(II)Lcom/vladsch/flexmark/util/format/TableRow;

    .line 577
    iget v4, v1, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    add-int/2addr v4, v0

    invoke-virtual {v1, v4}, Lcom/vladsch/flexmark/util/format/TableSection;->get(I)Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object v4

    iget-object v4, v4, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget v5, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    add-int/2addr v5, v3

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_5

    goto :goto_5

    .line 580
    :cond_5
    iget-object v4, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    iget v5, v1, Lcom/vladsch/flexmark/util/format/TableSection;->row:I

    add-int/2addr v5, v0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/format/TableRow;

    iget v5, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    add-int/2addr v5, v3

    sget-object v6, Lcom/vladsch/flexmark/util/format/TableCell;->NULL:Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v4, v5, v6}, Lcom/vladsch/flexmark/util/format/TableRow;->set(ILcom/vladsch/flexmark/util/format/TableCell;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_6
    :goto_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 586
    :cond_7
    iget v0, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    iget p1, p1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int/2addr v0, p1

    iput v0, v1, Lcom/vladsch/flexmark/util/format/TableSection;->column:I

    return-void
.end method

.method public addTrackedOffset(I)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 222
    invoke-virtual {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->addTrackedOffset(ILjava/lang/Character;Z)Z

    move-result p1

    return p1
.end method

.method public addTrackedOffset(ILjava/lang/Character;Z)Z
    .locals 8

    .line 234
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    move-result-object v0

    .line 235
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->getInsideColumn()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    .line 237
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget v4, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v6, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    iget v7, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    if-nez v7, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v7, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v7, v7, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget v0, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    sub-int/2addr v0, v3

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    :goto_0
    invoke-virtual {v6, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getTextStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    sub-int/2addr p1, v0

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/Character;->charValue()C

    move-result p2

    const/16 v0, 0x20

    if-ne p2, v0, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-virtual {v5, p1, v2, p3}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedOffset(IZZ)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p1

    invoke-interface {v1, v4, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return v3

    .line 239
    :cond_2
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isBeforeCells()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 242
    iget-object p2, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->setBeforeOffset(I)V

    return v3

    .line 244
    :cond_3
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isInCellSpan()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 246
    iget-object p2, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object p2, p2, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget p3, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->column:I

    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableCell:Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideEndOffset()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/format/TableCell;->withSpanTrackedOffset(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p1

    invoke-interface {p2, p3, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return v3

    .line 248
    :cond_4
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->isAfterCells()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 250
    iget-object p2, v0, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;->tableRow:Lcom/vladsch/flexmark/util/format/TableRow;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/format/TableRow;->setAfterOffset(I)V

    return v3

    :cond_5
    return v2
.end method

.method public addTrackedOffset(IZ)Z
    .locals 1

    const/16 p2, 0x20

    .line 226
    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->addTrackedOffset(ILjava/lang/Character;Z)Z

    move-result p1

    return p1
.end method

.method public addTrackedOffset(IZZ)Z
    .locals 0

    if-eqz p2, :cond_0

    const/16 p2, 0x20

    .line 230
    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->addTrackedOffset(ILjava/lang/Character;Z)Z

    move-result p1

    return p1
.end method

.method public appendTable(Lcom/vladsch/flexmark/util/html/FormattingAppendable;)V
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 801
    new-instance v5, Lcom/vladsch/flexmark/util/Ref;

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vladsch/flexmark/util/Ref;-><init>(Ljava/lang/Object;)V

    .line 802
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v4, v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableIndentPrefix:Ljava/lang/String;

    .line 803
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 805
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getOptions()I

    move-result v9

    and-int/lit8 v2, v9, -0x3

    const/16 v10, 0x20

    or-int/2addr v2, v10

    .line 806
    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 808
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->finalizeTable()V

    .line 810
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->appendRows(Lcom/vladsch/flexmark/util/html/FormattingAppendable;Ljava/util/List;ZLjava/lang/String;Lcom/vladsch/flexmark/util/Ref;)V

    .line 813
    invoke-interface {v1, v4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 815
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableRow;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const v11, 0x7fffffff

    if-eqz v2, :cond_1

    .line 817
    iget v7, v2, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    if-eq v7, v11, :cond_1

    .line 818
    iget-object v7, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v12, v2, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v7, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 822
    :cond_1
    iput-object v6, v5, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 823
    iget-object v7, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    array-length v12, v7

    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_1
    if-ge v13, v12, :cond_29

    aget-object v3, v7, v13

    .line 824
    invoke-direct {v0, v3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->adjustCellAlignment(Lcom/vladsch/flexmark/util/html/CellAlignment;)Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-result-object v3

    const/16 v16, 0x2

    .line 825
    sget-object v15, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v3, v15, :cond_4

    sget-object v15, Lcom/vladsch/flexmark/util/html/CellAlignment;->RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v3, v15, :cond_2

    goto :goto_2

    :cond_2
    sget-object v15, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v3, v15, :cond_3

    const/4 v15, 0x2

    goto :goto_3

    :cond_3
    const/4 v15, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v15, 0x1

    :goto_3
    const/16 v17, 0x0

    .line 826
    iget-object v8, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    aget v8, v8, v14

    iget-object v10, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v10, v10, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->colonWidth:I

    mul-int v10, v10, v15

    sub-int/2addr v8, v10

    iget-object v10, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v10, v10, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->pipeWidth:I

    sub-int/2addr v8, v10

    iget-object v10, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v10, v10, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dashWidth:I

    div-int/2addr v8, v10

    .line 827
    iget-object v10, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v10, v10, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorColumnWidth:I

    sub-int/2addr v10, v15

    iget-object v15, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v15, v15, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorDashes:I

    filled-new-array {v10, v15}, [I

    move-result-object v10

    invoke-static {v8, v10}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v10

    if-ge v8, v10, :cond_5

    move v8, v10

    .line 830
    :cond_5
    iget-object v10, v5, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    mul-int/lit8 v10, v10, 0x2

    iget-object v15, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v15, v15, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dashWidth:I

    if-lt v10, v15, :cond_6

    add-int/lit8 v8, v8, 0x1

    .line 832
    iget-object v10, v5, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    iget-object v15, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v15, v15, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dashWidth:I

    sub-int/2addr v10, v15

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    iput-object v10, v5, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    :cond_6
    if-eqz v2, :cond_8

    .line 842
    iget-object v10, v2, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    .line 843
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v15

    if-ge v14, v15, :cond_8

    .line 844
    invoke-interface {v10, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vladsch/flexmark/util/format/TableCell;

    if-lez v14, :cond_7

    add-int/lit8 v11, v14, -0x1

    .line 845
    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vladsch/flexmark/util/format/TableCell;

    goto :goto_4

    :cond_7
    const/4 v10, 0x0

    goto :goto_4

    :cond_8
    const/4 v10, 0x0

    const/4 v15, 0x0

    :goto_4
    if-nez v15, :cond_9

    move-object/from16 v19, v4

    const v4, 0x7fffffff

    goto :goto_5

    .line 849
    :cond_9
    iget v11, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    move-object/from16 v19, v4

    filled-new-array/range {v17 .. v17}, [I

    move-result-object v4

    invoke-static {v11, v4}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v4

    :goto_5
    const v11, 0x7fffffff

    if-eq v4, v11, :cond_21

    .line 852
    iget-object v11, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v11, v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    if-eqz v11, :cond_a

    if-nez v14, :cond_a

    const/16 v11, 0x7c

    invoke-interface {v1, v11}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_a
    if-nez v4, :cond_b

    .line 853
    iget-object v11, v15, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v11, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v11

    move-object/from16 v21, v5

    const/16 v5, 0x3a

    if-ne v11, v5, :cond_c

    const/4 v11, 0x1

    goto :goto_6

    :cond_b
    move-object/from16 v21, v5

    const/16 v5, 0x3a

    :cond_c
    const/4 v11, 0x0

    :goto_6
    const/4 v5, 0x1

    if-ne v4, v5, :cond_d

    .line 854
    iget-object v5, v15, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-object/from16 v22, v7

    add-int/lit8 v7, v4, -0x1

    invoke-interface {v5, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v5

    const/16 v7, 0x3a

    if-ne v5, v7, :cond_e

    const/4 v5, 0x1

    goto :goto_7

    :cond_d
    move-object/from16 v22, v7

    const/16 v7, 0x3a

    :cond_e
    const/4 v5, 0x0

    .line 855
    :goto_7
    iget-object v7, v15, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v7

    const/16 v18, 0x1

    add-int/lit8 v7, v7, -0x1

    if-ne v4, v7, :cond_f

    iget-object v7, v15, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v7

    move/from16 v23, v5

    const/16 v5, 0x3a

    if-ne v7, v5, :cond_10

    const/4 v5, 0x1

    goto :goto_8

    :cond_f
    move/from16 v23, v5

    :cond_10
    const/4 v5, 0x0

    .line 856
    :goto_8
    iget-object v7, v15, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v7

    if-ne v4, v7, :cond_11

    iget-object v7, v15, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move/from16 v24, v5

    add-int/lit8 v5, v4, -0x1

    invoke-interface {v7, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v5

    const/16 v7, 0x3a

    if-ne v5, v7, :cond_12

    const/4 v5, 0x1

    goto :goto_9

    :cond_11
    move/from16 v24, v5

    :cond_12
    const/4 v5, 0x0

    .line 857
    :goto_9
    iget-object v7, v15, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v7

    if-ne v4, v7, :cond_13

    iget-object v7, v15, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move/from16 v25, v4

    add-int/lit8 v4, v25, -0x1

    invoke-interface {v7, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v4

    const/16 v7, 0x2d

    if-ne v4, v7, :cond_14

    const/16 v18, 0x1

    goto :goto_a

    :cond_13
    move/from16 v25, v4

    :cond_14
    const/16 v18, 0x0

    .line 859
    :goto_a
    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v3, v4, :cond_16

    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v3, v4, :cond_15

    goto :goto_b

    :cond_15
    move/from16 v26, v5

    move/from16 v4, v25

    const/4 v11, 0x0

    const/16 v23, 0x0

    goto :goto_d

    :cond_16
    :goto_b
    if-eqz v11, :cond_17

    .line 861
    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v7, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v15, v10}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v25

    add-int v7, v7, v25

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v25

    move/from16 v26, v5

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v5, 0x3a

    .line 863
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :goto_c
    const v4, 0x7fffffff

    goto :goto_d

    :cond_17
    move/from16 v26, v5

    const/16 v5, 0x3a

    if-eqz v23, :cond_18

    .line 865
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 866
    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v7, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v15, v10}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v20

    add-int v7, v7, v20

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c

    .line 869
    :cond_18
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move/from16 v4, v25

    :goto_d
    if-nez v23, :cond_1b

    if-nez v11, :cond_1b

    if-nez v26, :cond_1b

    if-nez v24, :cond_1b

    if-nez v4, :cond_19

    .line 878
    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v5, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v15, v10}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v7

    add-int/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v7, 0x2d

    .line 880
    invoke-interface {v1, v7, v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    goto :goto_e

    :cond_19
    const/16 v7, 0x2d

    if-nez v18, :cond_1a

    if-ge v4, v8, :cond_1a

    .line 882
    invoke-interface {v1, v7, v4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 883
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v11, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v15, v10}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v18

    add-int v11, v11, v18

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v11, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sub-int/2addr v8, v4

    const/16 v7, 0x2d

    .line 884
    invoke-interface {v1, v7, v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    goto :goto_e

    .line 887
    :cond_1a
    invoke-interface {v1, v7, v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 888
    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v5, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v15, v10}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v7

    add-int/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e

    :cond_1b
    const/16 v7, 0x2d

    .line 892
    invoke-interface {v1, v7, v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 895
    :goto_e
    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v3, v4, :cond_1e

    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v3, v4, :cond_1c

    goto :goto_f

    :cond_1c
    if-nez v26, :cond_1d

    if-eqz v24, :cond_26

    .line 908
    :cond_1d
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v4, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v15, v10}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_12

    :cond_1e
    :goto_f
    if-eqz v26, :cond_1f

    const/16 v5, 0x3a

    .line 897
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 898
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v4, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v15, v10}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    :cond_1f
    if-eqz v24, :cond_20

    .line 901
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v4, v15, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    invoke-virtual {v15, v10}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v5, 0x3a

    .line 903
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    goto :goto_12

    :cond_20
    const/16 v5, 0x3a

    .line 905
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    goto :goto_12

    :cond_21
    move-object/from16 v21, v5

    move-object/from16 v22, v7

    .line 914
    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v4, v4, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    if-eqz v4, :cond_22

    if-nez v14, :cond_22

    const/16 v11, 0x7c

    invoke-interface {v1, v11}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 915
    :cond_22
    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v3, v4, :cond_24

    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v3, v4, :cond_23

    goto :goto_10

    :cond_23
    const/16 v5, 0x3a

    goto :goto_11

    :cond_24
    :goto_10
    const/16 v5, 0x3a

    .line 916
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :goto_11
    const/16 v7, 0x2d

    .line 918
    invoke-interface {v1, v7, v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 919
    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v3, v4, :cond_25

    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v3, v4, :cond_26

    .line 920
    :cond_25
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_26
    :goto_12
    add-int/lit8 v14, v14, 0x1

    .line 924
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    if-nez v3, :cond_27

    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    array-length v3, v3

    if-ge v14, v3, :cond_28

    :cond_27
    const/16 v11, 0x7c

    invoke-interface {v1, v11}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_28
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v4, v19

    move-object/from16 v5, v21

    move-object/from16 v7, v22

    const/4 v8, 0x0

    const/16 v10, 0x20

    const v11, 0x7fffffff

    goto/16 :goto_1

    :cond_29
    move-object/from16 v19, v4

    move-object/from16 v21, v5

    const/16 v16, 0x2

    const/16 v17, 0x0

    if-eqz v2, :cond_2a

    .line 927
    iget v3, v2, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    const v11, 0x7fffffff

    if-eq v3, v11, :cond_2a

    .line 928
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v2, v2, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 931
    :cond_2a
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 934
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    const/4 v3, 0x0

    move-object/from16 v4, v19

    move-object/from16 v5, v21

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->appendRows(Lcom/vladsch/flexmark/util/html/FormattingAppendable;Ljava/util/List;ZLjava/lang/String;Lcom/vladsch/flexmark/util/Ref;)V

    move-object v8, v1

    .line 936
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCaptionCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v10

    .line 937
    iget-object v1, v10, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    invoke-static {v1, v2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->formattedCaption(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/format/TableFormatOptions;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_37

    .line 939
    invoke-static {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 942
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v11, 0x5d

    const/16 v3, 0x5b

    if-lez v2, :cond_36

    .line 943
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 944
    iget v2, v10, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    const v4, 0x7fffffff

    if-ne v2, v4, :cond_2b

    iget v2, v12, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    if-ne v2, v4, :cond_2b

    iget v2, v12, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    if-eq v2, v4, :cond_36

    .line 947
    :cond_2b
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    if-eqz v12, :cond_2c

    .line 949
    iget v1, v12, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    if-eq v1, v4, :cond_2c

    .line 950
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v2, v12, Lcom/vladsch/flexmark/util/format/TableRow;->beforeOffset:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 953
    :cond_2c
    iget-object v1, v10, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->withText(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v1

    .line 954
    iget v2, v10, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    const v4, 0x7fffffff

    if-eq v2, v4, :cond_2d

    .line 955
    iget v2, v10, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget-object v4, v10, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimmedStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    sub-int/2addr v2, v4

    const/16 v17, 0x0

    filled-new-array/range {v17 .. v17}, [I

    move-result-object v4

    invoke-static {v2, v4}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/format/TableCell;->withTrackedOffset(I)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v1

    .line 961
    :cond_2d
    iget-object v2, v1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v2

    if-nez v2, :cond_2f

    .line 962
    sget-object v2, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$DiscretionaryText:[I

    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v4, v4, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableCaptionSpaces:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ordinal()I

    move-result v4

    aget v2, v2, v4

    const/4 v13, 0x1

    if-eq v2, v13, :cond_2e

    const/4 v4, 0x2

    if-eq v2, v4, :cond_30

    .line 973
    iget-object v2, v10, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v4, " "

    invoke-interface {v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 974
    iget-object v7, v10, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v4

    move v14, v4

    goto :goto_13

    :cond_2e
    const/4 v2, 0x1

    const/4 v14, 0x1

    goto :goto_13

    :cond_2f
    const/4 v13, 0x1

    :cond_30
    const/4 v2, 0x0

    const/4 v14, 0x0

    .line 979
    :goto_13
    invoke-interface {v8, v3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    if-eqz v2, :cond_31

    const/16 v2, 0x20

    .line 980
    invoke-interface {v8, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 982
    :cond_31
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v15

    .line 984
    iget-object v2, v12, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v2, v4, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 985
    iput-object v6, v5, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 986
    iget-object v1, v12, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    move-object v7, v5

    const/4 v5, 0x0

    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->cellText(Ljava/util/List;IZZILcom/vladsch/flexmark/util/html/CellAlignment;Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 987
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    .line 989
    iget v2, v10, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    const v4, 0x7fffffff

    if-eq v2, v4, :cond_33

    .line 990
    iget-object v2, v12, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 991
    iget v3, v2, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    if-eq v3, v4, :cond_33

    .line 992
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v4, v10, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    iget-object v5, v10, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v5

    if-eqz v5, :cond_32

    const/4 v2, 0x1

    goto :goto_14

    :cond_32
    iget v5, v2, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextOffset:I

    const/16 v17, 0x0

    filled-new-array/range {v17 .. v17}, [I

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v5

    iget v2, v2, Lcom/vladsch/flexmark/util/format/TableCell;->trackedTextAdjust:I

    add-int/2addr v2, v5

    :goto_14
    add-int/2addr v15, v2

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 995
    :cond_33
    iget-object v2, v12, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v2, v4, v10}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 997
    invoke-interface {v8, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    if-eqz v14, :cond_34

    const/16 v2, 0x20

    .line 999
    invoke-interface {v8, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 1000
    :cond_34
    invoke-interface {v8, v11}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    if-eqz v12, :cond_35

    .line 1002
    iget v1, v12, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    const v4, 0x7fffffff

    if-eq v1, v4, :cond_35

    .line 1003
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    iget v2, v12, Lcom/vladsch/flexmark/util/format/TableRow;->afterOffset:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1005
    :cond_35
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    goto :goto_15

    .line 1012
    :cond_36
    invoke-interface {v8, v9}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 1013
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v2

    invoke-interface {v2, v3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v1

    invoke-interface {v1, v11}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 1016
    :cond_37
    :goto_15
    invoke-interface {v8, v9}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void
.end method

.method public deleteColumns(II)V
    .locals 2

    .line 405
    new-instance v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable$2;-><init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;II)V

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllContentRows(Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    .line 419
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 420
    invoke-virtual {v1, p1, p2}, Lcom/vladsch/flexmark/util/format/TableRow;->deleteColumns(II)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public deleteRows(II)V
    .locals 2

    .line 340
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getMaxColumns()I

    .line 342
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gt p1, v0, :cond_0

    :goto_0
    add-int/lit8 v0, p2, -0x1

    if-lez p2, :cond_1

    .line 344
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object p2, p2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_1

    .line 345
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object p2, p2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move p2, v0

    goto :goto_0

    .line 347
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    if-lt p1, v0, :cond_1

    .line 348
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p1, v0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p1, v0

    :goto_1
    add-int/lit8 v0, p2, -0x1

    if-lez p2, :cond_1

    .line 350
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object p2, p2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_1

    .line 351
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object p2, p2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move p2, v0

    goto :goto_1

    :cond_1
    return-void
.end method

.method public fillMissingColumns()V
    .locals 1

    const/4 v0, 0x0

    .line 781
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->fillMissingColumns(Ljava/lang/Integer;)V

    return-void
.end method

.method public fillMissingColumns(Ljava/lang/Integer;)V
    .locals 3

    .line 785
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getMinColumns()I

    move-result v0

    .line 786
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getMaxColumns()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 789
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 790
    invoke-virtual {v2, p1, v1}, Lcom/vladsch/flexmark/util/format/TableRow;->fillMissingColumns(Ljava/lang/Integer;I)V

    goto :goto_0

    .line 793
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 794
    invoke-virtual {v2, p1, v1}, Lcom/vladsch/flexmark/util/format/TableRow;->fillMissingColumns(Ljava/lang/Integer;I)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public finalizeTable()V
    .locals 21

    move-object/from16 v0, p0

    .line 599
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->normalize()V

    .line 601
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v1, v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->fillMissingColumns:Z

    if-eqz v1, :cond_0

    .line 602
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->fillMissingColumns()V

    .line 605
    :cond_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getMaxColumns()I

    move-result v8

    .line 606
    new-array v1, v8, [Lcom/vladsch/flexmark/util/html/CellAlignment;

    iput-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    .line 607
    new-array v1, v8, [I

    iput-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    .line 608
    new-instance v9, Ljava/util/BitSet;

    invoke-direct {v9, v8}, Ljava/util/BitSet;-><init>(I)V

    .line 609
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 610
    new-instance v7, Lcom/vladsch/flexmark/util/Ref;

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v7, v1}, Lcom/vladsch/flexmark/util/Ref;-><init>(Ljava/lang/Object;)V

    .line 612
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v12, 0x1

    if-lez v1, :cond_3

    .line 613
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 616
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, v7, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 617
    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 619
    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    aget-object v4, v4, v2

    if-eqz v4, :cond_1

    iget v4, v3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-ne v4, v12, :cond_2

    invoke-virtual {v9, v2}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    iget-object v4, v3, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    sget-object v5, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v4, v5, :cond_2

    .line 620
    iget-object v4, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget-object v5, v3, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    aput-object v5, v4, v2

    .line 621
    iget v4, v3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-le v4, v12, :cond_2

    invoke-virtual {v9, v2}, Ljava/util/BitSet;->set(I)V

    .line 624
    :cond_2
    iget v3, v3, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int/2addr v2, v3

    goto :goto_0

    .line 628
    :cond_3
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    .line 630
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 633
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v7, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 634
    iget-object v1, v14, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v15

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1
    if-ge v2, v15, :cond_4

    .line 636
    iget-object v4, v14, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 639
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    aget-object v5, v5, v1

    if-eqz v5, :cond_5

    iget v5, v4, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-ne v5, v12, :cond_6

    invoke-virtual {v9, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-eqz v5, :cond_6

    :cond_5
    iget-object v5, v4, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v5, v6, :cond_6

    .line 640
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    iget-object v6, v4, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    aput-object v6, v5, v1

    .line 641
    iget v5, v4, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-le v5, v12, :cond_6

    invoke-virtual {v9, v1}, Ljava/util/BitSet;->set(I)V

    :cond_6
    move v5, v1

    .line 644
    iget-object v1, v14, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    move v6, v5

    const/4 v5, 0x0

    move/from16 v16, v6

    const/4 v6, 0x0

    move/from16 v17, v3

    const/4 v3, 0x0

    move-object/from16 v18, v4

    const/4 v4, 0x1

    move/from16 v20, v17

    move-object/from16 v11, v18

    const/16 v19, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->cellText(Ljava/util/List;IZZILcom/vladsch/flexmark/util/html/CellAlignment;Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 645
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v3, v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->charWidthProvider:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    invoke-interface {v3, v1}, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->charWidth(Ljava/lang/CharSequence;)I

    move-result v1

    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v3, v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spacePad:I

    add-int/2addr v1, v3

    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v3, v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->pipeWidth:I

    iget v4, v11, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    mul-int v3, v3, v4

    add-int/2addr v1, v3

    .line 646
    iget v3, v11, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-le v3, v12, :cond_7

    .line 647
    new-instance v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;

    iget v4, v11, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    move/from16 v5, v20

    invoke-direct {v3, v5, v4, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;-><init>(III)V

    invoke-interface {v10, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_7
    move/from16 v5, v20

    .line 649
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    aget v4, v3, v16

    if-ge v4, v1, :cond_8

    aput v1, v3, v16

    :cond_8
    :goto_2
    add-int/lit8 v3, v5, 0x1

    .line 653
    iget v1, v11, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int v1, v16, v1

    add-int/lit8 v2, v2, 0x1

    const/4 v11, 0x0

    goto :goto_1

    :cond_9
    const/16 v19, 0x0

    .line 659
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_d

    .line 661
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v7, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 662
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 665
    iget-object v1, v11, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v13

    const/4 v2, 0x0

    const/4 v14, 0x0

    :goto_3
    if-ge v2, v13, :cond_a

    .line 667
    iget-object v1, v11, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 668
    iget-object v1, v11, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->cellText(Ljava/util/List;IZZILcom/vladsch/flexmark/util/html/CellAlignment;Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 669
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v3, v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->charWidthProvider:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    invoke-interface {v3, v1}, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->charWidth(Ljava/lang/CharSequence;)I

    move-result v1

    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v3, v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spacePad:I

    add-int/2addr v1, v3

    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v3, v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->pipeWidth:I

    iget v4, v15, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    mul-int v3, v3, v4

    add-int/2addr v1, v3

    .line 670
    iget v3, v15, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-le v3, v12, :cond_b

    .line 671
    new-instance v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;

    iget v4, v15, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    invoke-direct {v3, v14, v4, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;-><init>(III)V

    invoke-interface {v10, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 673
    :cond_b
    iget-object v3, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    aget v4, v3, v14

    if-ge v4, v1, :cond_c

    aput v1, v3, v14

    .line 677
    :cond_c
    :goto_4
    iget v1, v15, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int/2addr v14, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 684
    :cond_d
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_14

    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_14

    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_e

    goto/16 :goto_8

    .line 700
    :cond_e
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v7, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 701
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v3, 0x0

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 702
    iget-object v5, v4, Lcom/vladsch/flexmark/util/format/TableCell;->alignment:Lcom/vladsch/flexmark/util/html/CellAlignment;

    invoke-direct {v0, v5}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->adjustCellAlignment(Lcom/vladsch/flexmark/util/html/CellAlignment;)Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-result-object v5

    .line 703
    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v5, v6, :cond_11

    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v5, v6, :cond_f

    goto :goto_6

    :cond_f
    sget-object v6, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v5, v6, :cond_10

    const/4 v5, 0x2

    goto :goto_7

    :cond_10
    const/4 v5, 0x0

    goto :goto_7

    :cond_11
    :goto_6
    const/4 v5, 0x1

    .line 704
    :goto_7
    iget-object v4, v4, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v6, ":"

    invoke-interface {v4, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    .line 705
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    .line 706
    iget-object v6, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v6, v6, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorColumnWidth:I

    sub-int/2addr v6, v5

    iget-object v7, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v7, v7, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorDashes:I

    filled-new-array {v6, v7}, [I

    move-result-object v6

    invoke-static {v4, v6}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v6

    if-ge v4, v6, :cond_12

    move v4, v6

    .line 708
    :cond_12
    iget-object v6, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v6, v6, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dashWidth:I

    mul-int v4, v4, v6

    iget-object v6, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v6, v6, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->colonWidth:I

    mul-int v5, v5, v6

    add-int/2addr v4, v5

    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v5, v5, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->pipeWidth:I

    add-int/2addr v4, v5

    .line 709
    iget-object v5, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    aget v6, v5, v3

    if-ge v6, v4, :cond_13

    aput v4, v5, v3

    :cond_13
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_14
    const/16 v19, 0x0

    .line 686
    :goto_8
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v7, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 687
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->alignments:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    array-length v3, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_9
    if-ge v4, v3, :cond_1a

    aget-object v6, v1, v4

    .line 688
    invoke-direct {v0, v6}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->adjustCellAlignment(Lcom/vladsch/flexmark/util/html/CellAlignment;)Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-result-object v6

    .line 689
    sget-object v7, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-eq v6, v7, :cond_17

    sget-object v7, Lcom/vladsch/flexmark/util/html/CellAlignment;->RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v6, v7, :cond_15

    goto :goto_a

    :cond_15
    sget-object v7, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    if-ne v6, v7, :cond_16

    const/4 v6, 0x2

    goto :goto_b

    :cond_16
    const/4 v6, 0x0

    goto :goto_b

    :cond_17
    :goto_a
    const/4 v6, 0x1

    .line 691
    :goto_b
    iget-object v7, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v7, v7, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorColumnWidth:I

    sub-int/2addr v7, v6

    iget-object v9, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v9, v9, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorDashes:I

    filled-new-array {v7, v9}, [I

    move-result-object v7

    const/4 v9, 0x0

    invoke-static {v9, v7}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result v7

    if-lez v7, :cond_18

    goto :goto_c

    :cond_18
    const/4 v7, 0x0

    .line 693
    :goto_c
    iget-object v11, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v11, v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dashWidth:I

    mul-int v7, v7, v11

    iget-object v11, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v11, v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->colonWidth:I

    mul-int v6, v6, v11

    add-int/2addr v7, v6

    iget-object v6, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget v6, v6, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->pipeWidth:I

    add-int/2addr v7, v6

    .line 694
    iget-object v6, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    aget v11, v6, v5

    if-ge v11, v7, :cond_19

    aput v7, v6, v5

    :cond_19
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    :cond_1a
    const/4 v9, 0x0

    .line 714
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_22

    .line 716
    new-array v1, v8, [I

    .line 717
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v8}, Ljava/util/BitSet;-><init>(I)V

    .line 718
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 720
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1b
    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;

    .line 721
    iget v5, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v6, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->spanWidth(II)I

    move-result v5

    .line 722
    iget v6, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->width:I

    if-ge v5, v6, :cond_1b

    .line 724
    iget v5, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v6, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v7, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    add-int/2addr v6, v7

    invoke-virtual {v1, v5, v6}, Ljava/util/BitSet;->set(II)V

    .line 725
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 730
    :cond_1c
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_22

    .line 733
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v8}, Ljava/util/BitSet;-><init>(I)V

    .line 734
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 737
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;

    .line 738
    iget v6, v5, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v7, v5, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    invoke-direct {v0, v6, v7}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->spanWidth(II)I

    move-result v6

    .line 739
    iget v7, v5, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v10, v5, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    invoke-direct {v0, v1, v7, v10}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->spanFixedWidth(Ljava/util/BitSet;II)I

    move-result v7

    if-gt v6, v7, :cond_1d

    .line 742
    iget v6, v5, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v7, v5, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v5, v5, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    add-int/2addr v7, v5

    invoke-virtual {v3, v6, v7}, Ljava/util/BitSet;->set(II)V

    goto :goto_e

    .line 744
    :cond_1d
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 749
    :cond_1e
    invoke-virtual {v1, v3}, Ljava/util/BitSet;->andNot(Ljava/util/BitSet;)V

    .line 751
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 753
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1f
    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;

    .line 754
    iget v5, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v6, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    invoke-direct {v0, v5, v6}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->spanWidth(II)I

    move-result v5

    .line 755
    iget v6, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v7, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    invoke-direct {v0, v1, v6, v7}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->spanFixedWidth(Ljava/util/BitSet;II)I

    move-result v6

    if-le v5, v6, :cond_1f

    sub-int/2addr v5, v6

    .line 760
    iget v6, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v7, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    iget v10, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    add-int/2addr v7, v10

    invoke-virtual {v1, v6, v7}, Ljava/util/BitSet;->get(II)Ljava/util/BitSet;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/BitSet;->cardinality()I

    move-result v6

    .line 761
    div-int v7, v5, v6

    mul-int v6, v6, v7

    sub-int/2addr v5, v6

    move v6, v5

    const/4 v5, 0x0

    .line 764
    :goto_10
    iget v10, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->columnSpan:I

    if-ge v5, v10, :cond_21

    .line 765
    iget v10, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    add-int/2addr v10, v5

    invoke-virtual {v1, v10}, Ljava/util/BitSet;->get(I)Z

    move-result v10

    if-eqz v10, :cond_20

    .line 766
    iget-object v10, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    iget v11, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    add-int/2addr v11, v5

    aget v13, v10, v11

    add-int/2addr v13, v7

    aput v13, v10, v11

    if-lez v6, :cond_20

    .line 768
    iget-object v10, v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->columnWidths:[I

    iget v11, v4, Lcom/vladsch/flexmark/util/format/MarkdownTable$ColumnSpan;->startColumn:I

    add-int/2addr v11, v5

    aget v13, v10, v11

    add-int/2addr v13, v12

    aput v13, v10, v11

    add-int/lit8 v6, v6, -0x1

    :cond_20
    add-int/lit8 v5, v5, 0x1

    goto :goto_10

    .line 773
    :cond_21
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_22
    return-void
.end method

.method public forAllContentRows(IILcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 1

    .line 324
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public forAllContentRows(ILcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 2

    const v0, 0x7fffffff

    .line 320
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public forAllContentRows(Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 3

    const v0, 0x7fffffff

    .line 316
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public forAllRows(IILcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 1

    .line 312
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public forAllRows(ILcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 2

    const v0, 0x7fffffff

    .line 308
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public forAllRows(Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 3

    const v0, 0x7fffffff

    .line 304
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public forAllSectionRows(IILcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 1

    .line 336
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_SECTIONS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public forAllSectionRows(ILcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 2

    const v0, 0x7fffffff

    .line 332
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_SECTIONS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public forAllSectionRows(Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V
    .locals 3

    const v0, 0x7fffffff

    .line 328
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_SECTIONS:[Lcom/vladsch/flexmark/util/format/TableSection;

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllSectionsRows(II[Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    return-void
.end method

.method public getAllContentRows()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;"
        }
    .end annotation

    .line 264
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllSectionsRows([Lcom/vladsch/flexmark/util/format/TableSection;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllContentRowsCount()I
    .locals 2

    .line 296
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getAllRows()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;"
        }
    .end annotation

    .line 260
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllSectionsRows([Lcom/vladsch/flexmark/util/format/TableSection;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllRowsCount()I
    .locals 2

    .line 292
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getAllRowsSection(I)Lcom/vladsch/flexmark/util/format/TableSection;
    .locals 5

    .line 284
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_SECTIONS:[Lcom/vladsch/flexmark/util/format/TableSection;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 285
    iget-object v4, v3, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge p1, v4, :cond_0

    return-object v3

    .line 286
    :cond_0
    iget-object v3, v3, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr p1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getAllSectionRows()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/TableRow;",
            ">;"
        }
    .end annotation

    .line 268
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_SECTIONS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllSectionsRows([Lcom/vladsch/flexmark/util/format/TableSection;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllSectionsRowsCount()I
    .locals 2

    .line 300
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getBodyRowCount()I
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getCaption()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 87
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCaptionCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getCaptionCell()Lcom/vladsch/flexmark/util/format/TableCell;
    .locals 2

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    return-object v0

    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableCaptionSection;->NULL_CELL:Lcom/vladsch/flexmark/util/format/TableCell;

    return-object v0
.end method

.method public getCaptionRowCount()I
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getCellOffsetInfo(I)Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;
    .locals 12

    .line 186
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllSectionRows()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v8, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 187
    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/format/TableRow;->normalizeIfNeeded()V

    .line 188
    iget-object v2, v6, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    iget-object v3, v6, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 189
    invoke-virtual {v7}, Lcom/vladsch/flexmark/util/format/TableCell;->getLastSegment()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 190
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    const-string v4, "\r\n"

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v5

    invoke-interface {v3, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOfAny(Ljava/lang/CharSequence;I)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 191
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v3

    :cond_0
    if-gt p1, v3, :cond_5

    .line 198
    iget-object v0, v6, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v9, 0x0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableCell;

    .line 199
    iget-object v3, v1, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, v1, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v3

    if-ge p1, v3, :cond_3

    goto :goto_2

    :cond_1
    iget-object v3, v1, Lcom/vladsch/flexmark/util/format/TableCell;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v3

    if-gt p1, v3, :cond_3

    .line 200
    :goto_2
    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    if-lt p1, v0, :cond_2

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideEndOffset()I

    move-result v0

    if-gt p1, v0, :cond_2

    move-object v0, v2

    .line 202
    new-instance v2, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    invoke-virtual {p0, v8}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRowsSection(I)Lcom/vladsch/flexmark/util/format/TableSection;

    move-result-object v5

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/format/TableCell;->getInsideStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    sub-int v0, p1, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    move-object v4, p0

    move v3, p1

    move-object v7, v1

    invoke-direct/range {v2 .. v11}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;-><init>(ILcom/vladsch/flexmark/util/format/MarkdownTable;Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRow;Lcom/vladsch/flexmark/util/format/TableCell;IILjava/lang/Integer;Ljava/lang/Integer;)V

    return-object v2

    :cond_2
    move-object v4, p0

    move v3, p1

    move-object v7, v1

    .line 205
    new-instance v2, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    invoke-virtual {p0, v8}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRowsSection(I)Lcom/vladsch/flexmark/util/format/TableSection;

    move-result-object v5

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v2 .. v11}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;-><init>(ILcom/vladsch/flexmark/util/format/MarkdownTable;Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRow;Lcom/vladsch/flexmark/util/format/TableCell;IILjava/lang/Integer;Ljava/lang/Integer;)V

    return-object v2

    :cond_3
    move-object v4, p0

    move v3, p1

    move-object v2, v1

    add-int/lit8 v9, v9, 0x1

    move p1, v3

    goto :goto_1

    :cond_4
    move-object v4, p0

    move v3, p1

    .line 212
    new-instance v2, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    invoke-virtual {p0, v8}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRowsSection(I)Lcom/vladsch/flexmark/util/format/TableSection;

    move-result-object v5

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v2 .. v11}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;-><init>(ILcom/vladsch/flexmark/util/format/MarkdownTable;Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRow;Lcom/vladsch/flexmark/util/format/TableCell;IILjava/lang/Integer;Ljava/lang/Integer;)V

    return-object v2

    :cond_5
    move-object v4, p0

    move v3, p1

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    :cond_6
    move-object v4, p0

    move v3, p1

    add-int/lit8 p1, v8, -0x1

    .line 217
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRowsSection(I)Lcom/vladsch/flexmark/util/format/TableSection;

    move-result-object v5

    .line 218
    new-instance v2, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v2 .. v11}, Lcom/vladsch/flexmark/util/format/TableCellOffsetInfo;-><init>(ILcom/vladsch/flexmark/util/format/MarkdownTable;Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/format/TableRow;Lcom/vladsch/flexmark/util/format/TableCell;IILjava/lang/Integer;Ljava/lang/Integer;)V

    return-object v2
.end method

.method public getHaveCaption()Z
    .locals 2

    .line 136
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget v0, v0, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method public getHeader()Z
    .locals 1

    .line 530
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isHeading:Z

    return v0
.end method

.method public getHeadingRowCount()I
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getMaxBodyColumns()I
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->getMaxColumns()I

    move-result v0

    return v0
.end method

.method public getMaxColumns()I
    .locals 3

    .line 147
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->getMaxColumns()I

    move-result v0

    .line 148
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/TableSection;->getMaxColumns()I

    move-result v1

    .line 149
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/TableSection;->getMaxColumns()I

    move-result v2

    .line 150
    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/Utils;->max(I[I)I

    move-result v0

    return v0
.end method

.method public varargs getMaxColumnsWithoutColumns(Z[I)I
    .locals 1

    if-eqz p1, :cond_0

    .line 158
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/util/collection/MaxAggregator;->INSTANCE:Lcom/vladsch/flexmark/util/collection/MaxAggregator;

    invoke-direct {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->aggregateTotalColumnsWithoutColumns([Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/BiFunction;[I)I

    move-result p1

    return p1
.end method

.method public varargs getMaxColumnsWithoutRows(Z[I)I
    .locals 1

    if-eqz p1, :cond_0

    .line 166
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/util/collection/MaxAggregator;->INSTANCE:Lcom/vladsch/flexmark/util/collection/MaxAggregator;

    invoke-direct {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->aggregateTotalColumnsWithoutRows([Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/BiFunction;[I)I

    move-result p1

    return p1
.end method

.method public getMaxHeadingColumns()I
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->getMaxColumns()I

    move-result v0

    return v0
.end method

.method public getMaxSeparatorColumns()I
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->getMaxColumns()I

    move-result v0

    return v0
.end method

.method public getMinColumns()I
    .locals 4

    .line 140
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->getMinColumns()I

    move-result v0

    .line 141
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/TableSection;->getMinColumns()I

    move-result v1

    .line 142
    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/TableSection;->getMinColumns()I

    move-result v2

    const v3, 0x7fffffff

    if-nez v0, :cond_0

    const v0, 0x7fffffff

    :cond_0
    if-nez v2, :cond_1

    const v2, 0x7fffffff

    .line 143
    :cond_1
    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/Utils;->min(I[I)I

    move-result v0

    return v0
.end method

.method public varargs getMinColumnsWithoutColumns(Z[I)I
    .locals 1

    if-eqz p1, :cond_0

    .line 154
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/util/collection/MinAggregator;->INSTANCE:Lcom/vladsch/flexmark/util/collection/MinAggregator;

    invoke-direct {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->aggregateTotalColumnsWithoutColumns([Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/BiFunction;[I)I

    move-result p1

    return p1
.end method

.method public varargs getMinColumnsWithoutRows(Z[I)I
    .locals 1

    if-eqz p1, :cond_0

    .line 162
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/util/collection/MinAggregator;->INSTANCE:Lcom/vladsch/flexmark/util/collection/MinAggregator;

    invoke-direct {p0, p1, v0, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->aggregateTotalColumnsWithoutRows([Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/BiFunction;[I)I

    move-result p1

    return p1
.end method

.method public getSeparatorRowCount()I
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getTableStartOffset()I
    .locals 3

    .line 174
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getAllRows()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    .line 175
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 176
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableRow;->normalizeIfNeeded()V

    .line 178
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 179
    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableCell;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/TableCell;->getStartOffset(Lcom/vladsch/flexmark/util/format/TableCell;)I

    move-result v0

    return v0

    :cond_0
    return v1
.end method

.method public getTrackedOffsets()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 170
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    return-object v0
.end method

.method public insertColumns(II)V
    .locals 2

    .line 385
    new-instance v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable$1;-><init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;II)V

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllContentRows(Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    .line 399
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 400
    invoke-virtual {v1, p1, p2}, Lcom/vladsch/flexmark/util/format/TableRow;->insertColumns(II)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public insertRows(II)V
    .locals 4

    .line 357
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getMaxColumns()I

    move-result v0

    .line 359
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gt p1, v1, :cond_0

    .line 360
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-direct {p0, v1, p1, p2, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->insertRows(Ljava/util/ArrayList;III)V

    return-void

    .line 362
    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr p1, v2

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr p1, v2

    iget-object v2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v2, v2, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    invoke-static {p1, v3, v2}, Lcom/vladsch/flexmark/util/Utils;->rangeLimit(III)I

    move-result p1

    invoke-direct {p0, v1, p1, p2, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->insertRows(Ljava/util/ArrayList;III)V

    return-void
.end method

.method public isAllRowsEmptyAt(I)Z
    .locals 1

    .line 481
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_TABLE_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isEmptyRowAt(I[Lcom/vladsch/flexmark/util/format/TableSection;)Z

    move-result p1

    return p1
.end method

.method public isAllRowsSeparator(I)Z
    .locals 2

    .line 280
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isContentRowsEmptyAt(I)Z
    .locals 1

    .line 492
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->ALL_CONTENT_ROWS:[Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isEmptyRowAt(I[Lcom/vladsch/flexmark/util/format/TableSection;)Z

    move-result p1

    return p1
.end method

.method public isEmptyColumn(I)Z
    .locals 3

    const/4 v0, 0x1

    .line 453
    new-array v1, v0, [Z

    const/4 v2, 0x0

    aput-boolean v0, v1, v2

    .line 454
    new-instance v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$4;

    invoke-direct {v0, p0, p1, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable$4;-><init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;I[Z)V

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllContentRows(Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    .line 470
    aget-boolean p1, v1, v2

    return p1
.end method

.method public isSeparator()Z
    .locals 1

    .line 538
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator:Z

    return v0
.end method

.method public moveColumn(II)V
    .locals 2

    .line 425
    new-instance v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable$3;-><init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;II)V

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->forAllContentRows(Lcom/vladsch/flexmark/util/format/TableRowManipulator;)V

    .line 439
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableRow;

    .line 440
    invoke-virtual {v1, p1, p2}, Lcom/vladsch/flexmark/util/format/TableRow;->moveColumn(II)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public nextRow()V
    .locals 2

    .line 546
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator:Z

    if-nez v0, :cond_1

    .line 547
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isHeading:Z

    if-eqz v0, :cond_0

    .line 548
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->nextRow()V

    return-void

    .line 550
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->nextRow()V

    return-void

    .line 546
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Only one separator row allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public normalize()V
    .locals 1

    .line 590
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->normalize()V

    .line 591
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->normalize()V

    .line 592
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/TableSection;->normalize()V

    return-void
.end method

.method public setCaption(Ljava/lang/CharSequence;)V
    .locals 3

    .line 91
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getCaptionCell()Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object v0

    .line 92
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "["

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lcom/vladsch/flexmark/util/format/TableCell;->openMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_0
    check-cast v1, Ljava/lang/CharSequence;

    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "]"

    goto :goto_1

    :cond_1
    iget-object v2, v0, Lcom/vladsch/flexmark/util/format/TableCell;->closeMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_1
    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1, p1, v2}, Lcom/vladsch/flexmark/util/format/TableCell;->withText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/format/TableCell;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setCaptionCell(Lcom/vladsch/flexmark/util/format/TableCell;)V

    return-void
.end method

.method public setCaptionCell(Lcom/vladsch/flexmark/util/format/TableCell;)V
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/TableSection;->defaultRow()Lcom/vladsch/flexmark/util/format/TableRow;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 83
    iget-object v0, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableSection;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/TableRow;

    iget-object v0, v0, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public setCaptionWithMarkers(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 6

    .line 104
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object v1, v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableCaptionSpaces:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    sget-object v2, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->AS_IS:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    :goto_0
    move-object v2, p2

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, p1

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)V

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setCaptionCell(Lcom/vladsch/flexmark/util/format/TableCell;)V

    return-void
.end method

.method public setHeader(Z)V
    .locals 0

    .line 534
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isHeading:Z

    return-void
.end method

.method public setSeparator(Z)V
    .locals 0

    .line 542
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1468
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{header="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->header:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",\nseparator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->separator:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",\nbody="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->body:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",\ncaption="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->caption:Lcom/vladsch/flexmark/util/format/TableSection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",\noptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",\ntrackedOffsets="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable;->trackedOffsets:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
