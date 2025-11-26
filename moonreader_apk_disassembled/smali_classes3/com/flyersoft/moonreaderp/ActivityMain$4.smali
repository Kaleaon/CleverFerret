.class Lcom/flyersoft/moonreaderp/ActivityMain$4;
.super Landroid/os/Handler;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->openAttachmentFile(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$dataFile:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/os/Looper;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 537
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$4;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$4;->val$dataFile:Ljava/lang/String;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    const/4 p1, 0x1

    .line 539
    new-array p1, p1, [Ljava/lang/Object;

    const-string v0, "*openAttachmentFile delay"

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 540
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$4;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$4;->val$dataFile:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mopenAttachmentFile(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void
.end method
