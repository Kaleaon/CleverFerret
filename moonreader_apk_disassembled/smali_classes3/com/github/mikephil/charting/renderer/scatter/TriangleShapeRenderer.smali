.class public Lcom/github/mikephil/charting/renderer/scatter/TriangleShapeRenderer;
.super Ljava/lang/Object;
.source "TriangleShapeRenderer.java"

# interfaces
.implements Lcom/github/mikephil/charting/renderer/scatter/IShapeRenderer;


# instance fields
.field protected mTrianglePathBuffer:Landroid/graphics/Path;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/scatter/TriangleShapeRenderer;->mTrianglePathBuffer:Landroid/graphics/Path;

    return-void
.end method


# virtual methods
.method public renderShape(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLandroid/graphics/Paint;)V
    .locals 9

    .line 25
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeSize()F

    move-result p3

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, p3, v0

    .line 27
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeHoleRadius()F

    move-result v2

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v2

    mul-float v2, v2, v0

    sub-float v2, p3, v2

    div-float/2addr v2, v0

    .line 31
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeHoleColor()I

    move-result p2

    .line 33
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 36
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/scatter/TriangleShapeRenderer;->mTrianglePathBuffer:Landroid/graphics/Path;

    .line 37
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    sub-float v3, p5, v1

    .line 39
    invoke-virtual {v0, p4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    add-float v4, p4, v1

    add-float/2addr p5, v1

    .line 40
    invoke-virtual {v0, v4, p5}, Landroid/graphics/Path;->lineTo(FF)V

    sub-float v1, p4, v1

    .line 41
    invoke-virtual {v0, v1, p5}, Landroid/graphics/Path;->lineTo(FF)V

    float-to-double v5, p3

    const-wide/16 v7, 0x0

    cmpl-double p3, v5, v7

    if-lez p3, :cond_0

    .line 44
    invoke-virtual {v0, p4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    add-float v5, v1, v2

    sub-float v6, p5, v2

    .line 46
    invoke-virtual {v0, v5, v6}, Landroid/graphics/Path;->moveTo(FF)V

    sub-float v7, v4, v2

    .line 48
    invoke-virtual {v0, v7, v6}, Landroid/graphics/Path;->lineTo(FF)V

    add-float v7, v3, v2

    .line 50
    invoke-virtual {v0, p4, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 52
    invoke-virtual {v0, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 56
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 58
    invoke-virtual {p1, v0, p6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 59
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    if-lez p3, :cond_1

    const p3, 0x112233

    if-eq p2, p3, :cond_1

    .line 64
    invoke-virtual {p6, p2}, Landroid/graphics/Paint;->setColor(I)V

    add-float/2addr v3, v2

    .line 66
    invoke-virtual {v0, p4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    sub-float/2addr v4, v2

    sub-float/2addr p5, v2

    .line 68
    invoke-virtual {v0, v4, p5}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v1, v2

    .line 70
    invoke-virtual {v0, v1, p5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 72
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 74
    invoke-virtual {p1, v0, p6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 75
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    :cond_1
    return-void
.end method
