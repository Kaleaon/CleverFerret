.class public Lcom/flyersoft/views/MyListView;
.super Landroid/widget/ListView;
.source "MyListView.java"


# static fields
.field public static FAST_SCROLL_ITEM_COUNT:I = 0x32

.field public static SCROLL_BAR_ITEM_COUNT:I = 0x19


# instance fields
.field addedOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

.field public fast_scroll_count:I

.field scrollHandler:Landroid/os/Handler;

.field public scroll_bar_count:I

.field public shouldFastScroll:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private addScrollListener()V
    .locals 2

    .line 54
    iget-object v0, p0, Lcom/flyersoft/views/MyListView;->scrollHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/flyersoft/views/MyListView$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/MyListView$1;-><init>(Lcom/flyersoft/views/MyListView;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/views/MyListView;->scrollHandler:Landroid/os/Handler;

    .line 61
    :cond_0
    new-instance v0, Lcom/flyersoft/views/MyListView$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/MyListView$2;-><init>(Lcom/flyersoft/views/MyListView;)V

    invoke-super {p0, v0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 12
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/MyListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 4

    .line 32
    invoke-super {p0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 33
    invoke-virtual {p0}, Lcom/flyersoft/views/MyListView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p1, :cond_4

    .line 34
    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/views/MyListView;->fast_scroll_count:I

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/views/MyListView;->FAST_SCROLL_ITEM_COUNT:I

    :goto_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lt v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/flyersoft/views/MyListView;->shouldFastScroll:Z

    .line 36
    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    move-result p1

    iget v0, p0, Lcom/flyersoft/views/MyListView;->scroll_bar_count:I

    if-lez v0, :cond_2

    goto :goto_2

    :cond_2
    sget v0, Lcom/flyersoft/views/MyListView;->SCROLL_BAR_ITEM_COUNT:I

    :goto_2
    if-lt p1, v0, :cond_3

    goto :goto_3

    :cond_3
    const/4 v2, 0x0

    :goto_3
    invoke-virtual {p0, v2}, Lcom/flyersoft/views/MyListView;->setVerticalScrollBarEnabled(Z)V

    .line 37
    iget-object p1, p0, Lcom/flyersoft/views/MyListView;->scrollHandler:Landroid/os/Handler;

    if-nez p1, :cond_4

    .line 38
    invoke-direct {p0}, Lcom/flyersoft/views/MyListView;->addScrollListener()V

    :cond_4
    return-void
.end method

.method public setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/flyersoft/views/MyListView;->addedOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 45
    iget-object p1, p0, Lcom/flyersoft/views/MyListView;->scrollHandler:Landroid/os/Handler;

    if-nez p1, :cond_0

    .line 46
    invoke-direct {p0}, Lcom/flyersoft/views/MyListView;->addScrollListener()V

    :cond_0
    return-void
.end method
