.class public abstract Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "MyRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/recyclerview/MyRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "MyAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;
    }
.end annotation


# instance fields
.field delayHandler:Landroid/os/Handler;

.field public onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field public rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 173
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 193
    new-instance v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$1;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->delayHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V
    .locals 2

    .line 185
    iput-object p3, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 186
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-boolean v0, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->fastScrollShowing:Z

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_0

    .line 187
    sget p3, Lcom/flyersoft/moonreaderp/R$id;->about:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 188
    iget-object p3, p0, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->delayHandler:Landroid/os/Handler;

    invoke-virtual {p3, p1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    const-wide/16 v0, 0x32

    invoke-virtual {p3, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    .line 190
    :cond_0
    invoke-interface {p3, p1, p2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;->fillData(ILandroid/view/View;)V

    return-void
.end method
