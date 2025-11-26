.class public Lcom/flyersoft/views/FlipImageView;
.super Landroid/widget/ImageView;
.source "FlipImageView.java"


# static fields
.field public static final SPEED_ACCELERATE:I = 0x1

.field public static final SPEED_DECELERATE:I = 0x2

.field public static final SPEED_NORMAL:I


# instance fields
.field private afterFlipCurl:Lcom/flyersoft/tools/A$AfterFlipCurl;

.field animateStartTime:J

.field public animateState:I

.field public animateType:I

.field public bm1:Landroid/graphics/Bitmap;

.field public bm2:Landroid/graphics/Bitmap;

.field drawCount:I

.field public for3dCurlCache:Z

.field frameStep:D

.field public isCoverShow:Z

.field public isDrawing:Z

.field public isPageDown:Z

.field lastDrawTime:J

.field private mDuration:I

.field msgCount:I

.field public shadow_b:Landroid/graphics/Bitmap;

.field public shadow_l:Landroid/graphics/Bitmap;

.field shadow_width:I

.field public speedType:I


# direct methods
.method static bridge synthetic -$$Nest$fgetmDuration(Lcom/flyersoft/views/FlipImageView;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x320

    .line 58
    iput p1, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    const/4 p1, 0x0

    .line 67
    iput-boolean p1, p0, Lcom/flyersoft/views/FlipImageView;->isCoverShow:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x320

    .line 58
    iput p1, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    const/4 p1, 0x0

    .line 67
    iput-boolean p1, p0, Lcom/flyersoft/views/FlipImageView;->isCoverShow:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x320

    .line 58
    iput p1, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    const/4 p1, 0x0

    .line 67
    iput-boolean p1, p0, Lcom/flyersoft/views/FlipImageView;->isCoverShow:Z

    return-void
.end method


# virtual methods
.method public doFinishAnimation()V
    .locals 6

    .line 386
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 387
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 391
    :cond_0
    iget v1, p0, Lcom/flyersoft/views/FlipImageView;->animateType:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v4, -0x64

    if-ne v1, v4, :cond_1

    iget-boolean v1, p0, Lcom/flyersoft/views/FlipImageView;->isPageDown:Z

    if-nez v1, :cond_1

    .line 392
    invoke-virtual {p0}, Lcom/flyersoft/views/FlipImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v4, p0, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-static {v1, v4}, Lcom/flyersoft/tools/T;->bitmapToDrawble(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/flyersoft/views/FlipImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 393
    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    iput-boolean v2, v0, Lcom/flyersoft/views/ContentLay;->finished:Z

    .line 394
    invoke-virtual {p0}, Lcom/flyersoft/views/FlipImageView;->invalidate()V

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 396
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/FlipImageView;->setBitmap1(Landroid/graphics/Bitmap;)V

    .line 397
    iget v5, p0, Lcom/flyersoft/views/FlipImageView;->animateType:I

    if-ne v5, v4, :cond_2

    .line 398
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/FlipImageView;->setBitmap2(Landroid/graphics/Bitmap;)V

    .line 399
    :cond_2
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/FlipImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 400
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/FlipImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 401
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/FlipImageView;->setTag(Ljava/lang/Object;)V

    const/16 v1, 0x8

    .line 402
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/FlipImageView;->setVisibility(I)V

    .line 403
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {v1, v3}, Lcom/flyersoft/views/ContentLay;->setAnimationState(Z)V

    .line 404
    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->invalidate()V

    .line 406
    :goto_0
    iput v3, p0, Lcom/flyersoft/views/FlipImageView;->animateState:I

    .line 407
    iget-object v0, p0, Lcom/flyersoft/views/FlipImageView;->afterFlipCurl:Lcom/flyersoft/tools/A$AfterFlipCurl;

    if-eqz v0, :cond_3

    .line 408
    invoke-interface {v0, v2}, Lcom/flyersoft/tools/A$AfterFlipCurl;->Finished(Z)V

    :cond_3
    :goto_1
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 133
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_17

    .line 135
    :cond_0
    iget-boolean v0, v1, Lcom/flyersoft/views/FlipImageView;->for3dCurlCache:Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v0, :cond_1

    .line 136
    iget-object v0, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_27

    .line 137
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getHeight()I

    move-result v6

    invoke-direct {v0, v4, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 138
    iget-object v4, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v4, v0, v0, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-void

    .line 144
    :cond_1
    sget-object v5, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/high16 v0, -0x1000000

    if-eqz v5, :cond_24

    .line 145
    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v6

    if-nez v6, :cond_24

    iget v6, v1, Lcom/flyersoft/views/FlipImageView;->animateState:I

    if-nez v6, :cond_2

    goto/16 :goto_16

    .line 158
    :cond_2
    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v6

    .line 160
    iget v7, v1, Lcom/flyersoft/views/FlipImageView;->animateType:I

    const/16 v8, -0x64

    if-eq v7, v8, :cond_4

    iget v7, v1, Lcom/flyersoft/views/FlipImageView;->drawCount:I

    const/16 v9, 0x28

    if-ge v7, v9, :cond_4

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    iget-wide v11, v1, Lcom/flyersoft/views/FlipImageView;->lastDrawTime:J

    sub-long/2addr v9, v11

    sget-boolean v7, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v7, :cond_3

    const/16 v7, 0xc8

    goto :goto_0

    :cond_3
    const/16 v7, 0x64

    :goto_0
    int-to-long v11, v7

    cmp-long v7, v9, v11

    if-lez v7, :cond_4

    .line 161
    iget-wide v9, v1, Lcom/flyersoft/views/FlipImageView;->lastDrawTime:J

    iput-wide v9, v1, Lcom/flyersoft/views/FlipImageView;->animateStartTime:J

    .line 163
    :cond_4
    iget-object v7, v5, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/4 v9, 0x1

    if-nez v7, :cond_5

    iget v7, v1, Lcom/flyersoft/views/FlipImageView;->animateType:I

    if-eq v7, v8, :cond_5

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getTag()Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_5

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getTag()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v10, v5, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v10}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v10

    if-eq v7, v10, :cond_5

    .line 164
    iget-object v7, v5, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v7}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/flyersoft/views/FlipImageView;->setTag(Ljava/lang/Object;)V

    .line 165
    invoke-virtual {v5, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getPageShot(Z)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/flyersoft/views/FlipImageView;->setBitmap2(Landroid/graphics/Bitmap;)V

    .line 166
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v10, "*****update AnimationShot(*3*):"

    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, v5, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v10}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-array v10, v9, [Ljava/lang/Object;

    aput-object v7, v10, v4

    invoke-static {v10}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 167
    iget-wide v10, v1, Lcom/flyersoft/views/FlipImageView;->lastDrawTime:J

    iput-wide v10, v1, Lcom/flyersoft/views/FlipImageView;->animateStartTime:J

    .line 170
    :cond_5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    iput-wide v10, v1, Lcom/flyersoft/views/FlipImageView;->lastDrawTime:J

    .line 171
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    iget-wide v12, v1, Lcom/flyersoft/views/FlipImageView;->animateStartTime:J

    sub-long/2addr v10, v12

    long-to-int v7, v10

    .line 172
    iget v10, v1, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    if-le v7, v10, :cond_6

    move v7, v10

    .line 175
    :cond_6
    iput-boolean v9, v1, Lcom/flyersoft/views/FlipImageView;->isDrawing:Z

    .line 177
    :try_start_0
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getWidth()I

    move-result v10

    .line 178
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getHeight()I

    move-result v11

    .line 180
    iget v12, v1, Lcom/flyersoft/views/FlipImageView;->animateType:I

    const/4 v13, 0x7

    const/4 v14, 0x4

    if-eq v12, v14, :cond_8

    if-ne v12, v13, :cond_7

    goto :goto_1

    :cond_7
    move v15, v10

    goto :goto_2

    :cond_8
    :goto_1
    move v15, v11

    :goto_2
    const/4 v3, 0x6

    const/4 v4, 0x2

    if-ne v12, v3, :cond_9

    .line 181
    iget-boolean v13, v1, Lcom/flyersoft/views/FlipImageView;->isPageDown:Z

    if-eqz v13, :cond_9

    .line 182
    iget v12, v1, Lcom/flyersoft/views/FlipImageView;->shadow_width:I

    mul-int/lit8 v12, v12, 0x2

    add-int/2addr v15, v12

    goto :goto_3

    :cond_9
    if-ne v12, v14, :cond_a

    if-nez v6, :cond_a

    .line 184
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v11

    move v15, v11

    .line 185
    :cond_a
    :goto_3
    iget v12, v1, Lcom/flyersoft/views/FlipImageView;->animateType:I

    if-ne v12, v8, :cond_b

    .line 186
    div-int/lit8 v15, v10, 0x2

    .line 189
    :cond_b
    iget v12, v1, Lcom/flyersoft/views/FlipImageView;->speedType:I

    if-eq v12, v9, :cond_d

    if-eq v12, v4, :cond_c

    mul-int v15, v15, v7

    .line 197
    iget v9, v1, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    div-int/2addr v15, v9
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v9, v5

    const/16 v18, 0x2

    goto :goto_4

    :cond_c
    int-to-double v12, v15

    move-object v9, v5

    const/16 v18, 0x2

    int-to-double v4, v7

    .line 194
    :try_start_1
    iget-wide v14, v1, Lcom/flyersoft/views/FlipImageView;->frameStep:D

    invoke-static {v4, v5, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    mul-double v12, v12, v4

    iget v4, v1, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    int-to-double v4, v4

    iget-wide v14, v1, Lcom/flyersoft/views/FlipImageView;->frameStep:D

    invoke-static {v4, v5, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    div-double/2addr v12, v4

    double-to-int v15, v12

    goto :goto_4

    :cond_d
    move-object v9, v5

    const/16 v18, 0x2

    int-to-double v4, v15

    .line 191
    iget v12, v1, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    sub-int/2addr v12, v7

    int-to-double v12, v12

    move-wide/from16 v19, v4

    iget-wide v3, v1, Lcom/flyersoft/views/FlipImageView;->frameStep:D

    invoke-static {v12, v13, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    mul-double v4, v19, v3

    iget v3, v1, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    int-to-double v12, v3

    move v3, v15

    iget-wide v14, v1, Lcom/flyersoft/views/FlipImageView;->frameStep:D

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v12

    div-double/2addr v4, v12

    double-to-int v4, v4

    sub-int v15, v3, v4

    .line 200
    :goto_4
    iget v3, v1, Lcom/flyersoft/views/FlipImageView;->drawCount:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v1, Lcom/flyersoft/views/FlipImageView;->drawCount:I

    if-nez v3, :cond_e

    iget v3, v1, Lcom/flyersoft/views/FlipImageView;->shadow_width:I

    if-le v15, v3, :cond_e

    move v15, v3

    .line 204
    :cond_e
    iget-object v3, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    iget-object v4, v1, Lcom/flyersoft/views/FlipImageView;->bm2:Landroid/graphics/Bitmap;

    .line 209
    iget v5, v1, Lcom/flyersoft/views/FlipImageView;->animateType:I

    if-eq v5, v8, :cond_19

    const/4 v0, 0x3

    if-eq v5, v0, :cond_17

    const/4 v0, 0x4

    if-eq v5, v0, :cond_14

    const/4 v14, 0x6

    if-eq v5, v14, :cond_11

    const/4 v0, 0x7

    if-eq v5, v0, :cond_f

    .line 337
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 338
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    mul-int/lit16 v6, v7, 0xff

    .line 339
    iget v8, v1, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    div-int/2addr v6, v8

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 340
    iget v6, v1, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    sub-int v8, v6, v7

    mul-int/lit16 v8, v8, 0xff

    div-int/2addr v8, v6

    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 341
    new-instance v6, Landroid/graphics/Rect;

    const/4 v8, 0x0

    invoke-direct {v6, v8, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v8, v4

    move-object v4, v3

    move-object v3, v8

    move-object v8, v0

    move-object v10, v5

    move-object v0, v6

    move-object v5, v0

    move-object v12, v5

    goto/16 :goto_b

    .line 254
    :cond_f
    iget-boolean v0, v1, Lcom/flyersoft/views/FlipImageView;->isPageDown:Z

    if-eqz v0, :cond_10

    .line 255
    new-instance v6, Landroid/graphics/Rect;

    const/4 v8, 0x0

    invoke-direct {v6, v8, v15, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 256
    new-instance v0, Landroid/graphics/Rect;

    sub-int v5, v11, v15

    invoke-direct {v0, v8, v8, v10, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 257
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12, v8, v5, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 258
    new-instance v11, Landroid/graphics/Rect;

    iget v13, v1, Lcom/flyersoft/views/FlipImageView;->shadow_width:I

    add-int/2addr v13, v5

    invoke-direct {v11, v8, v5, v10, v13}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v13, v11

    move-object v5, v12

    goto :goto_5

    .line 260
    :cond_10
    new-instance v6, Landroid/graphics/Rect;

    const/4 v8, 0x0

    invoke-direct {v6, v8, v15, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 261
    new-instance v0, Landroid/graphics/Rect;

    sub-int v5, v11, v15

    invoke-direct {v0, v8, v5, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 262
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v8, v8, v10, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 263
    new-instance v11, Landroid/graphics/Rect;

    iget v12, v1, Lcom/flyersoft/views/FlipImageView;->shadow_width:I

    add-int/2addr v12, v15

    invoke-direct {v11, v8, v15, v10, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v12, v0

    move-object v0, v6

    move-object v13, v11

    :goto_5
    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    goto/16 :goto_11

    .line 240
    :cond_11
    iget-boolean v0, v1, Lcom/flyersoft/views/FlipImageView;->isPageDown:Z

    if-eqz v0, :cond_13

    .line 241
    new-instance v6, Landroid/graphics/Rect;

    const/4 v8, 0x0

    invoke-direct {v6, v15, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 242
    new-instance v0, Landroid/graphics/Rect;

    sub-int v5, v10, v15

    invoke-direct {v0, v8, v8, v5, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 243
    new-instance v12, Landroid/graphics/Rect;

    if-ge v15, v10, :cond_12

    move v13, v5

    goto :goto_6

    :cond_12
    const/4 v13, 0x0

    :goto_6
    invoke-direct {v12, v13, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 244
    new-instance v10, Landroid/graphics/Rect;

    iget v13, v1, Lcom/flyersoft/views/FlipImageView;->shadow_width:I

    add-int/2addr v13, v5

    invoke-direct {v10, v5, v8, v13, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v11, v10

    move-object v5, v12

    goto :goto_7

    .line 246
    :cond_13
    new-instance v6, Landroid/graphics/Rect;

    const/4 v8, 0x0

    invoke-direct {v6, v15, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 247
    new-instance v0, Landroid/graphics/Rect;

    sub-int v5, v10, v15

    invoke-direct {v0, v5, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 248
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v8, v8, v15, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 249
    new-instance v10, Landroid/graphics/Rect;

    iget v12, v1, Lcom/flyersoft/views/FlipImageView;->shadow_width:I

    add-int/2addr v12, v15

    invoke-direct {v10, v15, v8, v12, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v12, v0

    move-object v0, v6

    move-object v11, v10

    :goto_7
    const/4 v8, 0x0

    const/4 v10, 0x0

    goto/16 :goto_c

    :cond_14
    if-eqz v6, :cond_15

    const/4 v0, 0x0

    goto :goto_8

    .line 225
    :cond_15
    iget-object v0, v9, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v0}, Lcom/flyersoft/views/ScrollView2;->getPaddingTop()I

    move-result v0

    .line 226
    :goto_8
    iget-boolean v5, v1, Lcom/flyersoft/views/FlipImageView;->isPageDown:Z

    if-eqz v5, :cond_16

    .line 227
    new-instance v6, Landroid/graphics/Rect;

    add-int v5, v0, v15

    add-int/2addr v11, v0

    const/4 v8, 0x0

    invoke-direct {v6, v8, v5, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 228
    new-instance v12, Landroid/graphics/Rect;

    sub-int v13, v11, v15

    invoke-direct {v12, v8, v0, v10, v13}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 229
    new-instance v14, Landroid/graphics/Rect;

    invoke-direct {v14, v8, v0, v10, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 230
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v8, v13, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v5, v0

    move-object v0, v12

    move-object v12, v14

    goto :goto_9

    .line 232
    :cond_16
    new-instance v6, Landroid/graphics/Rect;

    add-int/2addr v11, v0

    sub-int v5, v11, v15

    const/4 v8, 0x0

    invoke-direct {v6, v8, v0, v10, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 233
    new-instance v12, Landroid/graphics/Rect;

    add-int/2addr v15, v0

    invoke-direct {v12, v8, v15, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 234
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13, v8, v5, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 235
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v8, v0, v10, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v0, v12

    move-object v12, v13

    goto :goto_9

    .line 211
    :cond_17
    iget-boolean v0, v1, Lcom/flyersoft/views/FlipImageView;->isPageDown:Z

    if-eqz v0, :cond_18

    .line 212
    new-instance v6, Landroid/graphics/Rect;

    const/4 v8, 0x0

    invoke-direct {v6, v15, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 213
    new-instance v0, Landroid/graphics/Rect;

    sub-int v5, v10, v15

    invoke-direct {v0, v8, v8, v5, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 214
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12, v8, v8, v15, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 215
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13, v5, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v5, v13

    goto :goto_9

    .line 217
    :cond_18
    new-instance v6, Landroid/graphics/Rect;

    sub-int v0, v10, v15

    const/4 v8, 0x0

    invoke-direct {v6, v8, v8, v0, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 218
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v15, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 219
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12, v0, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 220
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v8, v8, v15, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v8, v5

    move-object v5, v0

    move-object v0, v8

    :goto_9
    const/4 v8, 0x0

    :goto_a
    const/4 v10, 0x0

    :goto_b
    const/4 v11, 0x0

    :goto_c
    const/4 v13, 0x0

    goto/16 :goto_11

    .line 268
    :cond_19
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v5
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v5, :cond_1a

    const/4 v8, 0x0

    .line 374
    iput-boolean v8, v1, Lcom/flyersoft/views/FlipImageView;->isDrawing:Z

    return-void

    .line 270
    :cond_1a
    :try_start_2
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 272
    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 273
    iget-object v0, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 274
    iget-object v6, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    mul-int v8, v15, v0

    .line 275
    div-int/2addr v8, v10

    const/high16 v12, 0x42480000    # 50.0f

    .line 276
    invoke-static {v12}, Lcom/flyersoft/tools/A;->d(F)I

    .line 277
    iget-boolean v12, v1, Lcom/flyersoft/views/FlipImageView;->isPageDown:Z

    if-eqz v12, :cond_1c

    .line 285
    new-instance v12, Landroid/graphics/Rect;

    div-int/lit8 v13, v10, 0x2

    sub-int/2addr v13, v15

    const/4 v14, 0x0

    invoke-direct {v12, v14, v14, v13, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 286
    new-instance v13, Landroid/graphics/Rect;

    div-int/lit8 v16, v10, 0x2

    move-object/from16 v17, v4

    add-int v4, v16, v15

    invoke-direct {v13, v4, v14, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 287
    invoke-virtual {v2, v12, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 288
    invoke-virtual {v2, v13, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 289
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getHeight()I

    move-result v12

    if-le v4, v12, :cond_1b

    .line 290
    new-instance v4, Landroid/graphics/Rect;

    div-int/lit8 v8, v0, 0x2

    const/4 v14, 0x0

    invoke-direct {v4, v14, v14, v8, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 291
    new-instance v8, Landroid/graphics/Rect;

    div-int/lit8 v12, v0, 0x2

    invoke-direct {v8, v12, v14, v0, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    mul-int v0, v0, v11

    .line 292
    div-int/2addr v0, v6

    .line 293
    new-instance v6, Landroid/graphics/Rect;

    div-int/lit8 v12, v10, 0x2

    sub-int/2addr v12, v15

    div-int/lit8 v13, v0, 0x2

    sub-int/2addr v12, v13

    div-int/lit8 v13, v10, 0x2

    sub-int/2addr v13, v15

    const/4 v14, 0x0

    invoke-direct {v6, v12, v14, v13, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 294
    new-instance v12, Landroid/graphics/Rect;

    div-int/lit8 v13, v10, 0x2

    add-int/2addr v13, v15

    div-int/lit8 v10, v10, 0x2

    add-int/2addr v10, v15

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v10, v0

    const/4 v14, 0x0

    invoke-direct {v12, v13, v14, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v19, v5

    move-object v0, v6

    move-object v5, v12

    goto/16 :goto_d

    .line 296
    :cond_1b
    new-instance v4, Landroid/graphics/Rect;

    div-int/lit8 v12, v0, 0x2

    const/4 v14, 0x0

    invoke-direct {v4, v8, v14, v12, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 297
    new-instance v12, Landroid/graphics/Rect;

    div-int/lit8 v13, v0, 0x2

    sub-int v8, v0, v8

    invoke-direct {v12, v13, v14, v8, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    mul-int v6, v6, v10

    .line 298
    div-int/2addr v6, v0

    sub-int/2addr v11, v6

    .line 299
    div-int/lit8 v11, v11, 0x2

    .line 300
    new-instance v0, Landroid/graphics/Rect;

    div-int/lit8 v8, v10, 0x2

    sub-int/2addr v8, v15

    add-int/2addr v6, v11

    const/4 v14, 0x0

    invoke-direct {v0, v14, v11, v8, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 301
    new-instance v8, Landroid/graphics/Rect;

    div-int/lit8 v13, v10, 0x2

    add-int/2addr v13, v15

    invoke-direct {v8, v13, v11, v10, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v6, v4

    move-object/from16 v19, v5

    move-object v5, v8

    goto/16 :goto_f

    :cond_1c
    move-object/from16 v17, v4

    .line 311
    new-instance v4, Landroid/graphics/Rect;

    const/4 v14, 0x0

    invoke-direct {v4, v14, v14, v15, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 312
    new-instance v12, Landroid/graphics/Rect;

    sub-int v13, v10, v15

    invoke-direct {v12, v13, v14, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 313
    invoke-virtual {v2, v4, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 314
    invoke-virtual {v2, v12, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 315
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getHeight()I

    move-result v12

    if-le v4, v12, :cond_1d

    .line 316
    new-instance v4, Landroid/graphics/Rect;

    div-int/lit8 v8, v0, 0x2

    const/4 v14, 0x0

    invoke-direct {v4, v14, v14, v8, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 317
    new-instance v8, Landroid/graphics/Rect;

    div-int/lit8 v10, v0, 0x2

    invoke-direct {v8, v10, v14, v0, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    mul-int v0, v0, v11

    .line 318
    div-int/2addr v0, v6

    .line 319
    new-instance v6, Landroid/graphics/Rect;

    div-int/lit8 v10, v0, 0x2

    sub-int v10, v15, v10

    invoke-direct {v6, v10, v14, v15, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 320
    new-instance v10, Landroid/graphics/Rect;

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v13

    invoke-direct {v10, v13, v14, v0, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v19, v5

    move-object v0, v6

    move-object v5, v10

    :goto_d
    move-object v6, v4

    :goto_e
    const/4 v4, 0x0

    goto :goto_10

    .line 322
    :cond_1d
    new-instance v4, Landroid/graphics/Rect;

    div-int/lit8 v12, v0, 0x2

    sub-int/2addr v12, v8

    div-int/lit8 v14, v0, 0x2

    move-object/from16 v19, v5

    const/4 v5, 0x0

    invoke-direct {v4, v12, v5, v14, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 323
    new-instance v12, Landroid/graphics/Rect;

    div-int/lit8 v14, v0, 0x2

    div-int/lit8 v16, v0, 0x2

    add-int v8, v16, v8

    invoke-direct {v12, v14, v5, v8, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    mul-int v6, v6, v10

    .line 324
    div-int/2addr v6, v0

    sub-int/2addr v11, v6

    .line 325
    div-int/lit8 v11, v11, 0x2

    .line 326
    new-instance v0, Landroid/graphics/Rect;

    add-int/2addr v6, v11

    invoke-direct {v0, v5, v11, v15, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 327
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v13, v11, v10, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v6, v4

    :goto_f
    move-object v8, v12

    goto :goto_e

    .line 330
    :goto_10
    invoke-virtual {v2, v3, v6, v0, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 331
    invoke-virtual {v2, v3, v8, v5, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    move-object v12, v8

    move-object/from16 v4, v17

    move-object/from16 v8, v19

    goto/16 :goto_a

    .line 345
    :goto_11
    invoke-static {v3}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v14

    if-nez v14, :cond_21

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v14

    if-nez v14, :cond_21

    .line 346
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v14

    if-lez v14, :cond_1e

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v14

    if-lez v14, :cond_1e

    .line 347
    invoke-virtual {v2, v3, v6, v0, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 348
    :cond_1e
    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-lez v0, :cond_1f

    invoke-virtual {v12}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-lez v0, :cond_1f

    .line 349
    invoke-virtual {v2, v4, v12, v5, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_1f
    if-eqz v11, :cond_20

    .line 350
    iget-object v0, v1, Lcom/flyersoft/views/FlipImageView;->shadow_l:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_20

    .line 351
    new-instance v3, Landroid/graphics/Rect;

    iget-object v4, v1, Lcom/flyersoft/views/FlipImageView;->shadow_l:Landroid/graphics/Bitmap;

    .line 352
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    iget-object v5, v1, Lcom/flyersoft/views/FlipImageView;->shadow_l:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    const/4 v8, 0x0

    invoke-direct {v3, v8, v8, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v4, 0x0

    .line 351
    invoke-virtual {v2, v0, v3, v11, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_20
    if-eqz v13, :cond_21

    .line 353
    iget-object v0, v1, Lcom/flyersoft/views/FlipImageView;->shadow_b:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_21

    .line 354
    new-instance v3, Landroid/graphics/Rect;

    iget-object v4, v1, Lcom/flyersoft/views/FlipImageView;->shadow_b:Landroid/graphics/Bitmap;

    .line 355
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    iget-object v5, v1, Lcom/flyersoft/views/FlipImageView;->shadow_b:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    const/4 v8, 0x0

    invoke-direct {v3, v8, v8, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v4, 0x0

    .line 354
    invoke-virtual {v2, v0, v3, v13, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 358
    :cond_21
    iget v0, v1, Lcom/flyersoft/views/FlipImageView;->animateType:I

    const/4 v3, 0x4

    if-ne v0, v3, :cond_22

    invoke-virtual {v9}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showStatusbar()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 359
    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    .line 360
    iget-object v0, v9, Lcom/flyersoft/moonreaderp/ActivityTxt;->statusLay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v0, v0

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 361
    iget-object v0, v9, Lcom/flyersoft/moonreaderp/ActivityTxt;->statusLay:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 362
    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_22
    const/4 v8, 0x0

    goto :goto_14

    :catch_0
    move-exception v0

    goto :goto_12

    :catch_1
    move-exception v0

    goto :goto_13

    :catchall_0
    move-exception v0

    const/4 v8, 0x0

    goto :goto_15

    :catch_2
    move-exception v0

    move-object v9, v5

    .line 369
    :goto_12
    :try_start_3
    iget-object v3, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v3

    if-nez v3, :cond_23

    .line 370
    iget-object v3, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    new-instance v4, Landroid/graphics/Rect;

    iget-object v5, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    iget-object v6, v1, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    const/4 v8, 0x0

    invoke-direct {v4, v8, v8, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v5, Landroid/graphics/Rect;

    .line 371
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getHeight()I

    move-result v10

    invoke-direct {v5, v8, v8, v6, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v6, 0x0

    .line 370
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 372
    :cond_23
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v8, 0x0

    goto :goto_14

    :catch_3
    move-exception v0

    move-object v9, v5

    .line 367
    :goto_13
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v8, 0x0

    .line 374
    :goto_14
    iput-boolean v8, v1, Lcom/flyersoft/views/FlipImageView;->isDrawing:Z

    .line 377
    iget v0, v1, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    if-lt v7, v0, :cond_27

    .line 379
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->doFinishAnimation()V

    const-wide/16 v2, 0x0

    .line 380
    iput-wide v2, v9, Lcom/flyersoft/moonreaderp/ActivityTxt;->flippingAnimationTime:J

    goto :goto_17

    .line 374
    :goto_15
    iput-boolean v8, v1, Lcom/flyersoft/views/FlipImageView;->isDrawing:Z

    .line 375
    throw v0

    .line 146
    :cond_24
    :goto_16
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-nez v3, :cond_25

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_27

    .line 148
    :cond_25
    iget-boolean v3, v1, Lcom/flyersoft/views/FlipImageView;->isCoverShow:Z

    if-eqz v3, :cond_26

    .line 149
    invoke-virtual {v2, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 150
    :cond_26
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_28

    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_28

    .line 151
    invoke-virtual {v1}, Lcom/flyersoft/views/FlipImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_28

    :cond_27
    :goto_17
    return-void

    .line 153
    :cond_28
    invoke-super/range {p0 .. p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public setBitmap1(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 49
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setBitmap2(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 52
    iget-object v0, p0, Lcom/flyersoft/views/FlipImageView;->bm2:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/flyersoft/views/FlipImageView;->bm1:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_0

    .line 53
    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 54
    :cond_0
    iput-object p1, p0, Lcom/flyersoft/views/FlipImageView;->bm2:Landroid/graphics/Bitmap;

    return-void
.end method

.method public startAnimation(ZILcom/flyersoft/tools/A$AfterFlipCurl;)V
    .locals 7

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 75
    iput-wide v0, p0, Lcom/flyersoft/views/FlipImageView;->frameStep:D

    .line 76
    iput-boolean p1, p0, Lcom/flyersoft/views/FlipImageView;->isPageDown:Z

    .line 77
    iput p2, p0, Lcom/flyersoft/views/FlipImageView;->animateType:I

    const/4 v0, 0x1

    .line 78
    iput v0, p0, Lcom/flyersoft/views/FlipImageView;->speedType:I

    .line 79
    sget v1, Lcom/flyersoft/tools/A;->flipSpeed:I

    mul-int/lit8 v1, v1, 0xa

    rsub-int v2, v1, 0x320

    iput v2, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    const/4 v2, 0x2

    const/4 v3, 0x6

    if-eqz p1, :cond_0

    if-ne p2, v3, :cond_0

    .line 81
    iput v2, p0, Lcom/flyersoft/views/FlipImageView;->speedType:I

    rsub-int v1, v1, 0x28a

    .line 82
    iput v1, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    .line 84
    :cond_0
    iput-object p3, p0, Lcom/flyersoft/views/FlipImageView;->afterFlipCurl:Lcom/flyersoft/tools/A$AfterFlipCurl;

    .line 86
    invoke-static {}, Lcom/flyersoft/tools/A;->getDensity()F

    move-result p3

    const/high16 v1, 0x40000000    # 2.0f

    cmpl-float p3, p3, v1

    if-lez p3, :cond_1

    const/high16 p3, 0x41700000    # 15.0f

    goto :goto_0

    :cond_1
    const/high16 p3, 0x41200000    # 10.0f

    :goto_0
    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p3

    iput p3, p0, Lcom/flyersoft/views/FlipImageView;->shadow_width:I

    const/16 p3, 0x64

    if-ne p2, v3, :cond_3

    if-nez p1, :cond_2

    const-wide/high16 p1, 0x4004000000000000L    # 2.5

    goto :goto_1

    :cond_2
    const-wide p1, 0x3ff3333333333333L    # 1.2

    .line 89
    :goto_1
    iput-wide p1, p0, Lcom/flyersoft/views/FlipImageView;->frameStep:D

    .line 91
    iget-object p1, p0, Lcom/flyersoft/views/FlipImageView;->shadow_l:Landroid/graphics/Bitmap;

    if-nez p1, :cond_6

    .line 92
    invoke-virtual {p0}, Lcom/flyersoft/views/FlipImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$drawable;->shadow_l:I

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/FlipImageView;->shadow_l:Landroid/graphics/Bitmap;

    goto :goto_2

    :cond_3
    const/4 p1, 0x7

    if-ne p2, p1, :cond_4

    .line 96
    iget-object p1, p0, Lcom/flyersoft/views/FlipImageView;->shadow_b:Landroid/graphics/Bitmap;

    if-nez p1, :cond_6

    .line 97
    invoke-virtual {p0}, Lcom/flyersoft/views/FlipImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$drawable;->shadow_b:I

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/FlipImageView;->shadow_b:Landroid/graphics/Bitmap;

    goto :goto_2

    :cond_4
    const/4 p1, 0x5

    if-ne p2, p1, :cond_5

    .line 100
    iget p1, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    goto :goto_2

    :cond_5
    const/16 p1, -0x64

    if-ne p2, p1, :cond_6

    .line 102
    sget p1, Lcom/flyersoft/tools/A;->flipSpeed:I

    mul-int/lit8 p1, p1, 0xa

    rsub-int p1, p1, 0x258

    iput p1, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    .line 103
    iput v2, p0, Lcom/flyersoft/views/FlipImageView;->speedType:I

    .line 109
    :cond_6
    :goto_2
    iget p1, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    if-ge p1, p3, :cond_7

    .line 110
    iput p3, p0, Lcom/flyersoft/views/FlipImageView;->mDuration:I

    :cond_7
    const/4 p1, 0x0

    .line 112
    iput p1, p0, Lcom/flyersoft/views/FlipImageView;->msgCount:I

    iput p1, p0, Lcom/flyersoft/views/FlipImageView;->drawCount:I

    .line 113
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p2

    iput-wide p2, p0, Lcom/flyersoft/views/FlipImageView;->lastDrawTime:J

    iput-wide p2, p0, Lcom/flyersoft/views/FlipImageView;->animateStartTime:J

    .line 114
    iput v0, p0, Lcom/flyersoft/views/FlipImageView;->animateState:I

    .line 115
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/FlipImageView;->setVisibility(I)V

    .line 118
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    new-instance v2, Lcom/flyersoft/views/FlipImageView$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/views/FlipImageView$1;-><init>(Lcom/flyersoft/views/FlipImageView;)V

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x5

    invoke-virtual/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    return-void
.end method
