.class Lcom/flyersoft/views/MyListView$2;
.super Ljava/lang/Object;
.source "MyListView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/MyListView;->addScrollListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mCurrentState:I

.field final synthetic this$0:Lcom/flyersoft/views/MyListView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/MyListView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 61
    iput-object p1, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 62
    iput p1, p0, Lcom/flyersoft/views/MyListView$2;->mCurrentState:I

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 2

    .line 75
    iget v0, p0, Lcom/flyersoft/views/MyListView$2;->mCurrentState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    iget-boolean v0, v0, Lcom/flyersoft/views/MyListView;->shouldFastScroll:Z

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/MyListView;->setFastScrollEnabled(Z)V

    .line 77
    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    iget-object v0, v0, Lcom/flyersoft/views/MyListView;->scrollHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    iget-object v0, v0, Lcom/flyersoft/views/MyListView;->addedOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_1

    .line 81
    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    iget-object v0, v0, Lcom/flyersoft/views/MyListView;->addedOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    :cond_1
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 4

    if-nez p2, :cond_0

    .line 65
    iget v0, p0, Lcom/flyersoft/views/MyListView$2;->mCurrentState:I

    if-eq v0, p2, :cond_0

    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    iget-boolean v0, v0, Lcom/flyersoft/views/MyListView;->shouldFastScroll:Z

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    iget-object v0, v0, Lcom/flyersoft/views/MyListView;->scrollHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 67
    :cond_0
    iput p2, p0, Lcom/flyersoft/views/MyListView$2;->mCurrentState:I

    .line 69
    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    iget-object v0, v0, Lcom/flyersoft/views/MyListView;->addedOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_1

    .line 70
    iget-object v0, p0, Lcom/flyersoft/views/MyListView$2;->this$0:Lcom/flyersoft/views/MyListView;

    iget-object v0, v0, Lcom/flyersoft/views/MyListView;->addedOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    :cond_1
    return-void
.end method
