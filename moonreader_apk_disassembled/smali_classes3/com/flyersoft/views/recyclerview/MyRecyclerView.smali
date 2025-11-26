.class public Lcom/flyersoft/views/recyclerview/MyRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "MyRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;,
        Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;
    }
.end annotation


# instance fields
.field public bigThumbColor:Ljava/lang/Integer;

.field fastEnabled:Z

.field public fastScrollShowing:Z

.field fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

.field public inItemDragging:Z

.field public smallThumbColor:Ljava/lang/Integer;

.field visibleInited:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastEnabled:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastEnabled:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastEnabled:Z

    return-void
.end method

.method private getBigThumbColor()I
    .locals 3

    .line 100
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->bigThumbColor:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 101
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 102
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_3

    .line 103
    invoke-static {}, Lcom/flyersoft/tools/C;->getTertiaryColor()I

    move-result v0

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/16 v1, 0x3c

    :goto_0
    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v2, -0x28

    :cond_2
    invoke-static {v0, v2}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v0

    return v0

    .line 104
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_4

    const v0, -0x11555556

    return v0

    :cond_4
    const v0, -0x11ff6634    # -9.950003E27f

    return v0
.end method

.method private getSmallThumbColor()I
    .locals 2

    .line 92
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->smallThumbColor:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 93
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 94
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    const v1, -0x11666667

    if-eqz v0, :cond_1

    .line 95
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    return v1

    .line 96
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    :cond_2
    const v0, -0x11444445

    return v0
.end method


# virtual methods
.method public findFirstVisibleItem()I
    .locals 1

    .line 150
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v0, :cond_0

    .line 151
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public findLastVisibleItem()I
    .locals 1

    .line 156
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v0, :cond_0

    .line 157
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getScrollOffset()I
    .locals 2

    const/4 v0, 0x0

    .line 163
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 164
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    .line 166
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return v0
.end method

.method public myScrollTo(I)Z
    .locals 1

    const/4 v0, 0x0

    .line 133
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(II)Z

    move-result p1

    return p1
.end method

.method public myScrollTo(II)Z
    .locals 1

    .line 137
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_1

    if-ltz p1, :cond_1

    .line 138
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 139
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v0, :cond_0

    .line 140
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_0

    .line 142
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->scrollToPosition(I)V

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    if-nez p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 126
    :goto_0
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->showThumbOnResume(Z)V

    .line 127
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->onVisibilityChanged(Landroid/view/View;I)V

    return-void
.end method

.method public setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 1

    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->inItemDragging:Z

    iput-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScrollShowing:Z

    .line 38
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastEnabled:Z

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setFastEnabled(Z)V

    .line 39
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 44
    iput-object p0, p1, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    :cond_0
    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->inItemDragging:Z

    iput-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScrollShowing:Z

    .line 46
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastEnabled:Z

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setFastEnabled(Z)V

    .line 47
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public setFastEnabled(Z)V
    .locals 9

    .line 54
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastEnabled:Z

    .line 55
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyFastScroller;->destroyCallbacks()V

    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    :cond_0
    if-eqz p1, :cond_1

    .line 60
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->fast_scroll_blue:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Landroid/graphics/drawable/StateListDrawable;

    .line 61
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->fast_scroll_track:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 62
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->fast_scroll_blue:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Landroid/graphics/drawable/StateListDrawable;

    .line 63
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->fast_scroll_track:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 65
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 66
    new-instance v0, Lcom/flyersoft/views/recyclerview/MyFastScroller;

    sget v1, Landroidx/recyclerview/R$dimen;->fastscroll_default_thickness:I

    .line 68
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    sget v1, Landroidx/recyclerview/R$dimen;->fastscroll_minimum_range:I

    .line 69
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    sget v1, Landroidx/recyclerview/R$dimen;->fastscroll_margin:I

    .line 70
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/flyersoft/views/recyclerview/MyFastScroller;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView;Landroid/graphics/drawable/StateListDrawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/StateListDrawable;Landroid/graphics/drawable/Drawable;III)V

    iput-object v0, v1, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    .line 72
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getSmallThumbColor()I

    move-result p1

    iput p1, v0, Lcom/flyersoft/views/recyclerview/MyFastScroller;->smallThumbColor:I

    .line 73
    iget-object p1, v1, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getBigThumbColor()I

    move-result v0

    iput v0, p1, Lcom/flyersoft/views/recyclerview/MyFastScroller;->bigThumbColor:I

    .line 74
    iget-object p1, v1, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    const/high16 v0, 0x40c00000    # 6.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Lcom/flyersoft/views/recyclerview/MyFastScroller;->largerThumbDragWidth:I

    .line 75
    iget-object p1, v1, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Lcom/flyersoft/views/recyclerview/MyFastScroller;->smallThumbPadding:I

    .line 77
    new-instance p1, Lcom/flyersoft/views/recyclerview/MyRecyclerView$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$1;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView;)V

    const-wide/16 v2, 0x14

    invoke-virtual {p0, p1, v2, v3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_1
    move-object v1, p0

    return-void
.end method

.method public showThumbOnResume(Z)V
    .locals 1

    .line 109
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->visibleInited:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 110
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    if-eqz v0, :cond_0

    .line 111
    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyFastScroller;->forceShowThumb()V

    :cond_0
    if-eqz p1, :cond_1

    .line 112
    iget-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->visibleInited:Z

    if-nez p1, :cond_1

    const/4 p1, 0x1

    .line 113
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->visibleInited:Z

    :cond_1
    return-void
.end method
