.class Lcom/flyersoft/moonreaderp/ActivityTxt$75;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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

    .line 6428
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private goToPdfPage(IZ)V
    .locals 3

    .line 6487
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-nez v0, :cond_0

    goto :goto_1

    .line 6489
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    if-nez v0, :cond_1

    goto :goto_1

    .line 6491
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfValidatePageNumber(I)I

    move-result p1

    .line 6492
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->percentView:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v2}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p2, :cond_3

    int-to-long p1, p1

    .line 6494
    sput-wide p1, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 6495
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide v0, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int p2, v0

    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGotoPage(IZ)V

    .line 6496
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 5

    .line 6461
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    if-eqz p3, :cond_1

    .line 6463
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz p1, :cond_0

    .line 6464
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputseekBarStopPos(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 6465
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    xor-int/2addr p1, v0

    invoke-direct {p0, p2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->goToPdfPage(IZ)V

    :cond_1
    return-void

    :cond_2
    const/4 p1, 0x0

    if-gez p2, :cond_3

    const/4 p2, 0x0

    :cond_3
    const/16 v1, 0x3e8

    if-le p2, v1, :cond_4

    const/16 p2, 0x3e8

    .line 6474
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, p2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowEbookPercent(Lcom/flyersoft/moonreaderp/ActivityTxt;IZ)V

    if-eqz p3, :cond_6

    .line 6476
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookLength()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_6

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    if-ne p1, v0, :cond_6

    .line 6477
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showBookByPercent(I)V

    .line 6478
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckStatusBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 6479
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetFlipViewINVISIBLE(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 6480
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetFlipCache()V

    .line 6483
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-wide/16 p2, -0x1

    invoke-static {p1, p2, p3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputcurrentPage(Lcom/flyersoft/moonreaderp/ActivityTxt;J)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .line 6454
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->nav_return:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 6455
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLinkBackInfo(Z)Lcom/flyersoft/moonreaderp/ActivityTxt$LINK_BACK;

    .line 6456
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetSeekBarProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/SeekBar;)I

    move-result p1

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputseekBarStartPos(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 6457
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputseekBarStopPos(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 4

    .line 6430
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->nav_return:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 6431
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetseekBarStopPos(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 6432
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetseekBarStopPos(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->goToPdfPage(IZ)V

    .line 6433
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v2, -0x1

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputseekBarStopPos(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 6435
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v0, :cond_1

    .line 6436
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$75$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$75$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$75;)V

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->post(Ljava/lang/Runnable;)Z

    .line 6442
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    const/16 v2, 0x64

    if-ne v0, v2, :cond_3

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetebook_inLoading(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetseekBarStartPos(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetSeekBarProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/SeekBar;)I

    move-result v2

    if-eq v0, v2, :cond_3

    .line 6443
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputebook_inLoading(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 6444
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getEbookTotalPageCount()I

    move-result v0

    if-lez v0, :cond_2

    int-to-double v0, v0

    .line 6446
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetSeekBarProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/SeekBar;)I

    move-result p1

    int-to-double v2, p1

    mul-double v0, v0, v2

    const-wide v2, 0x408f400000000000L    # 1000.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int p1, v0

    .line 6447
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showEBookbyPageNum(I)V

    return-void

    .line 6449
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetSeekBarProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/SeekBar;)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showBookByPercent(I)V

    :cond_3
    return-void
.end method
