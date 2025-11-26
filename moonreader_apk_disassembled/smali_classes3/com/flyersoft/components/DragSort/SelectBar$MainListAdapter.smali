.class public Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;
.super Lcom/flyersoft/components/DragSort/DragSortListAdapter;
.source "SelectBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DragSort/SelectBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MainListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flyersoft/components/DragSort/DragSortListAdapter<",
        "Lcom/flyersoft/components/DragSort/SortItem;",
        ">;"
    }
.end annotation


# instance fields
.field positionUpdate:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;)V"
        }
    .end annotation

    .line 313
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/DragSort/DragSortListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    return-void
.end method


# virtual methods
.method public onBindDragSortItemViewHolder(Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;I)V
    .locals 5

    .line 324
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/DragSort/SortItem;

    .line 325
    iget-object v1, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    iget-object v2, v0, Lcom/flyersoft/components/DragSort/SortItem;->text:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 326
    iget-object v1, v0, Lcom/flyersoft/components/DragSort/SortItem;->tag:Ljava/lang/Object;

    instance-of v1, v1, Lcom/flyersoft/components/DictPackage$DictItem;

    if-eqz v1, :cond_0

    .line 327
    iget-object v1, v0, Lcom/flyersoft/components/DragSort/SortItem;->tag:Ljava/lang/Object;

    check-cast v1, Lcom/flyersoft/components/DictPackage$DictItem;

    .line 328
    iget-object v2, v1, Lcom/flyersoft/components/DictPackage$DictItem;->appName:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 329
    iget-object v2, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/flyersoft/components/DragSort/SortItem;->text:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "<font color=\"#888888\"> ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/flyersoft/components/DictPackage$DictItem;->appName:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")</font>"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 332
    :cond_0
    iget-object v1, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    iget-boolean v2, v0, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 333
    iget v1, v0, Lcom/flyersoft/components/DragSort/SortItem;->icon:I

    if-eqz v1, :cond_1

    .line 334
    iget-object v1, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vImage:Landroid/widget/ImageView;

    iget v0, v0, Lcom/flyersoft/components/DragSort/SortItem;->icon:I

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 336
    :cond_1
    iget-object v0, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vImage:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 338
    :goto_0
    iget-object v0, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->dragSortItemLayout:Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    const/4 v1, 0x4

    if-ge p2, v1, :cond_2

    const p2, 0x1155a772

    goto :goto_1

    :cond_2
    const/4 p2, 0x0

    :goto_1
    invoke-virtual {v0, p2}, Lcom/flyersoft/components/DragSort/DragSortItemLayout;->setBackgroundColor(I)V

    .line 340
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 341
    iget-object p2, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->vCheck:Landroid/widget/CheckBox;

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 342
    :cond_3
    iget-object p1, p1, Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;->dragSortItemLayout:Lcom/flyersoft/components/DragSort/DragSortItemLayout;

    invoke-static {p1}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    return-void
.end method

.method public onCheckBoxChanged(ILandroid/widget/CompoundButton;)V
    .locals 1

    const/4 v0, 0x4

    if-ge p1, v0, :cond_0

    .line 354
    invoke-virtual {p2}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    .line 355
    invoke-virtual {p2, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    :cond_0
    return-void
.end method

.method public onCreateDragSortItemViewHolder(Landroid/view/ViewGroup;I)Lcom/flyersoft/components/DragSort/DragSortItemViewHolder;
    .locals 2

    .line 318
    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->drag_sort_item_list2:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 319
    new-instance p2, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter$ViewHolder;-><init>(Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public swapped(II)V
    .locals 1

    const/4 v0, 0x4

    if-lt p1, v0, :cond_1

    if-ge p2, v0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 349
    iput-boolean p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;->positionUpdate:Z

    return-void
.end method
