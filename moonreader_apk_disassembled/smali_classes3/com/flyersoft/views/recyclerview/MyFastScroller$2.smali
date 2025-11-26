.class Lcom/flyersoft/views/recyclerview/MyFastScroller$2;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "MyFastScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/recyclerview/MyFastScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/recyclerview/MyFastScroller;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 133
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$2;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 136
    iget-object p2, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$2;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollOffset()I

    move-result p3

    .line 137
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result p1

    .line 136
    invoke-virtual {p2, p3, p1}, Lcom/flyersoft/views/recyclerview/MyFastScroller;->updateScrollPosition(II)V

    return-void
.end method
