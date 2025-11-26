.class Lcom/flyersoft/views/recyclerview/MyFastScroller$1;
.super Ljava/lang/Object;
.source "MyFastScroller.java"

# interfaces
.implements Ljava/lang/Runnable;


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

    .line 126
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$1;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$1;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyFastScroller;->hide(I)V

    return-void
.end method
