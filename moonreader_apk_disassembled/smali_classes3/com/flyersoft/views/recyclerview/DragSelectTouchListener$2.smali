.class Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;
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

    .line 144
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 147
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetscroller(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Landroid/widget/OverScroller;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetscroller(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Landroid/widget/OverScroller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetscrollDistance(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)I

    move-result v0

    .line 150
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    iget-wide v3, v3, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->startScrollTime:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x7d0

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    const-wide/16 v3, 0x5

    .line 151
    invoke-static {v3, v4}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-gez v5, :cond_0

    int-to-float v0, v0

    long-to-float v1, v1

    const/high16 v2, 0x3fc00000    # 1.5f

    mul-float v1, v1, v2

    const/high16 v2, 0x44fa0000    # 2000.0f

    div-float/2addr v1, v2

    mul-float v0, v0, v1

    .line 152
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 154
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v1, v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$mscrollBy(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;I)V

    .line 155
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetrecyclerView(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;->this$0:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-static {v1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->-$$Nest$fgetscrollRun(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method
