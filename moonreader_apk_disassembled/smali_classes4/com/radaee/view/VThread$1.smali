.class Lcom/radaee/view/VThread$1;
.super Ljava/util/TimerTask;
.source "VThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/view/VThread;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/view/VThread;


# direct methods
.method constructor <init>(Lcom/radaee/view/VThread;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 64
    iput-object p1, p0, Lcom/radaee/view/VThread$1;->this$0:Lcom/radaee/view/VThread;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/radaee/view/VThread$1;->this$0:Lcom/radaee/view/VThread;

    invoke-static {v0}, Lcom/radaee/view/VThread;->access$000(Lcom/radaee/view/VThread;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
