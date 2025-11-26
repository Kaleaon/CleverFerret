.class Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$1;
.super Landroid/os/Handler;
.source "MyRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/os/Looper;)V
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

    .line 193
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$1;->this$0:Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 195
    iget v0, p1, Landroid/os/Message;->what:I

    .line 196
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    .line 197
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->about:I

    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 198
    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$1;->this$0:Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;

    iget-object v1, v1, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-interface {v1, v0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;->fillData(ILandroid/view/View;)V

    :cond_0
    return-void
.end method
