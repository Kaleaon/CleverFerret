.class Lcom/flyersoft/components/cloud/Gdrive$17;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/core/ObservableOnSubscribe<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$openAfterDownload:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/util/ArrayList;Landroid/content/Context;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1133
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->val$con:Landroid/content/Context;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->val$openAfterDownload:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1136
    const-string v0, ".mr"

    const-string v1, "/"

    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-lez v2, :cond_9

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-boolean v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->mCanceled:Z

    if-nez v2, :cond_9

    .line 1138
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->val$files:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    .line 1139
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1140
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1143
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, v2, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v2

    .line 1144
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1146
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ">>*download 1: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v6, v6, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v6, v3, [Ljava/lang/Object;

    aput-object v4, v6, v5

    invoke-static {v6}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1147
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getFileSize(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v6

    iput-wide v6, v4, Lcom/flyersoft/components/cloud/Gdrive;->mFileLen:J

    .line 1148
    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1149
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v8, v7, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1150
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-static {v7, v6}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_1

    .line 1151
    iget-object v8, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    sget-object v9, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 1152
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :cond_1
    if-nez v7, :cond_2

    .line 1153
    iget-object v8, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    sget-object v9, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 1154
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :cond_2
    if-nez v7, :cond_3

    .line 1155
    iget-object v8, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    sget-object v9, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 1156
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    sget-object v10, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-static {v9, v10}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1158
    :cond_3
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    sget-object v8, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1159
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->val$con:Landroid/content/Context;

    const-string v8, "gdrive_cache"

    invoke-virtual {v4, v8, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    iget-object v8, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-interface {v4, v6, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_4
    if-nez v7, :cond_7

    .line 1161
    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1163
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 1167
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v4}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v4

    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/google/api/services/drive/Drive$Files;->get(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Get;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/api/services/drive/Drive$Files$Get;->executeMediaAsInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 1169
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v7, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getFileSize(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v7

    const/16 v2, 0x2000

    .line 1171
    new-array v2, v2, [B

    .line 1173
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v9

    const-wide/16 v10, 0x0

    .line 1174
    :cond_5
    :goto_1
    invoke-virtual {v4, v2}, Ljava/io/InputStream;->read([B)I

    move-result v12

    const/4 v13, -0x1

    if-eq v12, v13, :cond_6

    .line 1175
    invoke-virtual {v9, v2, v5, v12}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v12, v12

    add-long/2addr v10, v12

    .line 1178
    iget-object v12, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-boolean v12, v12, Lcom/flyersoft/components/cloud/Gdrive;->mCanceled:Z

    if-nez v12, :cond_5

    .line 1179
    new-instance v12, Lcom/flyersoft/components/cloud/Cloud$Progress;

    invoke-direct {v12, v10, v11, v7, v8}, Lcom/flyersoft/components/cloud/Cloud$Progress;-><init>(JJ)V

    invoke-interface {p1, v12}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    goto :goto_1

    .line 1181
    :cond_6
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 1183
    invoke-static {v6}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 1184
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v6, v3}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto/16 :goto_0

    .line 1186
    :cond_7
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1187
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->fileCount:I

    if-ne v2, v3, :cond_8

    iget-boolean v2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->val$openAfterDownload:Z

    if-eqz v2, :cond_8

    .line 1188
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    goto/16 :goto_0

    .line 1190
    :cond_8
    invoke-static {v7, v6, v3}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    .line 1194
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1195
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$17;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    .line 1198
    :cond_9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
