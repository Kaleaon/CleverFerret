.class public Lcom/flyersoft/views/ProgressViews/ProgressNumberView;
.super Landroid/view/View;
.source "ProgressNumberView.java"


# instance fields
.field public lineHeight:F

.field public progress:I

.field public progressLineBackgroundColor:I

.field public progressLineColor:I

.field public progressTextBackgroundColor:I

.field public progressTextColor:I

.field public progressTextLinkColor:I

.field public textSize:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x21

    .line 15
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progress:I

    const p1, 0x3f99999a    # 1.2f

    .line 16
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->lineHeight:F

    const p1, -0x9b4a0a

    .line 17
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineColor:I

    const p1, -0x1f1f20

    .line 18
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineBackgroundColor:I

    const/4 p1, -0x1

    .line 19
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextColor:I

    const p1, -0xbd5a0b

    .line 20
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextBackgroundColor:I

    .line 21
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextLinkColor:I

    const/high16 p1, 0x41800000    # 16.0f

    .line 22
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->textSize:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x21

    .line 15
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progress:I

    const p1, 0x3f99999a    # 1.2f

    .line 16
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->lineHeight:F

    const p1, -0x9b4a0a

    .line 17
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineColor:I

    const p1, -0x1f1f20

    .line 18
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineBackgroundColor:I

    const/4 p1, -0x1

    .line 19
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextColor:I

    const p1, -0xbd5a0b

    .line 20
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextBackgroundColor:I

    .line 21
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextLinkColor:I

    const/high16 p1, 0x41800000    # 16.0f

    .line 22
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->textSize:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x21

    .line 15
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progress:I

    const p1, 0x3f99999a    # 1.2f

    .line 16
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->lineHeight:F

    const p1, -0x9b4a0a

    .line 17
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineColor:I

    const p1, -0x1f1f20

    .line 18
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineBackgroundColor:I

    const/4 p1, -0x1

    .line 19
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextColor:I

    const p1, -0xbd5a0b

    .line 20
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextBackgroundColor:I

    .line 21
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextLinkColor:I

    const/high16 p1, 0x41800000    # 16.0f

    .line 22
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->textSize:F

    return-void
.end method


