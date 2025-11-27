.class Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;
.super Landroid/os/Handler;
.source "MergedLinearLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/recyclerview/MergedLinearLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/recyclerview/MergedLinearLayout;Landroid/os/Looper;)V
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

    .line 98
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;->this$0:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;->this$0:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {v0, p1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->-$$Nest$mdoOutsideAccept(Lcom/flyersoft/views/recyclerview/MergedLinearLayout;Lcom/flyersoft/tools/BookDb$BookInfo;)V

    return-void
.end method
