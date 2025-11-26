.class public Lcom/github/mikephil/charting/renderer/scatter/SquareShapeRenderer;
.super Ljava/lang/Object;
.source "SquareShapeRenderer.java"

# interfaces
.implements Lcom/github/mikephil/charting/renderer/scatter/IShapeRenderer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public renderShape(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLandroid/graphics/Paint;)V
    .locals 10

    move-object/from16 v5, p6

    .line 23
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeSize()F

    move-result p3

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, p3, v0

    .line 25
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeHoleRadius()F

    move-result v2

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v2

    mul-float v3, v2, v0

    sub-float v3, p3, v3

    div-float/2addr v3, v0

    div-float v0, v3, v0

    .line 30
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeHoleColor()I

    move-result p2

    float-to-double v6, p3

    const-wide/16 v8, 0x0

    cmpl-double p3, v6, v8

    if-lez p3, :cond_1

    .line 33
    sget-object p3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 34
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sub-float p3, p4, v2

    sub-float v1, p3, v0

    sub-float v6, p5, v2

    move v3, v2

    sub-float v2, v6, v0

    add-float/2addr p4, v3

    move v4, v3

    add-float v3, p4, v0

    add-float v7, p5, v4

    add-float v4, v7, v0

    move-object v0, p1

    .line 36
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    const v0, 0x112233

    if-eq p2, v0, :cond_0

    .line 43
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 45
    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setColor(I)V

    move-object v0, p1

    move v1, p3

    move v3, p4

    move v2, v6

    move v4, v7

    .line 46
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_0
    return-void

    .line 54
    :cond_1
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    move p3, v1

    sub-float v1, p4, p3

    sub-float v2, p5, p3

    add-float v3, p4, p3

    add-float v4, p5, p3

    move-object v0, p1

    .line 56
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method
