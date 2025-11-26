.class public Lcom/flyersoft/moonreaderp/PrefStatusSetting;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefStatusSetting.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static statusBarUpdated:Z


# instance fields
.field act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field alignRG:Landroid/widget/RadioGroup;

.field private aloneChapterTv:Landroid/widget/TextView;

.field backcolorChanged:Z

.field backgroundIv:Lcom/google/android/material/imageview/ShapeableImageView;

.field barCS:Lcom/flyersoft/views/CustomSeek;

.field cMarginLeft:Lcom/flyersoft/views/CustomSeek;

.field cMarginRight:Lcom/flyersoft/views/CustomSeek;

.field cMarginStatus:Lcom/flyersoft/views/CustomSeek;

.field cMarginTop:Lcom/flyersoft/views/CustomSeek;

.field cb1:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field cb2:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field chapterCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field chapterPagesCb:Landroid/widget/CheckBox;

.field dualEnabled:Z

.field edgeRG:Landroid/widget/RadioGroup;

.field fontCS:Lcom/flyersoft/views/CustomSeek;

.field fontColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

.field fontTv:Landroid/widget/TextView;

.field leftSp:Landroid/widget/Spinner;

.field leftSp2:Landroid/widget/Spinner;

.field middleSp:Landroid/widget/Spinner;

.field middleSp2:Landroid/widget/Spinner;

.field previewHeight:I

.field previewLay:Landroid/view/View;

.field priorBackcolor:I

.field priorChapterTop:Z

.field progressCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field resetB:Landroid/view/View;

.field resetPreview:Landroid/view/View;

.field rightSp:Landroid/widget/Spinner;

.field rightSp2:Landroid/widget/Spinner;

.field showAloneChapter:Z

.field public status2Page:Landroid/view/View;

.field public statusLay:Landroid/view/View;

.field public statusLayHori:Landroid/view/View;

.field private statusLeft:Landroid/widget/TextView;

.field private statusLeft2:Landroid/widget/TextView;

.field public statusLeftPanel:Landroid/view/View;

.field private statusMiddle:Landroid/widget/TextView;

.field private statusMiddle21:Landroid/widget/TextView;

.field private statusMiddle22:Landroid/widget/TextView;

.field private statusRight:Landroid/widget/TextView;

.field timeCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field topCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field totalPagesCb:Landroid/widget/CheckBox;

.field undernotchCb:Lcom/google/android/material/materialswitch/MaterialSwitch;


