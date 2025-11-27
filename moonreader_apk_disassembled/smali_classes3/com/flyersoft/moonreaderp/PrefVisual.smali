.class public Lcom/flyersoft/moonreaderp/PrefVisual;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefVisual.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;


# instance fields
.field b1:Landroid/widget/Button;

.field b2:Landroid/widget/Button;

.field encodeSp:Landroid/widget/Spinner;

.field fileEncoding:Ljava/lang/String;

.field flip_speed_lay:Landroid/widget/LinearLayout;

.field flip_speed_sb:Landroid/widget/SeekBar;

.field flip_type_sp:Landroid/widget/Spinner;

.field fontWeightSelected:I

.field hyphLay:Landroid/widget/LinearLayout;

.field hyphSp:Landroid/widget/Spinner;

.field ignoreSwitchTmp:Z

.field marginTipCount:I

.field number1:Lcom/example2014/components/NumberPicker;

.field number2:Lcom/example2014/components/NumberPicker;

.field private old_day_fontColor:I

.field private old_night_fontColor:I

.field resumeTime:J

.field transparentTv:Landroid/widget/TextView;

.field tvLoadTheme:Landroid/view/View;

.field tvSaveTheme:Landroid/view/View;

.field weightTv:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$madjustFontSpacing(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->adjustFontSpacing()V

    return-void
.end method

.method static bridge synthetic -$$Nest$madjustLineSpacing(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->adjustLineSpacing()V

    return-void
.end method

.method static bridge synthetic -$$Nest$madjustParagraphSpacing(Lcom/flyersoft/moonreaderp/PrefVisual;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->adjustParagraphSpacing(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mclearCurlCache(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->clearCurlCache()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateBackgroundBitmap(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->createBackgroundBitmap(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mencodingError(Lcom/flyersoft/moonreaderp/PrefVisual;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->encodingError(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$meraseGPUShadow(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->eraseGPUShadow()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetAlaphaText(Lcom/flyersoft/moonreaderp/PrefVisual;I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->getAlaphaText(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mjustifiedOptionClick(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->justifiedOptionClick(Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mloadSettings(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->loadSettings()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrefreshFontStyle(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshFontStyle()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetFlipLayVisiblity(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setFlipLayVisiblity()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetFontColor(Lcom/flyersoft/moonreaderp/PrefVisual;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->setFontColor(I)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$msetHyphenationValue(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setHyphenationValue()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetImageViewBlur(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;II)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flyersoft/moonreaderp/PrefVisual;->setImageViewBlur(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;II)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetShadowAlpha(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/view/View;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->setShadowAlpha(Landroid/view/View;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetTextDenseVisible(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setTextDenseVisible()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetTxtScroll2Margin(Lcom/flyersoft/moonreaderp/PrefVisual;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->setTxtScroll2Margin(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowBackgroundTypeIndicator(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showBackgroundTypeIndicator()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowFontWeightDialog(Lcom/flyersoft/moonreaderp/PrefVisual;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->showFontWeightDialog(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowHint(Lcom/flyersoft/moonreaderp/PrefVisual;F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->showHint(F)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowSaveThemeHint(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showSaveThemeHint()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowUsedFontName(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showUsedFontName()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateFontWeightImageAlphaValue(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->updateFontWeightImageAlphaValue()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 76
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 79
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->pref_visual:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x0

    .line 815
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->marginTipCount:I

    .line 1382
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->old_night_fontColor:I

    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->old_day_fontColor:I

    .line 80
    invoke-virtual {p0, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->scrollToTitle(Ljava/lang/String;)V

    return-void
.end method

.method private add(II)I
    .locals 1

    int-to-float v0, p1

    .line 803
    invoke-static {v0}, Lcom/flyersoft/tools/A;->vd(F)I

    move-result v0

    add-int/2addr v0, p2

    if-lez p2, :cond_1

    :goto_0
    add-int/lit8 p1, p1, 0x1

    int-to-float p2, p1

    .line 806
    invoke-static {p2}, Lcom/flyersoft/tools/A;->vd(F)I

    move-result p2

    if-lt p2, v0, :cond_0

    return p1

    :cond_0
    goto :goto_0

    :cond_1
    add-int/lit8 p1, p1, -0x1

    :goto_1
    int-to-float p2, p1

    .line 810
    invoke-static {p2}, Lcom/flyersoft/tools/A;->vd(F)I

    move-result p2

    if-ge p2, v0, :cond_2

    add-int/lit8 p1, p1, 0x1

    return p1

    :cond_2
    add-int/lit8 p1, p1, -0x1

    goto :goto_1
.end method

.method private adjustFontSpacing()V
    .locals 1

    .line 1513
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1515
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setFontSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 1516
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setFontSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 1517
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->clearCurlCache()V

    .line 1518
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    return-void
.end method

.method private adjustLineSpacing()V
    .locals 4

    .line 1503
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setLineSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 1504
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setLineSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 1505
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1506
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1507
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const-class v2, Lcom/flyersoft/staticlayout/MyFloatSpan;

    const/4 v3, 0x0

    invoke-interface {v0, v3, v1, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/MyFloatSpan;

    array-length v0, v0

    if-lez v0, :cond_0

    .line 1508
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    .line 1509
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->clearCurlCache()V

    return-void
.end method

.method private adjustParagraphSpacing(Z)V
    .locals 5

    .line 1484
    sget v0, Lcom/flyersoft/tools/A;->paragraphSpace:I

    const/16 v1, 0x14

    if-le v0, v1, :cond_0

    .line 1485
    sput v1, Lcom/flyersoft/tools/A;->paragraphSpace:I

    .line 1486
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->paragraphSpace:I

    const/4 v1, 0x0

    if-gez v0, :cond_1

    .line 1487
    sput v1, Lcom/flyersoft/tools/A;->paragraphSpace:I

    .line 1488
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setLineSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 1489
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setLineSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    if-eqz p1, :cond_2

    .line 1491
    sget-boolean p1, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    if-eqz p1, :cond_2

    sget p1, Lcom/flyersoft/tools/A;->paragraphSpace:I

    const/4 v0, 0x3

    if-le p1, v0, :cond_2

    .line 1492
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->disabled_by:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " \""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1493
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->trimBlacnkSpace:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1492
    invoke-static {p1, v0, v2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 1495
    :cond_2
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 1496
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 1497
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object p1

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const-class v2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    invoke-interface {p1, v1, v0, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/flyersoft/staticlayout/MyMarginSpan;

    array-length p1, p1

    if-lez p1, :cond_3

    .line 1498
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    .line 1499
    :cond_3
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->clearCurlCache()V

    return-void
.end method

.method private clearCurlCache()V
    .locals 2

    .line 1366
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1367
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetFlipCache()V

    .line 1368
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->forceNoCurlCache:Z

    .line 1369
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetPageCount()V

    :cond_0
    return-void
.end method

.method private createBackgroundBitmap(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;
    .locals 5

    if-eqz p1, :cond_2

    .line 1297
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1298
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1299
    sget v2, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v2

    if-eqz v2, :cond_0

    const/high16 v2, -0x1000000

    goto :goto_0

    :cond_0
    const/4 v2, -0x1

    :goto_0
    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 1300
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1301
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    const/16 p1, 0xff

    if-le p2, p1, :cond_1

    .line 1303
    invoke-direct {p0, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->getShadowPaintColor(I)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->drawColor(I)V

    :cond_1
    return-object v0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method private createBlurBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 5

    if-eqz p1, :cond_1

    if-gtz p2, :cond_0

    goto :goto_0

    .line 1333
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1334
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1335
    new-instance v2, Landroid/graphics/Paint;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    .line 1336
    new-instance v3, Landroid/graphics/BlurMaskFilter;

    int-to-float p2, p2

    sget-object v4, Landroid/graphics/BlurMaskFilter$Blur;->INNER:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v3, p2, v4}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    const/4 p2, 0x0

    .line 1337
    invoke-virtual {v1, p1, p2, p2, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-object v0

    :cond_1
    :goto_0
    return-object p1
.end method

.method private encodingError(Ljava/lang/String;)Z
    .locals 5

    .line 411
    const-string v0, "AUTO"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 413
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/DataInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    sget-object v4, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 419
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    .line 415
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 416
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unsupported Encoding Exception: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private eraseGPUShadow()V
    .locals 2

    .line 1522
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1523
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->eraseGPUShadow(I)V

    :cond_0
    return-void
.end method

.method private getAlaphaText(I)Ljava/lang/String;
    .locals 3

    mul-int/lit8 v0, p1, 0x64

    const/16 v1, 0xff

    .line 1269
    div-int/2addr v0, v1

    const/16 v2, 0x77

    if-ne v0, v2, :cond_0

    const/16 v0, 0x78

    :cond_0
    const/16 v2, 0x64

    if-ne v0, v2, :cond_1

    if-ge p1, v1, :cond_1

    const/16 v0, 0x63

    :cond_1
    if-ne v0, v2, :cond_2

    if-le p1, v1, :cond_2

    const/16 v0, 0x65

    .line 1276
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "%"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static getNewFlipAnimations(Landroid/content/Context;)[Ljava/lang/String;
    .locals 10

    .line 355
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$array;->flip_animation_list:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 357
    aget-object v2, v0, v1

    .line 358
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "(Apple) "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    aget-object v4, v0, v3

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 359
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "(Google) "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v3, v0, v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x2

    .line 360
    aget-object v5, v0, v3

    const/4 v3, 0x3

    .line 361
    aget-object v6, v0, v3

    const/4 v3, 0x4

    .line 362
    aget-object v7, v0, v3

    .line 363
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->slide_horizontal:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 364
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->slide_vertical:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object v3, v1

    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getShadowPaintColor(I)I
    .locals 2

    const/16 v0, 0xff

    sub-int/2addr p1, v0

    const/16 v1, 0x32

    if-le p1, v1, :cond_0

    const/16 p1, 0x32

    .line 1291
    :cond_0
    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1292
    :goto_0
    invoke-static {p1, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    return p1
.end method

.method private justifiedOptionClick(Landroid/view/View;)V
    .locals 6

    .line 1399
    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->textJustified:Z

    .line 1400
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto/16 :goto_2

    .line 1402
    :cond_0
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->clearLrCache()V

    .line 1403
    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->clearLrCache()V

    .line 1405
    sget-boolean p1, Lcom/flyersoft/tools/A;->textHyphenation:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 1406
    sget-object p1, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->setTxtScrollPadding(Landroid/widget/ScrollView;Z)V

    .line 1407
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setTxtScroll2Margin(Z)V

    .line 1408
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    goto :goto_0

    .line 1410
    :cond_1
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p1, :cond_2

    .line 1411
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1412
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageFitScreen()Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-virtual {p1}, Landroid/widget/ScrollView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    .line 1413
    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1415
    :cond_2
    sget-boolean p1, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz p1, :cond_3

    .line 1416
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    .line 1419
    :cond_3
    :goto_0
    sget-object p1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz p1, :cond_7

    sget-boolean p1, Lcom/flyersoft/tools/A;->textJustified:Z

    if-nez p1, :cond_7

    .line 1420
    sget p1, Lcom/flyersoft/staticlayout/MRTextView;->global_alignment:I

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-ne p1, v2, :cond_4

    const/4 v0, 0x1

    :cond_4
    if-nez v0, :cond_6

    .line 1422
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p1

    sget-object v3, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result p1

    .line 1423
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3, p1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result v3

    if-ne v3, v2, :cond_5

    goto :goto_1

    .line 1426
    :cond_5
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    sget-object v4, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v4}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v4

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v5

    div-int/2addr v5, v2

    add-int/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v3

    if-eq v3, p1, :cond_6

    .line 1428
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result p1

    if-ne p1, v2, :cond_6

    goto :goto_1

    :cond_6
    move v1, v0

    :goto_1
    if-eqz v1, :cond_7

    .line 1434
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->align_justified:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1435
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->css_justified_tip:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "<br><br><b>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1436
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "</b> -> <b>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1437
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->disable_css:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "</b>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1435
    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    .line 1434
    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_7
    :goto_2
    return-void
.end method

.method private loadSettings()V
    .locals 5

    .line 431
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontBold:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontBold:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 432
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontItalic:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontItalic:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 433
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontUnderline:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontUnderline:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 434
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontShadow:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontShadow:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 435
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontAnti:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontAnti:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 436
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvTextJustified:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->textJustified:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 437
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvHyphenation:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->textHyphenation:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 438
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvCJK:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->textCJK:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 439
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvDense:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->textDense:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 440
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvVertical:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 441
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->jian2fan:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->textJian2Fan:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 442
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fan2jian:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->textFan2Jian:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 444
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setSytleMaterialSwitchEvents()V

    .line 446
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fontColorLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 447
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backColorLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 448
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backImageLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 449
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fontNameLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 453
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontColor:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    sget v2, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 454
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fontColorTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefColorPick;->colorToHex(IZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 455
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    sget v4, Lcom/flyersoft/tools/A;->backgroundColor:I

    invoke-direct {v1, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 456
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backColorTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->backgroundColor:I

    invoke-static {v1, v2, v2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->colorToHex(IZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 457
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBackgroundImages(Z)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getBackgroundImageFile()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3, v3}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/util/ArrayList;Ljava/lang/String;II)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 459
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvBackgroundImage:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-virtual {v1, v0}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 461
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showUsedFontName()V

    .line 463
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->paraSpace:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    const/16 v1, 0xa

    .line 464
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setStep(I)V

    .line 465
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$7;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$7;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 473
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lineSpace:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    .line 474
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$8;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$8;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 482
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fontSpace:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    .line 483
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$9;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$9;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 491
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fontScale:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    .line 492
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$10;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$10;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 500
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->topMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    .line 501
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$11;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$11;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 509
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bottomMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    .line 510
    invoke-static {}, Lcom/flyersoft/tools/A;->MAX_MARGIN()I

    move-result v1

    sget v3, Lcom/flyersoft/tools/A;->bottomMargin:I

    int-to-float v3, v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->vdr(F)I

    move-result v3

    invoke-virtual {v0, v2, v1, v3}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 511
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$12;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$12;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 519
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->leftMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    .line 520
    invoke-static {}, Lcom/flyersoft/tools/A;->MAX_MARGIN()I

    move-result v1

    sget v3, Lcom/flyersoft/tools/A;->leftMargin:I

    int-to-float v3, v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->vdr(F)I

    move-result v3

    invoke-virtual {v0, v2, v1, v3}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 521
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$13;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$13;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 533
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rightMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    .line 534
    invoke-static {}, Lcom/flyersoft/tools/A;->MAX_MARGIN()I

    move-result v1

    sget v3, Lcom/flyersoft/tools/A;->rightMargin:I

    int-to-float v3, v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->vdr(F)I

    move-result v3

    invoke-virtual {v0, v2, v1, v3}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 535
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$14;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$14;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    return-void
.end method

.method private refreshFontStyle()V
    .locals 1

    .line 1374
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1376
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->setTxtViewTypeface()V

    .line 1377
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1378
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1379
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->clearCurlCache()V

    return-void
.end method

.method private refreshTxtRender()V
    .locals 1

    .line 856
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v0, :cond_0

    .line 857
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->refreshTxtRender()V

    :cond_0
    return-void
.end method

.method private renderFlipSelected()V
    .locals 5

    .line 220
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, 0x441e88e5

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 221
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip0:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move-object v2, v0

    goto :goto_0

    :cond_0
    move-object v2, v3

    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 222
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip1:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v4, 0x1

    if-ne v2, v4, :cond_1

    move-object v2, v0

    goto :goto_1

    :cond_1
    move-object v2, v3

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 223
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v4, 0x2

    if-ne v2, v4, :cond_2

    move-object v2, v0

    goto :goto_2

    :cond_2
    move-object v2, v3

    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 224
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip3:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v4, 0x3

    if-ne v2, v4, :cond_3

    move-object v2, v0

    goto :goto_3

    :cond_3
    move-object v2, v3

    :goto_3
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 225
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip4:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v4, 0x4

    if-ne v2, v4, :cond_4

    move-object v2, v0

    goto :goto_4

    :cond_4
    move-object v2, v3

    :goto_4
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 226
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip5:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v4, 0x5

    if-ne v2, v4, :cond_5

    move-object v2, v0

    goto :goto_5

    :cond_5
    move-object v2, v3

    :goto_5
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 227
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip6:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v4, 0x6

    if-ne v2, v4, :cond_6

    move-object v2, v0

    goto :goto_6

    :cond_6
    move-object v2, v3

    :goto_6
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 228
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip7:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v4, 0x7

    if-ne v2, v4, :cond_7

    goto :goto_7

    :cond_7
    move-object v0, v3

    :goto_7
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private setBackgroundTransparency()V
    .locals 11

    .line 1156
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->pref_transparency:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1157
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/ImageView;

    .line 1158
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->alpha:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/SeekBar;

    .line 1159
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->blur:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/SeekBar;

    .line 1160
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->shadowFrame:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 1162
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->frame:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v2

    const/4 v9, -0x1

    if-eqz v2, :cond_0

    const/high16 v2, -0x1000000

    goto :goto_0

    :cond_0
    const/4 v2, -0x1

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    const/16 v1, 0x131

    .line 1163
    invoke-virtual {v4, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 1164
    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getImageAlpha(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v4, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1165
    invoke-static {}, Lcom/flyersoft/tools/A;->getMaxBlur()I

    move-result v1

    invoke-virtual {v5, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 1166
    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getImageBlur(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v5, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1167
    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1168
    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    invoke-virtual {v5}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    invoke-direct {p0, v6, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefVisual;->setImageViewBlur(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;II)V

    .line 1169
    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    invoke-direct {p0, v8, v2}, Lcom/flyersoft/moonreaderp/PrefVisual;->setShadowAlpha(Landroid/view/View;I)V

    .line 1171
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefVisual$36;

    invoke-direct {v2, p0, v6, v8}, Lcom/flyersoft/moonreaderp/PrefVisual$36;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/widget/ImageView;Landroid/view/View;)V

    invoke-virtual {v4, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 1189
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefVisual$37;

    invoke-direct {v2, p0, v1, v6, v4}, Lcom/flyersoft/moonreaderp/PrefVisual$37;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView;Landroid/widget/SeekBar;)V

    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 1205
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->reset:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->reset:I

    invoke-virtual {v3, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1206
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->reset:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefVisual$38;

    move-object v3, p0

    move-object v7, v6

    move-object v6, v1

    invoke-direct/range {v2 .. v8}, Lcom/flyersoft/moonreaderp/PrefVisual$38;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView;Landroid/view/View;)V

    move-object v6, v7

    invoke-virtual {v10, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1218
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 1220
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->alertDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    move-result-object v7

    .line 1221
    invoke-static {v7}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    .line 1222
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1223
    invoke-virtual {v7}, Landroidx/appcompat/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, -0x2

    invoke-virtual {v1, v9, v2}, Landroid/view/Window;->setLayout(II)V

    .line 1225
    :cond_1
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->Positive:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefVisual$39;

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefVisual$39;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/ImageView;Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1260
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->Negative:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$40;

    invoke-direct {v1, p0, v7}, Lcom/flyersoft/moonreaderp/PrefVisual$40;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroidx/appcompat/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private setEncodeValue()V
    .locals 4

    .line 313
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvEncode:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->encodeSp:Landroid/widget/Spinner;

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 315
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getTextEncodes()[Ljava/lang/CharSequence;

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 316
    invoke-static {}, Lcom/flyersoft/tools/A;->getTextEncodes()[Ljava/lang/CharSequence;

    move-result-object v2

    aget-object v2, v2, v1

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->fileEncoding:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 318
    :cond_1
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getTextEncodes()[Ljava/lang/CharSequence;

    move-result-object v2

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    if-lt v1, v2, :cond_2

    goto :goto_2

    :cond_2
    move v0, v1

    .line 320
    :goto_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->encodeSp:Landroid/widget/Spinner;

    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setSelection(I)V

    return-void
.end method

.method private setFlipImagesClick()V
    .locals 3

    .line 201
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$2;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 209
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip0:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip1:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip3:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 213
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip4:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 214
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip5:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip6:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 216
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->flip7:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private setFlipLayVisiblity()V
    .locals 4

    .line 425
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_speed_lay:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/flyersoft/tools/A;->isFlipNone()Z

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 426
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->flipResetLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->isFlipNone()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 427
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->renderFlipSelected()V

    return-void
.end method

.method private setFlipValue()V
    .locals 4

    .line 324
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->flip_speed_lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_speed_lay:Landroid/widget/LinearLayout;

    .line 325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFlipList:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_type_sp:Landroid/widget/Spinner;

    .line 326
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFlipSpeed:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_speed_sb:Landroid/widget/SeekBar;

    const/16 v1, 0x32

    .line 327
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 328
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_speed_sb:Landroid/widget/SeekBar;

    sget v1, Lcom/flyersoft/tools/A;->flipSpeed:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 330
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getNewFlipAnimations(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    .line 331
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1090008

    invoke-direct {v1, v2, v3, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v0, 0x1090009

    .line 332
    invoke-virtual {v1, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 334
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_type_sp:Landroid/widget/Spinner;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 335
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_type_sp:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 336
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_type_sp:Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->flip_animation:I

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 337
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setFlipLayVisiblity()V

    .line 338
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_type_sp:Landroid/widget/Spinner;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 340
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_speed_sb:Landroid/widget/SeekBar;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$5;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 351
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setSpinnerEvent()V

    return-void
.end method

.method private setFontColor(I)Z
    .locals 3

    .line 1460
    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    const/4 v1, 0x0

    if-eq p1, v0, :cond_2

    .line 1461
    sput p1, Lcom/flyersoft/tools/A;->fontColor:I

    .line 1462
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pvFontColor:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v2}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1463
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->fontColorTv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v2, 0x1

    invoke-static {p1, v1, v2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->colorToHex(IZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1464
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1465
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->setTextColor(I)V

    .line 1466
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->setTextColor(I)V

    .line 1468
    :cond_0
    sget-boolean p1, Lcom/flyersoft/tools/A;->fontShadow:Z

    if-eqz p1, :cond_1

    .line 1469
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshFontStyle()V

    .line 1470
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->clearCurlCache()V

    return v2

    :cond_2
    return v1
.end method

.method private setHyphenationValue()V
    .locals 4

    .line 303
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->hyphLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->hyphLay:Landroid/widget/LinearLayout;

    .line 304
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->hyphList:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->hyphSp:Landroid/widget/Spinner;

    .line 305
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->hyphLay:Landroid/widget/LinearLayout;

    sget-boolean v1, Lcom/flyersoft/tools/A;->textHyphenation:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 306
    sget-boolean v0, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz v0, :cond_2

    .line 307
    sget-object v0, Lcom/flyersoft/tools/A;->hyphenationLang:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->hyphenationIndex(Ljava/lang/String;)I

    move-result v0

    .line 308
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->hyphSp:Landroid/widget/Spinner;

    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    move v2, v0

    :cond_1
    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    :cond_2
    return-void
.end method

.method private setImageViewBlur(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;II)V
    .locals 1

    if-eqz p2, :cond_2

    const/16 v0, 0xff

    if-le p3, v0, :cond_0

    const/16 p3, 0xff

    :cond_0
    if-nez p4, :cond_1

    .line 1315
    :try_start_0
    invoke-virtual {p2, p3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1316
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 1318
    :cond_1
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1319
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/blurry/Blurry;->with(Landroid/content/Context;)Lcom/flyersoft/tools/blurry/Blurry$Composer;

    move-result-object v0

    .line 1320
    invoke-virtual {v0, p4}, Lcom/flyersoft/tools/blurry/Blurry$Composer;->radius(I)Lcom/flyersoft/tools/blurry/Blurry$Composer;

    move-result-object p4

    const/4 v0, 0x1

    .line 1321
    invoke-virtual {p4, v0}, Lcom/flyersoft/tools/blurry/Blurry$Composer;->sampling(I)Lcom/flyersoft/tools/blurry/Blurry$Composer;

    move-result-object p4

    .line 1322
    invoke-static {p2}, Lcom/flyersoft/tools/T;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {p4, p2}, Lcom/flyersoft/tools/blurry/Blurry$Composer;->from(Landroid/graphics/Bitmap;)Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->into(Landroid/widget/ImageView;)V

    .line 1323
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 1326
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    return-void
.end method

.method private setNumberPicker()V
    .locals 4

    .line 248
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->numberPicker1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/example2014/components/NumberPicker;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    .line 249
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->numberPicker2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/example2014/components/NumberPicker;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    .line 250
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    sget v1, Lcom/flyersoft/tools/A;->minFontSize:I

    invoke-virtual {v0, v1}, Lcom/example2014/components/NumberPicker;->setMinValue(I)V

    .line 251
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    sget v1, Lcom/flyersoft/tools/A;->maxFontSize:I

    invoke-virtual {v0, v1}, Lcom/example2014/components/NumberPicker;->setMaxValue(I)V

    .line 252
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/example2014/components/NumberPicker;->setMinValue(I)V

    .line 253
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    const/16 v2, 0x9

    invoke-virtual {v0, v2}, Lcom/example2014/components/NumberPicker;->setMaxValue(I)V

    .line 254
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    sget v2, Lcom/flyersoft/tools/A;->fontSize:F

    float-to-int v2, v2

    invoke-virtual {v0, v2}, Lcom/example2014/components/NumberPicker;->setValue(I)V

    .line 258
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    sget v2, Lcom/flyersoft/tools/A;->fontSize:F

    sget v3, Lcom/flyersoft/tools/A;->fontSize:F

    float-to-int v3, v3

    int-to-float v3, v3

    rem-float/2addr v2, v3

    const/high16 v3, 0x41200000    # 10.0f

    mul-float v2, v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/example2014/components/NumberPicker;->setValue(I)V

    .line 260
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/example2014/components/NumberPicker;->setFocusable(Z)V

    .line 261
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0, v2}, Lcom/example2014/components/NumberPicker;->setFocusableInTouchMode(Z)V

    .line 262
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0, v1}, Lcom/example2014/components/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 263
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0, v2}, Lcom/example2014/components/NumberPicker;->setFocusable(Z)V

    .line 264
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0, v2}, Lcom/example2014/components/NumberPicker;->setFocusableInTouchMode(Z)V

    .line 265
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    invoke-virtual {v0, v1}, Lcom/example2014/components/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 266
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    iget-object v0, v0, Lcom/example2014/components/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    const v1, -0x111112

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 268
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    iget-object v0, v0, Lcom/example2014/components/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 271
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number1:Lcom/example2014/components/NumberPicker;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$3;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/example2014/components/NumberPicker;->setOnValueChangedListener(Lcom/example2014/components/NumberPicker$OnValueChangeListener;)V

    .line 284
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->number2:Lcom/example2014/components/NumberPicker;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$4;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/example2014/components/NumberPicker;->setOnValueChangedListener(Lcom/example2014/components/NumberPicker$OnValueChangeListener;)V

    return-void
.end method

.method private setShadowAlpha(Landroid/view/View;I)V
    .locals 1

    const/16 v0, 0xff

    if-gt p2, v0, :cond_0

    const/4 p2, 0x0

    .line 1281
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 1283
    :cond_0
    invoke-direct {p0, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->getShadowPaintColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method private setSpinnerEvent()V
    .locals 4

    .line 369
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$6;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PrefVisual$6;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/os/Looper;)V

    const/4 v1, 0x0

    const-wide/16 v2, 0x1f4

    .line 407
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private setSytleMaterialSwitchEvents()V
    .locals 2

    .line 566
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontBold:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$15;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$15;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 575
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontItalic:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$16;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$16;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 585
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontUnderline:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$17;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$17;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 619
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontShadow:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$18;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$18;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 634
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontAnti:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$19;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$19;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 644
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvTextJustified:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$20;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$20;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 653
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvHyphenation:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$21;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$21;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 671
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvCJK:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$22;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$22;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 687
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvDense:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$23;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$23;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 729
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvVertical:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$24;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$24;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 738
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->jian2fan:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$25;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$25;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 770
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fan2jian:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$26;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$26;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method

.method private setTextDenseVisible()V
    .locals 2

    .line 1362
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvDense:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->textCJK()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private setTxtScroll2Margin(Z)V
    .locals 1

    .line 1446
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1447
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageFitScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1448
    sget-object v0, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-static {v0, p1}, Lcom/flyersoft/tools/A;->setTxtScrollPadding(Landroid/widget/ScrollView;Z)V

    :cond_0
    return-void
.end method

.method private showBackgroundTypeIndicator()V
    .locals 4

    .line 243
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backgroundColorSelect:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 244
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backgroundImageSelect:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->useBackgroundImage:Z

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private showFontWeightDialog()V
    .locals 6

    .line 1098
    sget-boolean v0, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefFontPick;->hasCssFont()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1099
    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 1100
    invoke-static {v1, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getPageTextFonts(ZZ)Ljava/util/ArrayList;

    move-result-object v2

    .line 1101
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1102
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1103
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1104
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1105
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 1106
    invoke-virtual {v3, v1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1107
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 1108
    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->fontWeightSelected:I

    array-length v4, v0

    if-lt v2, v4, :cond_2

    .line 1109
    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->fontWeightSelected:I

    .line 1110
    :cond_2
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1111
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->font_weight:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " & "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->italic_skew:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->fontWeightSelected:I

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefVisual$34;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$34;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1112
    invoke-virtual {v1, v0, v2, v4}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$33;

    invoke-direct {v1, p0, v3}, Lcom/flyersoft/moonreaderp/PrefVisual$33;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;Ljava/util/ArrayList;)V

    const v2, 0x104000a

    .line 1117
    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1122
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 1126
    :cond_3
    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showFontWeightDialog(Ljava/lang/String;)V

    return-void
.end method

.method private showFontWeightDialog(Ljava/lang/String;)V
    .locals 4

    .line 1130
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1131
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefVisual$35;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$35;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    const/4 v3, -0x1

    invoke-static {v0, p1, v1, v3, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->doFontWeight(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Typeface;ILcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;)V

    return-void
.end method

.method private showHint(F)V
    .locals 4

    .line 1452
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/text/DecimalFormat;

    const-string v2, "0.0"

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    float-to-double v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showHint(I)V
    .locals 3

    .line 1456
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showSaveThemeHint()V
    .locals 4

    .line 1477
    sget-boolean v0, Lcom/flyersoft/tools/A;->saveThemeHint:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 1479
    sput-boolean v0, Lcom/flyersoft/tools/A;->saveThemeHint:Z

    .line 1480
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->tip:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->save_theme_hint:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showUsedFontName()V
    .locals 5

    .line 549
    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 550
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pvFontTextView:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 551
    sget-boolean v1, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefFontPick;->hasCssFont()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    .line 552
    invoke-static {v1, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getPageTextFonts(ZZ)Ljava/util/ArrayList;

    move-result-object v1

    .line 554
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-string v2, ""

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 555
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 556
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 557
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 558
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvFontTextView:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<br>"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 558
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 561
    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->updateFontWeightImageAlphaValue()V

    return-void
.end method

.method private showZoomValue()V
    .locals 5

    .line 232
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->paraSpace:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    sget v1, Lcom/flyersoft/tools/A;->paragraphSpace:I

    mul-int/lit8 v1, v1, 0xa

    const-string v2, "%"

    const/4 v3, 0x0

    const/16 v4, 0xc8

    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/flyersoft/views/CustomSeek;->init(IIILjava/lang/String;)V

    .line 233
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lineSpace:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    sget v1, Lcom/flyersoft/tools/A;->lineSpace:I

    const/4 v2, -0x5

    const/16 v4, 0x14

    invoke-virtual {v0, v2, v4, v1}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 234
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fontSpace:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    sget v1, Lcom/flyersoft/tools/A;->fontSpace:I

    const/4 v2, -0x4

    invoke-virtual {v0, v2, v4, v1}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 235
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fontScale:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    sget v1, Lcom/flyersoft/tools/A;->fontScale:I

    invoke-virtual {v0, v2, v4, v1}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 236
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->topMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    invoke-static {}, Lcom/flyersoft/tools/A;->MAX_MARGIN()I

    move-result v1

    sget v2, Lcom/flyersoft/tools/A;->topMargin:I

    int-to-float v2, v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->vdr(F)I

    move-result v2

    invoke-virtual {v0, v3, v1, v2}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 237
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bottomMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    invoke-static {}, Lcom/flyersoft/tools/A;->MAX_MARGIN()I

    move-result v1

    sget v2, Lcom/flyersoft/tools/A;->bottomMargin:I

    int-to-float v2, v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->vdr(F)I

    move-result v2

    invoke-virtual {v0, v3, v1, v2}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 238
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->leftMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    invoke-static {}, Lcom/flyersoft/tools/A;->MAX_MARGIN()I

    move-result v1

    sget v2, Lcom/flyersoft/tools/A;->leftMargin:I

    int-to-float v2, v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->vdr(F)I

    move-result v2

    invoke-virtual {v0, v3, v1, v2}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 239
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rightMargin:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    invoke-static {}, Lcom/flyersoft/tools/A;->MAX_MARGIN()I

    move-result v1

    sget v2, Lcom/flyersoft/tools/A;->rightMargin:I

    int-to-float v2, v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->vdr(F)I

    move-result v2

    invoke-virtual {v0, v3, v1, v2}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    return-void
.end method

.method private updateFontWeightImageAlphaValue()V
    .locals 6

    .line 1142
    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getFontWeight(Ljava/lang/String;)I

    move-result v0

    .line 1143
    sget v1, Lcom/flyersoft/tools/A;->DEFAULT_WEIGHT:I

    const-string v2, ": "

    if-eq v0, v1, :cond_0

    .line 1144
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->weightTv:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->font_weight:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1146
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->weightTv:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->font_weight:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1148
    :goto_0
    sget-object v0, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getImageAlpha(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0xff

    if-eq v0, v1, :cond_1

    .line 1150
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->transparentTv:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->transparency:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getAlaphaText(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 1152
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->transparentTv:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->transparency:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected adjustMargin()V
    .locals 7

    .line 818
    const-string v0, "</b>\" -> \"<b>"

    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->setMarginLimitation()V

    .line 819
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 820
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v2, 0x3b9

    .line 821
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    const-wide/16 v3, 0xfa

    .line 822
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 825
    :cond_0
    sget v1, Lcom/flyersoft/tools/A;->leftMargin:I

    if-eqz v1, :cond_1

    sget v1, Lcom/flyersoft/tools/A;->rightMargin:I

    if-nez v1, :cond_4

    .line 826
    :cond_1
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v1, :cond_4

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->marginTipCount:I

    const/4 v2, 0x2

    if-ge v1, v2, :cond_4

    .line 828
    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    sget-object v3, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v1

    .line 829
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v3

    iget v3, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-gtz v3, :cond_3

    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v3

    iget v3, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2

    goto :goto_0

    .line 832
    :cond_2
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    sget-object v5, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v5}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v5

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v6

    div-int/2addr v6, v2

    add-int/2addr v5, v6

    invoke-virtual {v3, v5}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v2

    if-eq v2, v1, :cond_4

    .line 834
    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v1

    iget v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpl-float v1, v1, v4

    if-gtz v1, :cond_3

    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v1

    iget v1, v1, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    cmpl-float v1, v1, v4

    if-lez v1, :cond_4

    .line 839
    :cond_3
    :goto_0
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->marginTipCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->marginTipCount:I

    .line 840
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->statubar_margin:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 841
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->css_margin_tip:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "<br><br>\"<b>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 842
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 843
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->disable_css:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 844
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->disable_css_styles:I

    const/4 v5, 0x6

    invoke-static {v0, v4, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</b>\""

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 841
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    .line 840
    invoke-static {v1, v2, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 850
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 852
    :cond_4
    :goto_1
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->clearCurlCache()V

    return-void
.end method

.method protected checkFontColor(Landroid/graphics/drawable/Drawable;I)V
    .locals 2

    if-nez p1, :cond_0

    goto :goto_0

    .line 1385
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getDrawableAboutColor(Landroid/graphics/drawable/Drawable;)I

    move-result p2

    :goto_0
    invoke-static {p2}, Lcom/flyersoft/tools/T;->getColorValue(I)I

    move-result p1

    .line 1386
    sget p2, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getColorValue(I)I

    move-result p2

    .line 1387
    sget v0, Lcom/flyersoft/tools/A;->fontColor:I

    const/16 v1, 0x7e

    if-ge p1, v1, :cond_2

    if-ge p2, v1, :cond_2

    .line 1389
    sget p1, Lcom/flyersoft/tools/A;->fontColor:I

    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->old_night_fontColor:I

    .line 1390
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->old_day_fontColor:I

    if-eqz p1, :cond_1

    :goto_1
    move v0, p1

    goto :goto_2

    :cond_1
    const p1, -0xb0b0c

    const v0, -0xb0b0c

    goto :goto_2

    :cond_2
    if-le p1, v1, :cond_4

    if-le p2, v1, :cond_4

    .line 1392
    sget p1, Lcom/flyersoft/tools/A;->fontColor:I

    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->old_day_fontColor:I

    .line 1393
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->old_night_fontColor:I

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    const p1, -0xdededf

    const v0, -0xdededf

    .line 1395
    :cond_4
    :goto_2
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setFontColor(I)Z

    return-void
.end method

.method public checkNightState()V
    .locals 3

    .line 104
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->headerMain:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/C;->amoledBlack3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 106
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvTopLine:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v1

    if-eqz v1, :cond_1

    const/high16 v1, 0x41c00000    # 24.0f

    goto :goto_0

    :cond_1
    const/high16 v1, 0x41000000    # 8.0f

    :goto_0
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public dismiss()V
    .locals 3

    .line 862
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->forFuncSearch:Z

    if-eqz v0, :cond_0

    .line 863
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 866
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    .line 867
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->prefvp:I

    .line 868
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_speed_sb:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->flipSpeed:I

    .line 869
    sget-boolean v0, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz v0, :cond_1

    .line 870
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$array;->hyphenation_code:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->hyphSp:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->hyphenationLang:Ljava/lang/String;

    .line 871
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->res:Landroid/content/Context;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 872
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method public fan2jianToggle(Lcom/google/android/material/materialswitch/MaterialSwitch;)V
    .locals 2

    const/4 v0, 0x1

    .line 1342
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 1343
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->jian2fan:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 1344
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 1346
    sput-boolean v1, Lcom/flyersoft/tools/A;->textJian2Fan:Z

    .line 1347
    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->textFan2Jian:Z

    .line 1348
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    return-void
.end method

.method public initView()V
    .locals 4

    .line 118
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->resumeTime:J

    .line 119
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 120
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    sput-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    .line 121
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    sput-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    .line 123
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->fileEncoding:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 124
    sget-object v0, Lcom/flyersoft/tools/A;->fileEncoding:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->fileEncoding:Ljava/lang/String;

    goto :goto_0

    .line 126
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->textEncode:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->fileEncoding:Ljava/lang/String;

    .line 127
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->fileEncoding:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 128
    const-string v0, "AUTO"

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->fileEncoding:Ljava/lang/String;

    .line 130
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvSaveToTheme:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->tvSaveTheme:Landroid/view/View;

    .line 131
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvLoadFromTheme:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->tvLoadTheme:Landroid/view/View;

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->settingButton1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->b1:Landroid/widget/Button;

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->settingButton2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->b2:Landroid/widget/Button;

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->b1:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->b2:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setNumberPicker()V

    .line 139
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->transparency:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->transparentTv:Landroid/widget/TextView;

    .line 140
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->weightTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->weightTv:Landroid/widget/TextView;

    .line 143
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->tvSaveTheme:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 145
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->tvLoadTheme:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvResetStyle:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvResetAlignment:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvResetSpace:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvResetMargin:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvResetFlip:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 152
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->loadSettings()V

    .line 153
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showBackgroundTypeIndicator()V

    .line 155
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvHyphenation:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-nez v1, :cond_3

    const/4 v1, 0x0

    goto :goto_1

    :cond_3
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 156
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvCJK:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    if-eqz v1, :cond_4

    const/4 v1, 0x0

    goto :goto_2

    :cond_4
    const/16 v1, 0x8

    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 157
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setTextDenseVisible()V

    .line 158
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvVertical:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    if-eqz v1, :cond_5

    const/4 v1, 0x0

    goto :goto_3

    :cond_5
    const/16 v1, 0x8

    :goto_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 159
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->jianfanLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz v1, :cond_6

    goto :goto_4

    :cond_6
    const/16 v2, 0x8

    :goto_4
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 160
    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7

    .line 161
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->encodeLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 165
    :cond_7
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setHyphenationValue()V

    .line 166
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setEncodeValue()V

    .line 167
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setFlipValue()V

    .line 168
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setFlipImagesClick()V

    .line 169
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showZoomValue()V

    .line 170
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->transparentTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_8

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_8

    .line 173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->encodeLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 174
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->flipLayout:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 177
    :cond_8
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->forFuncSearch:Z

    if-nez v0, :cond_9

    sget v0, Lcom/flyersoft/tools/A;->prefvp:I

    if-lez v0, :cond_9

    .line 178
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefVisual$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$1;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 188
    :cond_9
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_a

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-ge v0, v1, :cond_a

    .line 189
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$array;->charsets:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 190
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1090008

    invoke-direct {v1, v2, v3, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 191
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->encodeSp:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 192
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setEncodeValue()V

    .line 193
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$array;->hyphenation_list:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 194
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v3, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 195
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->hyphSp:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 196
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setHyphenationValue()V

    :cond_a
    return-void
.end method

.method public jian2FanToggle(Lcom/google/android/material/materialswitch/MaterialSwitch;)V
    .locals 2

    const/4 v0, 0x1

    .line 1352
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 1353
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fan2jian:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 1354
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 1356
    sput-boolean v1, Lcom/flyersoft/tools/A;->textFan2Jian:Z

    .line 1357
    invoke-virtual {p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->textJian2Fan:Z

    .line 1358
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 876
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->weightTv:Landroid/widget/TextView;

    if-ne v1, v2, :cond_0

    .line 877
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showFontWeightDialog()V

    .line 880
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    .line 881
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->transparency:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v2, v3, :cond_1

    .line 882
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setBackgroundTransparency()V

    goto/16 :goto_1

    .line 883
    :cond_1
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->fontColorLay:I

    if-ne v2, v3, :cond_2

    .line 884
    new-instance v6, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->res:Landroid/content/Context;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->font_color:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    sget v10, Lcom/flyersoft/tools/A;->fontColor:I

    new-instance v11, Lcom/flyersoft/moonreaderp/PrefVisual$27;

    invoke-direct {v11, v0}, Lcom/flyersoft/moonreaderp/PrefVisual$27;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    const/4 v9, 0x1

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 889
    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    goto/16 :goto_1

    .line 890
    :cond_2
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->backColorLay:I

    if-ne v2, v3, :cond_3

    .line 891
    new-instance v6, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->res:Landroid/content/Context;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->background_color:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    sget v10, Lcom/flyersoft/tools/A;->backgroundColor:I

    new-instance v11, Lcom/flyersoft/moonreaderp/PrefVisual$28;

    invoke-direct {v11, v0}, Lcom/flyersoft/moonreaderp/PrefVisual$28;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    const/4 v9, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 913
    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    goto/16 :goto_1

    .line 914
    :cond_3
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->backImageLay:I

    if-ne v2, v3, :cond_4

    .line 915
    new-instance v6, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->res:Landroid/content/Context;

    new-instance v8, Lcom/flyersoft/moonreaderp/PrefVisual$29;

    invoke-direct {v8, v0}, Lcom/flyersoft/moonreaderp/PrefVisual$29;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 940
    invoke-static {v4}, Lcom/flyersoft/tools/A;->getBackgroundImages(Z)Ljava/util/ArrayList;

    move-result-object v9

    sget-object v11, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    const/high16 v2, 0x42b40000    # 90.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v13

    const/high16 v2, 0x428c0000    # 70.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v14

    .line 941
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->background_image:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    sget-object v16, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    const/4 v10, 0x1

    const/4 v12, 0x1

    invoke-direct/range {v6 .. v16}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;Ljava/util/ArrayList;ZLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->show()V

    goto/16 :goto_1

    .line 942
    :cond_4
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvResetStyle:I

    const-string v6, ""

    if-ne v2, v3, :cond_6

    .line 943
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v3, Lcom/flyersoft/tools/A;->fontBold:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->fontItalic:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->fontUnderline:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->fontShadow:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->fontAnti:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 944
    invoke-static {}, Lcom/flyersoft/tools/A;->set_default_fontStyle()V

    .line 945
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontBold:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontItalic:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontUnderline:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontShadow:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontAnti:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 946
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 947
    sget-object v2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v2, :cond_5

    .line 948
    sget-object v2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    const/4 v3, 0x0

    const/high16 v6, -0x1000000

    invoke-virtual {v2, v3, v3, v3, v6}, Lcom/flyersoft/staticlayout/MRTextView;->setShadowLayer(FFFI)V

    .line 949
    sget-object v2, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2, v3, v3, v3, v6}, Lcom/flyersoft/staticlayout/MRTextView;->setShadowLayer(FFFI)V

    .line 950
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshFontStyle()V

    .line 953
    :cond_5
    iput-boolean v4, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 954
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvFontBold:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 955
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvFontItalic:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 956
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvFontUnderline:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 957
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvFontShadow:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 958
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvFontAnti:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v4}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 959
    iput-boolean v5, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    goto/16 :goto_1

    .line 961
    :cond_6
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvResetAlignment:I

    if-ne v2, v3, :cond_8

    .line 962
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v3, Lcom/flyersoft/tools/A;->textJustified:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->textHyphenation:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->textCJK:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->textDense:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->textDensePunc:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->textJian2Fan:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->textFan2Jian:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 964
    invoke-static {}, Lcom/flyersoft/tools/A;->set_default_alignment()V

    .line 965
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v6, Lcom/flyersoft/tools/A;->textJustified:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->textHyphenation:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->textCJK:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->textDense:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->textDensePunc:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->textJian2Fan:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    sget-boolean v6, Lcom/flyersoft/tools/A;->textFan2Jian:Z

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 967
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 968
    iput-boolean v4, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 969
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvTextJustified:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->textJustified:Z

    invoke-virtual {v2, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 970
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvHyphenation:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 971
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvCJK:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 972
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvDense:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 973
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvVertical:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 974
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->jian2fan:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 975
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->fan2jian:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v2, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 976
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->hyphLay:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    sget-boolean v3, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz v3, :cond_7

    const/4 v3, 0x0

    goto :goto_0

    :cond_7
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 977
    iput-boolean v5, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 978
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshTxtRender()V

    goto/16 :goto_1

    .line 980
    :cond_8
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvResetSpace:I

    if-ne v2, v3, :cond_b

    .line 981
    sget v2, Lcom/flyersoft/tools/A;->paragraphSpace:I

    .line 982
    invoke-static {}, Lcom/flyersoft/tools/A;->set_default_Space()V

    .line 984
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->setFontSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 985
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->setLineSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 986
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageFitScreen()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 987
    sget-object v3, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->setFontSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 988
    sget-object v3, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->setLineSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 990
    :cond_9
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->refreshFontStyle()V

    .line 992
    sget v3, Lcom/flyersoft/tools/A;->paragraphSpace:I

    if-eq v2, v3, :cond_a

    .line 993
    invoke-direct {v0, v5}, Lcom/flyersoft/moonreaderp/PrefVisual;->adjustParagraphSpacing(Z)V

    .line 995
    :cond_a
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showZoomValue()V

    goto :goto_1

    .line 996
    :cond_b
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvResetMargin:I

    if-ne v2, v3, :cond_d

    .line 997
    invoke-static {}, Lcom/flyersoft/tools/A;->set_default_Margin()V

    .line 998
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 999
    sget-object v2, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-static {v2, v4}, Lcom/flyersoft/tools/A;->setTxtScrollPadding(Landroid/widget/ScrollView;Z)V

    .line 1000
    invoke-direct {v0, v4}, Lcom/flyersoft/moonreaderp/PrefVisual;->setTxtScroll2Margin(Z)V

    .line 1001
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->checkBottomHalfLine()V

    .line 1002
    sget-object v2, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->invalidate()V

    .line 1003
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->clearCurlCache()V

    .line 1005
    :cond_c
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->showZoomValue()V

    goto :goto_1

    .line 1006
    :cond_d
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pvResetFlip:I

    if-ne v2, v3, :cond_e

    .line 1007
    invoke-static {}, Lcom/flyersoft/tools/A;->set_default_flip()V

    .line 1008
    sget v2, Lcom/flyersoft/tools/A;->flip_ebook:I

    sput v2, Lcom/flyersoft/tools/A;->flip_animation:I

    .line 1009
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->setFlipValue()V

    goto :goto_1

    .line 1010
    :cond_e
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->fontNameLay:I

    if-ne v2, v3, :cond_f

    .line 1011
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->res:Landroid/content/Context;

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefVisual$30;

    invoke-direct {v6, v0}, Lcom/flyersoft/moonreaderp/PrefVisual$30;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    sget-object v7, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-direct {v2, v3, v6, v7, v4}, Lcom/flyersoft/moonreaderp/PrefFontPick;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;Ljava/lang/String;Z)V

    .line 1039
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->show()V

    .line 1042
    :cond_f
    :goto_1
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->tvSaveTheme:Landroid/view/View;

    const-string v3, "Please open a book first to do this."

    if-ne v1, v2, :cond_11

    .line 1043
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 1044
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 1048
    :cond_10
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->res:Landroid/content/Context;

    new-instance v7, Lcom/flyersoft/moonreaderp/PrefVisual$31;

    invoke-direct {v7, v0}, Lcom/flyersoft/moonreaderp/PrefVisual$31;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    invoke-direct {v2, v6, v7, v4}, Lcom/flyersoft/moonreaderp/PrefTheme;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;Z)V

    .line 1052
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefTheme;->show()V

    .line 1055
    :cond_11
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->tvLoadTheme:Landroid/view/View;

    if-ne v1, v2, :cond_13

    .line 1056
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1057
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 1061
    :cond_12
    sget-boolean v2, Lcom/flyersoft/tools/A;->fontItalic:Z

    .line 1062
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v4, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->res:Landroid/content/Context;

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefVisual$32;

    invoke-direct {v6, v0, v2}, Lcom/flyersoft/moonreaderp/PrefVisual$32;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual;Z)V

    invoke-direct {v3, v4, v6, v5}, Lcom/flyersoft/moonreaderp/PrefTheme;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;Z)V

    .line 1075
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefTheme;->show()V

    .line 1079
    :cond_13
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->b1:Landroid/widget/Button;

    if-ne v1, v2, :cond_15

    .line 1080
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->cancel()V

    .line 1081
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 1082
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showControlOptions()V

    goto :goto_2

    .line 1084
    :cond_14
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/moonreaderp/PrefControl;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefControl;->show()V

    .line 1087
    :cond_15
    :goto_2
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->b2:Landroid/widget/Button;

    if-ne v1, v2, :cond_17

    .line 1088
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->cancel()V

    .line 1089
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 1090
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showMiscOptions()V

    return-void

    .line 1092
    :cond_16
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->show()V

    :cond_17
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 85
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 86
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->forFuncSearch:Z

    if-nez p1, :cond_0

    .line 87
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefVisual;->selfPref:Lcom/flyersoft/moonreaderp/PrefVisual;

    .line 88
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->initView()V

    .line 89
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenHeight()I

    move-result p1

    .line 90
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object v0

    const/4 v1, 0x0

    .line 91
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object v0

    const/16 v1, 0x51

    .line 92
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setGravity(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object v0

    .line 93
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v1

    if-nez v1, :cond_1

    mul-int/lit8 p1, p1, 0x4

    div-int/lit8 p1, p1, 0x5

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    :goto_0
    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 95
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual;->res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->visual_options:I

    .line 96
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 97
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 98
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 100
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefVisual;->checkNightState()V

    return-void
.end method
