.class Lcom/flyersoft/moonreaderp/ActivityMain$80;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->deleteSelectedFilesFinal(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$fromPopupMenu:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 7257
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->val$fromPopupMenu:Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 7260
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->selectedFiles:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 7261
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetstopFileOperation(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 7263
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->selectedFiles:Ljava/util/ArrayList;

    .line 7264
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 7263
    invoke-virtual {v3, v0, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 7265
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selectedFiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->deleteSingeBook(Ljava/lang/String;Z)Z

    move-result v2

    .line 7266
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->sd_grant_dlg:Lcom/flyersoft/components/MyDialog;

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-eqz v2, :cond_4

    .line 7270
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    .line 7271
    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->val$fromPopupMenu:Z

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->selectedFiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    const/4 v3, 0x2

    .line 7270
    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 7272
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 7273
    invoke-static {}, Lcom/flyersoft/tools/A;->saveAllShelfSorts()V

    return-void
.end method
