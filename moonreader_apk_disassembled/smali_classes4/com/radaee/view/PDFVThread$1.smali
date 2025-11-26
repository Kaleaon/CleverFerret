.class Lcom/radaee/view/PDFVThread$1;
.super Ljava/util/TimerTask;
.source "PDFVThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/view/PDFVThread;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/view/PDFVThread;


# direct methods
.method constructor <init>(Lcom/radaee/view/PDFVThread;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 59
    iput-object p1, p0, Lcom/radaee/view/PDFVThread$1;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/radaee/view/PDFVThread$1;->this$0:Lcom/radaee/view/PDFVThread;

    invoke-static {v0}, Lcom/radaee/view/PDFVThread;->access$000(Lcom/radaee/view/PDFVThread;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
