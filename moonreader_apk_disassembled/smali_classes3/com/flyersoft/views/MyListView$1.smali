.class Lcom/flyersoft/views/MyListView$1;
.super Landroid/os/Handler;
.source "MyListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/MyListView;->addScrollListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/MyListView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/MyListView;Landroid/os/Looper;)V
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

    .line 55
    iput-object p1, p0, Lcom/flyersoft/views/MyListView$1;->this$0:Lcom/flyersoft/views/MyListView;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 57
    iget-object p1, p0, Lcom/flyersoft/views/MyListView$1;->this$0:Lcom/flyersoft/views/MyListView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/MyListView;->setFastScrollEnabled(Z)V

    return-void
.end method
