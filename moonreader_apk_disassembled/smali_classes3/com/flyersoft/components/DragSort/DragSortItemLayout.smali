.class public Lcom/flyersoft/components/DragSort/DragSortItemLayout;
.super Landroid/widget/FrameLayout;
.source "DragSortItemLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/DragSort/DragSortItemLayout$OnItemSortListener;
    }
.end annotation


# instance fields
.field private mDragHelper:Landroidx/customview/widget/ViewDragHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/components/DragSort/DragSortItemLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/components/DragSort/DragSortItemLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance p1, Lcom/flyersoft/components/DragSort/DragSortItemLayout$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/DragSort/DragSortItemLayout$1;-><init>(Lcom/flyersoft/components/DragSort/DragSortItemLayout;)V

    .line 46
    invoke-static {p0, p1}, Landroidx/customview/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;Landroidx/customview/widget/ViewDragHelper$Callback;)Landroidx/customview/widget/ViewDragHelper;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortItemLayout;->mDragHelper:Landroidx/customview/widget/ViewDragHelper;

    return-void
.end method


# virtual methods
.method public computeScroll()V
    .locals 2

    .line 66
    invoke-virtual {p0}, Lcom/flyersoft/components/DragSort/DragSortItemLayout;->invalidate()V

    .line 67
    invoke-super {p0}, Landroid/widget/FrameLayout;->computeScroll()V

    .line 68
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/DragSortItemLayout;->mDragHelper:Landroidx/customview/widget/ViewDragHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/customview/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 61
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    return-void
.end method
