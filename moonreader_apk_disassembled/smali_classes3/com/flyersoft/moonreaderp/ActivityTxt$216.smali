.class Lcom/flyersoft/moonreaderp/ActivityTxt$216;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditNote$OnAfterEditNote;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfDoAnnotation()V
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

    .line 20037
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEditNote(ILjava/lang/String;)V
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_6

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    const/4 p2, 0x2

    if-eq p1, p2, :cond_0

    goto/16 :goto_2

    .line 20067
    :cond_0
    :try_start_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfAnnotRemove()V

    .line 20068
    sput-boolean v1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 20069
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    goto/16 :goto_2

    .line 20042
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    if-nez p1, :cond_4

    .line 20043
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfGetVSel()Lcom/radaee/view/VSel;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 20044
    invoke-virtual {p1}, Lcom/radaee/view/VSel;->GetPage()Lcom/radaee/pdf/Page;

    move-result-object p1

    iget p1, p1, Lcom/radaee/pdf/Page;->pageno:I

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGetCurrPageNo()I

    move-result p1

    .line 20045
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v2, v0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotSetMarkup(I)Z

    move-result v2

    if-nez v2, :cond_3

    .line 20046
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string p2, "Failed to add annotation!"

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowFailedAnnotInfo(Ljava/lang/String;)V

    return-void

    .line 20049
    :cond_3
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v2, p1}, Lcom/flyersoft/books/PDFReader;->pdfGetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    .line 20050
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 20051
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v2, v2, Lcom/flyersoft/books/PDFReader;->selectedText:Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/flyersoft/books/PDFReader;->addNameTagToLastAnnot(Lcom/radaee/pdf/Page;Ljava/lang/String;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 20053
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    .line 20054
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget p1, p1, Lcom/radaee/pdf/Page;->pageno:I

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v3, v3, Lcom/flyersoft/books/PDFReader;->selectedText:Ljava/lang/String;

    invoke-virtual {v2, p1, v3, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveHighlightNote(ILjava/lang/String;Ljava/lang/String;I)V

    goto :goto_1

    .line 20057
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfAnnotGetText()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 20058
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v2}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v2

    invoke-virtual {p1, v2, p2}, Lcom/flyersoft/books/PDFReader;->pdfUpdateNoteTextFromAnnot(Lcom/radaee/pdf/Page$Annotation;Ljava/lang/String;)V

    .line 20059
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1, p2}, Lcom/flyersoft/books/PDFReader;->pdfAnnotSetText(Ljava/lang/String;)V

    .line 20062
    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 20063
    sput-boolean v1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 20064
    sput-boolean v1, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    goto :goto_2

    .line 20072
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 20076
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 20078
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 20079
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveAnnotsForTime()V

    .line 20080
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$216;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