# virtual methods
.method df(F)F
    .locals 1

    .line 94
    sget-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/flyersoft/tools/A;->df(F)F

    move-result p1

    return p1

    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    return p1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 38
    sget-boolean v2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v2, :cond_0

    const v2, -0x111112

    goto :goto_0

    :cond_0
    const/4 v2, -0x1

    :goto_0
    iput v2, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextColor:I

    .line 39
    sget-boolean v2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    const v3, -0x777778

    if-eqz v2, :cond_1

    const v2, -0x777778

    goto :goto_1

    :cond_1
    const v2, -0x9b4a0a

    :goto_1
    iput v2, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextBackgroundColor:I

    .line 41
    sget-boolean v2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    const v3, -0x1f1f20

    :goto_2
    iput v3, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineBackgroundColor:I

    .line 42
    sget-boolean v2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v2, :cond_3

    const v2, -0x8a8a8b

    goto :goto_3

    :cond_3
    const v2, -0xbd5a0b

    :goto_3
    iput v2, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextLinkColor:I

    .line 45
    iget v2, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->lineHeight:F

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->df(F)F

    move-result v2

    .line 46
    invoke-virtual {v0}, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    .line 47
    invoke-virtual {v0}, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    mul-float v6, v2, v5

    sub-float/2addr v4, v6

    .line 48
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    const/4 v7, 0x1

    .line 49
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 51
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 52
    iget v8, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineBackgroundColor:I

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 53
    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 55
    new-instance v8, Landroid/graphics/RectF;

    invoke-virtual {v0, v5}, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->df(F)F

    move-result v9

    add-float/2addr v9, v4

    const/4 v10, 0x0

    invoke-direct {v8, v10, v4, v3, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v9, 0x40a00000    # 5.0f

    invoke-virtual {v1, v8, v9, v9, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 56
    iget v8, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progress:I

    int-to-float v8, v8

    mul-float v8, v8, v3

    const/high16 v11, 0x42c80000    # 100.0f

    div-float/2addr v8, v11

    .line 57
    iget v11, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressLineColor:I

    invoke-virtual {v6, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 58
    new-instance v11, Landroid/graphics/RectF;

    invoke-virtual {v0, v5}, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->df(F)F

    move-result v12

    add-float/2addr v12, v4

    invoke-direct {v11, v10, v4, v8, v12}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v1, v11, v9, v9, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 60
    new-instance v6, Landroid/text/TextPaint;

    invoke-direct {v6}, Landroid/text/TextPaint;-><init>()V

    .line 61
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 62
    iget v7, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->textSize:F

    invoke-virtual {v0, v7}, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->df(F)F

    move-result v7

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 63
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget v11, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progress:I

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, "%"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 64
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    const/4 v12, 0x0

    .line 65
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v13

    invoke-virtual {v6, v7, v12, v13, v11}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    const/high16 v12, 0x40800000    # 4.0f

    .line 66
    invoke-virtual {v0, v12}, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->df(F)F

    move-result v12

    .line 67
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v13

    int-to-float v13, v13

    mul-float v14, v12, v5

    add-float/2addr v13, v14

    .line 68
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v11

    int-to-float v11, v11

    const/high16 v15, 0x40400000    # 3.0f

    div-float/2addr v14, v15

    add-float/2addr v11, v14

    div-float v14, v13, v5

    sub-float v16, v8, v14

    const/high16 v17, 0x40000000    # 2.0f

    const/high16 v5, 0x41000000    # 8.0f

    .line 70
    invoke-virtual {v0, v5}, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->df(F)F

    move-result v5

    sub-float v5, v4, v5

    const/high16 v18, 0x40900000    # 4.5f

    div-float v18, v11, v18

    cmpg-float v19, v16, v10

    if-gez v19, :cond_4

    goto :goto_4

    :cond_4
    move/from16 v10, v16

    :goto_4
    sub-float v16, v3, v13

    cmpl-float v19, v10, v16

    if-lez v19, :cond_5

    move/from16 v10, v16

    :cond_5
    const/high16 v16, 0x40400000    # 3.0f

    .line 76
    iget v15, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextBackgroundColor:I

    invoke-virtual {v6, v15}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    new-instance v15, Landroid/graphics/RectF;

    sub-float v11, v5, v11

    div-float v16, v18, v16

    add-float v11, v11, v16

    add-float/2addr v13, v10

    move/from16 v16, v2

    add-float v2, v5, v18

    invoke-direct {v15, v10, v11, v13, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v1, v15, v9, v9, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 78
    iget v9, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextColor:I

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setColor(I)V

    add-float/2addr v12, v10

    .line 79
    invoke-virtual {v1, v7, v12, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 80
    iget v5, v0, Lcom/flyersoft/views/ProgressViews/ProgressNumberView;->progressTextLinkColor:I

    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setColor(I)V

    div-float v5, v16, v17

    .line 82
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    add-float/2addr v10, v14

    div-float v7, v5, v17

    sub-float/2addr v10, v7

    div-float v7, v3, v17

    cmpg-float v9, v10, v7

    if-gez v9, :cond_6

    cmpl-float v9, v10, v8

    if-lez v9, :cond_6

    move v10, v8

    :cond_6
    cmpl-float v7, v10, v7

    if-lez v7, :cond_7

    cmpg-float v7, v10, v8

    if-gez v7, :cond_7

    goto :goto_5

    :cond_7
    move v8, v10

    :goto_5
    cmpl-float v7, v8, v3

    if-ltz v7, :cond_8

    sub-float v8, v3, v5

    :cond_8
    move v5, v4

    move v4, v8

    move v3, v2

    move v2, v8

    .line 90
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method
