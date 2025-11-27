.class Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;
.super Ljava/lang/Object;
.source "DragSelectTouchListener.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 55
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 58
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    iget-boolean v0, v0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->horizontal:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetinLeftSpot(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetinRightSpot(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    iget-boolean v0, v0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->horizontal:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetinTopSpot(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetinBottomSpot(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetscrollDistance(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$mscrollBy(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;I)V

    .line 63
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetautoScrollHandler(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x19

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
