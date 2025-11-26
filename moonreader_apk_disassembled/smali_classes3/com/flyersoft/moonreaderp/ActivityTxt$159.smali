.class Lcom/flyersoft/moonreaderp/ActivityTxt$159;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 15914
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 15916
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcancelFadeSelectBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 15918
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->hPen:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_4

    .line 15919
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isClickOnAnnot()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 15920
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v0, :cond_0

    .line 15921
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotRemove()V

    .line 15922
    sput-boolean v1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 15923
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 15924
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveAnnotsForTime()V

    goto :goto_0

    .line 15926
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->preNoteInfo:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mremoveCurrentNote(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/BookDb$NoteInfo;)V

    goto :goto_0

    .line 15928
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v0, :cond_4

    .line 15929
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->canSave()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 15930
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 15931
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 15932
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    goto :goto_0

    .line 15934
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->showBuyDialog(Landroid/content/Context;)V

    goto :goto_0

    .line 15936
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->pdf_cannot_modify:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowFailedAnnotInfo(Ljava/lang/String;)V

    .line 15940
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getSelectedWord()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5

    goto :goto_1

    .line 15944
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->hMore:Landroid/widget/TextView;

    if-ne p1, v1, :cond_6

    .line 15945
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$159;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowDictMoreMenu(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    :cond_6
    :goto_1
    return-void
.end method
