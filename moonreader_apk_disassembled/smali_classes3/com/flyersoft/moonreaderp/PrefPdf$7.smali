.class Lcom/flyersoft/moonreaderp/PrefPdf$7;
.super Ljava/lang/Object;
.source "PrefPdf.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefPdf;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefPdf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 297
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$7;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 2

    .line 299
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf$7;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->cbz_back_color:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->pdf_back_color:I

    :goto_0
    if-eq p1, v0, :cond_2

    .line 301
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf$7;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_1

    .line 302
    sput p1, Lcom/flyersoft/tools/A;->cbz_back_color:I

    goto :goto_1

    .line 304
    :cond_1
    sput p1, Lcom/flyersoft/tools/A;->pdf_back_color:I

    .line 305
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf$7;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefPdf;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bgColor:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 306
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 307
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setStatusBarProperties(Z)V

    .line 308
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowFullStatusBarInfo(Z)Z

    .line 309
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->setBackgroundColor()V

    .line 310
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->doPostInvalidate()V

    :cond_2
    return-void
.end method
