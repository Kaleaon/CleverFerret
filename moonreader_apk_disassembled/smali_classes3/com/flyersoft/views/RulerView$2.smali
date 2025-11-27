.class Lcom/flyersoft/views/RulerView$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "RulerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->setRulerTouchEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/RulerView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/RulerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 213
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method private doFling(FF)V
    .locals 10

    .line 221
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->scroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 223
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v2, 0x40a00000    # 5.0f

    mul-float v1, v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 p2, 0x0

    .line 225
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v1, v0, Lcom/flyersoft/views/RulerView;->scroller:Landroid/widget/Scroller;

    float-to-int v4, p1

    float-to-int v5, p2

    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget p1, p1, Lcom/flyersoft/views/RulerView;->width:I

    neg-int v6, p1

    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v7, p1, Lcom/flyersoft/views/RulerView;->width:I

    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget p1, p1, Lcom/flyersoft/views/RulerView;->height:I

    neg-int v8, p1

    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v9, p1, Lcom/flyersoft/views/RulerView;->height:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v9}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 227
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget p2, p1, Lcom/flyersoft/views/RulerView;->rTop:I

    iput p2, p1, Lcom/flyersoft/views/RulerView;->scrollStartTop:I

    .line 228
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget p2, p1, Lcom/flyersoft/views/RulerView;->rLeft:I

    iput p2, p1, Lcom/flyersoft/views/RulerView;->scrollStartLeft:I

    .line 229
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/flyersoft/views/RulerView;->scrollReverse:Z

    .line 230
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iput p2, p1, Lcom/flyersoft/views/RulerView;->scrollReverseStart:I

    .line 231
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/RulerView;->invalidate()V

    return-void
.end method

