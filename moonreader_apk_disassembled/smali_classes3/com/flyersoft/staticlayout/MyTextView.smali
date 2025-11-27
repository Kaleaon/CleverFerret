.class public Lcom/flyersoft/staticlayout/MyTextView;
.super Landroid/view/View;
.source "MyTextView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/MyTextView$BufferType;
    }
.end annotation


# static fields
.field private static final PREDRAW_DONE:I = 0x2

.field private static final PREDRAW_NOT_REGISTERED:I = 0x0

.field private static final PREDRAW_PENDING:I = 0x1


# instance fields
.field public alone:Z

.field public drawMarginBackgroundOnly:Z

.field private mCurTextColor:I

.field public mHighlightPaint:Landroid/graphics/Paint;

.field private mHintLayout:Lcom/flyersoft/staticlayout/MyLayout;

.field public mInnerWidth:I

.field public mLayout:Lcom/flyersoft/staticlayout/MyLayout;

.field private mLinkTextColor:Landroid/content/res/ColorStateList;

.field private mMaximum:I

.field private mMinimum:I

.field private mPreDrawState:I

.field private mScroller:Landroid/widget/Scroller;

.field private mShadowDx:F

.field private mShadowDy:F

.field private mShadowRadius:F

.field public mSpacingAdd:F

.field public mSpacingMult:F

.field public mText:Ljava/lang/CharSequence;

.field private mTextColor:Landroid/content/res/ColorStateList;

.field public mTextHash:I

.field private mTextPaint:Landroid/text/TextPaint;

.field private mUserSetTextScaleX:Z

.field public maxLines:I

