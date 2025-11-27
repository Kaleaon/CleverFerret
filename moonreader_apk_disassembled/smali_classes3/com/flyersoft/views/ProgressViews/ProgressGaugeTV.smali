.class public Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;
.super Landroid/widget/TextView;
.source "ProgressGaugeTV.java"


# instance fields
.field public progress:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x1e

    .line 24
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->progress:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x1e

    .line 24
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->progress:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x1e

    .line 24
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->progress:I

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 33
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 35
    :cond_0
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->progress:I

    if-ltz v0, :cond_2

    const/16 v1, 0x64

    if-le v0, v1, :cond_1

    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->getWidth()I

    move-result v0

    .line 42
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->getHeight()I

    move-result v2

    .line 43
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    const/4 v3, 0x1

    .line 44
    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 45
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 69
    div-int/lit8 v3, v0, 0x3

    .line 70
    div-int/lit8 v0, v0, 0x2

    sub-int v5, v0, v3

    int-to-float v9, v5

    div-int/lit8 v2, v2, 0x2

    sub-int v5, v2, v3

    int-to-float v10, v5

    add-int/2addr v0, v3

    int-to-float v0, v0

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v4, v9, v10, v0, v2}, Landroid/graphics/RectF;->set(FFFF)V

    const/high16 v3, 0x41200000    # 10.0f

    .line 71
    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const v3, 0x55111111

    .line 72
    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v6, 0x43b40000    # 360.0f

    const/4 v7, 0x1

    const/high16 v5, -0x3d4c0000    # -90.0f

    move-object v3, p1

    .line 73
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    const p1, 0x66111111

    .line 74
    invoke-virtual {v8, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    iget p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->progress:I

    mul-int/lit16 p1, p1, 0x168

    div-int/2addr p1, v1

    int-to-float v6, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 77
    invoke-virtual {v4, v9, v10, v0, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 78
    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 p1, 0x3f800000    # 1.0f

    .line 79
    invoke-virtual {v8, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const p1, -0x5f000001

    .line 80
    invoke-virtual {v8, p1}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v6, 0x43b40000    # 360.0f

    const/4 v7, 0x0

    .line 81
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 82
    invoke-super {p0, v3}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    return-void

    :cond_2
    :goto_0
    move-object v3, p1

    .line 36
    invoke-super {p0, v3}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public setProgress(I)V
    .locals 0

    .line 27
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->progress:I

    .line 28
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->postInvalidate()V

    return-void
.end method
