.class Lcom/vladsch/flexmark/util/format/MarkdownTable$6;
.super Ljava/lang/Object;
.source "MarkdownTable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/format/TableRowManipulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/format/MarkdownTable;->aggregateTotalColumnsWithoutColumns([Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/BiFunction;[I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field final synthetic val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

.field final synthetic val$columns:[Ljava/lang/Integer;

.field final synthetic val$skipColumns:[I


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;[I[Ljava/lang/Integer;Lcom/vladsch/flexmark/util/BiFunction;)V
    .locals 0

    .line 1360
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;->this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;->val$skipColumns:[I

    iput-object p3, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;->val$columns:[Ljava/lang/Integer;

    iput-object p4, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vladsch/flexmark/util/format/TableRow;ILjava/util/ArrayList;I)I
    .locals 2
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

    .line 1368
    iget-object p2, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    const/4 p3, 0x0

    const/4 p4, 0x0

    const/4 v0, 0x0

    :goto_0
    if-ge p4, p2, :cond_1

    .line 1371
    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;->val$skipColumns:[I

    invoke-static {p4, v1}, Lcom/vladsch/flexmark/util/Utils;->contained(I[I)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p1, Lcom/vladsch/flexmark/util/format/TableRow;->cells:Ljava/util/List;

    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/TableCell;

    iget v1, v1, Lcom/vladsch/flexmark/util/format/TableCell;->columnSpan:I

    add-int/2addr v0, v1

    :cond_0
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    .line 1374
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;->val$columns:[Ljava/lang/Integer;

    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$6;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    aget-object p4, p1, p3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p2, p4, v0}, Lcom/vladsch/flexmark/util/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    aput-object p2, p1, p3

    :cond_2
    return p3
.end method
