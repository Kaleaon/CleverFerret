.class Lcom/flyersoft/moonreaderp/PrefOptions$2;
.super Ljava/lang/Object;
.source "PrefOptions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefOptions;->getHeaderScrollEvent()Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 192
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->listSv:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    .line 194
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->gridSv:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    :cond_0
    if-nez v0, :cond_1

    .line 196
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    :cond_1
    if-eqz v0, :cond_f

    .line 198
    instance-of p1, v0, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_6

    .line 199
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 200
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p1

    instance-of p1, p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz p1, :cond_f

    .line 201
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p1

    if-lez p1, :cond_f

    .line 203
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v3

    .line 204
    sget-boolean v4, Lcom/flyersoft/tools/A;->eink:Z

    if-nez v4, :cond_4

    const/16 v4, 0x1e

    if-le p1, v4, :cond_2

    goto :goto_0

    :cond_2
    if-nez v3, :cond_3

    add-int/lit8 v2, p1, -0x1

    .line 207
    :cond_3
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    return-void

    :cond_4
    :goto_0
    if-nez v3, :cond_5

    add-int/lit8 v2, p1, -0x1

    .line 205
    :cond_5
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    return-void

    .line 210
    :cond_6
    instance-of p1, v0, Landroid/widget/ScrollView;

    if-eqz p1, :cond_a

    .line 211
    sget-boolean p1, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz p1, :cond_8

    .line 212
    move-object p1, v0

    check-cast p1, Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v1

    if-nez v1, :cond_7

    invoke-virtual {p1, v2}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    sub-int/2addr v1, v0

    goto :goto_1

    :cond_7
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p1, v2, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void

    .line 214
    :cond_8
    move-object p1, v0

    check-cast p1, Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v1

    if-nez v1, :cond_9

    invoke-virtual {p1, v2}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    sub-int/2addr v1, v0

    goto :goto_2

    :cond_9
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {p1, v2, v1}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    return-void

    .line 215
    :cond_a
    instance-of p1, v0, Landroid/widget/AbsListView;

    if-eqz p1, :cond_f

    .line 216
    check-cast v0, Landroid/widget/AbsListView;

    .line 217
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    move-result-object p1

    check-cast p1, Landroid/widget/ListAdapter;

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    move-result p1

    if-le p1, v1, :cond_f

    .line 218
    sget-boolean p1, Lcom/flyersoft/tools/A;->eink:Z

    if-nez p1, :cond_d

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    move-result-object p1

    check-cast p1, Landroid/widget/ListAdapter;

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    move-result p1

    const/16 v3, 0x32

    if-le p1, v3, :cond_b

    goto :goto_3

    .line 221
    :cond_b
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result p1

    if-nez p1, :cond_c

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    move-result-object p1

    check-cast p1, Landroid/widget/ListAdapter;

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    move-result p1

    add-int/lit8 v2, p1, -0x1

    :cond_c
    invoke-virtual {v0, v2}, Landroid/widget/AbsListView;->smoothScrollToPosition(I)V

    return-void

    .line 219
    :cond_d
    :goto_3
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result p1

    if-nez p1, :cond_e

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getAdapter()Landroid/widget/Adapter;

    move-result-object p1

    check-cast p1, Landroid/widget/ListAdapter;

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    move-result p1

    add-int/lit8 v2, p1, -0x1

    :cond_e
    invoke-virtual {v0, v2}, Landroid/widget/AbsListView;->setSelection(I)V

    :cond_f
    return-void
.end method