# direct methods
.method static bridge synthetic -$$Nest$mafterChapterEdgeChanged(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->afterChapterEdgeChanged()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetChapterMarginVisible(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setChapterMarginVisible()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetFontLayEnable(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setFontLayEnable()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateStatusBarProperties(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->updateStatusBarProperties()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 34
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->statusbar_setting:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 35
    invoke-virtual {p0, p2}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->scrollToTitle(Ljava/lang/String;)V

    return-void
.end method

.method private afterChapterEdgeChanged()V
    .locals 3

    .line 331
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->backcolorChanged:Z

    if-nez v0, :cond_2

    .line 332
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->priorBackcolor:I

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->DEFAULT_STATUS_BACK_COLOR:I

    :goto_0
    sput v0, Lcom/flyersoft/tools/A;->statusBackColor:I

    .line 333
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->backgroundIv:Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    sget v2, Lcom/flyersoft/tools/A;->statusBackColor:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    return-void
.end method

.method private chapterAlign()I
    .locals 2

    .line 354
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-ne v0, v1, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->chapterAlignStatus:I

    return v0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->chapterAlign:I

    return v0
.end method

.method private drawPreview()V
    .locals 10

    .line 482
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    const/16 v1, 0x8

    if-eqz v0, :cond_0

    .line 483
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 487
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/view/View;)V

    .line 488
    sget-boolean v0, Lcom/flyersoft/tools/A;->statusCustomizeFont:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/A;->statusFontColor:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    .line 490
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    const/16 v3, -0x32

    invoke-static {v0, v3}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 491
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 492
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 493
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle21:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 494
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle22:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 495
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 497
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 498
    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v4, :cond_2

    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget v5, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v4, v5}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v4

    iget-object v4, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 499
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget v4, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v2, v4}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    .line 501
    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->refreshAloneChapterVisible()V

    .line 502
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    iget-boolean v5, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    const/4 v6, 0x0

    if-eqz v5, :cond_3

    const/4 v5, 0x0

    goto :goto_1

    :cond_3
    const/16 v5, 0x8

    :goto_1
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 503
    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    const-string v5, ""

    const/4 v7, 0x1

    if-eqz v4, :cond_5

    .line 504
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    const/16 v8, -0x5a

    invoke-static {v0, v8}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 505
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 506
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtLay:Landroid/view/View;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-static {v2, v0, v4, v7}, Lcom/flyersoft/moonreaderp/ActivityTxt;->aloneChapterProperties(Landroid/widget/TextView;Landroid/view/View;Landroid/view/View;Z)V

    .line 507
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->dualEnabled:Z

    if-nez v2, :cond_4

    sget-boolean v2, Lcom/flyersoft/tools/A;->statusProgress:Z

    if-eqz v2, :cond_4

    sget-boolean v2, Lcom/flyersoft/tools/A;->chapterPageNum:Z

    if-eqz v2, :cond_4

    const-string v5, "1/10"

    :cond_4
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 509
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->dualEnabled:Z

    if-eqz v4, :cond_6

    goto :goto_2

    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v2, Lcom/flyersoft/tools/A;->statusProgress:Z

    if-eqz v2, :cond_7

    sget-boolean v2, Lcom/flyersoft/tools/A;->chapterPageNum:Z

    if-eqz v2, :cond_7

    const-string v5, " (1/10)"

    :cond_7
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_2
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 511
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->chapterAlignStatus:I

    if-nez v2, :cond_8

    const/4 v2, 0x3

    goto :goto_4

    :cond_8
    sget v2, Lcom/flyersoft/tools/A;->chapterAlignStatus:I

    if-ne v2, v7, :cond_9

    const/4 v2, 0x1

    goto :goto_4

    :cond_9
    const/4 v2, 0x5

    :goto_4
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 512
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->chapterMarginStatus:I

    add-int/lit8 v2, v2, 0x14

    int-to-float v2, v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    sget v4, Lcom/flyersoft/tools/A;->chapterMarginStatus:I

    add-int/lit8 v4, v4, 0x14

    int-to-float v4, v4

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-virtual {v0, v2, v6, v4, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 514
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeftPanel:Landroid/view/View;

    sget-boolean v2, Lcom/flyersoft/tools/A;->statusTime:Z

    const/4 v4, 0x4

    if-eqz v2, :cond_a

    const/4 v2, 0x0

    goto :goto_5

    :cond_a
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-eqz v2, :cond_b

    const/4 v2, 0x4

    goto :goto_5

    :cond_b
    const/16 v2, 0x8

    :goto_5
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 515
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    sget-boolean v2, Lcom/flyersoft/tools/A;->statusChapter:Z

    if-eqz v2, :cond_c

    const/4 v2, 0x0

    goto :goto_6

    :cond_c
    const/4 v2, 0x4

    :goto_6
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 516
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    sget-boolean v2, Lcom/flyersoft/tools/A;->statusProgress:Z

    if-eqz v2, :cond_d

    const/4 v2, 0x0

    goto :goto_7

    :cond_d
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-eqz v2, :cond_e

    const/4 v2, 0x4

    goto :goto_7

    :cond_e
    const/16 v2, 0x8

    :goto_7
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 518
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontSize:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 519
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontSize:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 520
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontSize:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 521
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontSize:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 522
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v2

    const/4 v5, 0x7

    if-eq v2, v5, :cond_f

    sget-boolean v2, Lcom/flyersoft/tools/A;->totalPageNum:Z

    if-eqz v2, :cond_f

    const-string v2, "72/720"

    goto :goto_8

    :cond_f
    const-string v2, "10%"

    :goto_8
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 524
    sget-boolean v0, Lcom/flyersoft/tools/A;->statusCustomizeFont:Z

    if-eqz v0, :cond_10

    .line 525
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontColor:I

    invoke-static {v2, v3}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 526
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontColor:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 527
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontColor:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 528
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontColor:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 529
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/tools/A;->statusFontColor:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 530
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    sget-object v2, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    xor-int/2addr v3, v7

    invoke-static {v2, v3}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 531
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    sget-object v2, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    xor-int/2addr v3, v7

    invoke-static {v2, v3}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 532
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    sget-object v2, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    invoke-static {v2, v6}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 533
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    sget-object v2, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    invoke-static {v2, v6}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 534
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    sget-object v2, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    xor-int/2addr v3, v7

    invoke-static {v2, v3}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_9

    .line 536
    :cond_10
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    xor-int/2addr v2, v7

    const-string v3, "sans-serif"

    invoke-static {v3, v2}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 537
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    xor-int/2addr v2, v7

    invoke-static {v3, v2}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 538
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    invoke-static {v3, v6}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 539
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    invoke-static {v3, v6}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 540
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    xor-int/2addr v2, v7

    invoke-static {v3, v2}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 543
    :goto_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 544
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->dualEnabled:Z

    const/high16 v3, 0x40000000    # 2.0f

    if-eqz v0, :cond_13

    .line 545
    sget-boolean v0, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v0, :cond_11

    const/high16 v0, 0x41400000    # 12.0f

    goto :goto_a

    :cond_11
    const/high16 v0, 0x41000000    # 8.0f

    :goto_a
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    .line 546
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLay:Landroid/view/View;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    sub-int v5, v0, v5

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLay:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getPaddingTop()I

    move-result v8

    const/high16 v9, 0x40a00000    # 5.0f

    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    invoke-virtual {v1, v5, v8, v0, v9}, Landroid/view/View;->setPadding(IIII)V

    .line 547
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->status2Page:Landroid/view/View;

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusProgress:Z

    if-eqz v1, :cond_12

    const/4 v4, 0x0

    :cond_12
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 548
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLayHori:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 549
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 550
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setStatusLayTextColorFor2PageMode()V

    goto :goto_b

    .line 552
    :cond_13
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->status2Page:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 553
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLay:Landroid/view/View;

    sget v1, Lcom/flyersoft/tools/A;->statusMargin:I

    sget v2, Lcom/flyersoft/tools/A;->statusMargin:I

    sget v4, Lcom/flyersoft/tools/A;->statusMargin:I

    sget v5, Lcom/flyersoft/tools/A;->statusMargin:I

    invoke-virtual {v0, v1, v2, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 554
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLayHori:Landroid/view/View;

    sget v1, Lcom/flyersoft/tools/A;->statusBackColor:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 555
    sget-boolean v0, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    if-ne v0, v1, :cond_14

    .line 556
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/material/components/icons/R$drawable;->list_focused_holo:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 559
    :cond_14
    :goto_b
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    check-cast v0, Lcom/flyersoft/views/BatteryTextView;

    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v1

    xor-int/2addr v1, v7

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BatteryTextView;->setBatteryIcon(Z)V

    .line 560
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->battery:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 561
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->battery:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 562
    :cond_15
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    sget-boolean v1, Lcom/flyersoft/tools/A;->use12Hour:Z

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v6, v1, v2}, Lcom/flyersoft/tools/T;->time(ZZLjava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 564
    invoke-static {}, Lcom/flyersoft/tools/A;->isFullScreenPhone()Z

    move-result v0

    if-eqz v0, :cond_16

    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz v0, :cond_16

    sget-boolean v0, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    if-eqz v0, :cond_16

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->dualEnabled:Z

    if-nez v0, :cond_16

    .line 565
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeftPanel:Landroid/view/View;

    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v0, v1, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 566
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-virtual {v0, v1, v6, v2, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 569
    :cond_16
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-eqz v1, :cond_17

    const/16 v1, 0x30

    goto :goto_c

    :cond_17
    const/16 v1, 0x50

    :goto_c
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 570
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-eqz v0, :cond_1a

    .line 571
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    mul-int/lit8 v0, v0, 0x2

    const/high16 v1, 0x41f00000    # 30.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    add-int/2addr v0, v1

    .line 572
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ge v1, v0, :cond_19

    .line 573
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewHeight:I

    if-nez v1, :cond_18

    .line 574
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewHeight:I

    .line 575
    :cond_18
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 576
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    .line 577
    :cond_19
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewHeight:I

    if-lez v1, :cond_1a

    if-ge v1, v0, :cond_1a

    .line 578
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 579
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1a
    return-void
.end method

.method private initActionList(Landroid/view/ViewGroup;)V
    .locals 3

    const/4 v0, 0x0

    .line 452
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 453
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 454
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    .line 455
    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup;

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initActionList(Landroid/view/ViewGroup;)V

    .line 456
    :cond_0
    instance-of v2, v1, Landroid/widget/Spinner;

    if-eqz v2, :cond_1

    .line 457
    check-cast v1, Landroid/widget/Spinner;

    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setSpinnerList(Landroid/widget/Spinner;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private refreshAloneChapterVisible()V
    .locals 2

    .line 586
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 588
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->statusChapter:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    sget-boolean v1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    if-eq v0, v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    return-void
.end method

.method private setChapterMarginVisible()V
    .locals 5

    .line 338
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->refreshAloneChapterVisible()V

    .line 339
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->chapterLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusChapter:Z

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 340
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginLeft:Lcom/flyersoft/views/CustomSeek;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-nez v1, :cond_2

    sget-boolean v1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    sget-boolean v4, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-eq v1, v4, :cond_1

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 341
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginRight:Lcom/flyersoft/views/CustomSeek;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-nez v1, :cond_4

    sget-boolean v1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    sget-boolean v4, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-eq v1, v4, :cond_3

    goto :goto_3

    :cond_3
    const/16 v1, 0x8

    goto :goto_4

    :cond_4
    :goto_3
    const/4 v1, 0x0

    :goto_4
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 342
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginTop:Lcom/flyersoft/views/CustomSeek;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-nez v1, :cond_6

    sget-boolean v1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    sget-boolean v4, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-eq v1, v4, :cond_5

    goto :goto_5

    :cond_5
    const/16 v1, 0x8

    goto :goto_6

    :cond_6
    :goto_5
    const/4 v1, 0x0

    :goto_6
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 343
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginStatus:Lcom/flyersoft/views/CustomSeek;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-nez v1, :cond_7

    sget-boolean v1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    sget-boolean v4, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-ne v1, v4, :cond_7

    const/4 v1, 0x0

    goto :goto_7

    :cond_7
    const/16 v1, 0x8

    :goto_7
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 344
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->edgeRG:Landroid/widget/RadioGroup;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->dualEnabled:Z

    if-nez v1, :cond_8

    const/4 v1, 0x0

    goto :goto_8

    :cond_8
    const/16 v1, 0x8

    :goto_8
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setVisibility(I)V

    .line 345
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->barCS:Lcom/flyersoft/views/CustomSeek;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->dualEnabled:Z

    if-nez v1, :cond_9

    const/4 v1, 0x0

    goto :goto_9

    :cond_9
    const/16 v1, 0x8

    :goto_9
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 346
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backgroundColorLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->dualEnabled:Z

    if-nez v1, :cond_a

    goto :goto_a

    :cond_a
    const/16 v2, 0x8

    :goto_a
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 348
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->edgeRG:Landroid/widget/RadioGroup;

    sget-boolean v1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    if-nez v1, :cond_b

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bottomRadio:I

    goto :goto_b

    :cond_b
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->topRadio:I

    :goto_b
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 349
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->alignRG:Landroid/widget/RadioGroup;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->chapterAlign()I

    move-result v1

    if-nez v1, :cond_c

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->leftRadio:I

    goto :goto_c

    :cond_c
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->chapterAlign()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_d

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->centerRadio:I

    goto :goto_c

    :cond_d
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rightRadio:I

    :goto_c
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 350
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginTop:Lcom/flyersoft/views/CustomSeek;

    iget-object v0, v0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    sget-boolean v1, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-eqz v1, :cond_e

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->bottom_margin:I

    goto :goto_d

    :cond_e
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->top_margin:I

    :goto_d
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method private setFontLayEnable()V
    .locals 3

    .line 379
    sget-boolean v0, Lcom/flyersoft/tools/A;->statusCustomizeFont:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    .line 380
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->fontLay:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 381
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->fontColorLay:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private setSelection(II)V
    .locals 1

    .line 466
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    .line 467
    invoke-virtual {p1}, Landroid/widget/Spinner;->getCount()I

    move-result v0

    if-lt p2, v0, :cond_0

    const/16 p2, 0xf

    .line 469
    :cond_0
    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setSelection(I)V

    return-void
.end method

.method private setSpinnerList(Landroid/widget/Spinner;)V
    .locals 1

    .line 462
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefControl;->setSpinnerList(Landroid/content/Context;Landroid/widget/Spinner;)V

    return-void
.end method

.method private updateStatusBarProperties()V
    .locals 2

    const/4 v0, 0x1

    .line 474
    sput-boolean v0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusBarUpdated:Z

    .line 475
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetPreview:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 476
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->drawPreview()V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 2

    .line 359
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->forFuncSearch:Z

    if-eqz v0, :cond_0

    .line 360
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->prefStatusp:I

    .line 364
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->undernotchCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->statusUnderNotch:Z

    .line 365
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->leftSp:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickLeft:I

    .line 366
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->middleSp:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickMiddle:I

    .line 367
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->rightSp:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickRight:I

    .line 368
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->leftSp2:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickLeft2:I

    .line 369
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->middleSp2:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickMiddle2:I

    .line 370
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->rightSp2:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->statusClickRight2:I

    .line 371
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 372
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setStatusBarProperties(Z)V

    .line 373
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->eraseGPUShadow(I)V

    .line 375
    :cond_1
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method public initView()V
    .locals 8

    .line 69
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    .line 70
    sput-boolean v0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusBarUpdated:Z

    .line 71
    sget v1, Lcom/flyersoft/tools/A;->statusBackColor:I

    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->priorBackcolor:I

    .line 72
    sget-boolean v1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->priorChapterTop:Z

    .line 74
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->previewLay:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->previewLay:Landroid/view/View;

    .line 75
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->resetPreview:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetPreview:Landroid/view/View;

    .line 76
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->txtStatusLay:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLay:Landroid/view/View;

    .line 77
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->txtStatusLayHori:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLayHori:Landroid/view/View;

    .line 78
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->statusLeftPanel:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeftPanel:Landroid/view/View;

    .line 79
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->status2Page:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->status2Page:Landroid/view/View;

    .line 80
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->aloneChapterTv:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->aloneChapterTv:Landroid/widget/TextView;

    .line 81
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->statusLeft:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    .line 82
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->statusLeft2:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    .line 83
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->statusRight:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    .line 84
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->statusMiddle:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle:Landroid/widget/TextView;

    .line 85
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->statusMiddle21:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle21:Landroid/widget/TextView;

    .line 86
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->statusMiddle22:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle22:Landroid/widget/TextView;

    .line 88
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->BackgroundColor:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/imageview/ShapeableImageView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->backgroundIv:Lcom/google/android/material/imageview/ShapeableImageView;

    .line 89
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->FontColor:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/imageview/ShapeableImageView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    .line 90
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->FontTextView:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontTv:Landroid/widget/TextView;

    .line 91
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pvReset:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetB:Landroid/view/View;

    .line 92
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ontop:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->topCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 93
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->undernotch:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->undernotchCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 94
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->showtime:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->timeCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 95
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->showchapter:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->chapterCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 96
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->showprogress:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->progressCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 97
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->UseThemeFont:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cb1:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 98
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->Use12Hour:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cb2:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 99
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ClickLeft:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->leftSp:Landroid/widget/Spinner;

    .line 100
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ClickMiddle:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->middleSp:Landroid/widget/Spinner;

    .line 101
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ClickRight:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->rightSp:Landroid/widget/Spinner;

    .line 102
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ClickLeft2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->leftSp2:Landroid/widget/Spinner;

    .line 103
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ClickMiddle2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->middleSp2:Landroid/widget/Spinner;

    .line 104
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ClickRight2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->rightSp2:Landroid/widget/Spinner;

    .line 105
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapterMarginLeft:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/CustomSeek;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginLeft:Lcom/flyersoft/views/CustomSeek;

    .line 106
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapterMarginRight:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/CustomSeek;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginRight:Lcom/flyersoft/views/CustomSeek;

    .line 107
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapterMarginTop:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/CustomSeek;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginTop:Lcom/flyersoft/views/CustomSeek;

    .line 108
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapterMarginStatus:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/CustomSeek;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginStatus:Lcom/flyersoft/views/CustomSeek;

    .line 109
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->marginStatus:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/CustomSeek;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->barCS:Lcom/flyersoft/views/CustomSeek;

    .line 110
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->fontSize:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/CustomSeek;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontCS:Lcom/flyersoft/views/CustomSeek;

    .line 111
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->edgeGroup:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioGroup;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->edgeRG:Landroid/widget/RadioGroup;

    .line 112
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->alignGroup:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioGroup;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->alignRG:Landroid/widget/RadioGroup;

    .line 113
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->totalPages:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->totalPagesCb:Landroid/widget/CheckBox;

    .line 114
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapterPages:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->chapterPagesCb:Landroid/widget/CheckBox;

    .line 116
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->totalPagesCb:Landroid/widget/CheckBox;

    sget-boolean v2, Lcom/flyersoft/tools/A;->totalPageNum:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 117
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->chapterPagesCb:Landroid/widget/CheckBox;

    sget-boolean v2, Lcom/flyersoft/tools/A;->chapterPageNum:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 119
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->totalPagesCb:Landroid/widget/CheckBox;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefStatusSetting$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$1;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 126
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->chapterPagesCb:Landroid/widget/CheckBox;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefStatusSetting$2;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$2;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 133
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v1

    const/4 v2, 0x7

    const/16 v3, 0x8

    if-ne v1, v2, :cond_0

    .line 134
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pagesLay:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 136
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->topRadio:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->edge_list:I

    const/4 v5, 0x2

    invoke-static {v2, v4, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 137
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->bottomRadio:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->edge_list:I

    const/4 v5, 0x3

    invoke-static {v2, v4, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 139
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->dualEnabled:Z

    .line 140
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginLeft:Lcom/flyersoft/views/CustomSeek;

    iget-object v1, v1, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    const v4, -0x777778

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 141
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginRight:Lcom/flyersoft/views/CustomSeek;

    iget-object v1, v1, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 142
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginTop:Lcom/flyersoft/views/CustomSeek;

    iget-object v1, v1, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 143
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginStatus:Lcom/flyersoft/views/CustomSeek;

    iget-object v1, v1, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->drawPreview()V

    .line 145
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setChapterMarginVisible()V

    .line 146
    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->showAloneChapter:Z

    if-nez v1, :cond_2

    sget v1, Lcom/flyersoft/tools/A;->statusMargin:I

    if-nez v1, :cond_2

    .line 147
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetPreview:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 149
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->edgeRG:Landroid/widget/RadioGroup;

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefStatusSetting$3;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$3;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v4}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 158
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->alignRG:Landroid/widget/RadioGroup;

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$4;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v4}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 171
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginLeft:Lcom/flyersoft/views/CustomSeek;

    sget v4, Lcom/flyersoft/tools/A;->CHAPTER_MARGIN_MIN:I

    sget v6, Lcom/flyersoft/tools/A;->CHAPTER_MARGIN_MAX:I

    sget v7, Lcom/flyersoft/tools/A;->chapterMarginLeft:I

    invoke-virtual {v1, v4, v6, v7}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 172
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginLeft:Lcom/flyersoft/views/CustomSeek;

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefStatusSetting$5;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$5;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v4}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 181
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginRight:Lcom/flyersoft/views/CustomSeek;

    sget v4, Lcom/flyersoft/tools/A;->CHAPTER_MARGIN_MIN:I

    sget v6, Lcom/flyersoft/tools/A;->CHAPTER_MARGIN_MAX:I

    sget v7, Lcom/flyersoft/tools/A;->chapterMarginRight:I

    invoke-virtual {v1, v4, v6, v7}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 182
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginRight:Lcom/flyersoft/views/CustomSeek;

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefStatusSetting$6;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$6;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v4}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 191
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginTop:Lcom/flyersoft/views/CustomSeek;

    sget v4, Lcom/flyersoft/tools/A;->CHAPTER_MARGIN_MIN:I

    sget v6, Lcom/flyersoft/tools/A;->CHAPTER_MARGIN_MAX:I

    sget v7, Lcom/flyersoft/tools/A;->chapterMarginTop:I

    invoke-virtual {v1, v4, v6, v7}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 192
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginTop:Lcom/flyersoft/views/CustomSeek;

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefStatusSetting$7;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$7;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v4}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 201
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginStatus:Lcom/flyersoft/views/CustomSeek;

    sget v4, Lcom/flyersoft/tools/A;->CHAPTER_MARGIN_MIN:I

    sget v6, Lcom/flyersoft/tools/A;->CHAPTER_MARGIN_MAX:I

    sget v7, Lcom/flyersoft/tools/A;->chapterMarginStatus:I

    invoke-virtual {v1, v4, v6, v7}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 202
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cMarginStatus:Lcom/flyersoft/views/CustomSeek;

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefStatusSetting$8;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$8;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v4}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 211
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->topCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v4, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    invoke-virtual {v1, v4}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 212
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->topCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v4}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 228
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->undernotchCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v4, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-eqz v4, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 v3, 0x0

    :cond_3
    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setVisibility(I)V

    .line 229
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    sget v4, Lcom/flyersoft/tools/A;->statusFontColor:I

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 230
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->backgroundIv:Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    sget v4, Lcom/flyersoft/tools/A;->statusBackColor:I

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 231
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontTv:Landroid/widget/TextView;

    sget-object v3, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setFontLayEnable()V

    .line 234
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetB:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetPreview:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 236
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->backgroundIv:Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-virtual {v1, p0}, Lcom/google/android/material/imageview/ShapeableImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 237
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-virtual {v1, p0}, Lcom/google/android/material/imageview/ShapeableImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontTv:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 239
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cb1:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->statusCustomizeFont:Z

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 240
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cb2:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->use12Hour:Z

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 241
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->undernotchCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->statusUnderNotch:Z

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 242
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->timeCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->statusTime:Z

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 243
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->chapterCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->statusChapter:Z

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 244
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->progressCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->statusProgress:Z

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 246
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->timeCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefStatusSetting$10;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$10;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 253
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->chapterCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefStatusSetting$11;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$11;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 261
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->progressCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefStatusSetting$12;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$12;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 268
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cb1:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefStatusSetting$13;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$13;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 276
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->cb2:Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefStatusSetting$14;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$14;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 286
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontCS:Lcom/flyersoft/views/CustomSeek;

    const/16 v3, 0x1e

    sget v4, Lcom/flyersoft/tools/A;->statusFontSize:I

    invoke-virtual {v1, v5, v3, v4}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 287
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontCS:Lcom/flyersoft/views/CustomSeek;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefStatusSetting$15;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$15;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v1, v3}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 297
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->barCS:Lcom/flyersoft/views/CustomSeek;

    iget-object v1, v1, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->statubar_margin:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "<br>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, " ("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 298
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->statubar:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 297
    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 299
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->barCS:Lcom/flyersoft/views/CustomSeek;

    const/16 v2, 0x64

    sget v3, Lcom/flyersoft/tools/A;->statusMargin:I

    invoke-virtual {v1, v0, v2, v3}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 300
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->barCS:Lcom/flyersoft/views/CustomSeek;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefStatusSetting$16;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$16;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 310
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initActionList(Landroid/view/ViewGroup;)V

    .line 311
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickLeft:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickLeft:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setSelection(II)V

    .line 312
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickMiddle:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickMiddle:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setSelection(II)V

    .line 313
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickRight:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickRight:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setSelection(II)V

    .line 314
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickLeft2:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickLeft2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setSelection(II)V

    .line 315
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickMiddle2:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickMiddle2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setSelection(II)V

    .line 316
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ClickRight2:I

    sget v1, Lcom/flyersoft/tools/A;->statusClickRight2:I

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->setSelection(II)V

    .line 318
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->forFuncSearch:Z

    if-nez v0, :cond_4

    sget v0, Lcom/flyersoft/tools/A;->prefStatusp:I

    if-lez v0, :cond_4

    .line 319
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefStatusSetting$17;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$17;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_4
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 386
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->backgroundIv:Lcom/google/android/material/imageview/ShapeableImageView;

    if-ne p1, v0, :cond_2

    .line 387
    sget v0, Lcom/flyersoft/tools/A;->statusBackColor:I

    if-nez v0, :cond_0

    .line 388
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->priorBackcolor:I

    if-eqz v1, :cond_0

    move v0, v1

    :cond_0
    if-nez v0, :cond_1

    .line 391
    sget v0, Lcom/flyersoft/tools/A;->DEFAULT_STATUS_BACK_COLOR:I

    :cond_1
    move v5, v0

    .line 394
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->res:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->background_color:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefStatusSetting$18;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$18;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    const/4 v4, 0x1

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 404
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 407
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontColorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    if-ne p1, v0, :cond_3

    .line 408
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->res:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->font_color:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget v5, Lcom/flyersoft/tools/A;->statusFontColor:I

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefStatusSetting$19;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$19;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    const/4 v4, 0x1

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 417
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 420
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontTv:Landroid/widget/TextView;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_4

    .line 421
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->res:Landroid/content/Context;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefStatusSetting$20;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting$20;-><init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    sget-object v4, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;Ljava/lang/String;Z)V

    .line 429
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->show()V

    .line 432
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetB:Landroid/view/View;

    const/16 v2, 0x8

    const/4 v3, 0x1

    if-ne p1, v0, :cond_6

    .line 433
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetPreview:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 434
    invoke-static {v3, v3}, Lcom/flyersoft/tools/A;->set_default_statusbar(ZZ)V

    .line 435
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initView()V

    .line 436
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->updateStatusBarProperties()V

    .line 437
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 438
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    .line 439
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->root:Landroid/view/View;

    sget v4, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    invoke-virtual {v0, v1, v1}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 442
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->resetPreview:Landroid/view/View;

    if-ne p1, v0, :cond_7

    .line 443
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 444
    invoke-static {v3, v1}, Lcom/flyersoft/tools/A;->set_default_statusbar(ZZ)V

    .line 445
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initView()V

    .line 446
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 447
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    :cond_7
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 40
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 42
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 43
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 44
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHideExit(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 46
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->statubar:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 47
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 49
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initView()V

    return-void
.end method

.method public setStatusLayTextColorFor2PageMode()V
    .locals 4

    .line 592
    sget-boolean v0, Lcom/flyersoft/tools/A;->statusCustomizeFont:Z

    if-nez v0, :cond_0

    .line 593
    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    .line 594
    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    const/16 v3, 0xc8

    invoke-static {v3, v1, v2, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    .line 595
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle21:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 596
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle22:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 597
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 598
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 599
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 601
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->statusFontSize:I

    .line 602
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle21:Landroid/widget/TextView;

    int-to-float v2, v0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 603
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle22:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 604
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 605
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 606
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 608
    sget-boolean v0, Lcom/flyersoft/tools/A;->statusCustomizeFont:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, "sans-serif"

    :goto_0
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    .line 609
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle21:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 610
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusMiddle22:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 611
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 612
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusLeft2:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 613
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->statusRight:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    return-void
.end method
