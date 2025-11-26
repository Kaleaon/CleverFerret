.class public Lcom/example2014/components/NumberPicker;
.super Landroid/widget/LinearLayout;
.source "NumberPicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example2014/components/NumberPicker$TwoDigitFormatter;,
        Lcom/example2014/components/NumberPicker$OnScrollListener;,
        Lcom/example2014/components/NumberPicker$PressedStateHelper;,
        Lcom/example2014/components/NumberPicker$InputTextFilter;,
        Lcom/example2014/components/NumberPicker$OnValueChangeListener;,
        Lcom/example2014/components/NumberPicker$Formatter;,
        Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;,
        Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;,
        Lcom/example2014/components/NumberPicker$SetSelectionCommand;,
        Lcom/example2014/components/NumberPicker$CustomEditText;
    }
.end annotation


# static fields
.field private static final DEFAULT_LAYOUT_RESOURCE_ID:I = 0x0

.field private static final DEFAULT_LONG_PRESS_UPDATE_INTERVAL:J = 0x12cL

.field private static final DIGIT_CHARACTERS:[C

.field private static final SELECTOR_ADJUSTMENT_DURATION_MILLIS:I = 0x320

.field private static final SELECTOR_MAX_FLING_VELOCITY_ADJUSTMENT:I = 0x8

.field private static final SELECTOR_MIDDLE_ITEM_INDEX:I = 0x1

.field private static final SELECTOR_WHEEL_ITEM_COUNT:I = 0x3

.field private static final SIZE_UNSPECIFIED:I = -0x1

.field private static final SNAP_SCROLL_DURATION:I = 0x12c

.field private static final TOP_AND_BOTTOM_FADING_EDGE_STRENGTH:F = 0.9f

.field private static final UNSCALED_DEFAULT_SELECTION_DIVIDERS_DISTANCE:I = 0x30

.field private static final UNSCALED_DEFAULT_SELECTION_DIVIDER_HEIGHT:I = 0x2

.field private static final sTwoDigitFormatter:Lcom/example2014/components/NumberPicker$TwoDigitFormatter;


# instance fields
.field private final mAdjustScroller:Lcom/example2014/components/Scroller;

.field private mBeginSoftInputOnLongPressCommand:Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;

.field private mBottomSelectionDividerBottom:I

.field private mChangeCurrentByOneFromLongPressCommand:Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

.field private final mComputeMaxWidth:Z

.field private mCurrentScrollOffset:I

.field private final mDecrementButton:Landroid/widget/ImageButton;

.field private mDecrementVirtualButtonPressed:Z

.field private mDisplayedValues:[Ljava/lang/String;

.field private final mFlingScroller:Lcom/example2014/components/Scroller;

.field private mFormatter:Lcom/example2014/components/NumberPicker$Formatter;

.field private final mHasSelectorWheel:Z

.field private final mIncrementButton:Landroid/widget/ImageButton;

.field private mIncrementVirtualButtonPressed:Z

.field private mIngonreMoveEvents:Z

.field private mInitialScrollOffset:I

.field public final mInputText:Landroid/widget/EditText;

.field private mLastDownEventTime:J

.field private mLastDownEventY:F

.field private mLastDownOrMoveEventY:F

.field private mLastHandledDownDpadKeyCode:I

.field private mLastHoveredChildVirtualViewId:I

.field private mLongPressUpdateInterval:J

.field private final mMaxHeight:I

.field private mMaxValue:I

.field private mMaxWidth:I

.field private mMaximumFlingVelocity:I

.field private final mMinHeight:I

.field private mMinValue:I

.field private final mMinWidth:I

.field private mMinimumFlingVelocity:I

.field private mOnScrollListener:Lcom/example2014/components/NumberPicker$OnScrollListener;

.field private mOnValueChangeListener:Lcom/example2014/components/NumberPicker$OnValueChangeListener;

.field private final mPressedStateHelper:Lcom/example2014/components/NumberPicker$PressedStateHelper;

.field private mPreviousScrollerY:I

.field private mScrollState:I

.field private final mSelectionDivider:Landroid/graphics/drawable/Drawable;

.field private final mSelectionDividerHeight:I

.field private final mSelectionDividersDistance:I

.field private mSelectorElementHeight:I

.field private final mSelectorIndexToStringCache:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mSelectorIndices:[I

.field private mSelectorTextGapHeight:I

.field public final mSelectorWheelPaint:Landroid/graphics/Paint;

.field private mSetSelectionCommand:Lcom/example2014/components/NumberPicker$SetSelectionCommand;

.field private mShowSoftInputOnTap:Z

.field private final mSolidColor:I

.field private final mTextSize:I

.field private mTopSelectionDividerTop:I

.field private mTouchSlop:I

.field private mValue:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private final mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

.field private mWrapSelectorWheel:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 195
    new-instance v0, Lcom/example2014/components/NumberPicker$TwoDigitFormatter;

    invoke-direct {v0}, Lcom/example2014/components/NumberPicker$TwoDigitFormatter;-><init>()V

    sput-object v0, Lcom/example2014/components/NumberPicker;->sTwoDigitFormatter:Lcom/example2014/components/NumberPicker$TwoDigitFormatter;

    const/16 v0, 0x1e

    .line 1968
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/example2014/components/NumberPicker;->DIGIT_CHARACTERS:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x660s
        0x661s
        0x662s
        0x663s
        0x664s
        0x665s
        0x666s
        0x667s
        0x668s
        0x669s
        0x6f0s
        0x6f1s
        0x6f2s
        0x6f3s
        0x6f4s
        0x6f5s
        0x6f6s
        0x6f7s
        0x6f8s
        0x6f9s
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 548
    invoke-direct {p0, p1, v0}, Lcom/example2014/components/NumberPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 558
    sget v0, Lcom/example2014/numberpicker/R$attr;->numberPickerStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/example2014/components/NumberPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 569
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 v0, 0x12c

    .line 297
    iput-wide v0, p0, Lcom/example2014/components/NumberPicker;->mLongPressUpdateInterval:J

    .line 302
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndexToStringCache:Landroid/util/SparseArray;

    const/4 v0, 0x3

    .line 307
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    const/high16 v0, -0x80000000

    .line 327
    iput v0, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    const/4 v0, 0x0

    .line 428
    iput v0, p0, Lcom/example2014/components/NumberPicker;->mScrollState:I

    const/4 v1, -0x1

    .line 479
    iput v1, p0, Lcom/example2014/components/NumberPicker;->mLastHandledDownDpadKeyCode:I

    .line 572
    sget-object v2, Lcom/example2014/numberpicker/R$styleable;->NumberPicker:[I

    invoke-virtual {p1, p2, v2, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 574
    sget p3, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_internalLayout:I

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    const/4 v2, 0x1

    if-eqz p3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 577
    :goto_0
    iput-boolean v3, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    .line 579
    sget v4, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_solidColor:I

    invoke-virtual {p2, v4, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/example2014/components/NumberPicker;->mSolidColor:I

    .line 581
    sget v4, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_selectionDivider:I

    invoke-virtual {p2, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lcom/example2014/components/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    .line 585
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    const/high16 v5, 0x40000000    # 2.0f

    .line 583
    invoke-static {v2, v5, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    .line 586
    sget v5, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_selectionDividerHeight:I

    invoke-virtual {p2, v5, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/example2014/components/NumberPicker;->mSelectionDividerHeight:I

    .line 591
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    const/high16 v5, 0x42400000    # 48.0f

    .line 589
    invoke-static {v2, v5, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    .line 592
    sget v5, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_selectionDividersDistance:I

    invoke-virtual {p2, v5, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/example2014/components/NumberPicker;->mSelectionDividersDistance:I

    .line 595
    sget v4, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_internalMinHeight:I

    invoke-virtual {p2, v4, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/example2014/components/NumberPicker;->mMinHeight:I

    .line 598
    sget v5, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_internalMaxHeight:I

    invoke-virtual {p2, v5, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Lcom/example2014/components/NumberPicker;->mMaxHeight:I

    if-eq v4, v1, :cond_2

    if-eq v5, v1, :cond_2

    if-gt v4, v5, :cond_1

    goto :goto_1

    .line 602
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "minHeight > maxHeight"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 605
    :cond_2
    :goto_1
    sget v4, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_internalMinWidth:I

    invoke-virtual {p2, v4, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/example2014/components/NumberPicker;->mMinWidth:I

    .line 608
    sget v5, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_internalMaxWidth:I

    invoke-virtual {p2, v5, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Lcom/example2014/components/NumberPicker;->mMaxWidth:I

    if-eq v4, v1, :cond_4

    if-eq v5, v1, :cond_4

    if-gt v4, v5, :cond_3

    goto :goto_2

    .line 612
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "minWidth > maxWidth"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    :goto_2
    if-ne v5, v1, :cond_5

    const/4 v4, 0x1

    goto :goto_3

    :cond_5
    const/4 v4, 0x0

    .line 615
    :goto_3
    iput-boolean v4, p0, Lcom/example2014/components/NumberPicker;->mComputeMaxWidth:Z

    .line 617
    sget v4, Lcom/example2014/numberpicker/R$styleable;->NumberPicker_virtualButtonPressedDrawable:I

    invoke-virtual {p2, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lcom/example2014/components/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    .line 620
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 622
    new-instance p2, Lcom/example2014/components/NumberPicker$PressedStateHelper;

    invoke-direct {p2, p0}, Lcom/example2014/components/NumberPicker$PressedStateHelper;-><init>(Lcom/example2014/components/NumberPicker;)V

    iput-object p2, p0, Lcom/example2014/components/NumberPicker;->mPressedStateHelper:Lcom/example2014/components/NumberPicker$PressedStateHelper;

    xor-int/lit8 p2, v3, 0x1

    .line 629
    invoke-virtual {p0, p2}, Lcom/example2014/components/NumberPicker;->setWillNotDraw(Z)V

    .line 631
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string v4, "layout_inflater"

    invoke-virtual {p2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/LayoutInflater;

    .line 633
    invoke-virtual {p2, p3, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 635
    new-instance p2, Lcom/example2014/components/NumberPicker$1;

    invoke-direct {p2, p0}, Lcom/example2014/components/NumberPicker$1;-><init>(Lcom/example2014/components/NumberPicker;)V

    .line 647
    new-instance p3, Lcom/example2014/components/NumberPicker$2;

    invoke-direct {p3, p0}, Lcom/example2014/components/NumberPicker$2;-><init>(Lcom/example2014/components/NumberPicker;)V

    const/4 v4, 0x0

    if-nez v3, :cond_6

    .line 662
    sget v5, Lcom/example2014/numberpicker/R$id;->np__increment:I

    invoke-virtual {p0, v5}, Lcom/example2014/components/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageButton;

    iput-object v5, p0, Lcom/example2014/components/NumberPicker;->mIncrementButton:Landroid/widget/ImageButton;

    .line 663
    invoke-virtual {v5, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 664
    invoke-virtual {v5, p3}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_4

    .line 666
    :cond_6
    iput-object v4, p0, Lcom/example2014/components/NumberPicker;->mIncrementButton:Landroid/widget/ImageButton;

    :goto_4
    if-nez v3, :cond_7

    .line 671
    sget v3, Lcom/example2014/numberpicker/R$id;->np__decrement:I

    invoke-virtual {p0, v3}, Lcom/example2014/components/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lcom/example2014/components/NumberPicker;->mDecrementButton:Landroid/widget/ImageButton;

    .line 672
    invoke-virtual {v3, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 673
    invoke-virtual {v3, p3}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_5

    .line 675
    :cond_7
    iput-object v4, p0, Lcom/example2014/components/NumberPicker;->mDecrementButton:Landroid/widget/ImageButton;

    .line 679
    :goto_5
    sget p2, Lcom/example2014/numberpicker/R$id;->np__numberpicker_input:I

    invoke-virtual {p0, p2}, Lcom/example2014/components/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    .line 680
    new-instance p3, Lcom/example2014/components/NumberPicker$3;

    invoke-direct {p3, p0}, Lcom/example2014/components/NumberPicker$3;-><init>(Lcom/example2014/components/NumberPicker;)V

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 690
    new-array p3, v2, [Landroid/text/InputFilter;

    new-instance v3, Lcom/example2014/components/NumberPicker$InputTextFilter;

    invoke-direct {v3, p0}, Lcom/example2014/components/NumberPicker$InputTextFilter;-><init>(Lcom/example2014/components/NumberPicker;)V

    aput-object v3, p3, v0

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    const/4 p3, 0x2

    .line 694
    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setRawInputType(I)V

    const/4 p3, 0x6

    .line 695
    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 698
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    .line 699
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p3

    iput p3, p0, Lcom/example2014/components/NumberPicker;->mTouchSlop:I

    .line 700
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p3

    iput p3, p0, Lcom/example2014/components/NumberPicker;->mMinimumFlingVelocity:I

    .line 701
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    div-int/lit8 p1, p1, 0x8

    iput p1, p0, Lcom/example2014/components/NumberPicker;->mMaximumFlingVelocity:I

    .line 703
    invoke-virtual {p2}, Landroid/widget/EditText;->getTextSize()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/example2014/components/NumberPicker;->mTextSize:I

    .line 706
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    .line 707
    invoke-virtual {p3, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 708
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    int-to-float p1, p1

    .line 709
    invoke-virtual {p3, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 710
    invoke-virtual {p2}, Landroid/widget/EditText;->getTypeface()Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 711
    invoke-virtual {p2}, Landroid/widget/EditText;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 712
    sget-object p2, Lcom/example2014/components/NumberPicker;->ENABLED_STATE_SET:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    .line 713
    invoke-virtual {p3, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 714
    iput-object p3, p0, Lcom/example2014/components/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    .line 717
    new-instance p1, Lcom/example2014/components/Scroller;

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2, v4, v2}, Lcom/example2014/components/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;Z)V

    iput-object p1, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    .line 718
    new-instance p1, Lcom/example2014/components/Scroller;

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance p3, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v0, 0x40200000    # 2.5f

    invoke-direct {p3, v0}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-direct {p1, p2, p3}, Lcom/example2014/components/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/example2014/components/NumberPicker;->mAdjustScroller:Lcom/example2014/components/Scroller;

    .line 720
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    return-void
.end method

.method static synthetic access$000(Lcom/example2014/components/NumberPicker;)V
    .locals 0

    .line 93
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->hideSoftInput()V

    return-void
.end method

.method static synthetic access$100(Lcom/example2014/components/NumberPicker;Z)V
    .locals 0

    .line 93
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->changeValueByOne(Z)V

    return-void
.end method

.method static synthetic access$1000(Lcom/example2014/components/NumberPicker;)I
    .locals 0

    .line 93
    iget p0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    return p0
.end method

.method static synthetic access$1100(Lcom/example2014/components/NumberPicker;II)V
    .locals 0

    .line 93
    invoke-direct {p0, p1, p2}, Lcom/example2014/components/NumberPicker;->postSetSelectionCommand(II)V

    return-void
.end method

.method static synthetic access$1200(Lcom/example2014/components/NumberPicker;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lcom/example2014/components/NumberPicker;->mIncrementVirtualButtonPressed:Z

    return p0
.end method

.method static synthetic access$1202(Lcom/example2014/components/NumberPicker;Z)Z
    .locals 0

    .line 93
    iput-boolean p1, p0, Lcom/example2014/components/NumberPicker;->mIncrementVirtualButtonPressed:Z

    return p1
.end method

.method static synthetic access$1280(Lcom/example2014/components/NumberPicker;I)Z
    .locals 1

    .line 93
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mIncrementVirtualButtonPressed:Z

    xor-int/2addr p1, v0

    int-to-byte p1, p1

    iput-boolean p1, p0, Lcom/example2014/components/NumberPicker;->mIncrementVirtualButtonPressed:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/example2014/components/NumberPicker;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lcom/example2014/components/NumberPicker;->mDecrementVirtualButtonPressed:Z

    return p0
.end method

.method static synthetic access$1302(Lcom/example2014/components/NumberPicker;Z)Z
    .locals 0

    .line 93
    iput-boolean p1, p0, Lcom/example2014/components/NumberPicker;->mDecrementVirtualButtonPressed:Z

    return p1
.end method

.method static synthetic access$1380(Lcom/example2014/components/NumberPicker;I)Z
    .locals 1

    .line 93
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mDecrementVirtualButtonPressed:Z

    xor-int/2addr p1, v0

    int-to-byte p1, p1

    iput-boolean p1, p0, Lcom/example2014/components/NumberPicker;->mDecrementVirtualButtonPressed:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/example2014/components/NumberPicker;)J
    .locals 2

    .line 93
    iget-wide v0, p0, Lcom/example2014/components/NumberPicker;->mLongPressUpdateInterval:J

    return-wide v0
.end method

.method static synthetic access$1500(Lcom/example2014/components/NumberPicker;)V
    .locals 0

    .line 93
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->showSoftInput()V

    return-void
.end method

.method static synthetic access$1602(Lcom/example2014/components/NumberPicker;Z)Z
    .locals 0

    .line 93
    iput-boolean p1, p0, Lcom/example2014/components/NumberPicker;->mIngonreMoveEvents:Z

    return p1
.end method

.method static synthetic access$200(Lcom/example2014/components/NumberPicker;ZJ)V
    .locals 0

    .line 93
    invoke-direct {p0, p1, p2, p3}, Lcom/example2014/components/NumberPicker;->postChangeCurrentByOneFromLongPress(ZJ)V

    return-void
.end method

.method static synthetic access$300(Lcom/example2014/components/NumberPicker;Landroid/view/View;)V
    .locals 0

    .line 93
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->validateInputTextView(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$700()[C
    .locals 1

    .line 93
    sget-object v0, Lcom/example2014/components/NumberPicker;->DIGIT_CHARACTERS:[C

    return-object v0
.end method

.method static synthetic access$800(Lcom/example2014/components/NumberPicker;)[Ljava/lang/String;
    .locals 0

    .line 93
    iget-object p0, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$900(Lcom/example2014/components/NumberPicker;Ljava/lang/String;)I
    .locals 0

    .line 93
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->getSelectedPos(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private changeValueByOne(Z)V
    .locals 13

    .line 1651
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-eqz v0, :cond_2

    .line 1652
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1653
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    invoke-direct {p0, v0}, Lcom/example2014/components/NumberPicker;->moveToFinalScrollerPosition(Lcom/example2014/components/Scroller;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1654
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mAdjustScroller:Lcom/example2014/components/Scroller;

    invoke-direct {p0, v0}, Lcom/example2014/components/NumberPicker;->moveToFinalScrollerPosition(Lcom/example2014/components/Scroller;)Z

    :cond_0
    const/4 v0, 0x0

    .line 1656
    iput v0, p0, Lcom/example2014/components/NumberPicker;->mPreviousScrollerY:I

    if-eqz p1, :cond_1

    .line 1658
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    iget p1, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    neg-int v5, p1

    const/16 v6, 0x12c

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/example2014/components/Scroller;->startScroll(IIIII)V

    goto :goto_0

    .line 1660
    :cond_1
    iget-object v7, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    iget v11, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    const/16 v12, 0x12c

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v7 .. v12}, Lcom/example2014/components/Scroller;->startScroll(IIIII)V

    .line 1662
    :goto_0
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void

    :cond_2
    const/4 v0, 0x1

    if-eqz p1, :cond_3

    .line 1665
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    add-int/2addr p1, v0

    invoke-direct {p0, p1, v0}, Lcom/example2014/components/NumberPicker;->setValueInternal(IZ)V

    return-void

    .line 1667
    :cond_3
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    sub-int/2addr p1, v0

    invoke-direct {p0, p1, v0}, Lcom/example2014/components/NumberPicker;->setValueInternal(IZ)V

    return-void
.end method

.method private decrementSelectorIndices([I)V
    .locals 3

    .line 1771
    array-length v0, p1

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-lez v0, :cond_0

    add-int/lit8 v2, v0, -0x1

    .line 1772
    aget v2, p1, v2

    aput v2, p1, v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1774
    :cond_0
    aget v0, p1, v1

    sub-int/2addr v0, v1

    .line 1775
    iget-boolean v1, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    if-ge v0, v1, :cond_1

    .line 1776
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    :cond_1
    const/4 v1, 0x0

    .line 1778
    aput v0, p1, v1

    .line 1779
    invoke-direct {p0, v0}, Lcom/example2014/components/NumberPicker;->ensureCachedScrollSelectorValue(I)V

    return-void
.end method

.method private ensureCachedScrollSelectorValue(I)V
    .locals 3

    .line 1787
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndexToStringCache:Landroid/util/SparseArray;

    .line 1788
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    return-void

    .line 1792
    :cond_0
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    if-lt p1, v1, :cond_3

    iget v2, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    if-le p1, v2, :cond_1

    goto :goto_0

    .line 1795
    :cond_1
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-eqz v2, :cond_2

    sub-int v1, p1, v1

    .line 1797
    aget-object v1, v2, v1

    goto :goto_1

    .line 1799
    :cond_2
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->formatNumber(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 1793
    :cond_3
    :goto_0
    const-string v1, ""

    .line 1802
    :goto_1
    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method private ensureScrollWheelAdjusted()Z
    .locals 7

    .line 2051
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    iget v1, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 2053
    iput v1, p0, Lcom/example2014/components/NumberPicker;->mPreviousScrollerY:I

    .line 2054
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    div-int/lit8 v3, v2, 0x2

    if-le v1, v3, :cond_1

    if-lez v0, :cond_0

    neg-int v2, v2

    :cond_0
    add-int/2addr v0, v2

    :cond_1
    move v5, v0

    .line 2057
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mAdjustScroller:Lcom/example2014/components/Scroller;

    const/4 v4, 0x0

    const/16 v6, 0x320

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/example2014/components/Scroller;->startScroll(IIIII)V

    .line 2058
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method private fling(I)V
    .locals 20

    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 1727
    iput v1, v0, Lcom/example2014/components/NumberPicker;->mPreviousScrollerY:I

    if-lez p1, :cond_0

    .line 1730
    iget-object v2, v0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    const/4 v9, 0x0

    const v10, 0x7fffffff

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move/from16 v6, p1

    invoke-virtual/range {v2 .. v10}, Lcom/example2014/components/Scroller;->fling(IIIIIIII)V

    goto :goto_0

    .line 1732
    :cond_0
    iget-object v11, v0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    const/16 v18, 0x0

    const v19, 0x7fffffff

    const/4 v12, 0x0

    const v13, 0x7fffffff

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move/from16 v15, p1

    invoke-virtual/range {v11 .. v19}, Lcom/example2014/components/Scroller;->fling(IIIIIIII)V

    .line 1735
    :goto_0
    invoke-virtual {v0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void
.end method

.method private formatNumber(I)Ljava/lang/String;
    .locals 1

    .line 1806
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mFormatter:Lcom/example2014/components/NumberPicker$Formatter;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/example2014/components/NumberPicker$Formatter;->format(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Lcom/example2014/components/NumberPicker;->formatNumberWithLocale(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static formatNumberWithLocale(I)Ljava/lang/String;
    .locals 3

    .line 2658
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const-string p0, "%d"

    invoke-static {v0, p0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getSelectedPos(Ljava/lang/String;)I
    .locals 2

    .line 1921
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1923
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :cond_0
    const/4 v0, 0x0

    .line 1928
    :goto_0
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 1930
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 1931
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1932
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    add-int/2addr p1, v0

    return p1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1941
    :cond_2
    :try_start_1
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    return p1

    .line 1947
    :catch_0
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    return p1
.end method

.method public static final getTwoDigitFormatter()Lcom/example2014/components/NumberPicker$Formatter;
    .locals 1

    .line 201
    sget-object v0, Lcom/example2014/components/NumberPicker;->sTwoDigitFormatter:Lcom/example2014/components/NumberPicker$TwoDigitFormatter;

    return-object v0
.end method

.method private getWrappedSelectorIndex(I)I
    .locals 2

    .line 1742
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    if-le p1, v0, :cond_0

    .line 1743
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    sub-int/2addr p1, v0

    sub-int/2addr v0, v1

    rem-int/2addr p1, v0

    add-int/2addr v1, p1

    add-int/lit8 v1, v1, -0x1

    return v1

    .line 1744
    :cond_0
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    if-ge p1, v1, :cond_1

    sub-int p1, v1, p1

    sub-int v1, v0, v1

    .line 1745
    rem-int/2addr p1, v1

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_1
    return p1
.end method

.method private hideSoftInput()V
    .locals 3

    .line 1202
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_0

    .line 1203
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1204
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1205
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-eqz v0, :cond_0

    .line 1206
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private incrementSelectorIndices([I)V
    .locals 3

    const/4 v0, 0x0

    .line 1755
    :goto_0
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    add-int/lit8 v1, v0, 0x1

    .line 1756
    aget v2, p1, v1

    aput v2, p1, v0

    move v0, v1

    goto :goto_0

    .line 1758
    :cond_0
    array-length v0, p1

    add-int/lit8 v0, v0, -0x2

    aget v0, p1, v0

    add-int/lit8 v0, v0, 0x1

    .line 1759
    iget-boolean v1, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    if-le v0, v1, :cond_1

    .line 1760
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    .line 1762
    :cond_1
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    aput v0, p1, v1

    .line 1763
    invoke-direct {p0, v0}, Lcom/example2014/components/NumberPicker;->ensureCachedScrollSelectorValue(I)V

    return-void
.end method

.method private initializeFadingEdges()V
    .locals 2

    const/4 v0, 0x1

    .line 1690
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->setVerticalFadingEdgeEnabled(Z)V

    .line 1691
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getBottom()I

    move-result v0

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getTop()I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/example2014/components/NumberPicker;->mTextSize:I

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->setFadingEdgeLength(I)V

    return-void
.end method

.method private initializeSelectorWheel()V
    .locals 4

    .line 1673
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1674
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    .line 1675
    array-length v1, v0

    iget v2, p0, Lcom/example2014/components/NumberPicker;->mTextSize:I

    mul-int v1, v1, v2

    .line 1676
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getBottom()I

    move-result v2

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getTop()I

    move-result v3

    sub-int/2addr v2, v3

    sub-int/2addr v2, v1

    int-to-float v1, v2

    .line 1677
    array-length v0, v0

    int-to-float v0, v0

    div-float/2addr v1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr v1, v0

    float-to-int v0, v1

    .line 1678
    iput v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorTextGapHeight:I

    .line 1679
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mTextSize:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    .line 1682
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getBaseline()I

    move-result v0

    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTop()I

    move-result v1

    add-int/2addr v0, v1

    .line 1683
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    .line 1685
    iput v0, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    .line 1686
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    return-void
.end method

.method private initializeSelectorWheelIndices()V
    .locals 5

    .line 1603
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndexToStringCache:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 1604
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    .line 1605
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getValue()I

    move-result v1

    const/4 v2, 0x0

    .line 1606
    :goto_0
    iget-object v3, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    array-length v3, v3

    if-ge v2, v3, :cond_1

    add-int/lit8 v3, v2, -0x1

    add-int/2addr v3, v1

    .line 1608
    iget-boolean v4, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    if-eqz v4, :cond_0

    .line 1609
    invoke-direct {p0, v3}, Lcom/example2014/components/NumberPicker;->getWrappedSelectorIndex(I)I

    move-result v3

    .line 1611
    :cond_0
    aput v3, v0, v2

    .line 1612
    invoke-direct {p0, v3}, Lcom/example2014/components/NumberPicker;->ensureCachedScrollSelectorValue(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private makeMeasureSpec(II)I
    .locals 4

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    goto :goto_0

    .line 1529
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 1530
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    const/high16 v2, -0x80000000

    const/high16 v3, 0x40000000    # 2.0f

    if-eq v1, v2, :cond_3

    if-eqz v1, :cond_2

    if-ne v1, v3, :cond_1

    :goto_0
    return p1

    .line 1539
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Unknown measure mode: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1537
    :cond_2
    invoke-static {p2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    return p1

    .line 1535
    :cond_3
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {p1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    return p1
.end method

.method private moveToFinalScrollerPosition(Lcom/example2014/components/Scroller;)Z
    .locals 6

    const/4 v0, 0x1

    .line 786
    invoke-virtual {p1, v0}, Lcom/example2014/components/Scroller;->forceFinished(Z)V

    .line 787
    invoke-virtual {p1}, Lcom/example2014/components/Scroller;->getFinalY()I

    move-result v1

    invoke-virtual {p1}, Lcom/example2014/components/Scroller;->getCurrY()I

    move-result p1

    sub-int/2addr v1, p1

    .line 788
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    add-int/2addr p1, v1

    iget v2, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    rem-int/2addr p1, v2

    .line 789
    iget v2, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    sub-int/2addr v2, p1

    const/4 p1, 0x0

    if-eqz v2, :cond_2

    .line 791
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v3

    iget v4, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    div-int/lit8 v5, v4, 0x2

    if-le v3, v5, :cond_1

    if-lez v2, :cond_0

    sub-int/2addr v2, v4

    goto :goto_0

    :cond_0
    add-int/2addr v2, v4

    :cond_1
    :goto_0
    add-int/2addr v1, v2

    .line 799
    invoke-virtual {p0, p1, v1}, Lcom/example2014/components/NumberPicker;->scrollBy(II)V

    return v0

    :cond_2
    return p1
.end method

.method private notifyChange(II)V
    .locals 1

    .line 1850
    iget-object p2, p0, Lcom/example2014/components/NumberPicker;->mOnValueChangeListener:Lcom/example2014/components/NumberPicker$OnValueChangeListener;

    if-eqz p2, :cond_0

    .line 1851
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    invoke-interface {p2, p0, p1, v0}, Lcom/example2014/components/NumberPicker$OnValueChangeListener;->onValueChange(Lcom/example2014/components/NumberPicker;II)V

    :cond_0
    return-void
.end method

.method private onScrollStateChange(I)V
    .locals 1

    .line 1714
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mScrollState:I

    if-ne v0, p1, :cond_0

    goto :goto_0

    .line 1717
    :cond_0
    iput p1, p0, Lcom/example2014/components/NumberPicker;->mScrollState:I

    .line 1718
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mOnScrollListener:Lcom/example2014/components/NumberPicker$OnScrollListener;

    if-eqz v0, :cond_1

    .line 1719
    invoke-interface {v0, p0, p1}, Lcom/example2014/components/NumberPicker$OnScrollListener;->onScrollStateChange(Lcom/example2014/components/NumberPicker;I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private onScrollerFinished(Lcom/example2014/components/Scroller;)V
    .locals 1

    .line 1698
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    if-ne p1, v0, :cond_1

    .line 1699
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->ensureScrollWheelAdjusted()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1700
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    :cond_0
    const/4 p1, 0x0

    .line 1702
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->onScrollStateChange(I)V

    return-void

    .line 1704
    :cond_1
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mScrollState:I

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    .line 1705
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    :cond_2
    return-void
.end method

.method private postBeginSoftInputOnLongPressCommand()V
    .locals 3

    .line 1884
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;

    if-nez v0, :cond_0

    .line 1885
    new-instance v0, Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;

    invoke-direct {v0, p0}, Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;-><init>(Lcom/example2014/components/NumberPicker;)V

    iput-object v0, p0, Lcom/example2014/components/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;

    goto :goto_0

    .line 1887
    :cond_0
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1889
    :goto_0
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/example2014/components/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private postChangeCurrentByOneFromLongPress(ZJ)V
    .locals 1

    .line 1861
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    if-nez v0, :cond_0

    .line 1862
    new-instance v0, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-direct {v0, p0}, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;-><init>(Lcom/example2014/components/NumberPicker;)V

    iput-object v0, p0, Lcom/example2014/components/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    goto :goto_0

    .line 1864
    :cond_0
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1866
    :goto_0
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-static {v0, p1}, Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;->access$400(Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;Z)V

    .line 1867
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-virtual {p0, p1, p2, p3}, Lcom/example2014/components/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private postSetSelectionCommand(II)V
    .locals 1

    .line 1955
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSetSelectionCommand:Lcom/example2014/components/NumberPicker$SetSelectionCommand;

    if-nez v0, :cond_0

    .line 1956
    new-instance v0, Lcom/example2014/components/NumberPicker$SetSelectionCommand;

    invoke-direct {v0, p0}, Lcom/example2014/components/NumberPicker$SetSelectionCommand;-><init>(Lcom/example2014/components/NumberPicker;)V

    iput-object v0, p0, Lcom/example2014/components/NumberPicker;->mSetSelectionCommand:Lcom/example2014/components/NumberPicker$SetSelectionCommand;

    goto :goto_0

    .line 1958
    :cond_0
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1960
    :goto_0
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSetSelectionCommand:Lcom/example2014/components/NumberPicker$SetSelectionCommand;

    invoke-static {v0, p1}, Lcom/example2014/components/NumberPicker$SetSelectionCommand;->access$502(Lcom/example2014/components/NumberPicker$SetSelectionCommand;I)I

    .line 1961
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mSetSelectionCommand:Lcom/example2014/components/NumberPicker$SetSelectionCommand;

    invoke-static {p1, p2}, Lcom/example2014/components/NumberPicker$SetSelectionCommand;->access$602(Lcom/example2014/components/NumberPicker$SetSelectionCommand;I)I

    .line 1962
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mSetSelectionCommand:Lcom/example2014/components/NumberPicker$SetSelectionCommand;

    invoke-virtual {p0, p1}, Lcom/example2014/components/NumberPicker;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private removeAllCallbacks()V
    .locals 1

    .line 1905
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    if-eqz v0, :cond_0

    .line 1906
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1908
    :cond_0
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSetSelectionCommand:Lcom/example2014/components/NumberPicker$SetSelectionCommand;

    if-eqz v0, :cond_1

    .line 1909
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1911
    :cond_1
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;

    if-eqz v0, :cond_2

    .line 1912
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1914
    :cond_2
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mPressedStateHelper:Lcom/example2014/components/NumberPicker$PressedStateHelper;

    invoke-virtual {v0}, Lcom/example2014/components/NumberPicker$PressedStateHelper;->cancel()V

    return-void
.end method

.method private removeBeginSoftInputCommand()V
    .locals 1

    .line 1896
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lcom/example2014/components/NumberPicker$BeginSoftInputOnLongPressCommand;

    if-eqz v0, :cond_0

    .line 1897
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private removeChangeCurrentByOneFromLongPress()V
    .locals 1

    .line 1874
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lcom/example2014/components/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    if-eqz v0, :cond_0

    .line 1875
    invoke-virtual {p0, v0}, Lcom/example2014/components/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public static resolveSizeAndState(III)I
    .locals 2

    .line 1578
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 1579
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_1

    const/high16 v1, 0x40000000    # 2.0f

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move p0, p1

    goto :goto_0

    :cond_1
    if-ge p1, p0, :cond_2

    const/high16 p0, 0x1000000

    or-int/2addr p0, p1

    :cond_2
    :goto_0
    const/high16 p1, -0x1000000

    and-int/2addr p1, p2

    or-int/2addr p0, p1

    return p0
.end method

.method private resolveSizeAndStateRespectingMinSize(III)I
    .locals 1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 1556
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/4 p2, 0x0

    .line 1557
    invoke-static {p1, p3, p2}, Lcom/example2014/components/NumberPicker;->resolveSizeAndState(III)I

    move-result p1

    return p1

    :cond_0
    return p2
.end method

.method private setValueInternal(IZ)V
    .locals 1

    .line 1623
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    if-ne v0, p1, :cond_0

    return-void

    .line 1627
    :cond_0
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    if-eqz v0, :cond_1

    .line 1628
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->getWrappedSelectorIndex(I)I

    move-result p1

    goto :goto_0

    .line 1630
    :cond_1
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1631
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 1633
    :goto_0
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    .line 1634
    iput p1, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    .line 1635
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    if-eqz p2, :cond_2

    .line 1637
    invoke-direct {p0, v0, p1}, Lcom/example2014/components/NumberPicker;->notifyChange(II)V

    .line 1639
    :cond_2
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1640
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void
.end method

.method private showSoftInput()V
    .locals 3

    .line 1188
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_1

    .line 1190
    iget-boolean v1, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1191
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1193
    :cond_0
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 1194
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :cond_1
    return-void
.end method

.method private tryComputeMaxWidth()V
    .locals 5

    .line 1215
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mComputeMaxWidth:Z

    if-nez v0, :cond_0

    goto :goto_5

    .line 1219
    :cond_0
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x9

    if-gt v2, v3, :cond_2

    .line 1222
    iget-object v3, p0, Lcom/example2014/components/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    invoke-static {v2}, Lcom/example2014/components/NumberPicker;->formatNumberWithLocale(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    cmpl-float v4, v3, v0

    if-lez v4, :cond_1

    move v0, v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1228
    :cond_2
    iget v2, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    :goto_1
    if-lez v2, :cond_3

    add-int/lit8 v1, v1, 0x1

    .line 1231
    div-int/lit8 v2, v2, 0xa

    goto :goto_1

    :cond_3
    int-to-float v1, v1

    mul-float v1, v1, v0

    float-to-int v0, v1

    goto :goto_3

    .line 1235
    :cond_4
    array-length v0, v0

    const/4 v2, 0x0

    :goto_2
    if-ge v1, v0, :cond_6

    .line 1237
    iget-object v3, p0, Lcom/example2014/components/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    int-to-float v4, v2

    cmpl-float v4, v3, v4

    if-lez v4, :cond_5

    float-to-int v2, v3

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_6
    move v0, v2

    .line 1243
    :goto_3
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v2

    add-int/2addr v1, v2

    add-int/2addr v0, v1

    .line 1244
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMaxWidth:I

    if-eq v1, v0, :cond_8

    .line 1245
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMinWidth:I

    if-le v0, v1, :cond_7

    .line 1246
    iput v0, p0, Lcom/example2014/components/NumberPicker;->mMaxWidth:I

    goto :goto_4

    .line 1248
    :cond_7
    iput v1, p0, Lcom/example2014/components/NumberPicker;->mMaxWidth:I

    .line 1250
    :goto_4
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    :cond_8
    :goto_5
    return-void
.end method

.method private updateInputTextView()Z
    .locals 3

    .line 1835
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    invoke-direct {p0, v0}, Lcom/example2014/components/NumberPicker;->formatNumber(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1836
    :cond_0
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    iget v2, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    sub-int/2addr v1, v2

    aget-object v0, v0, v1

    .line 1837
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1838
    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private validateInputTextView(Landroid/view/View;)V
    .locals 1

    .line 1810
    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1811
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1813
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    return-void

    .line 1816
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->getSelectedPos(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x1

    .line 1817
    invoke-direct {p0, p1, v0}, Lcom/example2014/components/NumberPicker;->setValueInternal(IZ)V

    return-void
.end method


# virtual methods
.method public computeScroll()V
    .locals 4

    .line 1044
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    .line 1045
    invoke-virtual {v0}, Lcom/example2014/components/Scroller;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1046
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mAdjustScroller:Lcom/example2014/components/Scroller;

    .line 1047
    invoke-virtual {v0}, Lcom/example2014/components/Scroller;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 1051
    :cond_0
    invoke-virtual {v0}, Lcom/example2014/components/Scroller;->computeScrollOffset()Z

    .line 1052
    invoke-virtual {v0}, Lcom/example2014/components/Scroller;->getCurrY()I

    move-result v1

    .line 1053
    iget v2, p0, Lcom/example2014/components/NumberPicker;->mPreviousScrollerY:I

    if-nez v2, :cond_1

    .line 1054
    invoke-virtual {v0}, Lcom/example2014/components/Scroller;->getStartY()I

    move-result v2

    iput v2, p0, Lcom/example2014/components/NumberPicker;->mPreviousScrollerY:I

    .line 1056
    :cond_1
    iget v2, p0, Lcom/example2014/components/NumberPicker;->mPreviousScrollerY:I

    sub-int v2, v1, v2

    const/4 v3, 0x0

    invoke-virtual {p0, v3, v2}, Lcom/example2014/components/NumberPicker;->scrollBy(II)V

    .line 1057
    iput v1, p0, Lcom/example2014/components/NumberPicker;->mPreviousScrollerY:I

    .line 1058
    invoke-virtual {v0}, Lcom/example2014/components/Scroller;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1059
    invoke-direct {p0, v0}, Lcom/example2014/components/NumberPicker;->onScrollerFinished(Lcom/example2014/components/Scroller;)V

    return-void

    .line 1061
    :cond_2
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5

    .line 945
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x13

    const/16 v2, 0x14

    if-eq v0, v1, :cond_1

    if-eq v0, v2, :cond_1

    const/16 v1, 0x17

    if-eq v0, v1, :cond_0

    const/16 v1, 0x42

    if-eq v0, v1, :cond_0

    goto :goto_3

    .line 949
    :cond_0
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeAllCallbacks()V

    goto :goto_3

    .line 953
    :cond_1
    iget-boolean v1, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-nez v1, :cond_2

    goto :goto_3

    .line 956
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_4

    if-eq v1, v3, :cond_3

    goto :goto_3

    .line 970
    :cond_3
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mLastHandledDownDpadKeyCode:I

    if-ne v1, v0, :cond_9

    const/4 p1, -0x1

    .line 971
    iput p1, p0, Lcom/example2014/components/NumberPicker;->mLastHandledDownDpadKeyCode:I

    return v3

    .line 958
    :cond_4
    iget-boolean v1, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    if-nez v1, :cond_6

    if-ne v0, v2, :cond_5

    goto :goto_0

    .line 959
    :cond_5
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getValue()I

    move-result v1

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getMinValue()I

    move-result v4

    if-le v1, v4, :cond_9

    goto :goto_1

    :cond_6
    :goto_0
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getValue()I

    move-result v1

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getMaxValue()I

    move-result v4

    if-ge v1, v4, :cond_9

    .line 960
    :goto_1
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->requestFocus()Z

    .line 961
    iput v0, p0, Lcom/example2014/components/NumberPicker;->mLastHandledDownDpadKeyCode:I

    .line 962
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeAllCallbacks()V

    .line 963
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    invoke-virtual {p1}, Lcom/example2014/components/Scroller;->isFinished()Z

    move-result p1

    if-eqz p1, :cond_8

    if-ne v0, v2, :cond_7

    const/4 p1, 0x1

    goto :goto_2

    :cond_7
    const/4 p1, 0x0

    .line 964
    :goto_2
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->changeValueByOne(Z)V

    :cond_8
    return v3

    .line 977
    :cond_9
    :goto_3
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 933
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 937
    :cond_0
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeAllCallbacks()V

    .line 940
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 982
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 986
    :cond_0
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeAllCallbacks()V

    .line 989
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method protected getBottomFadingEdgeStrength()F
    .locals 1

    const v0, 0x3f666666    # 0.9f

    return v0
.end method

.method public getDisplayedValues()[Ljava/lang/String;
    .locals 1

    .line 1395
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    return-object v0
.end method

.method public getMaxValue()I
    .locals 1

    .line 1357
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    return v0
.end method

.method public getMinValue()I
    .locals 1

    .line 1319
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    return v0
.end method

.method public getSolidColor()I
    .locals 1

    .line 1111
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mSolidColor:I

    return v0
.end method

.method protected getTopFadingEdgeStrength()F
    .locals 1

    const v0, 0x3f666666    # 0.9f

    return v0
.end method

.method public getValue()I
    .locals 1

    .line 1310
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    return v0
.end method

.method public getWrapSelectorWheel()Z
    .locals 1

    .line 1263
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    return v0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 1436
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeAllCallbacks()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1441
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_0

    .line 1442
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    return-void

    .line 1445
    :cond_0
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getLeft()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    .line 1446
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    int-to-float v1, v1

    .line 1449
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    iget v4, p0, Lcom/example2014/components/NumberPicker;->mScrollState:I

    if-nez v4, :cond_2

    .line 1451
    iget-boolean v4, p0, Lcom/example2014/components/NumberPicker;->mDecrementVirtualButtonPressed:Z

    if-eqz v4, :cond_1

    .line 1453
    sget-object v4, Lcom/example2014/components/NumberPicker;->PRESSED_ENABLED_STATE_SET:[I

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 1454
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getRight()I

    move-result v4

    iget v5, p0, Lcom/example2014/components/NumberPicker;->mTopSelectionDividerTop:I

    invoke-virtual {v2, v3, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1455
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1457
    :cond_1
    iget-boolean v2, p0, Lcom/example2014/components/NumberPicker;->mIncrementVirtualButtonPressed:Z

    if-eqz v2, :cond_2

    .line 1459
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v4, Lcom/example2014/components/NumberPicker;->PRESSED_ENABLED_STATE_SET:[I

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 1460
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    iget v4, p0, Lcom/example2014/components/NumberPicker;->mBottomSelectionDividerBottom:I

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getRight()I

    move-result v5

    .line 1461
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getBottom()I

    move-result v6

    .line 1460
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1462
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1467
    :cond_2
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    const/4 v4, 0x0

    .line 1468
    :goto_0
    array-length v5, v2

    if-ge v4, v5, :cond_5

    .line 1469
    aget v5, v2, v4

    .line 1470
    iget-object v6, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndexToStringCache:Landroid/util/SparseArray;

    invoke-virtual {v6, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const/4 v6, 0x1

    if-ne v4, v6, :cond_3

    .line 1476
    iget-object v6, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getVisibility()I

    move-result v6

    if-eqz v6, :cond_4

    .line 1477
    :cond_3
    iget-object v6, p0, Lcom/example2014/components/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v0, v1, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1479
    :cond_4
    iget v5, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    int-to-float v5, v5

    add-float/2addr v1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1483
    :cond_5
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_6

    .line 1485
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mTopSelectionDividerTop:I

    .line 1486
    iget v2, p0, Lcom/example2014/components/NumberPicker;->mSelectionDividerHeight:I

    add-int/2addr v2, v1

    .line 1487
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getRight()I

    move-result v4

    invoke-virtual {v0, v3, v1, v4, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1488
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1491
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mBottomSelectionDividerBottom:I

    .line 1492
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mSelectionDividerHeight:I

    sub-int v1, v0, v1

    .line 1493
    iget-object v2, p0, Lcom/example2014/components/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getRight()I

    move-result v4

    invoke-virtual {v2, v3, v1, v4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1494
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_6
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 807
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 810
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    if-eqz v0, :cond_1

    return v1

    .line 813
    :cond_1
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeAllCallbacks()V

    .line 814
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 815
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/example2014/components/NumberPicker;->mLastDownEventY:F

    iput v0, p0, Lcom/example2014/components/NumberPicker;->mLastDownOrMoveEventY:F

    .line 816
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/example2014/components/NumberPicker;->mLastDownEventTime:J

    .line 817
    iput-boolean v1, p0, Lcom/example2014/components/NumberPicker;->mIngonreMoveEvents:Z

    .line 818
    iput-boolean v1, p0, Lcom/example2014/components/NumberPicker;->mShowSoftInputOnTap:Z

    .line 820
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mLastDownEventY:F

    iget v0, p0, Lcom/example2014/components/NumberPicker;->mTopSelectionDividerTop:I

    int-to-float v0, v0

    const/4 v2, 0x1

    cmpg-float v0, p1, v0

    if-gez v0, :cond_2

    .line 821
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mScrollState:I

    if-nez p1, :cond_3

    .line 822
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mPressedStateHelper:Lcom/example2014/components/NumberPicker$PressedStateHelper;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/example2014/components/NumberPicker$PressedStateHelper;->buttonPressDelayed(I)V

    goto :goto_0

    .line 825
    :cond_2
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mBottomSelectionDividerBottom:I

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_3

    .line 826
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mScrollState:I

    if-nez p1, :cond_3

    .line 827
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mPressedStateHelper:Lcom/example2014/components/NumberPicker$PressedStateHelper;

    invoke-virtual {p1, v2}, Lcom/example2014/components/NumberPicker$PressedStateHelper;->buttonPressDelayed(I)V

    .line 832
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 833
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    invoke-virtual {p1}, Lcom/example2014/components/Scroller;->isFinished()Z

    move-result p1

    if-nez p1, :cond_4

    .line 834
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    invoke-virtual {p1, v2}, Lcom/example2014/components/Scroller;->forceFinished(Z)V

    .line 835
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mAdjustScroller:Lcom/example2014/components/Scroller;

    invoke-virtual {p1, v2}, Lcom/example2014/components/Scroller;->forceFinished(Z)V

    .line 836
    invoke-direct {p0, v1}, Lcom/example2014/components/NumberPicker;->onScrollStateChange(I)V

    goto :goto_1

    .line 837
    :cond_4
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mAdjustScroller:Lcom/example2014/components/Scroller;

    invoke-virtual {p1}, Lcom/example2014/components/Scroller;->isFinished()Z

    move-result p1

    if-nez p1, :cond_5

    .line 838
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mFlingScroller:Lcom/example2014/components/Scroller;

    invoke-virtual {p1, v2}, Lcom/example2014/components/Scroller;->forceFinished(Z)V

    .line 839
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mAdjustScroller:Lcom/example2014/components/Scroller;

    invoke-virtual {p1, v2}, Lcom/example2014/components/Scroller;->forceFinished(Z)V

    goto :goto_1

    .line 840
    :cond_5
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mLastDownEventY:F

    iget v0, p0, Lcom/example2014/components/NumberPicker;->mTopSelectionDividerTop:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_6

    .line 841
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->hideSoftInput()V

    .line 843
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result p1

    int-to-long v3, p1

    .line 842
    invoke-direct {p0, v1, v3, v4}, Lcom/example2014/components/NumberPicker;->postChangeCurrentByOneFromLongPress(ZJ)V

    goto :goto_1

    .line 844
    :cond_6
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mBottomSelectionDividerBottom:I

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_7

    .line 845
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->hideSoftInput()V

    .line 847
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result p1

    int-to-long v0, p1

    .line 846
    invoke-direct {p0, v2, v0, v1}, Lcom/example2014/components/NumberPicker;->postChangeCurrentByOneFromLongPress(ZJ)V

    goto :goto_1

    .line 849
    :cond_7
    iput-boolean v2, p0, Lcom/example2014/components/NumberPicker;->mShowSoftInputOnTap:Z

    .line 850
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->postBeginSoftInputOnLongPressCommand()V

    :goto_1
    return v2

    :cond_8
    :goto_2
    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    .line 732
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_0

    .line 733
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    move-object p1, p0

    return-void

    :cond_0
    move p2, p1

    move-object p1, p0

    .line 736
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getMeasuredWidth()I

    move-result p3

    .line 737
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getMeasuredHeight()I

    move-result p4

    .line 740
    iget-object p5, p1, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {p5}, Landroid/widget/EditText;->getMeasuredWidth()I

    move-result p5

    .line 741
    iget-object v0, p1, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMeasuredHeight()I

    move-result v0

    sub-int/2addr p3, p5

    .line 742
    div-int/lit8 p3, p3, 0x2

    sub-int/2addr p4, v0

    .line 743
    div-int/lit8 p4, p4, 0x2

    add-int/2addr p5, p3

    add-int/2addr v0, p4

    .line 746
    iget-object v1, p1, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1, p3, p4, p5, v0}, Landroid/widget/EditText;->layout(IIII)V

    if-eqz p2, :cond_1

    .line 750
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->initializeSelectorWheel()V

    .line 751
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->initializeFadingEdges()V

    .line 752
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getHeight()I

    move-result p2

    iget p3, p1, Lcom/example2014/components/NumberPicker;->mSelectionDividersDistance:I

    sub-int/2addr p2, p3

    div-int/lit8 p2, p2, 0x2

    iget p4, p1, Lcom/example2014/components/NumberPicker;->mSelectionDividerHeight:I

    sub-int/2addr p2, p4

    iput p2, p1, Lcom/example2014/components/NumberPicker;->mTopSelectionDividerTop:I

    mul-int/lit8 p4, p4, 0x2

    add-int/2addr p2, p4

    add-int/2addr p2, p3

    .line 754
    iput p2, p1, Lcom/example2014/components/NumberPicker;->mBottomSelectionDividerBottom:I

    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2

    .line 761
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_0

    .line 762
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void

    .line 766
    :cond_0
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxWidth:I

    invoke-direct {p0, p1, v0}, Lcom/example2014/components/NumberPicker;->makeMeasureSpec(II)I

    move-result v0

    .line 767
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMaxHeight:I

    invoke-direct {p0, p2, v1}, Lcom/example2014/components/NumberPicker;->makeMeasureSpec(II)I

    move-result v1

    .line 768
    invoke-super {p0, v0, v1}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 770
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMinWidth:I

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getMeasuredWidth()I

    move-result v1

    invoke-direct {p0, v0, v1, p1}, Lcom/example2014/components/NumberPicker;->resolveSizeAndStateRespectingMinSize(III)I

    move-result p1

    .line 772
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMinHeight:I

    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->getMeasuredHeight()I

    move-result v1

    invoke-direct {p0, v0, v1, p2}, Lcom/example2014/components/NumberPicker;->resolveSizeAndStateRespectingMinSize(III)I

    move-result p2

    .line 774
    invoke-virtual {p0, p1, p2}, Lcom/example2014/components/NumberPicker;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 860
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->isEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 863
    :cond_0
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_1

    .line 864
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/example2014/components/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 866
    :cond_1
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 867
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v0, v3, :cond_6

    if-eq v0, v2, :cond_2

    goto/16 :goto_3

    .line 870
    :cond_2
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mIngonreMoveEvents:Z

    if-eqz v0, :cond_3

    goto/16 :goto_3

    .line 873
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 874
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mScrollState:I

    if-eq v0, v3, :cond_4

    .line 875
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mLastDownEventY:F

    sub-float v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-int v0, v0

    .line 876
    iget v1, p0, Lcom/example2014/components/NumberPicker;->mTouchSlop:I

    if-le v0, v1, :cond_5

    .line 877
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeAllCallbacks()V

    .line 878
    invoke-direct {p0, v3}, Lcom/example2014/components/NumberPicker;->onScrollStateChange(I)V

    goto :goto_0

    .line 881
    :cond_4
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mLastDownOrMoveEventY:F

    sub-float v0, p1, v0

    float-to-int v0, v0

    .line 882
    invoke-virtual {p0, v1, v0}, Lcom/example2014/components/NumberPicker;->scrollBy(II)V

    .line 883
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    .line 885
    :cond_5
    :goto_0
    iput p1, p0, Lcom/example2014/components/NumberPicker;->mLastDownOrMoveEventY:F

    goto/16 :goto_3

    .line 888
    :cond_6
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeBeginSoftInputCommand()V

    .line 889
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->removeChangeCurrentByOneFromLongPress()V

    .line 890
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mPressedStateHelper:Lcom/example2014/components/NumberPicker$PressedStateHelper;

    invoke-virtual {v0}, Lcom/example2014/components/NumberPicker$PressedStateHelper;->cancel()V

    .line 891
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 892
    iget v4, p0, Lcom/example2014/components/NumberPicker;->mMaximumFlingVelocity:I

    int-to-float v4, v4

    const/16 v5, 0x3e8

    invoke-virtual {v0, v5, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 893
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v0

    float-to-int v0, v0

    .line 894
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v4

    iget v5, p0, Lcom/example2014/components/NumberPicker;->mMinimumFlingVelocity:I

    if-le v4, v5, :cond_7

    .line 895
    invoke-direct {p0, v0}, Lcom/example2014/components/NumberPicker;->fling(I)V

    .line 896
    invoke-direct {p0, v2}, Lcom/example2014/components/NumberPicker;->onScrollStateChange(I)V

    goto :goto_2

    .line 898
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    int-to-float v4, v0

    .line 899
    iget v5, p0, Lcom/example2014/components/NumberPicker;->mLastDownEventY:F

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    float-to-int v4, v4

    .line 900
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 901
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 902
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mTouchSlop:I

    if-gt v4, p1, :cond_a

    .line 903
    iget-boolean p1, p0, Lcom/example2014/components/NumberPicker;->mShowSoftInputOnTap:Z

    if-eqz p1, :cond_8

    .line 904
    iput-boolean v1, p0, Lcom/example2014/components/NumberPicker;->mShowSoftInputOnTap:Z

    .line 905
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->showSoftInput()V

    goto :goto_1

    .line 907
    :cond_8
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    div-int/2addr v0, p1

    sub-int/2addr v0, v3

    if-lez v0, :cond_9

    .line 910
    invoke-direct {p0, v3}, Lcom/example2014/components/NumberPicker;->changeValueByOne(Z)V

    .line 911
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mPressedStateHelper:Lcom/example2014/components/NumberPicker$PressedStateHelper;

    invoke-virtual {p1, v3}, Lcom/example2014/components/NumberPicker$PressedStateHelper;->buttonTapped(I)V

    goto :goto_1

    :cond_9
    if-gez v0, :cond_b

    .line 914
    invoke-direct {p0, v1}, Lcom/example2014/components/NumberPicker;->changeValueByOne(Z)V

    .line 915
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mPressedStateHelper:Lcom/example2014/components/NumberPicker$PressedStateHelper;

    invoke-virtual {p1, v2}, Lcom/example2014/components/NumberPicker$PressedStateHelper;->buttonTapped(I)V

    goto :goto_1

    .line 920
    :cond_a
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->ensureScrollWheelAdjusted()Z

    .line 922
    :cond_b
    :goto_1
    invoke-direct {p0, v1}, Lcom/example2014/components/NumberPicker;->onScrollStateChange(I)V

    .line 924
    :goto_2
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    const/4 p1, 0x0

    .line 925
    iput-object p1, p0, Lcom/example2014/components/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    :goto_3
    return v3

    :cond_c
    :goto_4
    return v1
.end method

.method public scrollBy(II)V
    .locals 4

    .line 1079
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    .line 1080
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    if-lez p2, :cond_0

    aget v2, p1, v1

    iget v3, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    if-gt v2, v3, :cond_0

    .line 1082
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    iput p1, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    return-void

    :cond_0
    if-nez v0, :cond_1

    if-gez p2, :cond_1

    .line 1085
    aget v0, p1, v1

    iget v2, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    if-lt v0, v2, :cond_1

    .line 1087
    iget p1, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    iput p1, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    return-void

    .line 1090
    :cond_1
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    .line 1091
    :cond_2
    :goto_0
    iget p2, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    iget v0, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    sub-int v0, p2, v0

    iget v2, p0, Lcom/example2014/components/NumberPicker;->mSelectorTextGapHeight:I

    if-le v0, v2, :cond_3

    .line 1092
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    sub-int/2addr p2, v0

    iput p2, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    .line 1093
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->decrementSelectorIndices([I)V

    .line 1094
    aget p2, p1, v1

    invoke-direct {p0, p2, v1}, Lcom/example2014/components/NumberPicker;->setValueInternal(IZ)V

    .line 1095
    iget-boolean p2, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    if-nez p2, :cond_2

    aget p2, p1, v1

    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    if-gt p2, v0, :cond_2

    .line 1096
    iget p2, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    iput p2, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    goto :goto_0

    .line 1099
    :cond_3
    :goto_1
    iget p2, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    iget v0, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    sub-int v0, p2, v0

    iget v2, p0, Lcom/example2014/components/NumberPicker;->mSelectorTextGapHeight:I

    neg-int v2, v2

    if-ge v0, v2, :cond_4

    .line 1100
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorElementHeight:I

    add-int/2addr p2, v0

    iput p2, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    .line 1101
    invoke-direct {p0, p1}, Lcom/example2014/components/NumberPicker;->incrementSelectorIndices([I)V

    .line 1102
    aget p2, p1, v1

    invoke-direct {p0, p2, v1}, Lcom/example2014/components/NumberPicker;->setValueInternal(IZ)V

    .line 1103
    iget-boolean p2, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    if-nez p2, :cond_3

    aget p2, p1, v1

    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    if-lt p2, v0, :cond_3

    .line 1104
    iget p2, p0, Lcom/example2014/components/NumberPicker;->mInitialScrollOffset:I

    iput p2, p0, Lcom/example2014/components/NumberPicker;->mCurrentScrollOffset:I

    goto :goto_1

    :cond_4
    return-void
.end method

.method public setDisplayedValues([Ljava/lang/String;)V
    .locals 1

    .line 1408
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-ne v0, p1, :cond_0

    return-void

    .line 1411
    :cond_0
    iput-object p1, p0, Lcom/example2014/components/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-eqz p1, :cond_1

    .line 1414
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    const v0, 0x80001

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setRawInputType(I)V

    goto :goto_0

    .line 1417
    :cond_1
    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setRawInputType(I)V

    .line 1419
    :goto_0
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    .line 1420
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1421
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->tryComputeMaxWidth()V

    return-void
.end method

.method public setEnabled(Z)V
    .locals 1

    .line 1067
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 1068
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_0

    .line 1069
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mIncrementButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1071
    :cond_0
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_1

    .line 1072
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mDecrementButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1074
    :cond_1
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setEnabled(Z)V

    return-void
.end method

.method public setFormatter(Lcom/example2014/components/NumberPicker$Formatter;)V
    .locals 1

    .line 1144
    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mFormatter:Lcom/example2014/components/NumberPicker$Formatter;

    if-ne p1, v0, :cond_0

    return-void

    .line 1147
    :cond_0
    iput-object p1, p0, Lcom/example2014/components/NumberPicker;->mFormatter:Lcom/example2014/components/NumberPicker$Formatter;

    .line 1148
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1149
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    return-void
.end method

.method public setMaxValue(I)V
    .locals 1

    .line 1371
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-ltz p1, :cond_3

    .line 1377
    iput p1, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    .line 1378
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    if-ge p1, v0, :cond_1

    .line 1379
    iput p1, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    .line 1381
    :cond_1
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    sub-int/2addr p1, v0

    iget-object v0, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    array-length v0, v0

    if-le p1, v0, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 1382
    :goto_0
    invoke-virtual {p0, p1}, Lcom/example2014/components/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1383
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1384
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    .line 1385
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->tryComputeMaxWidth()V

    .line 1386
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void

    .line 1375
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "maxValue must be >= 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setMinValue(I)V
    .locals 1

    .line 1333
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-ltz p1, :cond_3

    .line 1339
    iput p1, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    .line 1340
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    if-le p1, v0, :cond_1

    .line 1341
    iput p1, p0, Lcom/example2014/components/NumberPicker;->mValue:I

    .line 1343
    :cond_1
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    sub-int/2addr v0, p1

    iget-object p1, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    array-length p1, p1

    if-le v0, p1, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 1344
    :goto_0
    invoke-virtual {p0, p1}, Lcom/example2014/components/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1345
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1346
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->updateInputTextView()Z

    .line 1347
    invoke-direct {p0}, Lcom/example2014/components/NumberPicker;->tryComputeMaxWidth()V

    .line 1348
    invoke-virtual {p0}, Lcom/example2014/components/NumberPicker;->invalidate()V

    return-void

    .line 1337
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "minValue must be >= 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOnLongPressUpdateInterval(J)V
    .locals 0

    .line 1301
    iput-wide p1, p0, Lcom/example2014/components/NumberPicker;->mLongPressUpdateInterval:J

    return-void
.end method

.method public setOnScrollListener(Lcom/example2014/components/NumberPicker$OnScrollListener;)V
    .locals 0

    .line 1129
    iput-object p1, p0, Lcom/example2014/components/NumberPicker;->mOnScrollListener:Lcom/example2014/components/NumberPicker$OnScrollListener;

    return-void
.end method

.method public setOnValueChangedListener(Lcom/example2014/components/NumberPicker$OnValueChangeListener;)V
    .locals 0

    .line 1120
    iput-object p1, p0, Lcom/example2014/components/NumberPicker;->mOnValueChangeListener:Lcom/example2014/components/NumberPicker$OnValueChangeListener;

    return-void
.end method

.method public setValue(I)V
    .locals 1

    const/4 v0, 0x0

    .line 1181
    invoke-direct {p0, p1, v0}, Lcom/example2014/components/NumberPicker;->setValueInternal(IZ)V

    return-void
.end method

.method public setWrapSelectorWheel(Z)V
    .locals 2

    .line 1284
    iget v0, p0, Lcom/example2014/components/NumberPicker;->mMaxValue:I

    iget v1, p0, Lcom/example2014/components/NumberPicker;->mMinValue:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/example2014/components/NumberPicker;->mSelectorIndices:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz p1, :cond_1

    if-eqz v0, :cond_2

    .line 1285
    :cond_1
    iget-boolean v0, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    if-eq p1, v0, :cond_2

    .line 1286
    iput-boolean p1, p0, Lcom/example2014/components/NumberPicker;->mWrapSelectorWheel:Z

    :cond_2
    return-void
.end method
