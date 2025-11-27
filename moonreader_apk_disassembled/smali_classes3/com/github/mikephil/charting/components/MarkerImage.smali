.class public Lcom/github/mikephil/charting/components/MarkerImage;
.super Ljava/lang/Object;
.source "MarkerImage.java"

# interfaces
.implements Lcom/github/mikephil/charting/components/IMarker;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mDrawableBoundsCache:Landroid/graphics/Rect;

.field private mOffset:Lcom/github/mikephil/charting/utils/MPPointF;

.field private mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

.field private mSize:Lcom/github/mikephil/charting/utils/FSize;

.field private mWeakChart:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/github/mikephil/charting/charts/Chart;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/github/mikephil/charting/utils/MPPointF;

    invoke-direct {v0}, Lcom/github/mikephil/charting/utils/MPPointF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset:Lcom/github/mikephil/charting/utils/MPPointF;

    .line 33
    new-instance v0, Lcom/github/mikephil/charting/utils/MPPointF;

    invoke-direct {v0}, Lcom/github/mikephil/charting/utils/MPPointF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    .line 36
    new-instance v0, Lcom/github/mikephil/charting/utils/FSize;

    invoke-direct {v0}, Lcom/github/mikephil/charting/utils/FSize;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mSize:Lcom/github/mikephil/charting/utils/FSize;

    .line 37
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawableBoundsCache:Landroid/graphics/Rect;

    .line 46
    iput-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mContext:Landroid/content/Context;

    .line 50
    iget-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;FF)V
    .locals 7

    .line 138
    iget-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    return-void

    .line 140
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/github/mikephil/charting/components/MarkerImage;->getOffsetForDrawingAtPoint(FF)Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v0

    .line 142
    iget-object v1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mSize:Lcom/github/mikephil/charting/utils/FSize;

    iget v1, v1, Lcom/github/mikephil/charting/utils/FSize;->width:F

    .line 143
    iget-object v2, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mSize:Lcom/github/mikephil/charting/utils/FSize;

    iget v2, v2, Lcom/github/mikephil/charting/utils/FSize;->height:F

    const/4 v3, 0x0

    cmpl-float v4, v1, v3

    if-nez v4, :cond_1

    .line 146
    iget-object v1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    :cond_1
    cmpl-float v3, v2, v3

    if-nez v3, :cond_2

    .line 149
    iget-object v2, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    .line 152
    :cond_2
    iget-object v3, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawableBoundsCache:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 153
    iget-object v3, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawableBoundsCache:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iget-object v5, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawableBoundsCache:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawableBoundsCache:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    float-to-int v1, v1

    add-int/2addr v6, v1

    iget-object v1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawableBoundsCache:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    float-to-int v2, v2

    add-int/2addr v1, v2

    invoke-virtual {v3, v4, v5, v6, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 159
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 161
    iget v2, v0, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr p2, v2

    iget v0, v0, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr p3, v0

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 162
    iget-object p2, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 163
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 165
    iget-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object p2, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawableBoundsCache:Landroid/graphics/Rect;

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public getChartView()Lcom/github/mikephil/charting/charts/Chart;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mWeakChart:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/charts/Chart;

    return-object v0
.end method

.method public getOffset()Lcom/github/mikephil/charting/utils/MPPointF;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset:Lcom/github/mikephil/charting/utils/MPPointF;

    return-object v0
.end method

.method public getOffsetForDrawingAtPoint(FF)Lcom/github/mikephil/charting/utils/MPPointF;
    .locals 6

    .line 99
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/MarkerImage;->getOffset()Lcom/github/mikephil/charting/utils/MPPointF;

    move-result-object v0

    .line 100
    iget-object v1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    iget v2, v0, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    iput v2, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    .line 101
    iget-object v1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    iget v0, v0, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    iput v0, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 103
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/MarkerImage;->getChartView()Lcom/github/mikephil/charting/charts/Chart;

    move-result-object v0

    .line 105
    iget-object v1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mSize:Lcom/github/mikephil/charting/utils/FSize;

    iget v1, v1, Lcom/github/mikephil/charting/utils/FSize;->width:F

    .line 106
    iget-object v2, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mSize:Lcom/github/mikephil/charting/utils/FSize;

    iget v2, v2, Lcom/github/mikephil/charting/utils/FSize;->height:F

    const/4 v3, 0x0

    cmpl-float v4, v1, v3

    if-nez v4, :cond_0

    .line 108
    iget-object v4, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_0

    .line 109
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    :cond_0
    cmpl-float v4, v2, v3

    if-nez v4, :cond_1

    .line 111
    iget-object v4, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_1

    .line 112
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    .line 115
    :cond_1
    iget-object v4, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    iget v4, v4, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v4, p1

    cmpg-float v4, v4, v3

    if-gez v4, :cond_2

    .line 116
    iget-object v1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    neg-float p1, p1

    iput p1, v1, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    goto :goto_0

    :cond_2
    if-eqz v0, :cond_3

    add-float v4, p1, v1

    .line 117
    iget-object v5, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    iget v5, v5, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    add-float/2addr v4, v5

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/Chart;->getWidth()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_3

    .line 118
    iget-object v4, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/Chart;->getWidth()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, p1

    sub-float/2addr v5, v1

    iput v5, v4, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    .line 121
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    iget p1, p1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr p1, p2

    cmpg-float p1, p1, v3

    if-gez p1, :cond_4

    .line 122
    iget-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    neg-float p2, p2

    iput p2, p1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    goto :goto_1

    :cond_4
    if-eqz v0, :cond_5

    add-float p1, p2, v2

    .line 123
    iget-object v1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    iget v1, v1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    add-float/2addr p1, v1

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/Chart;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpl-float p1, p1, v1

    if-lez p1, :cond_5

    .line 124
    iget-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/Chart;->getHeight()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, p2

    sub-float/2addr v0, v2

    iput v0, p1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    .line 127
    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset2:Lcom/github/mikephil/charting/utils/MPPointF;

    return-object p1
.end method

.method public getSize()Lcom/github/mikephil/charting/utils/FSize;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mSize:Lcom/github/mikephil/charting/utils/FSize;

    return-object v0
.end method

.method public refreshContent(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)V
    .locals 0

    return-void
.end method

.method public setChartView(Lcom/github/mikephil/charting/charts/Chart;)V
    .locals 1

    .line 89
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mWeakChart:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public setOffset(FF)V
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset:Lcom/github/mikephil/charting/utils/MPPointF;

    iput p1, v0, Lcom/github/mikephil/charting/utils/MPPointF;->x:F

    .line 68
    iget-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset:Lcom/github/mikephil/charting/utils/MPPointF;

    iput p2, p1, Lcom/github/mikephil/charting/utils/MPPointF;->y:F

    return-void
.end method

.method public setOffset(Lcom/github/mikephil/charting/utils/MPPointF;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset:Lcom/github/mikephil/charting/utils/MPPointF;

    if-nez p1, :cond_0

    .line 62
    new-instance p1, Lcom/github/mikephil/charting/utils/MPPointF;

    invoke-direct {p1}, Lcom/github/mikephil/charting/utils/MPPointF;-><init>()V

    iput-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mOffset:Lcom/github/mikephil/charting/utils/MPPointF;

    :cond_0
    return-void
.end method

.method public setSize(Lcom/github/mikephil/charting/utils/FSize;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mSize:Lcom/github/mikephil/charting/utils/FSize;

    if-nez p1, :cond_0

    .line 80
    new-instance p1, Lcom/github/mikephil/charting/utils/FSize;

    invoke-direct {p1}, Lcom/github/mikephil/charting/utils/FSize;-><init>()V

    iput-object p1, p0, Lcom/github/mikephil/charting/components/MarkerImage;->mSize:Lcom/github/mikephil/charting/utils/FSize;

    :cond_0
    return-void
.end method
