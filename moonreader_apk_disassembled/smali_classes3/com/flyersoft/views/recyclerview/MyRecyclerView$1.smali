.class Lcom/flyersoft/views/recyclerview/MyRecyclerView$1;
.super Ljava/lang/Object;
.source "MyRecyclerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setFastEnabled(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/recyclerview/MyRecyclerView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 77
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$1;->this$0:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$1;->this$0:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-object v0, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$1;->this$0:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-object v0, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScroller:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyFastScroller;->forceShowThumb()V

    :cond_0
    return-void
.end method
