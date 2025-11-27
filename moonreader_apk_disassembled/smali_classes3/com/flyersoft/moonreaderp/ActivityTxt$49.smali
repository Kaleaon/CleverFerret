.class Lcom/flyersoft/moonreaderp/ActivityTxt$49;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


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
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 4540
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 4542
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 4546
    :cond_0
    :try_start_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v0, v4, :cond_b

    if-eq v0, v3, :cond_a

    if-eq v0, v2, :cond_9

    const/4 v2, 0x4

    if-eq v0, v2, :cond_1

    goto :goto_2

    .line 4599
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputebook_inLoading(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 4600
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mclearTxtView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 4602
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->isHtml()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 4612
    :cond_2
    sget-object v0, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    sget v2, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4613
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtViewSetText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 4603
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->createHtmlBookImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v2

    goto :goto_1

    :cond_4
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v2}, Lcom/flyersoft/books/BaseEBook;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v2

    :goto_1
    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputimageGetter(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;)V

    .line 4604
    invoke-static {}, Lcom/flyersoft/tools/A;->noSplitHtmls()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_6

    .line 4621
    :cond_5
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputchangeChapterTime(Lcom/flyersoft/moonreaderp/ActivityTxt;J)V

    .line 4622
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    return-void

    .line 4606
    :cond_6
    :try_start_1
    sget v0, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    sget-object v2, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_7

    .line 4607
    sget-object v0, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v4

    sput v0, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    .line 4608
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-object v2, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    sget v3, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    .line 4609
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    .line 4610
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetimageGetter(Lcom/flyersoft/moonreaderp/ActivityTxt;)Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v3

    sget v5, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-static {v2, v3, v5}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtViewSetText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    .line 4616
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgettxtScrollHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;)Landroid/os/Handler;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v4, :cond_8

    goto :goto_4

    :cond_8
    const/4 v1, 0x1

    :goto_4
    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 4617
    sget-boolean p1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz p1, :cond_5

    .line 4618
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v0, -0x64

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mspeakCurrentPage(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    goto :goto_2

    .line 4594
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result p1

    .line 4595
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetLineTopForPageTurn(Lcom/flyersoft/moonreaderp/ActivityTxt;I)I

    move-result p1

    .line 4596
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    goto/16 :goto_2

    .line 4589
    :cond_a
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-long v0, p1

    .line 4590
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result p1

    int-to-long v2, p1

    mul-long v0, v0, v2

    sget p1, Lcom/flyersoft/tools/A;->maxHtmlChapterSize:I

    int-to-long v2, p1

    div-long/2addr v0, v2

    .line 4591
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    long-to-int v1, v0

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    goto/16 :goto_2

    .line 4553
    :cond_b
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdisableTxtViewDraw(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 4554
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result p1

    .line 4555
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v0

    .line 4556
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v5}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v5

    .line 4559
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v6

    if-eqz v6, :cond_d

    mul-int/lit8 v0, v0, 0x2

    sub-int v3, v0, v5

    if-le p1, v3, :cond_c

    .line 4562
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    sub-int/2addr p1, v0

    mul-int/lit8 v5, v5, 0x3

    add-int/2addr p1, v5

    invoke-virtual {v3, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result p1

    .line 4563
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetLineTopForPageTurn(Lcom/flyersoft/moonreaderp/ActivityTxt;I)I

    move-result p1

    goto/16 :goto_5

    :cond_c
    const/4 p1, 0x0

    goto :goto_5

    .line 4566
    :cond_d
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    sub-int/2addr p1, v0

    mul-int/lit8 v5, v5, 0x2

    add-int/2addr p1, v5

    invoke-virtual {v2, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result p1

    .line 4568
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 4569
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    .line 4570
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    const-class v5, Lcom/flyersoft/components/CSS$PAGE_BREAK;

    invoke-interface {v2, v0, v3, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/flyersoft/components/CSS$PAGE_BREAK;

    .line 4571
    array-length v3, v2

    if-lez v3, :cond_e

    .line 4572
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v3

    array-length v5, v2

    sub-int/2addr v5, v4

    aget-object v2, v2, v5

    invoke-interface {v3, v2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    if-le v2, v0, :cond_e

    .line 4573
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge v2, v0, :cond_e

    .line 4574
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result p1

    .line 4578
    :cond_e
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgetLineTopForPageTurn(Lcom/flyersoft/moonreaderp/ActivityTxt;I)I

    move-result p1

    .line 4581
    :goto_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->goToLastTime:J

    .line 4582
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 4583
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$menableTxtViewDraw(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    .line 4584
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputforceDelayFlipAnimation(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 4585
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputebook_inLoading(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    goto/16 :goto_2

    .line 4548
    :cond_f
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 4549
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputforceDelayFlipAnimation(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 4550
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputebook_inLoading(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_2

    :catchall_0
    move-exception p1

    .line 4621
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputchangeChapterTime(Lcom/flyersoft/moonreaderp/ActivityTxt;J)V

    .line 4622
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$49;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 4623
    throw p1
.end method
