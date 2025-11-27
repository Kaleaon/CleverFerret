.class public Lcom/flyersoft/views/ProgressViews/ProgressLineView;
.super Landroid/view/View;
.source "ProgressLineView.java"


# instance fields
.field public lineHeight:F

.field public progress:I

.field public progressLineBackgroundColor:Ljava/lang/Integer;

.field public progressLineColor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x21

    .line 13
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progress:I

    const p1, 0x3f99999a    # 1.2f

    .line 14
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->lineHeight:F

    const p1, -0xe6892e

    .line 15
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineColor:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x21

    .line 13
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progress:I

    const p1, 0x3f99999a    # 1.2f

    .line 14
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->lineHeight:F

    const p1, -0xe6892e

    .line 15
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineColor:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x21

    .line 13
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progress:I

    const p1, 0x3f99999a    # 1.2f

    .line 14
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->lineHeight:F

    const p1, -0xe6892e

    .line 15
    iput p1, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineColor:I

    return-void
.end method


# virtual methods
.method df(F)F
    .locals 1

    .line 54
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
    .locals 7

    .line 32
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineBackgroundColor:Ljava/lang/Integer;

    if-nez v0, :cond_2

    .line 36
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v0, :cond_1

    const v0, -0x777778

    goto :goto_0

    :cond_1
    const v0, -0x1f1f20

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineBackgroundColor:Ljava/lang/Integer;

    .line 38
    :cond_2
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->lineHeight:F

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->df(F)F

    move-result v0

    .line 39
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    .line 40
    invoke-virtual {p0}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float v4, v0, v3

    sub-float/2addr v2, v4

    .line 41
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    const/4 v5, 0x1

    .line 42
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 43
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 44
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 45
    iget-object v5, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineBackgroundColor:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 47
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0, v3}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->df(F)F

    move-result v5

    add-float/2addr v5, v2

    const/4 v6, 0x0

    invoke-direct {v0, v6, v2, v1, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v5, 0x40a00000    # 5.0f

    invoke-virtual {p1, v0, v5, v5, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 48
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progress:I

    int-to-float v0, v0

    mul-float v1, v1, v0

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr v1, v0

    .line 49
    iget v0, p0, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineColor:I

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 50
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0, v3}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->df(F)F

    move-result v3

    add-float/2addr v3, v2

    invoke-direct {v0, v6, v2, v1, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, v5, v5, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void
.end method
