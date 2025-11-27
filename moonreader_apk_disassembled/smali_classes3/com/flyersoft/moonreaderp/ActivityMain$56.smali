.class Lcom/flyersoft/moonreaderp/ActivityMain$56;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->do_local_search_thread(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V
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

    .line 5198
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 5201
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->val$key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 5204
    :try_start_0
    sget-object v2, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v7, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    new-instance v10, Lcom/flyersoft/moonreaderp/ActivityMain$56$1;

    invoke-direct {v10, p0, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$56$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$56;Ljava/lang/String;)V

    const/4 v3, 0x1

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x7

    invoke-static/range {v2 .. v10}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZLandroid/os/Handler;IILcom/flyersoft/tools/T$FileResultOK;)Ljava/util/ArrayList;

    move-result-object v2

    .line 5212
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 5213
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 5214
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/flyersoft/tools/T;->filenameMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 5215
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 5216
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 5217
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    new-instance v4, Lcom/flyersoft/tools/T$FileSearch;

    sget-object v5, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-direct {v4, v5, v3}, Lcom/flyersoft/tools/T$FileSearch;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    const/4 v3, 0x7

    invoke-virtual {v2, v3, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 5218
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$56;->val$key:Ljava/lang/String;

    const/16 v4, 0x8

    invoke-virtual {v2, v4, v1, v1, v3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 5220
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 5222
    :goto_1
    sput-boolean v1, Lcom/flyersoft/tools/T;->scanCanceled:Z

    return-void
.end method
