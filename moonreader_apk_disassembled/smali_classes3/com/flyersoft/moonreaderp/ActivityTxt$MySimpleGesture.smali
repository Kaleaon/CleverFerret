.class Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MySimpleGesture"
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

    .line 9576
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 11

    .line 9578
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->inPreShow:Z

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    return v0

    .line 9580
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result p2

    if-eqz p2, :cond_1

    return v0

    .line 9582
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dotVisible()Z

    move-result p2

    if-eqz p2, :cond_2

    return v0

    .line 9584
    :cond_2
    sget-boolean p2, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-nez p2, :cond_13

    sget-boolean p2, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-eqz p2, :cond_3

    goto/16 :goto_3

    .line 9587
    :cond_3
    sget-object p2, Lcom/flyersoft/tools/A;->touchingView:Landroid/view/View;

    instance-of p2, p2, Landroid/widget/ScrollView;

    if-eqz p2, :cond_13

    .line 9589
    :try_start_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->mVT:Landroid/view/VelocityTracker;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->hMotionEvent:Landroid/view/MotionEvent;

    invoke-virtual {p2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 9590
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->mVT:Landroid/view/VelocityTracker;

    invoke-virtual {p2, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 9591
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->mVT:Landroid/view/VelocityTracker;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mMaximumVelocity:I

    int-to-float v1, v1

    const/16 v2, 0x3e8

    invoke-virtual {p2, v2, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 9593
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->mVT:Landroid/view/VelocityTracker;

    invoke-static {p2, v1, p3, p4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$macceptHorizontalFling(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/VelocityTracker;FF)Z

    move-result p2

    const/4 p3, 0x1

    if-eqz p2, :cond_4

    return p3

    .line 9595
    :cond_4
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$misDisableMove(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p2

    if-eqz p2, :cond_5

    return p3

    .line 9597
    :cond_5
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$misDisableMovedFlips(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p2

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$misMiddleTap(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/view/MotionEvent;)Z

    move-result p1

    if-nez p1, :cond_6

    return p3

    .line 9600
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-wide/16 v1, -0x1

    invoke-static {p1, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputcurrentPage(Lcom/flyersoft/moonreaderp/ActivityTxt;J)V

    .line 9601
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->longTimeTapEvent:Z

    .line 9602
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 9604
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    if-eqz p1, :cond_7

    .line 9605
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V

    .line 9606
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p3, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->flingStart:Z

    return v0

    .line 9610
    :cond_7
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->mVT:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result p1

    float-to-double p1, p1

    const-wide/16 v1, 0x0

    cmpl-double v3, p1, v1

    if-nez v3, :cond_8

    float-to-double p1, p4

    :cond_8
    mul-double v3, p1, p1

    .line 9614
    iget-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget p4, p4, Lcom/flyersoft/moonreaderp/ActivityTxt;->mDeceleration:F

    const/high16 v5, 0x40000000    # 2.0f

    mul-float p4, p4, v5

    float-to-double v5, p4

    div-double/2addr v3, v5

    double-to-int p4, v3

    .line 9615
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    const-wide/high16 v5, 0x4014000000000000L    # 5.0

    cmpg-double v7, v3, v5

    if-gez v7, :cond_9

    return v0

    .line 9618
    :cond_9
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v3}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v3

    .line 9619
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v4}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result v4

    .line 9620
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v5}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v5

    .line 9622
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v6

    if-nez v6, :cond_a

    return v0

    .line 9626
    :cond_a
    div-int/lit8 v7, v4, 0x2

    const/4 v8, 0x2

    if-lt p4, v7, :cond_c

    .line 9627
    div-int/lit8 p4, v4, 0x2

    mul-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    .line 9628
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v7, v7, Lcom/flyersoft/moonreaderp/ActivityTxt;->mDeceleration:F

    mul-float p4, p4, v7

    float-to-double v9, p4

    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v9

    cmpl-double p4, p1, v1

    if-lez p4, :cond_b

    move-wide p1, v9

    goto :goto_0

    :cond_b
    neg-double p1, v9

    :cond_c
    :goto_0
    cmpl-double p4, p1, v1

    if-lez p4, :cond_f

    .line 9632
    sget p4, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    if-le p4, v8, :cond_f

    int-to-double v1, v3

    sub-double/2addr v1, p1

    int-to-double v4, v5

    cmpg-double p4, v1, v4

    if-gez p4, :cond_12

    .line 9634
    invoke-virtual {v6, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result p4

    .line 9635
    invoke-virtual {v6, p4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result p4

    .line 9637
    sget v1, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    add-int/lit8 v2, v1, -0x1

    .line 9638
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-le p4, v2, :cond_d

    sub-int v3, p4, v2

    goto :goto_1

    :cond_d
    move v3, p4

    :goto_1
    if-ge p4, v2, :cond_e

    add-int/lit8 v1, v1, -0x1

    .line 9643
    :cond_e
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v2, v1, -0x2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p4, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v1, -0x1

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4, v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p4

    .line 9644
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, p4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtViewSetText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    .line 9645
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p4

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr p4, v1

    add-int/2addr p4, v3

    add-int/lit8 p4, p4, -0x5

    .line 9646
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, p4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result p4

    .line 9647
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1, p4}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop2(I)I

    move-result p4

    .line 9648
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, p4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 9649
    sput v4, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    goto/16 :goto_2

    :cond_f
    cmpg-double p4, p1, v1

    if-gez p4, :cond_12

    .line 9652
    sget p4, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    invoke-static {}, Lcom/flyersoft/tools/A;->getTxts()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v8

    if-ge p4, v1, :cond_12

    sget p4, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    if-lez p4, :cond_12

    int-to-double v1, v3

    sub-double/2addr v1, p1

    sub-int/2addr v4, v5

    int-to-double v4, v4

    cmpl-double p4, v1, v4

    if-lez p4, :cond_12

    const-wide/high16 v1, 0x4022000000000000L    # 9.0

    mul-double p1, p1, v1

    const-wide/high16 v1, 0x4024000000000000L    # 10.0

    div-double/2addr p1, v1

    .line 9655
    invoke-virtual {v6, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result p4

    .line 9656
    invoke-virtual {v6, p4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result p4

    .line 9658
    sget v1, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    add-int/lit8 v2, v1, -0x1

    .line 9659
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    .line 9660
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int v4, v2, v3

    sub-int v2, p4, v2

    if-le p4, v4, :cond_10

    sub-int/2addr v2, v3

    :cond_10
    if-le p4, v4, :cond_11

    add-int/lit8 v1, v1, 0x1

    .line 9665
    :cond_11
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v1, 0x1

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p4, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr v1, v8

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4, v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p4

    .line 9666
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, p4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtViewSetText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    .line 9667
    iget-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p4, p4, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p4}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p4

    add-int/lit8 v2, v2, 0x5

    invoke-virtual {p4, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result p4

    .line 9668
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1, p4}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop2(I)I

    move-result p4

    .line 9669
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1, p4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 9670
    sput v3, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    .line 9675
    :cond_12
    :goto_2
    iget-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p4, Lcom/flyersoft/moonreaderp/ActivityTxt;->yFlingTime:J

    .line 9676
    iget-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p4, p4, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    double-to-int p1, p1

    neg-int p1, p1

    invoke-virtual {p4, p1}, Lcom/flyersoft/views/ScrollView2;->fling(I)V

    .line 9677
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p3, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->flingStart:Z

    .line 9678
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MySimpleGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p3

    :catch_0
    move-exception p1

    .line 9682
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_13
    :goto_3
    return v0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
