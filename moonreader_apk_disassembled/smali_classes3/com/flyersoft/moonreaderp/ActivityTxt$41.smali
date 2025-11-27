.class Lcom/flyersoft/moonreaderp/ActivityTxt$41;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showVisualOptions(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$fitPage:Z

.field final synthetic val$flip_animation:I

.field final synthetic val$gl:Z

.field final synthetic val$page_gap:I

.field final synthetic val$pdf_render_quality:I

.field final synthetic val$pdf_view_mode:I

.field final synthetic val$rtol:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;ZIIZILjava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
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

    .line 3255
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$gl:Z

    iput p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$flip_animation:I

    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$pdf_render_quality:I

    iput-boolean p5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$fitPage:Z

    iput p6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$page_gap:I

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$rtol:Ljava/lang/String;

    iput p8, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$pdf_view_mode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 3257
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_0

    goto/16 :goto_3

    .line 3259
    :cond_0
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$gl:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eq p1, v0, :cond_1

    .line 3260
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    :cond_1
    const/4 p1, 0x1

    .line 3263
    invoke-static {p1}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 3264
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$flip_animation:I

    sget v0, Lcom/flyersoft/tools/A;->flip_animation:I

    if-eq p1, v0, :cond_4

    invoke-static {}, Lcom/flyersoft/tools/A;->isFlipCurl()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 3265
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curl3d:Lcom/flyersoft/views/NewCurl3D;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curl3d:Lcom/flyersoft/views/NewCurl3D;

    iget p1, p1, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->curl3d:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D;->getStyle()I

    move-result v0

    if-eq p1, v0, :cond_2

    goto :goto_0

    .line 3269
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curl3d:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D;->clearAllShots()V

    goto :goto_1

    .line 3266
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3271
    :cond_4
    :goto_1
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$pdf_render_quality:I

    sget v0, Lcom/flyersoft/tools/A;->pdf_render_quality:I

    if-ne p1, v0, :cond_9

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$fitPage:Z

    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-ne p1, v0, :cond_9

    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$page_gap:I

    .line 3272
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v0, :cond_5

    sget v0, Lcom/flyersoft/tools/A;->pdf_page_gap:I

    goto :goto_2

    :cond_5
    sget v0, Lcom/flyersoft/tools/A;->djvu_page_gap:I

    :goto_2
    if-eq p1, v0, :cond_6

    goto :goto_4

    .line 3276
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v0, Lcom/radaee/pdf/Global;->rtol:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v0, Lcom/radaee/pdf/Global;->cbzRtol:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v0, Lcom/radaee/pdf/Global;->djvuRtol:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 3277
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$rtol:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 3278
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3281
    :cond_7
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->val$pdf_view_mode:I

    sget v0, Lcom/flyersoft/tools/A;->pdf_view_mode:I

    if-eq p1, v0, :cond_8

    .line 3282
    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    .line 3283
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetGlobalValue(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3284
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-eq p1, v0, :cond_8

    .line 3285
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    :cond_8
    :goto_3
    return-void

    .line 3273
    :cond_9
    :goto_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void
.end method
