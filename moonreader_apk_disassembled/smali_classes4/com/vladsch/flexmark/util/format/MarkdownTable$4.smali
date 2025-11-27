.class Lcom/vladsch/flexmark/util/format/MarkdownTable$4;
.super Ljava/lang/Object;
.source "MarkdownTable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/format/TableRowManipulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/format/MarkdownTable;->isEmptyColumn(I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field final synthetic val$column:I

.field final synthetic val$result:[Z


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;I[Z)V
    .locals 0

    .line 454
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$4;->this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iput p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$4;->val$column:I

    iput-object p3, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$4;->val$result:[Z

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

    .line 462
    iget p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$4;->val$column:I

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/format/TableRow;->isEmptyColumn(I)Z

    move-result p1

    const/4 p2, 0x0

    if-nez p1, :cond_0

    .line 463
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$4;->val$result:[Z

    aput-boolean p2, p1, p2

    const/high16 p1, -0x80000000

    return p1

    :cond_0
    return p2
.end method
