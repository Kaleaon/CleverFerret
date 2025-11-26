.class public Lcom/flyersoft/views/BookShelfView;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView;
.source "BookShelfView.java"


# instance fields
.field public rowDrawable:Landroid/graphics/drawable/Drawable;

.field public woodyHeightInited:Z

.field woodyRowHeight:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 49
    iget-object v0, p0, Lcom/flyersoft/views/BookShelfView;->rowDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/flyersoft/views/BookShelfView;->woodyRowHeight:I

    if-lez v0, :cond_0

    .line 51
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookShelfView;->computeVerticalScrollOffset()I

    move-result v0

    .line 52
    iget v1, p0, Lcom/flyersoft/views/BookShelfView;->woodyRowHeight:I

    rem-int/2addr v0, v1

    .line 53
    invoke-virtual {p0}, Lcom/flyersoft/views/BookShelfView;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/flyersoft/views/BookShelfView;->woodyRowHeight:I

    div-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    neg-int v4, v0

    .line 55
    iget v5, p0, Lcom/flyersoft/views/BookShelfView;->woodyRowHeight:I

    mul-int v5, v5, v3

    add-int/2addr v4, v5

    .line 56
    iget-object v5, p0, Lcom/flyersoft/views/BookShelfView;->rowDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/flyersoft/views/BookShelfView;->getWidth()I

    move-result v6

    iget v7, p0, Lcom/flyersoft/views/BookShelfView;->woodyRowHeight:I

    add-int/2addr v7, v4

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v5, v2, v4, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 57
    iget-object v4, p0, Lcom/flyersoft/views/BookShelfView;->rowDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 63
    :catch_0
    :cond_0
    invoke-super {p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public initWoodyRowHeight(Landroid/view/View;)V
    .locals 1

    .line 31
    iget-boolean v0, p0, Lcom/flyersoft/views/BookShelfView;->woodyHeightInited:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 33
    iput-boolean v0, p0, Lcom/flyersoft/views/BookShelfView;->woodyHeightInited:Z

    const/4 v0, 0x0

    .line 34
    invoke-virtual {p1, v0, v0}, Landroid/view/View;->measure(II)V

    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookShelfView;->setWoodyRowHeight(I)V

    return-void
.end method

.method public setWoodyRowHeight(I)V
    .locals 4

    .line 39
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v0, :cond_0

    if-lez p1, :cond_0

    .line 40
    iget v0, p0, Lcom/flyersoft/views/BookShelfView;->woodyRowHeight:I

    if-eq v0, p1, :cond_0

    .line 41
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "woodyRowHeight"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 42
    iput p1, p0, Lcom/flyersoft/views/BookShelfView;->woodyRowHeight:I

    :cond_0
    return-void
.end method
