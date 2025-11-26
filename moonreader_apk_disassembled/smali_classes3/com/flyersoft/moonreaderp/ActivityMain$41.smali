.class Lcom/flyersoft/moonreaderp/ActivityMain$41;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->rebuildCoverThread(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 4151
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 4153
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetstopFileOperation(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 4154
    new-array p1, p1, [Ljava/lang/Object;

    const-string v0, "*****cancel rebuildCoverFinal*****"

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 4155
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$41;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    const/16 v0, 0x14

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method