.field public outerWidth2:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 45
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    const/4 v1, 0x1

    .line 46
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 48
    const-string v1, "H"

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 52
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/MyTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x1010084

    .line 57
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/staticlayout/MyTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 38
    iput p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mPreDrawState:I

    const/high16 p2, 0x3f800000    # 1.0f

    .line 608
    iput p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mSpacingMult:F

    const/4 p2, 0x0

    .line 609
    iput p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mSpacingAdd:F

    const p2, 0x7fffffff

    .line 611
    iput p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mMaximum:I

    .line 612
    iput p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mMinimum:I

    const/4 p1, 0x0

    .line 613
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mScroller:Landroid/widget/Scroller;

    .line 64
    const-string p1, ""

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mText:Ljava/lang/CharSequence;

    .line 65
    new-instance p2, Landroid/text/TextPaint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    .line 66
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mHighlightPaint:Landroid/graphics/Paint;

    const/high16 p2, -0x1000000

    .line 70
    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/flyersoft/staticlayout/MyTextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    const/16 p2, 0xf

    int-to-float p2, p2

    .line 71
    invoke-direct {p0, p2}, Lcom/flyersoft/staticlayout/MyTextView;->setRawTextSize(F)V

    .line 72
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private bringTextIntoView()Z
    .locals 6

    .line 517
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphAlignment(I)Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    move-result-object v0

    .line 518
    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v2, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v2

    .line 519
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getRight()I

    move-result v3

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getLeft()I

    move-result v4

    sub-int/2addr v3, v4

    .line 524
    sget-object v4, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_CENTER:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    if-ne v0, v4, :cond_1

    .line 525
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineLeft(I)F

    move-result v0

    float-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v0, v4

    .line 526
    iget-object v4, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v4, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineRight(I)F

    move-result v4

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    sub-int v5, v4, v0

    if-ge v5, v3, :cond_0

    add-int/2addr v4, v0

    .line 529
    div-int/lit8 v4, v4, 0x2

    div-int/lit8 v3, v3, 0x2

    :goto_0
    sub-int v0, v4, v3

    goto :goto_3

    :cond_0
    if-gez v2, :cond_5

    goto :goto_0

    .line 537
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/staticlayout/MyLayout;->alignNormal(Lcom/flyersoft/staticlayout/MyLayout$Alignment;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-gez v2, :cond_2

    .line 539
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineRight(I)F

    move-result v0

    float-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    goto :goto_2

    .line 542
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineLeft(I)F

    move-result v0

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    goto :goto_1

    :cond_3
    if-gez v2, :cond_4

    .line 546
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineLeft(I)F

    move-result v0

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    :goto_1
    double-to-int v0, v2

    goto :goto_3

    .line 548
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineRight(I)F

    move-result v0

    float-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    :goto_2
    double-to-int v0, v4

    sub-int/2addr v0, v3

    .line 553
    :cond_5
    :goto_3
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getScrollX()I

    move-result v2

    if-ne v0, v2, :cond_7

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getScrollY()I

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_4

    :cond_6
    return v1

    .line 554
    :cond_7
    :goto_4
    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/staticlayout/MyTextView;->scrollTo(II)V

    const/4 v0, 0x1

    return v0
.end method

.method private checkForRelayout()V
    .locals 2

    .line 492
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyLayout;->getHeight()I

    move-result v0

    .line 493
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MyLayout;->getWidth()I

    move-result v1

    .line 494
    invoke-virtual {p0, v1}, Lcom/flyersoft/staticlayout/MyTextView;->makeNewLayout(I)V

    .line 497
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 498
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-eqz v1, :cond_0

    sget-boolean v1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v1, :cond_0

    return-void

    .line 503
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MyLayout;->getHeight()I

    move-result v1

    if-ne v1, v0, :cond_1

    .line 504
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->invalidate()V

    return-void

    .line 507
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->requestLayout()V

    .line 508
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->invalidate()V

    return-void
.end method

.method private getDesiredHeight()I
    .locals 3

    .line 462
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/staticlayout/MyTextView;->getDesiredHeight(Lcom/flyersoft/staticlayout/MyLayout;Z)I

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mHintLayout:Lcom/flyersoft/staticlayout/MyLayout;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/flyersoft/staticlayout/MyTextView;->getDesiredHeight(Lcom/flyersoft/staticlayout/MyLayout;Z)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private getDesiredHeight(Lcom/flyersoft/staticlayout/MyLayout;Z)I
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 470
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v0

    .line 471
    invoke-virtual {p1, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v1

    if-eqz p2, :cond_1

    .line 474
    iget p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mMaximum:I

    if-le v0, p2, :cond_1

    .line 475
    invoke-virtual {p1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result p2

    .line 476
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MyLayout;->getBottomPadding()I

    move-result p1

    add-int v1, p2, p1

    .line 478
    iget v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mMaximum:I

    .line 482
    :cond_1
    iget p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mMinimum:I

    if-ge v0, p1, :cond_2

    .line 483
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getLineHeight()I

    move-result p1

    iget p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mMinimum:I

    sub-int/2addr p2, v0

    mul-int p1, p1, p2

    add-int/2addr v1, p1

    .line 487
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getSuggestedMinimumHeight()I

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    return p1
.end method

.method private rebuildLayout()V
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mText:Ljava/lang/CharSequence;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->checkForRelayout()V

    return-void

    .line 137
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->nullLayouts()V

    .line 138
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->requestLayout()V

    .line 139
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->invalidate()V

    return-void
.end method

.method private registerForPreDraw()V
    .locals 3

    .line 241
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 246
    :cond_0
    iget v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mPreDrawState:I

    const/4 v2, 0x1

    if-nez v1, :cond_1

    .line 247
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 248
    iput v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mPreDrawState:I

    return-void

    :cond_1
    const/4 v0, 0x2

    if-ne v1, v0, :cond_2

    .line 250
    iput v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mPreDrawState:I

    :cond_2
    :goto_0
    return-void
.end method

.method private setRawTextSize(F)V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextSize()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 127
    iget-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz p1, :cond_0

    .line 128
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->rebuildLayout()V

    :cond_0
    return-void
.end method

.method private updateTextColors()V
    .locals 5

    .line 210
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getDrawableState()[I

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 211
    iget v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mCurTextColor:I

    const/4 v3, 0x1

    if-eq v0, v1, :cond_0

    .line 212
    iput v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mCurTextColor:I

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 215
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLinkTextColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_1

    .line 216
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getDrawableState()[I

    move-result-object v4

    invoke-virtual {v1, v4, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    .line 217
    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    iget v2, v2, Landroid/text/TextPaint;->linkColor:I

    if-eq v1, v2, :cond_1

    .line 218
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    iput v1, v0, Landroid/text/TextPaint;->linkColor:I

    goto :goto_1

    :cond_1
    move v3, v0

    :goto_1
    if-eqz v3, :cond_2

    .line 223
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->invalidate()V

    :cond_2
    return-void
.end method


# virtual methods
.method public assumeLayout()V
    .locals 2

    .line 361
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getLeft()I

    move-result v1

    sub-int/2addr v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x0

    .line 365
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flyersoft/staticlayout/MyTextView;->makeNewLayout(I)V

    return-void
.end method

.method protected computeHorizontalScrollRange()I
    .locals 1

    .line 578
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz v0, :cond_0

    .line 579
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyLayout;->getWidth()I

    move-result v0

    return v0

    .line 580
    :cond_0
    invoke-super {p0}, Landroid/view/View;->computeHorizontalScrollRange()I

    move-result v0

    return v0
.end method

.method public computeScroll()V
    .locals 2

    .line 563
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mScroller:Landroid/widget/Scroller;

    if-eqz v0, :cond_0

    .line 564
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 566
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/staticlayout/MyTextView;->scrollTo(II)V

    :cond_0
    return-void
.end method

.method protected computeVerticalScrollExtent()I
    .locals 1

    .line 592
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getHeight()I

    move-result v0

    return v0
.end method

.method protected computeVerticalScrollRange()I
    .locals 1

    .line 585
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz v0, :cond_0

    .line 586
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyLayout;->getHeight()I

    move-result v0

    return v0

    .line 587
    :cond_0
    invoke-super {p0}, Landroid/view/View;->computeVerticalScrollRange()I

    move-result v0

    return v0
.end method

.method public getBaseline()I
    .locals 2

    .line 340
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-nez v0, :cond_0

    .line 341
    invoke-super {p0}, Landroid/view/View;->getBaseline()I

    move-result v0

    return v0

    :cond_0
    const/4 v1, 0x0

    .line 343
    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineBaseline(I)I

    move-result v0

    return v0
.end method

.method public getLayout()Lcom/flyersoft/staticlayout/MyLayout;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    return-object v0
.end method

.method public getLineBounds(ILandroid/graphics/Rect;)I
    .locals 2

    .line 323
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    .line 325
    invoke-virtual {p2, v1, v1, v1, v1}, Landroid/graphics/Rect;->set(IIII)V

    :cond_0
    return v1

    .line 330
    :cond_1
    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineBounds(ILandroid/graphics/Rect;)I

    move-result p1

    if-eqz p2, :cond_2

    .line 332
    invoke-virtual {p2, v1, v1}, Landroid/graphics/Rect;->offset(II)V

    :cond_2
    return p1
.end method

.method public getLineCount()I
    .locals 1

    .line 319
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getLineHeight()I
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mSpacingMult:F

    mul-float v0, v0, v1

    iget v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mSpacingAdd:F

    add-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    if-lez v0, :cond_0

    return v0

    .line 81
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    return v0
.end method

.method public getPaint()Landroid/text/TextPaint;
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    return-object v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTextScaleX()F
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextScaleX()F

    move-result v0

    return v0
.end method

.method public getTextSize()F
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextSize()F

    move-result v0

    return v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method protected makeNewLayout(I)V
    .locals 9

    if-gez p1, :cond_0

    const/4 p1, 0x0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    move v4, p1

    .line 372
    :goto_0
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz p1, :cond_4

    .line 373
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 375
    :cond_1
    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-eqz p1, :cond_2

    sget-boolean p1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-nez p1, :cond_2

    goto :goto_1

    .line 378
    :cond_2
    iget-boolean p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->alone:Z

    if-nez p1, :cond_3

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p1, :cond_3

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eq p0, p1, :cond_3

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 379
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    return-void

    .line 381
    :cond_3
    new-instance v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;

    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mText:Ljava/lang/CharSequence;

    iget-object v3, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    sget-object v5, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    iget v6, p0, Lcom/flyersoft/staticlayout/MyTextView;->mSpacingMult:F

    iget v7, p0, Lcom/flyersoft/staticlayout/MyTextView;->mSpacingAdd:F

    const/4 v8, 0x1

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;-><init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;Landroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZ)V

    iput-object v0, v1, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    return-void

    :cond_4
    :goto_1
    move-object v1, p0

    return-void
.end method

.method public nullLayouts()V
    .locals 1

    const/4 v0, 0x0

    .line 348
    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mHintLayout:Lcom/flyersoft/staticlayout/MyLayout;

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 271
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 273
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getScrollX()I

    move-result v0

    .line 274
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getScrollY()I

    move-result v1

    .line 275
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getRight()I

    move-result v2

    .line 276
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getLeft()I

    move-result v3

    .line 277
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getBottom()I

    move-result v4

    .line 278
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getTop()I

    move-result v5

    .line 280
    iget v6, p0, Lcom/flyersoft/staticlayout/MyTextView;->mCurTextColor:I

    .line 282
    iget-object v7, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-nez v7, :cond_0

    .line 283
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->assumeLayout()V

    .line 285
    :cond_0
    iget-object v7, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    .line 287
    iget-object v8, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v8, v6}, Landroid/text/TextPaint;->setColor(I)V

    .line 288
    iget-object v6, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getDrawableState()[I

    move-result-object v8

    iput-object v8, v6, Landroid/text/TextPaint;->drawableState:[I

    .line 290
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    int-to-float v6, v0

    int-to-float v8, v1

    sub-int/2addr v2, v3

    add-int/2addr v2, v0

    int-to-float v0, v2

    sub-int/2addr v4, v5

    add-int/2addr v4, v1

    int-to-float v1, v4

    .line 297
    iget v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowRadius:F

    const/4 v3, 0x0

    cmpl-float v4, v2, v3

    if-eqz v4, :cond_1

    .line 298
    iget v4, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowDx:F

    sub-float/2addr v4, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    add-float/2addr v6, v2

    .line 299
    iget v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowDx:F

    iget v4, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowRadius:F

    add-float/2addr v2, v4

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    add-float/2addr v0, v2

    .line 300
    iget v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowDy:F

    iget v4, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowRadius:F

    sub-float/2addr v2, v4

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    add-float/2addr v8, v2

    .line 301
    iget v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowDy:F

    iget v4, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowRadius:F

    add-float/2addr v2, v4

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    add-float/2addr v1, v2

    .line 304
    :cond_1
    invoke-virtual {p1, v6, v8, v0, v1}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 305
    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->translate(FF)V

    if-eqz v7, :cond_2

    .line 309
    :try_start_0
    move-object v0, p0

    check-cast v0, Lcom/flyersoft/staticlayout/MRTextView;

    iput-object v0, v7, Lcom/flyersoft/staticlayout/MyLayout;->tv:Lcom/flyersoft/staticlayout/MRTextView;

    .line 310
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mHighlightPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v7, p1, v2, v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->draw(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/Paint;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 312
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 315
    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 6

    .line 392
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 393
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 394
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 402
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-nez v1, :cond_0

    .line 403
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->makeNewLayout(I)V

    goto :goto_0

    .line 404
    :cond_0
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MyLayout;->getWidth()I

    move-result v1

    if-eq v1, p1, :cond_5

    .line 409
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v1, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->setLayoutTime:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x12c

    cmp-long v5, v1, v3

    if-gez v5, :cond_1

    goto :goto_0

    .line 411
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v1

    if-lez v1, :cond_3

    .line 412
    iget v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->outerWidth2:I

    if-ne v1, p1, :cond_2

    iget v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextHash:I

    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mText:Ljava/lang/CharSequence;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    if-ne v1, v2, :cond_2

    goto :goto_0

    .line 414
    :cond_2
    sget-object v1, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_3

    sget-object v1, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x2

    if-le p1, v1, :cond_3

    goto :goto_0

    .line 419
    :cond_3
    instance-of v1, p0, Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v1, :cond_4

    .line 420
    move-object v1, p0

    check-cast v1, Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->clearLrCache()V

    .line 421
    :cond_4
    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->makeNewLayout(I)V

    :cond_5
    :goto_0
    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_6

    goto :goto_1

    .line 432
    :cond_6
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getDesiredHeight()I

    move-result p2

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_7

    .line 435
    invoke-static {p2, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 440
    :cond_7
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz v0, :cond_b

    .line 441
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineCount()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mMaximum:I

    if-le v0, v1, :cond_8

    .line 442
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTop(I)I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_2

    :cond_8
    move v0, p2

    .line 445
    :goto_2
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MyLayout;->getWidth()I

    move-result v1

    if-gt v1, p1, :cond_a

    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    .line 446
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MyLayout;->getHeight()I

    move-result v1

    if-le v1, v0, :cond_9

    goto :goto_3

    :cond_9
    const/4 v0, 0x0

    .line 449
    invoke-virtual {p0, v0, v0}, Lcom/flyersoft/staticlayout/MyTextView;->scrollTo(II)V

    goto :goto_4

    .line 447
    :cond_a
    :goto_3
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->registerForPreDraw()V

    .line 453
    :cond_b
    :goto_4
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyTextView;->setMeasuredDimension(II)V

    return-void
.end method

.method public onPreDraw()Z
    .locals 3

    .line 255
    iget v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mPreDrawState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    return v1

    .line 258
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-nez v0, :cond_1

    .line 259
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->assumeLayout()V

    .line 261
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->bringTextIntoView()Z

    move-result v0

    const/4 v2, 0x2

    .line 262
    iput v2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mPreDrawState:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public scrollTo(II)V
    .locals 0

    .line 458
    invoke-super {p0, p1, p2}, Landroid/view/View;->scrollTo(II)V

    return-void
.end method

.method public setLineSpacing(FF)V
    .locals 0

    .line 200
    iput p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mSpacingMult:F

    .line 201
    iput p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mSpacingAdd:F

    .line 203
    iget-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz p1, :cond_0

    .line 204
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->rebuildLayout()V

    :cond_0
    return-void
.end method

.method public setPadding(IIII)V
    .locals 1

    .line 90
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getPaddingLeft()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 91
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getPaddingRight()I

    move-result v0

    if-ne p3, v0, :cond_0

    .line 92
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getPaddingTop()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 93
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getPaddingBottom()I

    move-result v0

    if-eq p4, v0, :cond_1

    .line 94
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->nullLayouts()V

    .line 98
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 99
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->invalidate()V

    return-void
.end method

.method public setShadowLayer(FFFI)V
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 189
    iput p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowRadius:F

    .line 190
    iput p2, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowDx:F

    .line 191
    iput p3, p0, Lcom/flyersoft/staticlayout/MyTextView;->mShadowDy:F

    .line 192
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->invalidate()V

    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 2

    if-nez p1, :cond_0

    .line 229
    const-string p1, ""

    .line 231
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mUserSetTextScaleX:Z

    if-nez v0, :cond_1

    .line 232
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextScaleX(F)V

    .line 235
    :cond_1
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mText:Ljava/lang/CharSequence;

    .line 236
    iget-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz p1, :cond_2

    .line 237
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->checkForRelayout()V

    :cond_2
    return-void
.end method

.method public setTextColor(I)V
    .locals 0

    .line 173
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextColor:Landroid/content/res/ColorStateList;

    .line 175
    sget p1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const p1, -0x5f5f01

    goto :goto_0

    :cond_0
    sget p1, Lcom/flyersoft/tools/A;->linkColor:I

    .line 174
    :goto_0
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLinkTextColor:Landroid/content/res/ColorStateList;

    .line 176
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->updateTextColors()V

    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 181
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 183
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextColor:Landroid/content/res/ColorStateList;

    .line 184
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->updateTextColors()V

    return-void
.end method

.method public setTextScaleX(F)V
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextScaleX()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 149
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mUserSetTextScaleX:Z

    .line 150
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTextScaleX(F)V

    .line 152
    iget-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz p1, :cond_0

    .line 153
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->rebuildLayout()V

    :cond_0
    return-void
.end method

.method public setTextSize(F)V
    .locals 1

    const/4 v0, 0x2

    .line 107
    invoke-virtual {p0, v0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->setTextSize(IF)V

    return-void
.end method

.method public setTextSize(IF)V
    .locals 1

    .line 111
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTextView;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    .line 115
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 120
    :goto_0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 119
    invoke-static {p1, p2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/MyTextView;->setRawTextSize(F)V

    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 160
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTextView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 162
    iget-object p1, p0, Lcom/flyersoft/staticlayout/MyTextView;->mLayout:Lcom/flyersoft/staticlayout/MyLayout;

    if-eqz p1, :cond_0

    .line 163
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/MyTextView;->rebuildLayout()V

    :cond_0
    return-void
.end method
