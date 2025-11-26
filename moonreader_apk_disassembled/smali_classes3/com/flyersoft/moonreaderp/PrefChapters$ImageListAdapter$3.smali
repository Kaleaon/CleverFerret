.class Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2342
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 2345
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 2346
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_0

    .line 2347
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v1}, Lcom/flyersoft/books/BaseEBook;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mshowImageLocation(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/lang/String;)V

    return-void

    .line 2348
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 2349
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget p1, p1, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    int-to-long v4, p1

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface/range {v1 .. v6}, Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;->onGetChapter(IIJZ)V

    .line 2350
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->dismiss()V

    :cond_1
    return-void
.end method
