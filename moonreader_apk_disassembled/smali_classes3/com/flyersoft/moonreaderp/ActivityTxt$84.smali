.class Lcom/flyersoft/moonreaderp/ActivityTxt$84;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showEpub3Footnote(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field downTime:J

.field downX:F

.field downY:F

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

    .line 8894
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10

    .line 8900
    const-string v0, "?"

    .line 0
    const-string v1, "*action:"

    const/4 v2, 0x0

    .line 8900
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    aput-object v1, v4, v2

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 8901
    check-cast p1, Landroid/widget/ScrollView;

    .line 8902
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const-wide/16 v4, 0x190

    if-nez v1, :cond_1

    .line 8903
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->downTime:J

    .line 8904
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->downX:F

    .line 8905
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->downY:F

    .line 8906
    invoke-static {}, Lcom/flyersoft/tools/A;->isInMultiWindow()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 8907
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v6, 0x7d0

    invoke-virtual {v1, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->eraseGPUShadow(I)V

    .line 8908
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v3, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->footnoteLongTimeTapEvent:Z

    .line 8909
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v6, 0x1f6

    invoke-virtual {v1, v6}, Landroid/os/Handler;->removeMessages(I)V

    .line 8910
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    invoke-virtual {v7, v6, v3, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v1, v6, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 8912
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v6, 0x2

    if-ne v1, v6, :cond_3

    .line 8913
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget v6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->downY:F

    sub-float/2addr v1, v6

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    int-to-float v7, v7

    cmpl-float v1, v1, v7

    if-gtz v1, :cond_2

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getTouchX(Landroid/view/MotionEvent;)F

    move-result v1

    iget v7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->downX:F

    sub-float/2addr v1, v7

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    int-to-float v6, v6

    cmpl-float v1, v1, v6

    if-lez v1, :cond_3

    .line 8914
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->footnoteLongTimeTapEvent:Z

    .line 8915
    :cond_3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v3, :cond_e

    .line 8916
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v6, 0x3bc

    const-wide/16 v7, 0xbb8

    invoke-virtual {v1, v6, v7, v8}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 8917
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->downTime:J

    sub-long/2addr v6, v8

    cmp-long v1, v6, v4

    if-lez v1, :cond_4

    return v2

    .line 8919
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->footnoteLongTimeTapEvent:Z

    .line 8920
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pop:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v1, v1, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    .line 8921
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v4

    .line 8922
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v6

    sub-int/2addr v5, v6

    .line 8923
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p1}, Landroid/widget/ScrollView;->getScrollY()I

    move-result p1

    add-int/2addr p2, p1

    .line 8924
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaddingTop()I

    move-result p1

    sub-int/2addr p2, p1

    invoke-virtual {v1}, Landroid/widget/TextView;->getLineHeight()I

    move-result p1

    mul-int/lit8 p1, p1, 0x2d

    div-int/lit8 p1, p1, 0x64

    sub-int/2addr p2, p1

    .line 8925
    invoke-virtual {v4, p2}, Landroid/text/Layout;->getLineForVertical(I)I

    move-result p1

    int-to-float p2, v5

    .line 8926
    invoke-virtual {v4, p1, p2}, Landroid/text/Layout;->getOffsetForHorizontal(IF)I

    move-result p2

    .line 8927
    invoke-virtual {v4, p1}, Landroid/text/Layout;->getLineStart(I)I

    move-result v5

    .line 8928
    invoke-virtual {v4, p1}, Landroid/text/Layout;->getLineEnd(I)I

    move-result p1

    if-lt p2, v5, :cond_e

    if-ge p2, p1, :cond_e

    if-eq v5, p1, :cond_e

    .line 8930
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Landroid/text/Spanned;

    if-ge v5, p2, :cond_5

    add-int/lit8 v5, p2, -0x1

    :cond_5
    if-le p1, p2, :cond_6

    add-int/lit8 p1, p2, 0x1

    .line 8933
    :cond_6
    const-class p2, Ljava/lang/Object;

    invoke-interface {v1, v5, p1, p2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    .line 8934
    array-length p2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_e

    aget-object v4, p1, v1

    .line 8935
    instance-of v5, v4, Landroid/text/style/URLSpan;

    if-nez v5, :cond_8

    instance-of v5, v4, Lcom/flyersoft/staticlayout/MyUrlSpan;

    if-eqz v5, :cond_7

    goto :goto_1

    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 8936
    :cond_8
    :goto_1
    instance-of p1, v4, Landroid/text/style/URLSpan;

    if-eqz p1, :cond_9

    check-cast v4, Landroid/text/style/URLSpan;

    invoke-virtual {v4}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_9
    check-cast v4, Lcom/flyersoft/staticlayout/MyUrlSpan;

    invoke-virtual {v4}, Lcom/flyersoft/staticlayout/MyUrlSpan;->getURL()Ljava/lang/String;

    move-result-object p1

    .line 8937
    :goto_2
    const-string p2, ""

    .line 8938
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetfootnoteStr(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<a href=\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v4, -0x1

    if-eq v1, v4, :cond_a

    .line 8940
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetfootnoteStr(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/lang/String;

    move-result-object p2

    const-string v4, ">"

    invoke-virtual {p2, v4, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    .line 8941
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetfootnoteStr(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/lang/String;

    move-result-object v1

    add-int/2addr p2, v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetfootnoteStr(Lcom/flyersoft/moonreaderp/ActivityTxt;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<"

    invoke-virtual {v4, v5, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v1, p2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 8943
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "title:#"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "#url:"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v4, v3, [Ljava/lang/Object;

    aput-object v1, v4, v2

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 8945
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hidePop(Z)Z

    .line 8946
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputshowNoteAnimation(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 8948
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isHttpImage(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 8949
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->openUrlAsk(Ljava/lang/String;)V

    goto :goto_3

    .line 8951
    :cond_b
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v1, :cond_d

    .line 8952
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 8953
    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v4, v1}, Lcom/flyersoft/books/BaseEBook;->getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;

    move-result-object v4

    if-nez v4, :cond_c

    .line 8954
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 8955
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/BaseEBook;->getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;

    move-result-object v4

    :cond_c
    if-eqz v4, :cond_d

    .line 8957
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowFB2Footnote(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/books/BaseEBook$FootNote;)V

    return v2

    .line 8961
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$84;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-wide/16 v3, 0x32

    invoke-static {v0, p1, p2, v3, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mopenUrlLink(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    .line 8969
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_e
    :goto_3
    return v2
.end method
