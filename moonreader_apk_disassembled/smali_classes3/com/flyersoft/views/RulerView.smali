.class public Lcom/flyersoft/views/RulerView;
.super Landroid/view/View;
.source "RulerView.java"


# static fields
.field static final ALPHA_FILE:Ljava/lang/String; = "ruler_alpha_"

.field static final RULER_DEFAULT_COLOR:I = 0x5564b685

.field static custRulerImage:Ljava/lang/String; = null

.field static hasDoubleTap:Z = false

.field static hasLongTap:Z = false

.field static hasSingleTap:Z = false

.field private static rulerAlphaSK:Landroid/widget/SeekBar; = null

.field private static rulerBase:Landroid/view/View; = null

.field static rulerColor:I = 0x0

.field private static rulerColorCb:Landroid/widget/CheckBox; = null

.field private static rulerColorIv:Lcom/google/android/material/imageview/ShapeableImageView; = null

.field static rulerHeight:I = 0x0

.field private static rulerImageLay:Landroid/view/View; = null

.field static rulerImageRes:I = 0x0

.field private static rulerInnerLay:Landroid/view/View; = null

.field private static rulerInnerRuler:Landroid/view/View; = null

.field static rulerLeft:I = 0x0

.field private static rulerOuterBottom:Landroid/view/View; = null

.field private static rulerOuterLay:Landroid/view/View; = null

.field private static rulerOuterRuler:Landroid/view/View; = null

.field private static rulerOuterTop:Landroid/view/View; = null

.field private static rulerResClick:Landroid/view/View$OnClickListener; = null

.field static rulerReverse:Z = false

.field private static rulerSizeSK:Landroid/widget/SeekBar;

.field static rulerTop:I

.field static rulerUseImage:Z


# instance fields
.field EDGE:I

.field LEFT_MAX:I

.field LEFT_MIN:I

.field TOP_MAX:I

.field TOP_MIN:I

.field act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field baseFrame:Landroid/view/View;

.field disableX:Z

.field downLeftMargin:I

.field downTopMargin:I

.field height:I

.field ignoreRulerTap:Z

.field rHeight:I

.field rLeft:I

.field rTop:I

.field rulerDrawable:Landroid/graphics/drawable/Drawable;

.field rulerGestureDetector:Landroid/view/GestureDetector;

.field scrollReverse:Z

.field scrollReverseStart:I

.field scrollStartLeft:I

.field scrollStartTop:I

.field scroller:Landroid/widget/Scroller;

.field startAtEdge:Z

.field touchOnRuler:Z

.field txtScroll:Lcom/flyersoft/views/ScrollView2;

.field txtView:Lcom/flyersoft/staticlayout/MRTextView;

.field width:I