.method private doSingleTap(Landroid/view/MotionEvent;)V
    .locals 10

    .line 295
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-boolean v0, v0, Lcom/flyersoft/views/RulerView;->ignoreRulerTap:Z

    if-eqz v0, :cond_0

    goto/16 :goto_6

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->layoutVisible:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 298
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    return-void

    .line 302
    :cond_1
    sget-boolean v0, Lcom/flyersoft/views/RulerView;->hasSingleTap:Z

    if-nez v0, :cond_2

    goto/16 :goto_6

    .line 304
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    goto/16 :goto_6

    .line 306
    :cond_3
    sget v0, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    const/16 v2, 0x1e

    const/4 v3, 0x0

    const/4 v4, 0x3

    if-lt v0, v2, :cond_5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v0, v0, Lcom/flyersoft/views/RulerView;->rTop:I

    iget-object v2, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v2, v2, Lcom/flyersoft/views/RulerView;->rHeight:I

    div-int/2addr v2, v4

    add-int/2addr v0, v2

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_4

    goto :goto_0

    :cond_4
    const/4 p1, 0x0

    goto :goto_1

    :cond_5
    :goto_0
    const/4 p1, 0x1

    :goto_1
    if-nez p1, :cond_6

    .line 307
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v0}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_6

    .line 311
    :cond_6
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    invoke-static {v0}, Lcom/flyersoft/views/RulerView;->-$$Nest$mreloadTxtIfNeed(Lcom/flyersoft/views/RulerView;)V

    .line 312
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v0}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v0

    .line 313
    iget-object v2, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v2, v2, Lcom/flyersoft/views/RulerView;->rTop:I

    add-int/2addr v2, v0

    iget-object v5, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v5, v5, Lcom/flyersoft/views/RulerView;->rHeight:I

    sget v6, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v7, 0x4

    if-le v6, v7, :cond_7

    goto :goto_2

    :cond_7
    const/4 v4, 0x2

    :goto_2
    div-int/2addr v5, v4

    add-int/2addr v2, v5

    iget-object v4, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v4, v4, Lcom/flyersoft/views/RulerView;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v4}, Lcom/flyersoft/views/ScrollView2;->getPaddingTop()I

    move-result v4

    sub-int/2addr v2, v4

    .line 314
    iget-object v4, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v4, v4, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v4}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v2

    .line 315
    iget-object v4, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v4, v4, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v4}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v4

    if-eqz p1, :cond_8

    add-int/lit8 v5, v4, -0x1

    if-ne v2, v5, :cond_8

    goto/16 :goto_6

    :cond_8
    if-eqz p1, :cond_9

    add-int/lit8 v5, v4, -0x1

    if-lt v2, v5, :cond_a

    :cond_9
    if-nez p1, :cond_11

    if-lez v2, :cond_11

    .line 319
    :cond_a
    iget-object v5, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v5, v5, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v5, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop2(I)I

    move-result v5

    if-eqz p1, :cond_b

    const/4 v6, 0x1

    goto :goto_3

    :cond_b
    const/4 v6, -0x1

    :goto_3
    add-int/2addr v6, v2

    if-eqz p1, :cond_c

    :goto_4
    add-int/lit8 v7, v4, -0x1

    if-ge v6, v7, :cond_d

    .line 322
    iget-object v7, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v7, v7, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v7, v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineText(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d

    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    :cond_c
    :goto_5
    if-lez v6, :cond_d

    .line 324
    iget-object v4, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v4, v4, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v4, v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineText(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    add-int/lit8 v6, v6, -0x1

    goto :goto_5

    .line 326
    :cond_d
    iget-object v4, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v4, v4, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v4, v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop2(I)I

    move-result v4

    if-eqz v4, :cond_11

    .line 328
    sget v7, Lcom/flyersoft/tools/A;->paragraphSpace:I

    const/16 v8, 0xa

    if-eqz v7, :cond_e

    iget-object v7, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v7, v7, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v7}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    iget-object v9, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v9, v9, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v9

    invoke-virtual {v9, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v9

    sub-int/2addr v9, v1

    invoke-interface {v7, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_e

    .line 329
    iget-object v7, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v7, v7, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v7, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x64

    div-int/lit16 v2, v2, 0x2d8

    sub-int/2addr v0, v2

    .line 330
    :cond_e
    sget v2, Lcom/flyersoft/tools/A;->paragraphSpace:I

    if-eqz v2, :cond_f

    iget-object v2, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v2, v2, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v7, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v7, v7, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v7}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v7

    sub-int/2addr v7, v1

    invoke-interface {v2, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    if-ne v2, v8, :cond_f

    .line 331
    iget-object v2, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v2, v2, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2, v6}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x64

    div-int/lit16 v2, v2, 0x2d8

    add-int/2addr v4, v2

    :cond_f
    add-int/2addr v0, v4

    sub-int/2addr v0, v5

    if-eqz p1, :cond_10

    .line 334
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v2, v2, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1, v2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->fixBottomForScrollTo(Lcom/flyersoft/staticlayout/MRTextView;I)V

    .line 335
    :cond_10
    sput-boolean v1, Lcom/flyersoft/tools/A;->moveStart:Z

    .line 336
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {p1, v3, v0}, Lcom/flyersoft/views/ScrollView2;->smoothScrollTo(II)V

    .line 337
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V

    .line 338
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetFlipCache()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 342
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_11
    :goto_6
    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 276
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v0, v0, Lcom/flyersoft/views/RulerView;->rLeft:I

    iget-object v1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v1, v1, Lcom/flyersoft/views/RulerView;->LEFT_MIN:I

    const/4 v2, 0x1

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v0, v0, Lcom/flyersoft/views/RulerView;->rLeft:I

    iget-object v1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v1, v1, Lcom/flyersoft/views/RulerView;->LEFT_MAX:I

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 281
    :cond_0
    sget-boolean v0, Lcom/flyersoft/views/RulerView;->hasDoubleTap:Z

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v1, v1, Lcom/flyersoft/views/RulerView;->rLeft:I

    iget-object v3, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v3, v3, Lcom/flyersoft/views/RulerView;->width:I

    div-int/lit8 v3, v3, 0x3

    add-int/2addr v1, v3

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v1, v1, Lcom/flyersoft/views/RulerView;->rLeft:I

    iget-object v3, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v3, v3, Lcom/flyersoft/views/RulerView;->width:I

    mul-int/lit8 v3, v3, 0x2

    div-int/lit8 v3, v3, 0x3

    add-int/2addr v1, v3

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    .line 282
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v2}, Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V

    goto :goto_0

    .line 284
    :cond_1
    invoke-direct {p0, p1}, Lcom/flyersoft/views/RulerView$2;->doSingleTap(Landroid/view/MotionEvent;)V

    :goto_0
    return v2

    .line 278
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget p1, p1, Lcom/flyersoft/views/RulerView;->rLeft:I

    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v0, v0, Lcom/flyersoft/views/RulerView;->LEFT_MIN:I

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget p1, p1, Lcom/flyersoft/views/RulerView;->width:I

    goto :goto_2

    :cond_3
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget p1, p1, Lcom/flyersoft/views/RulerView;->width:I

    neg-int p1, p1

    :goto_2
    mul-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/RulerView$2;->doFling(FF)V

    return v2
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 216
    invoke-direct {p0, p3, p4}, Lcom/flyersoft/views/RulerView$2;->doFling(FF)V

    const/4 p1, 0x1

    return p1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 4

    .line 251
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->layoutVisible:Z

    if-eqz v0, :cond_0

    .line 252
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->inverseLayoutVisible(Z)V

    return-void

    .line 255
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-boolean v0, v0, Lcom/flyersoft/views/RulerView;->ignoreRulerTap:Z

    if-eqz v0, :cond_1

    goto :goto_0

    .line 257
    :cond_1
    sget-boolean v0, Lcom/flyersoft/views/RulerView;->hasLongTap:Z

    if-nez v0, :cond_2

    :goto_0
    return-void

    .line 260
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 261
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-object v2, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget v2, v2, Lcom/flyersoft/views/RulerView;->width:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    cmpg-float v0, v0, v2

    if-gez v0, :cond_3

    .line 262
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    sput-object v0, Lcom/flyersoft/tools/A;->touchingView:Landroid/view/View;

    .line 263
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    goto :goto_1

    .line 265
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll2:Lcom/flyersoft/views/ScrollView2;

    sput-object v0, Lcom/flyersoft/tools/A;->touchingView:Landroid/view/View;

    .line 266
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v0, v0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->additionalLeft()I

    move-result v0

    :goto_1
    rsub-int/lit8 v0, v0, 0x0

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    .line 269
    :goto_2
    iget-object v2, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v2, v2, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v3, v3, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v3, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveEvent(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->hMotionEvent:Landroid/view/MotionEvent;

    .line 270
    iget-object v2, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object v2, v2, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->hMotionEvent:Landroid/view/MotionEvent;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    int-to-float v0, v0

    add-float/2addr v3, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v2, v3, p1}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 271
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$2;->this$0:Lcom/flyersoft/views/RulerView;

    iget-object p1, p1, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->doLongTimeTapEvent(Z)Z

    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 290
    invoke-direct {p0, p1}, Lcom/flyersoft/views/RulerView$2;->doSingleTap(Landroid/view/MotionEvent;)V

    const/4 p1, 0x1

    return p1
.end method
