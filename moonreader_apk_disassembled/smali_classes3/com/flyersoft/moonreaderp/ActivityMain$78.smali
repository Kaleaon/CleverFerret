.class Lcom/flyersoft/moonreaderp/ActivityMain$78;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->copyMoveSelectedFiles()V
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

    .line 7132
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    const/4 v0, 0x3

    const/4 v1, 0x1

    .line 7136
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetOverwriteFiles(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/util/ArrayList;

    move-result-object v2

    .line 7137
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 7138
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 7139
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 7140
    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 7141
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v4, v3, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->ifRequestGrantSD(Ljava/lang/String;Z)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    .line 7203
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 7204
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 7143
    :cond_2
    :try_start_1
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 7144
    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteFolder(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 7145
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v4, v3, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->ifRequestGrantSD(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 7151
    :cond_3
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selectedFiles:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 7152
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetstopFileOperation(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_0

    .line 7154
    :cond_5
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 7155
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_7

    .line 7156
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 7157
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    invoke-virtual {v7, v6, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 7159
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->isMoveFile:Z

    if-eqz v5, :cond_6

    .line 7160
    invoke-static {v3, v4, v1}, Lcom/flyersoft/tools/T;->moveFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    .line 7161
    invoke-static {v3, v4}, Lcom/flyersoft/tools/A;->updateToNewFilename(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 7163
    :cond_6
    invoke-static {v3, v4, v1}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    :goto_2
    if-nez v5, :cond_4

    .line 7164
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v3, v4, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->ifRequestGrantSD(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_4

    goto/16 :goto_0

    .line 7167
    :cond_7
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 7168
    invoke-static {v3, v1, v6, v1, v1}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZ)Ljava/util/ArrayList;

    move-result-object v5

    .line 7169
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 7171
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    sub-int/2addr v7, v1

    :goto_3
    if-ltz v7, :cond_b

    .line 7172
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 7173
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetstopFileOperation(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    move-result v8

    if-eqz v8, :cond_8

    goto/16 :goto_0

    .line 7175
    :cond_8
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 7176
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    invoke-virtual {v10, v6, v8}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 7177
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v9, v9, Lcom/flyersoft/moonreaderp/ActivityMain;->isMoveFile:Z

    if-eqz v9, :cond_9

    .line 7178
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9, v8, v1}, Lcom/flyersoft/tools/T;->moveFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v9

    .line 7179
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10, v8}, Lcom/flyersoft/tools/A;->updateToNewFilename(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 7181
    :cond_9
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9, v8, v1}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v9

    :goto_4
    if-nez v9, :cond_a

    .line 7182
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v9, v8, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->ifRequestGrantSD(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_a

    goto/16 :goto_0

    :cond_a
    add-int/lit8 v7, v7, -0x1

    goto :goto_3

    .line 7186
    :cond_b
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 7187
    invoke-static {v7}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 7188
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 7189
    invoke-static {v7}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_c

    .line 7190
    invoke-static {v7}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_c

    .line 7191
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v8, v7, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->ifRequestGrantSD(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_c

    goto/16 :goto_0

    .line 7195
    :cond_d
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->isMoveFile:Z

    if-eqz v4, :cond_4

    .line 7196
    invoke-static {v3, v1, v1, v1, v6}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZ)Ljava/util/ArrayList;

    move-result-object v4

    .line 7197
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_4

    .line 7198
    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteFolder(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1

    :catchall_0
    move-exception v2

    .line 7203
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 7204
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$78;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 7205
    throw v2
.end method
