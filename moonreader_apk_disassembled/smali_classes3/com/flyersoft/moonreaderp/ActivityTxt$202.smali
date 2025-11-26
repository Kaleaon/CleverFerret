.class Lcom/flyersoft/moonreaderp/ActivityTxt$202;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfInitThickPanel()V
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

    .line 19113
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 19116
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    .line 19117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 19118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    div-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeWidth(F)Z

    .line 19119
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfUpdateCurPage()V

    const/4 p1, 0x1

    .line 19120
    sput-boolean p1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    goto :goto_0

    .line 19121
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->antFreeText:Landroid/widget/ImageView;

    if-ne v0, v1, :cond_1

    add-int/lit8 p1, p1, 0xa

    int-to-float p1, p1

    .line 19122
    sput p1, Lcom/radaee/pdf/Global;->freeTextSize:F

    goto :goto_0

    :cond_1
    int-to-float p1, p1

    .line 19124
    sput p1, Lcom/radaee/pdf/Global;->inkWidth:F

    .line 19125
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->getStatus()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    .line 19126
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->onPdfAnnotButtonClick:Landroid/view/View$OnClickListener;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->antInk:Landroid/widget/ImageView;

    invoke-interface {p1, v0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 19128
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetImmersiveMode(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 19129
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$202;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetThickSelectView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