# direct methods
.method static bridge synthetic -$$Nest$mreloadTxtIfNeed(Lcom/flyersoft/views/RulerView;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->reloadTxtIfNeed()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smhideRulerImageIfNeed()V
    .locals 0

    invoke-static {}, Lcom/flyersoft/views/RulerView;->hideRulerImageIfNeed()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smresetRulerImageHeight()V
    .locals 0

    invoke-static {}, Lcom/flyersoft/views/RulerView;->resetRulerImageHeight()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smsetRulerSelect()V
    .locals 0

    invoke-static {}, Lcom/flyersoft/views/RulerView;->setRulerSelect()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smshowRulerResetDialog(Landroid/content/Context;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/views/RulerView;->showRulerResetDialog(Landroid/content/Context;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smshowRulerSample()V
    .locals 0

    invoke-static {}, Lcom/flyersoft/views/RulerView;->showRulerSample()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smshowRulerTapEventOptions(Landroid/content/Context;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/views/RulerView;->showRulerTapEventOptions(Landroid/content/Context;Z)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 815
    new-instance v0, Lcom/flyersoft/views/RulerView$18;

    invoke-direct {v0}, Lcom/flyersoft/views/RulerView$18;-><init>()V

    sput-object v0, Lcom/flyersoft/views/RulerView;->rulerResClick:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 50
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/high16 p1, 0x41800000    # 16.0f

    .line 96
    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/RulerView;->EDGE:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x41800000    # 16.0f

    .line 96
    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/RulerView;->EDGE:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 58
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x41800000    # 16.0f

    .line 96
    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/RulerView;->EDGE:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 62
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/high16 p1, 0x41800000    # 16.0f

    .line 96
    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/RulerView;->EDGE:I

    return-void
.end method

.method public static getRulerAlpha()I
    .locals 5

    .line 500
    sget-boolean v0, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    const/4 v1, -0x1

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    .line 501
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "ruler_alpha_"

    const/4 v4, 0x0

    .line 502
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    if-ne v0, v1, :cond_1

    .line 503
    sget v0, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    goto :goto_1

    :cond_1
    const/4 v1, 0x5

    if-ne v0, v1, :cond_2

    const/16 v0, 0xd6

    goto :goto_1

    :cond_2
    const/16 v0, 0xff

    :goto_1
    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getRulerBackground()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 539
    sget-boolean v0, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 540
    invoke-static {v0}, Lcom/flyersoft/views/RulerView;->getRulerDrawable(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 541
    invoke-static {}, Lcom/flyersoft/views/RulerView;->getRulerAlpha()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-object v0

    .line 544
    :cond_0
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    sget v1, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    return-object v0
.end method

.method public static getRulerDrawable(Z)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 548
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 549
    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    packed-switch v1, :pswitch_data_0

    .line 557
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->ruler11:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 555
    :pswitch_0
    sget-object v1, Lcom/flyersoft/views/RulerView;->custRulerImage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_1

    if-eqz p0, :cond_0

    goto :goto_0

    .line 556
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->ruler11:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    return-object v1

    .line 554
    :pswitch_1
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->ruler23:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 553
    :pswitch_2
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->ruler22:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 552
    :pswitch_3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->ruler21:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 551
    :pswitch_4
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->ruler13:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 550
    :pswitch_5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->ruler12:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getRulerLeft()I
    .locals 2

    .line 482
    iget v0, p0, Lcom/flyersoft/views/RulerView;->width:I

    int-to-float v0, v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerLeft:I

    int-to-float v1, v1

    mul-float v0, v0, v1

    const v1, 0x461c4000    # 10000.0f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private getRulerTop()I
    .locals 2

    .line 486
    iget v0, p0, Lcom/flyersoft/views/RulerView;->height:I

    int-to-float v0, v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerTop:I

    int-to-float v1, v1

    mul-float v0, v0, v1

    const v1, 0x461c4000    # 10000.0f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private static hideRulerImageIfNeed()V
    .locals 3

    .line 865
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget-boolean v1, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    const/4 v2, 0x0

    if-nez v1, :cond_1

    sget-boolean v1, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 866
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerColorCb:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    if-eqz v1, :cond_2

    const/4 v2, 0x4

    :cond_2
    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setVisibility(I)V

    return-void
.end method

.method public static loadSettings()V
    .locals 4

    .line 450
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "ruler_alpha_"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 451
    const-string v1, "rulerColor"

    const v3, 0x5564b685

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    sput v1, Lcom/flyersoft/views/RulerView;->rulerColor:I

    .line 452
    const-string v1, "rulerImageRes"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    sput v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/high16 v1, 0x42960000    # 75.0f

    .line 453
    sget v3, Lcom/flyersoft/tools/A;->fontSize:F

    mul-float v3, v3, v1

    const/high16 v1, 0x41700000    # 15.0f

    div-float/2addr v3, v1

    float-to-int v1, v3

    const-string v3, "rulerHeight"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    sput v1, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    .line 454
    const-string v1, "rulerPos"

    const/16 v3, 0x1194

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    sput v1, Lcom/flyersoft/views/RulerView;->rulerTop:I

    .line 455
    const-string v1, "rulerLeft"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    sput v1, Lcom/flyersoft/views/RulerView;->rulerLeft:I

    .line 456
    const-string v1, "custRulerImage"

    const-string v3, ""

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/flyersoft/views/RulerView;->custRulerImage:Ljava/lang/String;

    .line 457
    const-string v1, "rulerUseImage"

    const/4 v3, 0x1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    .line 458
    const-string v1, "hasLongTap2"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/flyersoft/views/RulerView;->hasLongTap:Z

    .line 459
    const-string v1, "hasSingleTap"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/flyersoft/views/RulerView;->hasSingleTap:Z

    .line 460
    const-string v1, "hasDoubleTap"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/flyersoft/views/RulerView;->hasDoubleTap:Z

    .line 461
    const-string v1, "rulerReverse"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    return-void
.end method

.method public static reloadRulerInReader(Z)V
    .locals 2

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    .line 853
    :goto_0
    sput v0, Lcom/flyersoft/tools/A;->showRuler:I

    .line 854
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 855
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/tools/A;->showRuler:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showRuler(I)V

    .line 857
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    if-eqz v0, :cond_2

    .line 858
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmRuler:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz v0, :cond_2

    .line 859
    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v1

    if-eq v1, p0, :cond_2

    .line 860
    invoke-virtual {v0, p0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    :cond_2
    return-void
.end method

.method private reloadTxtIfNeed()V
    .locals 8

    .line 426
    iget-object v0, p0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 428
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/RulerView;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v0}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v0

    .line 429
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v1

    .line 430
    iget-object v2, p0, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v2

    .line 431
    iget-object v3, p0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtKeepPage(I)I

    move-result v3

    mul-int v3, v3, v1

    add-int/2addr v3, v2

    .line 432
    sget v2, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    const/4 v5, 0x1

    if-le v2, v5, :cond_1

    if-ge v0, v3, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 433
    :goto_0
    sget v6, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    invoke-static {}, Lcom/flyersoft/tools/A;->getTxts()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    if-ge v6, v7, :cond_2

    iget-object v6, p0, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    .line 434
    invoke-virtual {v6}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v6

    iget-object v7, p0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v7, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtKeepPage(I)I

    move-result v7

    mul-int v1, v1, v7

    add-int/2addr v1, v0

    sub-int/2addr v6, v1

    if-ge v6, v3, :cond_2

    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    if-nez v2, :cond_4

    if-eqz v1, :cond_3

    goto :goto_3

    :cond_3
    :goto_2
    return-void

    .line 436
    :cond_4
    :goto_3
    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "reload txt..2"

    aput-object v2, v1, v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 437
    iget-object v1, p0, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v1

    .line 438
    iget-object v2, p0, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v2

    .line 439
    iget-object v3, p0, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop(I)I

    move-result v1

    sub-int/2addr v0, v1

    .line 440
    iget-object v1, p0, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x14

    if-ge v2, v1, :cond_5

    iget-object v1, p0, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v3, v2, 0x14

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_5
    const/4 v1, 0x0

    :goto_4
    int-to-long v2, v2

    .line 441
    invoke-static {v2, v3}, Lcom/flyersoft/tools/A;->getTxtRealPos(J)J

    move-result-wide v2

    sput-wide v2, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 442
    iget-object v2, p0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide v5, Lcom/flyersoft/tools/A;->lastPosition:J

    invoke-virtual {v2, v5, v6, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showTxtByPosition(JLjava/lang/String;)V

    .line 443
    iget-object v1, p0, Lcom/flyersoft/views/RulerView;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v1, v4, v0}, Lcom/flyersoft/views/ScrollView2;->scrollBy(II)V

    return-void
.end method

.method public static reset()V
    .locals 4

    const v0, 0x5564b685

    .line 516
    sput v0, Lcom/flyersoft/views/RulerView;->rulerColor:I

    const/4 v0, 0x1

    .line 517
    sput-boolean v0, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    const/4 v0, 0x0

    .line 518
    sput-boolean v0, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    .line 519
    sput v0, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    .line 520
    sput v0, Lcom/flyersoft/views/RulerView;->rulerLeft:I

    const/16 v1, 0x1194

    .line 521
    sput v1, Lcom/flyersoft/views/RulerView;->rulerTop:I

    .line 522
    invoke-static {}, Lcom/flyersoft/views/RulerView;->resetRulerImageHeight()V

    .line 523
    invoke-static {}, Lcom/flyersoft/views/RulerView;->saveSettings()V

    .line 524
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "ruler_alpha_"

    .line 525
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 526
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerColor:I

    .line 527
    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    const-string v2, "-1"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 528
    const-string v1, "0"

    const/16 v2, 0xff

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "1"

    .line 529
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "2"

    .line 530
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "3"

    .line 531
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "4"

    .line 532
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "5"

    const/16 v3, 0xd6

    .line 533
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "6"

    .line 534
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 535
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private static resetRulerImageHeight()V
    .locals 3

    .line 807
    sget-boolean v0, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x3

    const/high16 v2, 0x41700000    # 15.0f

    if-ge v0, v1, :cond_1

    const/high16 v0, 0x42960000    # 75.0f

    .line 810
    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    mul-float v1, v1, v0

    div-float/2addr v1, v2

    float-to-int v0, v1

    sput v0, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    return-void

    :cond_1
    const/high16 v0, 0x42f00000    # 120.0f

    .line 812
    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    mul-float v1, v1, v0

    div-float/2addr v1, v2

    float-to-int v0, v1

    sput v0, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    :cond_2
    :goto_0
    return-void
.end method

.method public static saveRulerAlpha(I)V
    .locals 4

    .line 507
    sget-boolean v0, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    .line 508
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "ruler_alpha_"

    const/4 v3, 0x0

    .line 509
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 510
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 511
    invoke-interface {v1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 512
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static saveSettings()V
    .locals 3

    .line 465
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "ruler_alpha_"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 466
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "rulerColor"

    sget v2, Lcom/flyersoft/views/RulerView;->rulerColor:I

    .line 467
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "rulerImageRes"

    sget v2, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    .line 468
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "rulerHeight"

    sget v2, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    .line 469
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "rulerPos"

    sget v2, Lcom/flyersoft/views/RulerView;->rulerTop:I

    .line 470
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "rulerLeft"

    sget v2, Lcom/flyersoft/views/RulerView;->rulerLeft:I

    .line 471
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "custRulerImage"

    sget-object v2, Lcom/flyersoft/views/RulerView;->custRulerImage:Ljava/lang/String;

    .line 472
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "rulerUseImage"

    sget-boolean v2, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    .line 473
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hasLongTap2"

    sget-boolean v2, Lcom/flyersoft/views/RulerView;->hasLongTap:Z

    .line 474
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hasSingleTap"

    sget-boolean v2, Lcom/flyersoft/views/RulerView;->hasSingleTap:Z

    .line 475
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hasDoubleTap"

    sget-boolean v2, Lcom/flyersoft/views/RulerView;->hasDoubleTap:Z

    .line 476
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "rulerReverse"

    sget-boolean v2, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    .line 477
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 478
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private setRulerLeft(I)V
    .locals 1

    int-to-float p1, p1

    const v0, 0x461c4000    # 10000.0f

    mul-float p1, p1, v0

    .line 490
    iget v0, p0, Lcom/flyersoft/views/RulerView;->width:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    sput p1, Lcom/flyersoft/views/RulerView;->rulerLeft:I

    return-void
.end method

.method private static setRulerSelect()V
    .locals 5

    .line 797
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ruler0:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const v2, 0x331e88e5

    const/4 v3, 0x0

    if-nez v1, :cond_0

    const v1, 0x331e88e5

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 798
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ruler1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v4, 0x1

    if-ne v1, v4, :cond_1

    const v1, 0x331e88e5

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 799
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ruler2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_2

    const v1, 0x331e88e5

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 800
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ruler3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v4, 0x3

    if-ne v1, v4, :cond_3

    const v1, 0x331e88e5

    goto :goto_3

    :cond_3
    const/4 v1, 0x0

    :goto_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 801
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ruler4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v4, 0x4

    if-ne v1, v4, :cond_4

    const v1, 0x331e88e5

    goto :goto_4

    :cond_4
    const/4 v1, 0x0

    :goto_4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 802
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ruler5:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v4, 0x5

    if-ne v1, v4, :cond_5

    const v1, 0x331e88e5

    goto :goto_5

    :cond_5
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 803
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ruler6:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v4, 0x6

    if-ne v1, v4, :cond_6

    goto :goto_6

    :cond_6
    const/4 v2, 0x0

    :goto_6
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method private setRulerTop(I)V
    .locals 1

    int-to-float p1, p1

    const v0, 0x461c4000    # 10000.0f

    mul-float p1, p1, v0

    .line 494
    iget v0, p0, Lcom/flyersoft/views/RulerView;->height:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    sput p1, Lcom/flyersoft/views/RulerView;->rulerTop:I

    return-void
.end method

.method public static showRulerOptions(Landroid/content/Context;Z)V
    .locals 6

    .line 569
    invoke-static {}, Lcom/flyersoft/views/RulerView;->loadSettings()V

    .line 570
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->ruler_options:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    .line 571
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 572
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rulerCb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 573
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->innerRb:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioButton;

    .line 574
    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v4, Lcom/flyersoft/moonreaderp/R$id;->outerRb:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RadioButton;

    .line 575
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->innerLay:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerInnerLay:Landroid/view/View;

    .line 576
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->outerLay:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerOuterLay:Landroid/view/View;

    .line 577
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->sizeSk:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/SeekBar;

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerSizeSK:Landroid/widget/SeekBar;

    .line 578
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->alphaSk:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/SeekBar;

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerAlphaSK:Landroid/widget/SeekBar;

    .line 579
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->colorCb:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerColorCb:Landroid/widget/CheckBox;

    .line 580
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->innerRuler:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerInnerRuler:Landroid/view/View;

    .line 581
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->outerRuler:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerOuterRuler:Landroid/view/View;

    .line 582
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->outerTop:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerOuterTop:Landroid/view/View;

    .line 583
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->outerBottom:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerOuterBottom:Landroid/view/View;

    .line 584
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->colorIv:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/google/android/material/imageview/ShapeableImageView;

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    .line 585
    sget-object v4, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    sget v5, Lcom/flyersoft/moonreaderp/R$id;->imageLay:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    sput-object v4, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    .line 586
    invoke-static {}, Lcom/flyersoft/views/RulerView;->showRulerSample()V

    if-nez p1, :cond_0

    const/16 v4, 0x8

    .line 589
    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 590
    :cond_0
    sget v4, Lcom/flyersoft/tools/A;->showRuler:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 591
    new-instance v4, Lcom/flyersoft/views/RulerView$4;

    invoke-direct {v4}, Lcom/flyersoft/views/RulerView$4;-><init>()V

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 599
    sget-boolean v4, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    xor-int/2addr v4, v5

    invoke-virtual {v1, v4}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 600
    sget-boolean v4, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    invoke-virtual {v3, v4}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 601
    new-instance v4, Lcom/flyersoft/views/RulerView$5;

    invoke-direct {v4, v3}, Lcom/flyersoft/views/RulerView$5;-><init>(Landroid/widget/RadioButton;)V

    invoke-virtual {v1, v4}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 611
    new-instance v4, Lcom/flyersoft/views/RulerView$6;

    invoke-direct {v4, v1}, Lcom/flyersoft/views/RulerView$6;-><init>(Landroid/widget/RadioButton;)V

    invoke-virtual {v3, v4}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 624
    invoke-static {}, Lcom/flyersoft/views/RulerView;->hideRulerImageIfNeed()V

    .line 625
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerColorCb:Landroid/widget/CheckBox;

    new-instance v3, Lcom/flyersoft/views/RulerView$7;

    invoke-direct {v3}, Lcom/flyersoft/views/RulerView$7;-><init>()V

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 638
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerSizeSK:Landroid/widget/SeekBar;

    new-instance v3, Lcom/flyersoft/views/RulerView$8;

    invoke-direct {v3}, Lcom/flyersoft/views/RulerView$8;-><init>()V

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 651
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerAlphaSK:Landroid/widget/SeekBar;

    new-instance v3, Lcom/flyersoft/views/RulerView$9;

    invoke-direct {v3}, Lcom/flyersoft/views/RulerView$9;-><init>()V

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 665
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ruler0:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 666
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ruler1:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 667
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ruler2:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 668
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ruler3:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 669
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ruler4:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 670
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ruler5:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 671
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ruler6:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerResClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 672
    invoke-static {}, Lcom/flyersoft/views/RulerView;->setRulerSelect()V

    .line 674
    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v3, Lcom/flyersoft/views/RulerView$10;

    invoke-direct {v3, p0}, Lcom/flyersoft/views/RulerView$10;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/imageview/ShapeableImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 690
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    if-eqz p1, :cond_2

    move-object v3, v2

    goto :goto_1

    .line 691
    :cond_2
    sget v3, Lcom/flyersoft/moonreaderp/R$string;->reading_ruler:I

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v1, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/views/RulerView;->rulerBase:Landroid/view/View;

    .line 692
    invoke-virtual {v1, v3}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    const v3, 0x104000a

    .line 693
    invoke-virtual {v1, v3, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->reset:I

    new-instance v3, Lcom/flyersoft/views/RulerView$13;

    invoke-direct {v3, p0, p1}, Lcom/flyersoft/views/RulerView$13;-><init>(Landroid/content/Context;Z)V

    .line 694
    invoke-virtual {v1, v2, v3}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    new-instance v3, Lcom/flyersoft/views/RulerView$12;

    invoke-direct {v3, p0, p1}, Lcom/flyersoft/views/RulerView$12;-><init>(Landroid/content/Context;Z)V

    .line 699
    invoke-virtual {v1, v2, v3}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance p1, Lcom/flyersoft/views/RulerView$11;

    invoke-direct {p1, v0}, Lcom/flyersoft/views/RulerView$11;-><init>(Landroid/widget/CheckBox;)V

    .line 704
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 710
    invoke-virtual {p0, v5}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private static showRulerResetDialog(Landroid/content/Context;Z)V
    .locals 3

    .line 714
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    .line 715
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->reset:I

    .line 716
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->reading_ruler:I

    .line 717
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\"?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 716
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/views/RulerView$15;

    invoke-direct {v1}, Lcom/flyersoft/views/RulerView$15;-><init>()V

    const v2, 0x104000a

    .line 718
    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 723
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/views/RulerView$14;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/views/RulerView$14;-><init>(Landroid/content/Context;Z)V

    .line 724
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 729
    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private static showRulerSample()V
    .locals 3

    .line 870
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerInnerRuler:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/views/RulerView;->getRulerBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 871
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerOuterTop:Landroid/view/View;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    sget v2, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 872
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerOuterBottom:Landroid/view/View;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    sget v2, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 873
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    sget v2, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 874
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerImageLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->custRuler:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    sget-object v1, Lcom/flyersoft/views/RulerView;->custRulerImage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 875
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerColorCb:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 876
    sget v0, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    sget-object v1, Lcom/flyersoft/views/RulerView;->rulerSizeSK:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getMax()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 877
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerSizeSK:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    sput v0, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    .line 878
    :cond_0
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerSizeSK:Landroid/widget/SeekBar;

    sget v1, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 879
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerAlphaSK:Landroid/widget/SeekBar;

    invoke-static {}, Lcom/flyersoft/views/RulerView;->getRulerAlpha()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 880
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerInnerRuler:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    int-to-float v1, v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 881
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerOuterRuler:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    sget v1, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    int-to-float v1, v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 882
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerInnerLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 883
    sget-object v0, Lcom/flyersoft/views/RulerView;->rulerOuterLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method private static showRulerTapEventOptions(Landroid/content/Context;Z)V
    .locals 12

    .line 733
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->ruler_tap_events:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 734
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->longTapCb:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 735
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->singTapCb:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 736
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->doubleTapCb:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    .line 738
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->long_time_tap_control:I

    .line 739
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "Screen"

    const-string v7, "Ruler"

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v8, " ("

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 740
    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefControl;->getActionItems(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v9

    sget v10, Lcom/flyersoft/tools/A;->doLongTap:I

    aget-object v9, v9, v10

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ")"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v10, 0x1

    invoke-static {v5, v10}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 738
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 742
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->tap_screen_top:I

    .line 743
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v11, Lcom/flyersoft/moonreaderp/R$string;->page_move_up:I

    .line 744
    invoke-virtual {p0, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v10}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "<br>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->tap_screen_bottom:I

    .line 745
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->page_move_down:I

    .line 746
    invoke-virtual {p0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v10}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 742
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 748
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->reading_ruler_double_tap:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 749
    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_0

    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 750
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 751
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v10}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 750
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 753
    :cond_0
    sget-boolean v4, Lcom/flyersoft/views/RulerView;->hasLongTap:Z

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 754
    sget-boolean v4, Lcom/flyersoft/views/RulerView;->hasSingleTap:Z

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 755
    sget-boolean v4, Lcom/flyersoft/views/RulerView;->hasDoubleTap:Z

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 757
    sget-object v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 758
    sget-object v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v4

    if-nez v4, :cond_1

    sget-object v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 759
    :cond_1
    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 760
    invoke-virtual {v2}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/text/TextPaint;->setStrikeThruText(Z)V

    .line 763
    :cond_2
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 764
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->more:I

    invoke-virtual {p0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->customize_bottom_bar1:I

    invoke-virtual {p0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 765
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 766
    new-instance v5, Lcom/flyersoft/views/RulerView$16;

    invoke-direct {v5, p0}, Lcom/flyersoft/views/RulerView$16;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 779
    new-instance v4, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v4, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget p0, Lcom/flyersoft/moonreaderp/R$string;->reading_ruler:I

    .line 780
    invoke-virtual {v4, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 781
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const p1, 0x104000a

    .line 782
    invoke-virtual {p0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance p1, Lcom/flyersoft/views/RulerView$17;

    invoke-direct {p1, v0, v2, v3}, Lcom/flyersoft/views/RulerView$17;-><init>(Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V

    .line 783
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 792
    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private updateRulerPosByScroller()V
    .locals 6

    .line 161
    iget v0, p0, Lcom/flyersoft/views/RulerView;->height:I

    iget v1, p0, Lcom/flyersoft/views/RulerView;->rHeight:I

    sub-int/2addr v0, v1

    .line 162
    iget v1, p0, Lcom/flyersoft/views/RulerView;->downTopMargin:I

    if-lt v1, v0, :cond_0

    iget v2, p0, Lcom/flyersoft/views/RulerView;->scrollStartTop:I

    if-lt v2, v0, :cond_0

    iget v0, p0, Lcom/flyersoft/views/RulerView;->TOP_MAX:I

    :cond_0
    const/4 v2, 0x0

    if-gtz v1, :cond_1

    .line 163
    iget v1, p0, Lcom/flyersoft/views/RulerView;->scrollStartTop:I

    if-gtz v1, :cond_1

    iget v1, p0, Lcom/flyersoft/views/RulerView;->TOP_MIN:I

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 165
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/views/RulerView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    .line 166
    iget-boolean v4, p0, Lcom/flyersoft/views/RulerView;->scrollReverse:Z

    if-eqz v4, :cond_2

    .line 167
    iget v4, p0, Lcom/flyersoft/views/RulerView;->scrollReverseStart:I

    sub-int/2addr v4, v3

    div-int/lit8 v3, v4, 0x2

    .line 168
    :cond_2
    iget v4, p0, Lcom/flyersoft/views/RulerView;->scrollStartTop:I

    add-int/2addr v4, v3

    const/4 v5, 0x1

    if-le v4, v0, :cond_3

    .line 171
    iput-boolean v5, p0, Lcom/flyersoft/views/RulerView;->scrollReverse:Z

    .line 172
    iput v0, p0, Lcom/flyersoft/views/RulerView;->scrollStartTop:I

    .line 173
    iput v3, p0, Lcom/flyersoft/views/RulerView;->scrollReverseStart:I

    goto :goto_1

    :cond_3
    move v0, v4

    :goto_1
    if-ge v0, v1, :cond_4

    .line 177
    iput-boolean v5, p0, Lcom/flyersoft/views/RulerView;->scrollReverse:Z

    .line 178
    iput v1, p0, Lcom/flyersoft/views/RulerView;->scrollStartTop:I

    .line 179
    iput v3, p0, Lcom/flyersoft/views/RulerView;->scrollReverseStart:I

    goto :goto_2

    :cond_4
    move v1, v0

    .line 182
    :goto_2
    iget v0, p0, Lcom/flyersoft/views/RulerView;->scrollStartLeft:I

    iget-object v3, p0, Lcom/flyersoft/views/RulerView;->scroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrX()I

    move-result v3

    add-int/2addr v0, v3

    .line 183
    iget v3, p0, Lcom/flyersoft/views/RulerView;->scrollStartLeft:I

    if-lez v3, :cond_5

    if-ge v0, v3, :cond_5

    if-gez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    if-gez v3, :cond_6

    if-le v0, v3, :cond_6

    if-lez v0, :cond_6

    const/4 v0, 0x0

    .line 190
    :cond_6
    iget v4, p0, Lcom/flyersoft/views/RulerView;->LEFT_MAX:I

    if-le v0, v4, :cond_7

    move v0, v4

    .line 192
    :cond_7
    iget v4, p0, Lcom/flyersoft/views/RulerView;->LEFT_MIN:I

    if-ge v0, v4, :cond_8

    move v0, v4

    .line 194
    :cond_8
    iget-boolean v4, p0, Lcom/flyersoft/views/RulerView;->disableX:Z

    if-eqz v4, :cond_9

    goto :goto_3

    :cond_9
    move v3, v0

    .line 198
    :goto_3
    invoke-virtual {p0, v3, v1, v2}, Lcom/flyersoft/views/RulerView;->setRulerPos(IIZ)V

    return-void
.end method

.method private verifyRulerPosition()V
    .locals 3

    .line 142
    iget v0, p0, Lcom/flyersoft/views/RulerView;->EDGE:I

    iget v1, p0, Lcom/flyersoft/views/RulerView;->width:I

    sub-int v2, v0, v1

    iput v2, p0, Lcom/flyersoft/views/RulerView;->LEFT_MIN:I

    sub-int/2addr v1, v0

    .line 143
    iput v1, p0, Lcom/flyersoft/views/RulerView;->LEFT_MAX:I

    mul-int/lit8 v0, v0, 0x2

    .line 145
    sget v1, Lcom/flyersoft/tools/A;->sysbar_height:I

    mul-int/lit8 v1, v1, 0x78

    div-int/lit8 v1, v1, 0x64

    if-ge v0, v1, :cond_0

    .line 146
    sget v0, Lcom/flyersoft/tools/A;->sysbar_height:I

    mul-int/lit8 v0, v0, 0x78

    div-int/lit8 v0, v0, 0x64

    .line 147
    :cond_0
    sget v1, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    int-to-float v1, v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result v1

    sub-int v1, v0, v1

    iput v1, p0, Lcom/flyersoft/views/RulerView;->TOP_MIN:I

    .line 148
    iget v1, p0, Lcom/flyersoft/views/RulerView;->height:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/flyersoft/views/RulerView;->TOP_MAX:I

    .line 150
    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->getRulerLeft()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/views/RulerView;->LEFT_MAX:I

    if-le v0, v1, :cond_1

    .line 151
    invoke-direct {p0, v1}, Lcom/flyersoft/views/RulerView;->setRulerLeft(I)V

    goto :goto_0

    .line 152
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->getRulerLeft()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/views/RulerView;->LEFT_MIN:I

    if-ge v0, v1, :cond_2

    .line 153
    iget v0, p0, Lcom/flyersoft/views/RulerView;->EDGE:I

    sub-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/flyersoft/views/RulerView;->setRulerLeft(I)V

    .line 154
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->getRulerTop()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/views/RulerView;->TOP_MAX:I

    if-le v0, v1, :cond_3

    .line 155
    invoke-direct {p0, v1}, Lcom/flyersoft/views/RulerView;->setRulerTop(I)V

    return-void

    .line 156
    :cond_3
    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->getRulerTop()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/views/RulerView;->TOP_MIN:I

    if-ge v0, v1, :cond_4

    .line 157
    invoke-direct {p0, v1}, Lcom/flyersoft/views/RulerView;->setRulerTop(I)V

    :cond_4
    return-void
.end method


# virtual methods
.method public init(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 3

    .line 105
    invoke-static {}, Lcom/flyersoft/views/RulerView;->loadSettings()V

    .line 106
    iput-object p1, p0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 107
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/flyersoft/views/RulerView;->baseFrame:Landroid/view/View;

    .line 108
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iput-object v0, p0, Lcom/flyersoft/views/RulerView;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    .line 109
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    iput-object p1, p0, Lcom/flyersoft/views/RulerView;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    .line 111
    iget-object p1, p0, Lcom/flyersoft/views/RulerView;->baseFrame:Landroid/view/View;

    new-instance v0, Lcom/flyersoft/views/RulerView$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/RulerView$1;-><init>(Lcom/flyersoft/views/RulerView;)V

    const-wide/16 v1, 0x32

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 67
    invoke-virtual {p0}, Lcom/flyersoft/views/RulerView;->getWidth()I

    move-result v0

    .line 68
    invoke-virtual {p0}, Lcom/flyersoft/views/RulerView;->getHeight()I

    move-result v1

    .line 69
    sget-boolean v2, Lcom/flyersoft/views/RulerView;->rulerReverse:Z

    if-eqz v2, :cond_0

    .line 70
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 71
    sget v3, Lcom/flyersoft/views/RulerView;->rulerColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 72
    new-instance v3, Landroid/graphics/Rect;

    iget v4, p0, Lcom/flyersoft/views/RulerView;->rTop:I

    const/4 v5, 0x0

    invoke-direct {v3, v5, v5, v0, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 73
    new-instance v3, Landroid/graphics/Rect;

    iget v4, p0, Lcom/flyersoft/views/RulerView;->rTop:I

    iget v6, p0, Lcom/flyersoft/views/RulerView;->rHeight:I

    add-int/2addr v4, v6

    invoke-direct {v3, v5, v4, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 74
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/views/RulerView;->rulerDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1

    .line 75
    iget v2, p0, Lcom/flyersoft/views/RulerView;->rLeft:I

    iget v3, p0, Lcom/flyersoft/views/RulerView;->rTop:I

    add-int/2addr v0, v2

    iget v4, p0, Lcom/flyersoft/views/RulerView;->rHeight:I

    add-int/2addr v4, v3

    invoke-virtual {v1, v2, v3, v0, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 76
    iget-object v0, p0, Lcom/flyersoft/views/RulerView;->rulerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 78
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/views/RulerView;->scroller:Landroid/widget/Scroller;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 79
    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->updateRulerPosByScroller()V

    :cond_2
    return-void
.end method

.method public setRulerPos(IIZ)V
    .locals 1

    .line 131
    iput p1, p0, Lcom/flyersoft/views/RulerView;->rLeft:I

    .line 132
    iput p2, p0, Lcom/flyersoft/views/RulerView;->rTop:I

    .line 133
    sget v0, Lcom/flyersoft/views/RulerView;->rulerHeight:I

    int-to-float v0, v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/RulerView;->rHeight:I

    if-eqz p3, :cond_0

    .line 135
    invoke-static {}, Lcom/flyersoft/views/RulerView;->getRulerBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/views/RulerView;->rulerDrawable:Landroid/graphics/drawable/Drawable;

    .line 136
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/RulerView;->invalidate()V

    .line 137
    invoke-direct {p0, p1}, Lcom/flyersoft/views/RulerView;->setRulerLeft(I)V

    .line 138
    invoke-direct {p0, p2}, Lcom/flyersoft/views/RulerView;->setRulerTop(I)V

    return-void
.end method

.method public setRulerTouchEvent()V
    .locals 3

    .line 211
    new-instance v0, Landroid/widget/Scroller;

    iget-object v1, p0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flyersoft/views/RulerView;->scroller:Landroid/widget/Scroller;

    .line 213
    new-instance v0, Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/flyersoft/views/RulerView;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v2, Lcom/flyersoft/views/RulerView$2;

    invoke-direct {v2, p0}, Lcom/flyersoft/views/RulerView$2;-><init>(Lcom/flyersoft/views/RulerView;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/flyersoft/views/RulerView;->rulerGestureDetector:Landroid/view/GestureDetector;

    .line 347
    new-instance v0, Lcom/flyersoft/views/RulerView$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/RulerView$3;-><init>(Lcom/flyersoft/views/RulerView;)V

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/RulerView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public showRuler(Z)V
    .locals 3

    if-eqz p1, :cond_0

    .line 122
    iget-object v0, p0, Lcom/flyersoft/views/RulerView;->baseFrame:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/RulerView;->width:I

    .line 123
    iget-object v0, p0, Lcom/flyersoft/views/RulerView;->baseFrame:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/RulerView;->height:I

    .line 124
    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->verifyRulerPosition()V

    .line 125
    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->getRulerLeft()I

    move-result v0

    invoke-direct {p0}, Lcom/flyersoft/views/RulerView;->getRulerTop()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/flyersoft/views/RulerView;->setRulerPos(IIZ)V

    :cond_0
    if-eqz p1, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    const/16 p1, 0x8

    .line 127
    :goto_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/RulerView;->setVisibility(I)V

    return-void
.end method
