.class Lcom/flyersoft/moonreaderp/ActivityMain$52;
.super Landroid/os/Handler;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->resetBooklistByScreenChange()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/os/Looper;)V
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

    .line 4868
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 4870
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mupdateTab(Lcom/flyersoft/moonreaderp/ActivityMain;IZ)V

    return-void
.end method
