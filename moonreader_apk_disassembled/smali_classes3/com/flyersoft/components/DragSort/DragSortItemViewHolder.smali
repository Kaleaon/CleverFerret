.class public abstract Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "DragSortItemViewHolder.java"

# interfaces
.implements Lcom/flyersoft/components/DragSort/ItemTouchHelperViewHolder;


# instance fields
.field public dragSortItemLayout:Lcom/flyersoft/components/DragSort/DragSortItemLayout;

.field public vCheck:Landroid/widget/CheckBox;

.field public vImage:Landroid/widget/ImageView;

.field public vSort:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 21
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 22
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->setItemLayout(Landroid/view/View;)Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->dragSortItemLayout:Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    .line 23
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->setImageView(Landroid/view/View;)Landroid/widget/ImageView;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vImage:Landroid/widget/ImageView;

    .line 24
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->setCheckBox(Landroid/view/View;)Landroid/widget/CheckBox;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    .line 25
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->setSort(Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vSort:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public abstract setCheckBox(Landroid/view/View;)Landroid/widget/CheckBox;
.end method

.method public abstract setImageView(Landroid/view/View;)Landroid/widget/ImageView;
.end method

.method public abstract setItemLayout(Landroid/view/View;)Lcom/flyersoft/components/DragSort/DragSortItemLayout;
.end method

.method public abstract setSort(Landroid/view/View;)Landroid/view/View;
.end method
