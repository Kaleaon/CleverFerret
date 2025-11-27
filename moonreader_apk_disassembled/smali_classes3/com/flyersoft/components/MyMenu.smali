.class public Lcom/flyersoft/components/MyMenu;
.super Ljava/lang/Object;
.source "MyMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/MyMenu$MenuItemClick;,
        Lcom/flyersoft/components/MyMenu$MenuItemLongClick;,
        Lcom/flyersoft/components/MyMenu$MyMenuAdapter;
    }
.end annotation


# static fields
.field private static final DIVIDER_COLOR:I = -0x616162

.field public static final ITEM_DARK:I = -0x111112

.field public static final ITEM_LIGHT:I = -0xdededf

.field public static SELECT_END:Ljava/lang/String; = " \u2714"

.field private static amoledMenuDrawable:Landroid/graphics/drawable/Drawable; = null

.field private static text_size:F = 16.0f


# instance fields
.field animationStyle:I

.field backgroundDrawable:Landroid/graphics/drawable/Drawable;

.field builderAnchor:Landroid/view/View;

.field forceWidth:I

.field height:I

.field inited:Z

.field itemBackgroundColors:[I

.field items:[Ljava/lang/CharSequence;

.field public listView:Landroid/widget/ListView;

.field mAnchor:Landroid/view/View;

.field mContext:Landroid/content/Context;

.field private mOnDismissListener:Landroid/widget/PopupWindow$OnDismissListener;

.field mTextColor:I

.field private maxHeight:I

.field minWidth:I

.field onItemClick:Lcom/flyersoft/components/MyMenu$MenuItemClick;

.field onItemLongClick:Lcom/flyersoft/components/MyMenu$MenuItemLongClick;

.field public popupWindow:Landroid/widget/PopupWindow;

.field rightAnimatOnly:Z

.field shadowText:Z

.field title:Ljava/lang/CharSequence;

.field topBar:Landroid/view/View;

.field truncateAt:Landroid/text/TextUtils$TruncateAt;

.field width:I


# direct methods
.method static bridge synthetic -$$Nest$fgetmOnDismissListener(Lcom/flyersoft/components/MyMenu;)Landroid/widget/PopupWindow$OnDismissListener;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/components/MyMenu;->mOnDismissListener:Landroid/widget/PopupWindow$OnDismissListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$msetTextViewHtmlProperties(Lcom/flyersoft/components/MyMenu;Landroid/widget/TextView;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/MyMenu;->setTextViewHtmlProperties(Landroid/widget/TextView;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetTextViewProperties(Lcom/flyersoft/components/MyMenu;Landroid/widget/TextView;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/MyMenu;->setTextViewProperties(Landroid/widget/TextView;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    iput-object v0, p0, Lcom/flyersoft/components/MyMenu;->truncateAt:Landroid/text/TextUtils$TruncateAt;

    const/4 v0, 0x0

    .line 212
    iput v0, p0, Lcom/flyersoft/components/MyMenu;->maxHeight:I

    .line 67
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static addItemDescription(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 527
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<br>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static colorFilter(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 501
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 502
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, p2, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    return-object p0
.end method

.method private static d(I)I
    .locals 0

    int-to-float p0, p0

    .line 382
    invoke-static {p0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p0

    return p0
.end method

.method private getMeasured(Ljava/lang/CharSequence;I)[I
    .locals 3

    .line 283
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 284
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "#html#"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 285
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x6

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    .line 286
    invoke-direct {p0, v0}, Lcom/flyersoft/components/MyMenu;->setTextViewHtmlProperties(Landroid/widget/TextView;)V

    goto :goto_0

    .line 288
    :cond_0
    invoke-direct {p0, v0}, Lcom/flyersoft/components/MyMenu;->setTextViewProperties(Landroid/widget/TextView;)V

    .line 289
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-lez p2, :cond_1

    int-to-float p1, p2

    goto :goto_1

    .line 290
    :cond_1
    sget p1, Lcom/flyersoft/components/MyMenu;->text_size:F

    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p1, 0x0

    .line 291
    invoke-virtual {v0, p1, p1}, Landroid/widget/TextView;->measure(II)V

    .line 292
    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result p2

    filled-new-array {p1, p2}, [I

    move-result-object p1

    return-object p1
.end method

.method public static getMenuBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 485
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 486
    sget-object v0, Lcom/flyersoft/components/MyMenu;->amoledMenuDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 487
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dialog_full_holo_dark:I

    sget v1, Lcom/flyersoft/tools/C;->amoledBlack4:I

    invoke-static {p0, v0, v1}, Lcom/flyersoft/components/MyMenu;->colorFilter(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    sput-object p0, Lcom/flyersoft/components/MyMenu;->amoledMenuDrawable:Landroid/graphics/drawable/Drawable;

    .line 488
    :cond_0
    sget-object p0, Lcom/flyersoft/components/MyMenu;->amoledMenuDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0

    .line 490
    :cond_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    .line 491
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 492
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dialog_full_holo_dark:I

    invoke-static {}, Lcom/flyersoft/tools/C;->menuDynamicColor()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/flyersoft/components/MyMenu;->colorFilter(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 494
    :cond_2
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dialog_full_holo_light:I

    invoke-static {}, Lcom/flyersoft/tools/C;->menuDynamicColor()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/flyersoft/components/MyMenu;->colorFilter(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 496
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 497
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dialog_full_holo_dark:I

    goto :goto_0

    :cond_4
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dialog_full_holo_light:I

    .line 496
    :goto_0
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static getTypeface()Landroid/graphics/Typeface;
    .locals 2

    .line 386
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method private getWidthHeight(I)V
    .locals 8

    .line 215
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->items:[Ljava/lang/CharSequence;

    array-length v0, v0

    const/4 v1, 0x2

    new-array v2, v1, [I

    const/4 v3, 0x1

    aput v1, v2, v3

    const/4 v4, 0x0

    aput v0, v2, v4

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    const/4 v2, 0x0

    .line 216
    :goto_0
    iget-object v5, p0, Lcom/flyersoft/components/MyMenu;->items:[Ljava/lang/CharSequence;

    array-length v6, v5

    if-ge v2, v6, :cond_0

    .line 217
    aget-object v5, v5, v2

    const/4 v6, -0x1

    invoke-direct {p0, v5, v6}, Lcom/flyersoft/components/MyMenu;->getMeasured(Ljava/lang/CharSequence;I)[I

    move-result-object v5

    aput-object v5, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 219
    :cond_0
    iput v4, p0, Lcom/flyersoft/components/MyMenu;->height:I

    const/4 v2, 0x0

    .line 220
    :goto_1
    array-length v5, v0

    if-ge v2, v5, :cond_2

    .line 221
    iget-object v5, p0, Lcom/flyersoft/components/MyMenu;->items:[Ljava/lang/CharSequence;

    aget-object v5, v5, v2

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 222
    iget v5, p0, Lcom/flyersoft/components/MyMenu;->height:I

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    add-int/2addr v5, v6

    iput v5, p0, Lcom/flyersoft/components/MyMenu;->height:I

    goto :goto_2

    .line 224
    :cond_1
    iget v5, p0, Lcom/flyersoft/components/MyMenu;->height:I

    aget-object v6, v0, v2

    aget v6, v6, v3

    add-int/2addr v5, v6

    iput v5, p0, Lcom/flyersoft/components/MyMenu;->height:I

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 227
    :cond_2
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 228
    iget-object v5, p0, Lcom/flyersoft/components/MyMenu;->backgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 229
    iget v5, p0, Lcom/flyersoft/components/MyMenu;->height:I

    iget v6, v2, Landroid/graphics/Rect;->top:I

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v6, v2

    add-int/2addr v5, v6

    iput v5, p0, Lcom/flyersoft/components/MyMenu;->height:I

    .line 231
    iget-object v2, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 232
    iget-object v5, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 234
    iget-object v6, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    if-eqz v6, :cond_b

    if-le v2, v5, :cond_3

    move v2, v5

    :cond_3
    if-nez p1, :cond_9

    const/4 v6, 0x0

    .line 237
    :goto_3
    iget-object v7, p0, Lcom/flyersoft/components/MyMenu;->items:[Ljava/lang/CharSequence;

    array-length v7, v7

    if-ge v6, v7, :cond_5

    .line 238
    aget-object v7, v0, v6

    aget v7, v7, v4

    if-le v7, p1, :cond_4

    move p1, v7

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 241
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->title:Ljava/lang/CharSequence;

    if-eqz v0, :cond_6

    const/16 v6, 0x12

    .line 242
    invoke-direct {p0, v0, v6}, Lcom/flyersoft/components/MyMenu;->getMeasured(Ljava/lang/CharSequence;I)[I

    move-result-object v0

    aget v0, v0, v4

    if-le v0, p1, :cond_6

    move p1, v0

    .line 245
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->title:Ljava/lang/CharSequence;

    if-eqz v0, :cond_7

    invoke-static {v1}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v0

    add-int/2addr p1, v0

    :cond_7
    const/16 v0, 0x18

    .line 246
    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v0

    add-int/2addr p1, v0

    if-le p1, v2, :cond_8

    move p1, v2

    goto :goto_4

    :cond_8
    const/16 v0, 0xbe

    .line 249
    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v4

    if-ge p1, v4, :cond_9

    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v4

    if-le v2, v4, :cond_9

    .line 250
    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result p1

    .line 252
    :cond_9
    :goto_4
    new-array v0, v1, [I

    .line 253
    iget-object v2, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    invoke-static {v2, v0}, Lcom/flyersoft/tools/A;->getLocationOnScreen(Landroid/view/View;[I)V

    .line 254
    aget v2, v0, v3

    iget-object v4, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    div-int/2addr v4, v1

    add-int/2addr v2, v4

    div-int/lit8 v1, v5, 0x2

    if-ge v2, v1, :cond_a

    .line 255
    aget v0, v0, v3

    sub-int/2addr v5, v0

    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr v5, v0

    goto :goto_5

    :cond_a
    aget v5, v0, v3

    :goto_5
    iput v5, p0, Lcom/flyersoft/components/MyMenu;->maxHeight:I

    const/4 v0, 0x4

    .line 256
    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v0

    sub-int/2addr v5, v0

    iput v5, p0, Lcom/flyersoft/components/MyMenu;->maxHeight:I

    .line 257
    iput p1, p0, Lcom/flyersoft/components/MyMenu;->width:I

    .line 258
    iget v0, p0, Lcom/flyersoft/components/MyMenu;->minWidth:I

    if-lez v0, :cond_f

    if-ge p1, v0, :cond_f

    .line 259
    iput v0, p0, Lcom/flyersoft/components/MyMenu;->width:I

    goto :goto_8

    .line 261
    :cond_b
    sget-boolean p1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz p1, :cond_d

    if-ge v2, v5, :cond_c

    mul-int/lit16 v2, v2, 0x2a3

    .line 262
    div-int/lit16 v2, v2, 0x3e8

    goto :goto_6

    :cond_c
    mul-int/lit16 v2, v2, 0x1a9

    div-int/lit16 v2, v2, 0x3e8

    :goto_6
    iput v2, p0, Lcom/flyersoft/components/MyMenu;->width:I

    mul-int/lit16 v5, v5, 0x3c0

    .line 263
    div-int/lit16 v5, v5, 0x3e8

    iput v5, p0, Lcom/flyersoft/components/MyMenu;->maxHeight:I

    goto :goto_8

    :cond_d
    if-ge v2, v5, :cond_e

    mul-int/lit16 v2, v2, 0x39d

    .line 265
    div-int/lit16 v2, v2, 0x3e8

    goto :goto_7

    :cond_e
    move v2, v5

    :goto_7
    iput v2, p0, Lcom/flyersoft/components/MyMenu;->width:I

    mul-int/lit16 v5, v5, 0x3bb

    .line 266
    div-int/lit16 v5, v5, 0x3e8

    iput v5, p0, Lcom/flyersoft/components/MyMenu;->maxHeight:I

    .line 270
    :cond_f
    :goto_8
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu;->topBar:Landroid/view/View;

    if-eqz p1, :cond_10

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_10

    .line 271
    iget p1, p0, Lcom/flyersoft/components/MyMenu;->height:I

    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->topBar:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr p1, v0

    iput p1, p0, Lcom/flyersoft/components/MyMenu;->height:I

    .line 274
    :cond_10
    iget p1, p0, Lcom/flyersoft/components/MyMenu;->height:I

    iget v0, p0, Lcom/flyersoft/components/MyMenu;->maxHeight:I

    if-le p1, v0, :cond_11

    .line 275
    iput v0, p0, Lcom/flyersoft/components/MyMenu;->height:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 278
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_11
    return-void
.end method

.method public static getXoffInDialog(Landroid/view/View;)I
    .locals 2

    .line 508
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    if-eqz p0, :cond_0

    .line 510
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    sub-int/2addr v0, p0

    div-int/lit8 v1, v0, 0x2

    .line 511
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 512
    invoke-static {}, Lcom/flyersoft/tools/A;->getSysBarHeight()I

    move-result p0

    add-int/2addr v1, p0

    :cond_1
    neg-int p0, v1

    return p0
.end method

.method public static getYoffInDialog()I
    .locals 2

    .line 518
    invoke-static {}, Lcom/flyersoft/tools/A;->getSysBarHeight()I

    move-result v0

    .line 519
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 520
    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz v1, :cond_1

    sget-boolean v1, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    if-nez v1, :cond_1

    const/4 v0, 0x0

    :cond_1
    neg-int v0, v0

    return v0
.end method

.method private static padding()I
    .locals 1

    const/16 v0, 0xd

    .line 390
    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v0

    return v0
.end method

.method private static popFromBottom(Landroid/view/View;I[I)Z
    .locals 2

    .line 377
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    const/4 v1, 0x1

    .line 378
    aget p2, p2, v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    mul-int/lit8 p0, p0, 0x6

    div-int/lit8 p0, p0, 0xa

    add-int/2addr p2, p0

    add-int/2addr p2, p1

    const/high16 p0, 0x40a00000    # 5.0f

    invoke-static {p0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p0

    sub-int/2addr v0, p0

    if-le p2, v0, :cond_0

    return v1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static setMenuAnimation(Landroid/view/View;Landroid/widget/PopupWindow;IIIZ)V
    .locals 4

    .line 350
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-lez p4, :cond_1

    .line 353
    invoke-virtual {p1, p4}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    return-void

    :cond_1
    const/4 p4, 0x2

    .line 357
    new-array v0, p4, [I

    .line 358
    invoke-static {p0, v0}, Lcom/flyersoft/tools/A;->getLocationOnScreen(Landroid/view/View;[I)V

    .line 359
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 362
    invoke-static {p0, p3, v0}, Lcom/flyersoft/components/MyMenu;->popFromBottom(Landroid/view/View;I[I)Z

    move-result p3

    const/4 v2, 0x0

    .line 363
    aget v3, v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    div-int/2addr p0, p4

    add-int/2addr v3, p0

    .line 364
    aget p0, v0, v2

    add-int/2addr p0, p2

    div-int/lit8 p2, p2, 0xa

    sub-int/2addr p0, p2

    if-eqz p5, :cond_3

    if-eqz p3, :cond_2

    .line 366
    sget p0, Lcom/flyersoft/moonreaderp/R$style;->menuBottomRight:I

    goto :goto_1

    :cond_2
    sget p0, Lcom/flyersoft/moonreaderp/R$style;->menuTopRight:I

    goto :goto_1

    :cond_3
    mul-int/lit8 p2, v1, 0xf

    .line 367
    div-int/lit8 p2, p2, 0x64

    if-lt v3, p2, :cond_8

    if-ge p0, v1, :cond_4

    goto :goto_0

    :cond_4
    mul-int/lit8 v1, v1, 0x55

    .line 369
    div-int/lit8 v1, v1, 0x64

    if-le v3, v1, :cond_6

    if-eqz p3, :cond_5

    .line 370
    sget p0, Lcom/flyersoft/moonreaderp/R$style;->menuBottomRight:I

    goto :goto_1

    :cond_5
    sget p0, Lcom/flyersoft/moonreaderp/R$style;->menuTopRight:I

    goto :goto_1

    :cond_6
    if-eqz p3, :cond_7

    .line 372
    sget p0, Lcom/flyersoft/moonreaderp/R$style;->menuBottomMiddle:I

    goto :goto_1

    :cond_7
    sget p0, Lcom/flyersoft/moonreaderp/R$style;->menuTopMiddle:I

    goto :goto_1

    :cond_8
    :goto_0
    if-eqz p3, :cond_9

    .line 368
    sget p0, Lcom/flyersoft/moonreaderp/R$style;->menuBottomLeft:I

    goto :goto_1

    :cond_9
    sget p0, Lcom/flyersoft/moonreaderp/R$style;->menuTopLeft:I

    .line 373
    :goto_1
    invoke-virtual {p1, p0}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    return-void
.end method

.method private setTextViewHtmlProperties(Landroid/widget/TextView;)V
    .locals 1

    .line 405
    invoke-direct {p0, p1}, Lcom/flyersoft/components/MyMenu;->setTextViewProperties(Landroid/widget/TextView;)V

    const/4 v0, 0x0

    .line 406
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    return-void
.end method

.method private setTextViewProperties(Landroid/widget/TextView;)V
    .locals 3

    .line 393
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v0

    or-int/lit16 v0, v0, 0x80

    .line 394
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 395
    invoke-static {}, Lcom/flyersoft/components/MyMenu;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 396
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->truncateAt:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 397
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/C;->mainTextColor()I

    move-result v0

    goto :goto_0

    .line 398
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, -0x111112

    goto :goto_0

    :cond_1
    const v0, -0xdededf

    .line 397
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 399
    sget v0, Lcom/flyersoft/components/MyMenu;->text_size:F

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 400
    invoke-static {}, Lcom/flyersoft/components/MyMenu;->padding()I

    move-result v0

    const/4 v1, 0x3

    .line 401
    invoke-static {v1}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v2

    add-int/2addr v2, v0

    invoke-static {v1}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p1, v2, v0, v1, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    return-void
.end method


# virtual methods
.method public initMenu()Z
    .locals 7

    .line 153
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->items:[Ljava/lang/CharSequence;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    array-length v0, v0

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 155
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/components/MyMenu;->inited:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 157
    :cond_1
    iput-boolean v2, p0, Lcom/flyersoft/components/MyMenu;->inited:Z

    const/high16 v0, 0x41800000    # 16.0f

    .line 159
    sput v0, Lcom/flyersoft/components/MyMenu;->text_size:F

    .line 160
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, -0x111112

    goto :goto_0

    :cond_2
    const v0, -0xdededf

    :goto_0
    iput v0, p0, Lcom/flyersoft/components/MyMenu;->mTextColor:I

    .line 162
    new-instance v0, Landroid/widget/ListView;

    iget-object v3, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flyersoft/components/MyMenu;->listView:Landroid/widget/ListView;

    .line 163
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 164
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->getMenuBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/MyMenu;->backgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 165
    iget v0, p0, Lcom/flyersoft/components/MyMenu;->forceWidth:I

    invoke-direct {p0, v0}, Lcom/flyersoft/components/MyMenu;->getWidthHeight(I)V

    .line 167
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->listView:Landroid/widget/ListView;

    new-instance v3, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;

    iget-object v4, p0, Lcom/flyersoft/components/MyMenu;->items:[Ljava/lang/CharSequence;

    iget-object v5, p0, Lcom/flyersoft/components/MyMenu;->topBar:Landroid/view/View;

    invoke-direct {v3, p0, v4, v5}, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;-><init>(Lcom/flyersoft/components/MyMenu;[Ljava/lang/CharSequence;Landroid/view/View;)V

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 168
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->listView:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 169
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->onItemLongClick:Lcom/flyersoft/components/MyMenu$MenuItemLongClick;

    if-nez v0, :cond_3

    .line 170
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->listView:Landroid/widget/ListView;

    new-instance v3, Lcom/flyersoft/components/MyMenu$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/components/MyMenu$1;-><init>(Lcom/flyersoft/components/MyMenu;)V

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 179
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->title:Ljava/lang/CharSequence;

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eqz v0, :cond_5

    .line 180
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v5, Lcom/flyersoft/moonreaderp/R$layout;->mypopupmenu_title:I

    invoke-virtual {v0, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/LinearLayout;

    .line 181
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->textView1:I

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 182
    iget-object v5, p0, Lcom/flyersoft/components/MyMenu;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    iget v5, p0, Lcom/flyersoft/components/MyMenu;->mTextColor:I

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    invoke-virtual {v3, v1, v1}, Landroid/widget/LinearLayout;->measure(II)V

    .line 185
    iget v0, p0, Lcom/flyersoft/components/MyMenu;->height:I

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v5

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    add-int/2addr v0, v5

    iput v0, p0, Lcom/flyersoft/components/MyMenu;->height:I

    .line 186
    iget v0, p0, Lcom/flyersoft/components/MyMenu;->maxHeight:I

    const/4 v5, 0x6

    invoke-static {v5}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v5

    sub-int/2addr v0, v5

    iput v0, p0, Lcom/flyersoft/components/MyMenu;->maxHeight:I

    .line 187
    iget v5, p0, Lcom/flyersoft/components/MyMenu;->height:I

    if-le v5, v0, :cond_4

    .line 188
    iput v0, p0, Lcom/flyersoft/components/MyMenu;->height:I

    .line 189
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->backgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 190
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->listView:Landroid/widget/ListView;

    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v5, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .line 191
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    if-nez v0, :cond_6

    .line 192
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 193
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->backgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 194
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->listView:Landroid/widget/ListView;

    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v5, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 197
    :cond_6
    :goto_1
    new-instance v0, Landroid/widget/PopupWindow;

    if-nez v3, :cond_7

    iget-object v4, p0, Lcom/flyersoft/components/MyMenu;->listView:Landroid/widget/ListView;

    goto :goto_2

    :cond_7
    move-object v4, v3

    :goto_2
    iget v5, p0, Lcom/flyersoft/components/MyMenu;->width:I

    iget v6, p0, Lcom/flyersoft/components/MyMenu;->height:I

    invoke-direct {v0, v4, v5, v6, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v0, p0, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    if-eqz v3, :cond_8

    .line 198
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_3

    :cond_8
    iget-object v3, p0, Lcom/flyersoft/components/MyMenu;->backgroundDrawable:Landroid/graphics/drawable/Drawable;

    :goto_3
    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 199
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    new-instance v1, Lcom/flyersoft/components/MyMenu$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/MyMenu$2;-><init>(Lcom/flyersoft/components/MyMenu;)V

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 207
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-nez v0, :cond_9

    .line 208
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    sget v1, Lcom/flyersoft/moonreaderp/R$style;->menuSlideDown:I

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    :cond_9
    return v2

    :cond_a
    :goto_4
    return v1
.end method

.method public setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 112
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    return-object p0
.end method

.method public setAnimation(I)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 123
    iput p1, p0, Lcom/flyersoft/components/MyMenu;->animationStyle:I

    return-object p0
.end method

.method public setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 117
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->builderAnchor:Landroid/view/View;

    return-object p0
.end method

.method public setForceWidth(I)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 102
    iput p1, p0, Lcom/flyersoft/components/MyMenu;->forceWidth:I

    return-object p0
.end method

.method public setItemBackgroundColors([I)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->itemBackgroundColors:[I

    return-object p0
.end method

.method public setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->items:[Ljava/lang/CharSequence;

    .line 72
    iput-object p2, p0, Lcom/flyersoft/components/MyMenu;->onItemClick:Lcom/flyersoft/components/MyMenu$MenuItemClick;

    return-object p0
.end method

.method public setMinWidth(I)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 107
    iput p1, p0, Lcom/flyersoft/components/MyMenu;->minWidth:I

    return-object p0
.end method

.method public setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->mOnDismissListener:Landroid/widget/PopupWindow$OnDismissListener;

    return-object p0
.end method

.method public setOnItemLongClick(Lcom/flyersoft/components/MyMenu$MenuItemLongClick;)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->onItemLongClick:Lcom/flyersoft/components/MyMenu$MenuItemLongClick;

    return-object p0
.end method

.method public setRightAnimateOnly()Lcom/flyersoft/components/MyMenu;
    .locals 1

    const/4 v0, 0x1

    .line 129
    iput-boolean v0, p0, Lcom/flyersoft/components/MyMenu;->rightAnimatOnly:Z

    return-object p0
.end method

.method public setShadowText(Z)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 97
    iput-boolean p1, p0, Lcom/flyersoft/components/MyMenu;->shadowText:Z

    return-object p0
.end method

.method public setTitle(I)Lcom/flyersoft/components/MyMenu;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->title:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->title:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setTopBar(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 135
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->topBar:Landroid/view/View;

    return-object p0
.end method

.method public setTruncateAt(Landroid/text/TextUtils$TruncateAt;)Lcom/flyersoft/components/MyMenu;
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu;->truncateAt:Landroid/text/TextUtils$TruncateAt;

    return-object p0
.end method

.method public show()V
    .locals 4

    .line 296
    invoke-virtual {p0}, Lcom/flyersoft/components/MyMenu;->initMenu()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 298
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 299
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    iget-object v2, p0, Lcom/flyersoft/components/MyMenu;->builderAnchor:Landroid/view/View;

    if-eqz v2, :cond_0

    goto :goto_0

    .line 300
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v2

    :goto_0
    const/16 v3, 0x11

    .line 299
    invoke-virtual {v0, v2, v3, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    return-void

    .line 302
    :cond_1
    invoke-virtual {p0, v1, v1}, Lcom/flyersoft/components/MyMenu;->show(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 305
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    return-void
.end method

.method public show(II)V
    .locals 6

    .line 310
    invoke-virtual {p0}, Lcom/flyersoft/components/MyMenu;->initMenu()Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    .line 312
    :try_start_0
    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->d(I)I

    move-result v0

    sub-int/2addr p2, v0

    .line 313
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 314
    iget-object v1, p0, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    iget v2, p0, Lcom/flyersoft/components/MyMenu;->width:I

    iget v3, p0, Lcom/flyersoft/components/MyMenu;->height:I

    iget v4, p0, Lcom/flyersoft/components/MyMenu;->animationStyle:I

    iget-boolean v5, p0, Lcom/flyersoft/components/MyMenu;->rightAnimatOnly:Z

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/components/MyMenu;->setMenuAnimation(Landroid/view/View;Landroid/widget/PopupWindow;IIIZ)V

    .line 315
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/flyersoft/components/MyMenu;->mAnchor:Landroid/view/View;

    invoke-virtual {v0, v1, p1, p2}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    return-void

    .line 317
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/MyMenu;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 319
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public showOverflow(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x0

    .line 324
    invoke-virtual {p0, p1, v0, v0}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void
.end method

.method public showOverflow(Landroid/view/View;II)V
    .locals 9

    .line 328
    invoke-virtual {p0}, Lcom/flyersoft/components/MyMenu;->initMenu()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x2

    .line 329
    new-array v0, v0, [I

    .line 330
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->getLocationOnScreen(Landroid/view/View;[I)V

    .line 331
    iget v1, p0, Lcom/flyersoft/components/MyMenu;->height:I

    invoke-static {p1, v1, v0}, Lcom/flyersoft/components/MyMenu;->popFromBottom(Landroid/view/View;I[I)Z

    move-result v1

    .line 334
    iget-boolean v2, p0, Lcom/flyersoft/components/MyMenu;->rightAnimatOnly:Z

    const/4 v3, 0x0

    if-nez v2, :cond_0

    aget v2, v0, v3

    goto :goto_0

    :cond_0
    aget v2, v0, v3

    iget v3, p0, Lcom/flyersoft/components/MyMenu;->width:I

    sub-int/2addr v2, v3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    mul-int/lit8 v3, v3, 0x7a

    div-int/lit8 v3, v3, 0x64

    add-int/2addr v2, v3

    :goto_0
    add-int/2addr v2, p2

    const/4 p2, 0x1

    .line 335
    aget p2, v0, p2

    if-eqz v1, :cond_1

    iget v0, p0, Lcom/flyersoft/components/MyMenu;->height:I

    neg-int v0, v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    mul-int/lit8 v1, v1, 0x5

    div-int/lit8 v1, v1, 0xa

    add-int/2addr v0, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    div-int/lit8 v0, v0, 0xa

    :goto_1
    add-int/2addr p2, v0

    add-int/2addr p2, p3

    .line 337
    iget-object v4, p0, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    iget v5, p0, Lcom/flyersoft/components/MyMenu;->width:I

    iget v6, p0, Lcom/flyersoft/components/MyMenu;->height:I

    iget v7, p0, Lcom/flyersoft/components/MyMenu;->animationStyle:I

    iget-boolean v8, p0, Lcom/flyersoft/components/MyMenu;->rightAnimatOnly:Z

    move-object v3, p1

    invoke-static/range {v3 .. v8}, Lcom/flyersoft/components/MyMenu;->setMenuAnimation(Landroid/view/View;Landroid/widget/PopupWindow;IIIZ)V

    .line 339
    :try_start_0
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    iget-object p3, p0, Lcom/flyersoft/components/MyMenu;->builderAnchor:Landroid/view/View;

    if-eqz p3, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object p3

    :goto_2
    const/16 v0, 0x33

    invoke-virtual {p1, p3, v0, v2, p2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    const/4 p2, 0x0

    .line 341
    iput-object p2, p0, Lcom/flyersoft/components/MyMenu;->listView:Landroid/widget/ListView;

    .line 342
    iput-object p2, p0, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    .line 343
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    return-void
.end method
