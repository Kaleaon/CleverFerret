.class Lcom/flyersoft/tools/blurry/BlurTask$1;
.super Ljava/lang/Object;
.source "BlurTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/blurry/BlurTask;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/tools/blurry/BlurTask;


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/blurry/BlurTask;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 61
    iput-object p1, p0, Lcom/flyersoft/tools/blurry/BlurTask$1;->this$0:Lcom/flyersoft/tools/blurry/BlurTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 64
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/BlurTask$1;->this$0:Lcom/flyersoft/tools/blurry/BlurTask;

    invoke-static {v0}, Lcom/flyersoft/tools/blurry/BlurTask;->-$$Nest$fgetcontextWeakRef(Lcom/flyersoft/tools/blurry/BlurTask;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 65
    iget-object v1, p0, Lcom/flyersoft/tools/blurry/BlurTask$1;->this$0:Lcom/flyersoft/tools/blurry/BlurTask;

    invoke-static {v1}, Lcom/flyersoft/tools/blurry/BlurTask;->-$$Nest$fgetcallback(Lcom/flyersoft/tools/blurry/BlurTask;)Lcom/flyersoft/tools/blurry/BlurTask$Callback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 66
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/flyersoft/tools/blurry/BlurTask$1$1;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/tools/blurry/BlurTask$1$1;-><init>(Lcom/flyersoft/tools/blurry/BlurTask$1;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
