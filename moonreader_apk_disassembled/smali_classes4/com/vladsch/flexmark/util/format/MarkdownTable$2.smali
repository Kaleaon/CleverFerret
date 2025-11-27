.class Lcom/vladsch/flexmark/util/format/MarkdownTable$2;
.super Ljava/lang/Object;
.source "MarkdownTable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/format/TableRowManipulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/format/MarkdownTable;->deleteColumns(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field final synthetic val$column:I

.field final synthetic val$count:I


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;II)V
    .locals 0

    .line 405
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$2;->this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iput p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$2;->val$column:I

    iput p3, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$2;->val$count:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vladsch/flexmark/util/format/TableRow;ILjava/util/ArrayList;I)I
    .locals 0
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

    .line 413
    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/TableRow;

    iget p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$2;->val$column:I

    iget p3, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$2;->val$count:I

    invoke-virtual {p1, p2, p3}, Lcom/vladsch/flexmark/util/format/TableRow;->deleteColumns(II)V

    const/4 p1, 0x0

    return p1
.end method
