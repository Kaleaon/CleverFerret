.class Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;
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

    .line 18935
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 4

    .line 18937
    sput p1, Lcom/radaee/pdf/Global;->fillColor:I

    .line 18938
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 18940
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetStrokeColor()I

    move-result v0

    .line 18941
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    .line 18942
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    if-eqz v2, :cond_0

    if-eq v1, v2, :cond_0

    .line 18944
    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    invoke-static {v2, v1, v3, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    .line 18945
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeColor(I)Z

    .line 18948
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    .line 18949
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfUpdateCurPage()V

    const/4 p1, 0x1

    .line 18951
    sput-boolean p1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    :cond_1
    return-void
.end method
