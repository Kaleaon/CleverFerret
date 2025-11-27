.class Lcom/flyersoft/components/DualFavLay$3$1;
.super Landroid/os/Handler;
.source "DualFavLay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DualFavLay$3;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$3;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 185
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$3$1;->this$1:Lcom/flyersoft/components/DualFavLay$3;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 187
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$3$1;->this$1:Lcom/flyersoft/components/DualFavLay$3;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/flyersoft/components/DualFavLay;->collectionThreadWorking:Z

    .line 188
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$3$1;->this$1:Lcom/flyersoft/components/DualFavLay$3;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay$3$1;->this$1:Lcom/flyersoft/components/DualFavLay$3;

    iget-object v1, v1, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;-><init>(Lcom/flyersoft/components/DualFavLay;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 189
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$3$1;->this$1:Lcom/flyersoft/components/DualFavLay$3;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-static {p1}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$mgetLastSub(Lcom/flyersoft/components/DualFavLay;)I

    move-result p1

    if-lez p1, :cond_0

    .line 191
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$3$1;->this$1:Lcom/flyersoft/components/DualFavLay$3;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    :cond_0
    return-void
.end method
