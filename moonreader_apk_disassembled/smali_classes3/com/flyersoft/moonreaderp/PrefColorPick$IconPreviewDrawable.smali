.class Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PrefColorPick.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefColorPick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IconPreviewDrawable"
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mTintColor:I

.field private mTmpBitmap:Landroid/graphics/Bitmap;

.field private mTmpCanvas:Landroid/graphics/Canvas;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 2

    .line 403
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 405
    :try_start_0
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->icon2:I

    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 406
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 407
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 408
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    add-int/lit8 p1, p1, -0x6

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 407
    invoke-static {v0, p1, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    .line 409
    new-instance p1, Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTmpCanvas:Landroid/graphics/Canvas;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 411
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 417
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 418
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    .line 419
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x3f400000    # 0.75f

    mul-float v0, v0, v3

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    sub-float/2addr v0, v3

    .line 421
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTmpCanvas:Landroid/graphics/Canvas;

    const/4 v3, 0x0

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 422
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTmpCanvas:Landroid/graphics/Canvas;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 423
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTmpCanvas:Landroid/graphics/Canvas;

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTintColor:I

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 424
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v2, v1, v0, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 442
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$IconPreviewDrawable;->mTintColor:I

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method
