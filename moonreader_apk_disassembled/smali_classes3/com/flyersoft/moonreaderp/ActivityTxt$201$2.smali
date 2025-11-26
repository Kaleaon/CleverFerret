.class Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

    .line 18879
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 18881
    check-cast p1, Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ListView;->getCheckedItemPosition()I

    move-result p1

    .line 18882
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p2}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object p2

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    .line 18883
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p2}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object p2

    add-int/2addr p1, v0

    div-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeWidth(F)Z

    .line 18884
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfUpdateCurPage()V

    .line 18886
    sput-boolean v0, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    goto :goto_0

    .line 18887
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->antFreeText:Landroid/widget/ImageView;

    if-ne p2, v1, :cond_1

    add-int/lit8 p1, p1, 0xb

    int-to-float p1, p1

    .line 18888
    sput p1, Lcom/radaee/pdf/Global;->freeTextSize:F

    goto :goto_0

    :cond_1
    add-int/2addr p1, v0

    int-to-float p1, p1

    .line 18890
    sput p1, Lcom/radaee/pdf/Global;->inkWidth:F

    .line 18891
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->getStatus()I

    move-result p1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_2

    .line 18892
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->onPdfAnnotButtonClick:Landroid/view/View$OnClickListener;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->antInk:Landroid/widget/ImageView;

    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 18894
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
