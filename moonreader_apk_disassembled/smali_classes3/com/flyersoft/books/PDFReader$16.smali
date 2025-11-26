.class Lcom/flyersoft/books/PDFReader$16;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/PDFReader;->pdfUpdateNotesToFile(Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/PDFReader;

.field final synthetic val$pageUpdates:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/PDFReader;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1532
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$16;->this$0:Lcom/flyersoft/books/PDFReader;

    iput-object p2, p0, Lcom/flyersoft/books/PDFReader$16;->val$pageUpdates:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const/4 v0, 0x0

    .line 1535
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$16;->val$pageUpdates:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1536
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$16;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object v2, p0, Lcom/flyersoft/books/PDFReader$16;->val$pageUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/PDFReader;->pdfUpdatePage(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
