.class Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$201;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18909
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 1

    .line 18911
    sput p1, Lcom/radaee/pdf/Global;->inkColor:I

    .line 18912
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 18913
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeColor(I)Z

    .line 18914
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfUpdateCurPage()V

    const/4 p1, 0x1

    .line 18916
    sput-boolean p1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    return-void

    .line 18918
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->getStatus()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 18919
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->onPdfAnnotButtonClick:Landroid/view/View$OnClickListener;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antInk:Landroid/widget/ImageView;

    invoke-interface {p1, v0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_1
    return-void
.end method
