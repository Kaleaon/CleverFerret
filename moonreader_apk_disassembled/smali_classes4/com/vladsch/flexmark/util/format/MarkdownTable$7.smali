.class Lcom/vladsch/flexmark/util/format/MarkdownTable$7;
.super Ljava/lang/Object;
.source "MarkdownTable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/format/TableRowManipulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/format/MarkdownTable;->aggregateTotalColumnsWithoutRows([Lcom/vladsch/flexmark/util/format/TableSection;Lcom/vladsch/flexmark/util/BiFunction;[I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field final synthetic val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

.field final synthetic val$columns:[Ljava/lang/Integer;

.field final synthetic val$skipRows:[I


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;[I[Ljava/lang/Integer;Lcom/vladsch/flexmark/util/BiFunction;)V
    .locals 0

    .line 1390
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;->this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;->val$skipRows:[I

    iput-object p3, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;->val$columns:[Ljava/lang/Integer;

    iput-object p4, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vladsch/flexmark/util/format/TableRow;ILjava/util/ArrayList;I)I
    .locals 1
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

    .line 1398
    iget-object p3, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;->val$skipRows:[I

    invoke-static {p2, p3}, Lcom/vladsch/flexmark/util/Utils;->contained(I[I)Z

    move-result p2

    const/4 p3, 0x0

    if-nez p2, :cond_0

    .line 1399
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/TableRow;->getTotalColumns()I

    move-result p1

    if-lez p1, :cond_0

    .line 1401
    iget-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;->val$columns:[Ljava/lang/Integer;

    iget-object p4, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$7;->val$aggregator:Lcom/vladsch/flexmark/util/BiFunction;

    aget-object v0, p2, p3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p4, v0, p1}, Lcom/vladsch/flexmark/util/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    aput-object p1, p2, p3

    :cond_0
    return p3
.end method
