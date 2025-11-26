.class Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

.field final synthetic val$item:Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;Lcom/flyersoft/books/PDFReader$PdfAnnotItem;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2386
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$item:Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3

    if-nez p1, :cond_3

    .line 2389
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    .line 2390
    iget v1, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$item:Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget v2, v2, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    if-ne v1, v2, :cond_0

    .line 2391
    iget v1, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annotIndexInPage:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$item:Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget v2, v2, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annotIndexInPage:I

    if-le v1, v2, :cond_0

    .line 2392
    iget v1, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annotIndexInPage:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annotIndexInPage:I

    goto :goto_0

    .line 2393
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$item:Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget v0, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 2394
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$item:Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget v0, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2396
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$item:Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->RemoveFromPage()Z

    .line 2397
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$position:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2398
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->imageList:Ljava/util/ArrayList;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->val$position:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2399
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->notifyDataSetChanged()V

    :cond_3
    return-void
.end method
