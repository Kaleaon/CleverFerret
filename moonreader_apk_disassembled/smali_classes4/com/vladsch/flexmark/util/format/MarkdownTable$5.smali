.class Lcom/vladsch/flexmark/util/format/MarkdownTable$5;
.super Ljava/lang/Object;
.source "MarkdownTable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/format/TableRowManipulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/format/MarkdownTable;->isEmptyRowAt(I[Lcom/vladsch/flexmark/util/format/TableSection;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field final synthetic val$result:[Z


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/format/MarkdownTable;[Z)V
    .locals 0

    .line 505
    iput-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$5;->this$0:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$5;->val$result:[Z

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

    .line 513
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/TableRow;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 514
    iget-object p1, p0, Lcom/vladsch/flexmark/util/format/MarkdownTable$5;->val$result:[Z

    const/4 p2, 0x0

    const/4 p3, 0x1

    aput-boolean p3, p1, p2

    :cond_0
    const/high16 p1, -0x80000000

    return p1
.end method
