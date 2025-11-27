.class Lcom/flyersoft/components/cloud/Ftp$21;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Ftp;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$files:Ljava/util/ArrayList;

.field final synthetic val$openAfterDownload:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/util/ArrayList;Landroid/content/Context;Z)V
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

    .line 1019
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$21;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$21;->val$con:Landroid/content/Context;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/Ftp$21;->val$openAfterDownload:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 1022
    const-string v0, "/"

    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v3}, Lcom/flyersoft/components/cloud/Ftp;->waitWhileBusy()V

    .line 1023
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v3, v2}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mftpReady(Lcom/flyersoft/components/cloud/Ftp;Lio/reactivex/rxjava3/core/ObservableEmitter;)Z

    move-result v3

    if-nez v3, :cond_0

    return-void

    .line 1025
    :cond_0
    :goto_0
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-lez v3, :cond_10

    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-boolean v3, v3, Lcom/flyersoft/components/cloud/Ftp;->mCanceled:Z

    if-nez v3, :cond_10

    .line 1027
    :try_start_0
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v5, v1, Lcom/flyersoft/components/cloud/Ftp$21;->val$files:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v3, v5}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    .line 1028
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1029
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1031
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v5, v3, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v3, v5}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mgetFtpFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)J

    move-result-wide v7

    iput-wide v7, v3, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    .line 1032
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ">>*download 1: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v5, v5, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " | size: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v5, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v7, v5, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/Object;

    aput-object v3, v8, v6

    aput-object v5, v8, v4

    invoke-static {v8}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1034
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1035
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v9, v8, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-static {v8, v9}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1037
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v8, v8, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    const-wide/16 v10, 0x0

    cmp-long v12, v8, v10

    if-lez v12, :cond_3

    .line 1038
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v8, v5}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_1

    .line 1039
    iget-object v9, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v9, v9, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    sget-object v12, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 1040
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v12, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    :cond_1
    if-nez v8, :cond_2

    .line 1041
    iget-object v9, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v9, v9, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    sget-object v12, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 1042
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v12, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    :cond_2
    if-nez v8, :cond_4

    .line 1043
    iget-object v9, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v9, v9, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    sget-object v12, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 1044
    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    sget-object v13, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-static {v12, v13}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    :cond_3
    const/4 v8, 0x0

    .line 1047
    :cond_4
    :goto_1
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    sget-object v9, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1048
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->val$con:Landroid/content/Context;

    const-string v9, "ftp_cache"

    invoke-virtual {v3, v9, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    iget-object v9, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v9, v9, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-interface {v3, v5, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_5
    if-nez v8, :cond_d

    .line 1051
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, ">>*download 2: "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "to: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-array v9, v7, [Ljava/lang/Object;

    aput-object v3, v9, v6

    aput-object v8, v9, v4

    invoke-static {v9}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1052
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ".mr"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1053
    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    const/4 v8, 0x0

    .line 1057
    :goto_2
    iget-object v9, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    if-lez v8, :cond_6

    const/4 v12, 0x1

    goto :goto_3

    :cond_6
    const/4 v12, 0x0

    :goto_3
    iput-boolean v12, v9, Lcom/flyersoft/components/cloud/Ftp;->isReTryDownload:Z

    .line 1058
    iget-object v9, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v9, v9, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 1059
    iget-object v9, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v9, v9, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v12, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v13, v12, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v12, v13}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v9, :cond_9

    .line 1061
    :try_start_1
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v12

    const/16 v13, 0x2000

    .line 1063
    new-array v13, v13, [B

    move-wide v14, v10

    move-wide/from16 v16, v14

    .line 1065
    :goto_4
    invoke-virtual {v9, v13}, Ljava/io/InputStream;->read([B)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_8

    .line 1066
    invoke-virtual {v12, v13, v6, v10}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v10, v10

    add-long/2addr v14, v10

    .line 1068
    iget-object v10, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-boolean v10, v10, Lcom/flyersoft/components/cloud/Ftp;->mCanceled:Z

    if-nez v10, :cond_7

    .line 1069
    new-instance v10, Lcom/flyersoft/components/cloud/Cloud$Progress;

    iget-object v11, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object/from16 v19, v5

    const/16 v18, 0x1

    :try_start_2
    iget-wide v4, v11, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    invoke-direct {v10, v14, v15, v4, v5}, Lcom/flyersoft/components/cloud/Cloud$Progress;-><init>(JJ)V

    invoke-interface {v2, v10}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    goto :goto_5

    :cond_7
    move-object/from16 v19, v5

    const/16 v18, 0x1

    :goto_5
    move-object/from16 v5, v19

    const/4 v4, 0x1

    goto :goto_4

    :cond_8
    move-object/from16 v19, v5

    const/16 v18, 0x1

    .line 1071
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V

    .line 1072
    iget-object v4, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPClient;->completePendingCommand()Z

    goto :goto_6

    :catchall_0
    move-exception v0

    const/16 v18, 0x1

    goto/16 :goto_8

    :cond_9
    move-object/from16 v19, v5

    move-wide/from16 v16, v10

    const/16 v18, 0x1

    .line 1075
    :goto_6
    iget-object v4, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-boolean v4, v4, Lcom/flyersoft/components/cloud/Ftp;->mCanceled:Z

    if-nez v4, :cond_b

    iget-object v4, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v4, v4, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    cmp-long v9, v4, v16

    if-lez v9, :cond_b

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v4

    iget-object v9, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v9, v9, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    cmp-long v11, v4, v9

    if-eqz v11, :cond_b

    add-int/lit8 v4, v8, 0x1

    if-lt v8, v7, :cond_a

    goto :goto_7

    :cond_a
    const-wide/16 v8, 0x64

    .line 1078
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    .line 1079
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "#file size different, try again "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-array v9, v7, [Ljava/lang/Object;

    aput-object v5, v9, v6

    aput-object v8, v9, v18

    invoke-static {v9}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    move v8, v4

    move-wide/from16 v10, v16

    move-object/from16 v5, v19

    const/4 v4, 0x1

    goto/16 :goto_2

    .line 1084
    :cond_b
    :goto_7
    invoke-static/range {v19 .. v19}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 1085
    iget-object v4, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v4, v4, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    cmp-long v8, v4, v16

    if-lez v8, :cond_c

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v4

    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v8, v8, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    cmp-long v10, v4, v8

    if-eqz v10, :cond_c

    .line 1086
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "should be "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-wide v8, v8, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v8, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const-string v10, "####FTP Download Failed, size different"

    aput-object v10, v9, v6

    aput-object v4, v9, v18

    aput-object v5, v9, v7

    const/4 v4, 0x3

    aput-object v8, v9, v4

    invoke-static {v9}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_c
    move-object/from16 v4, v19

    const/4 v5, 0x1

    .line 1087
    invoke-static {v3, v4, v5}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto/16 :goto_0

    :cond_d
    move-object v4, v5

    .line 1088
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1089
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget v3, v3, Lcom/flyersoft/components/cloud/Ftp;->fileCount:I

    const/4 v5, 0x1

    if-ne v3, v5, :cond_f

    iget-boolean v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->val$openAfterDownload:Z

    if-eqz v3, :cond_e

    .line 1090
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    goto/16 :goto_0

    :cond_e
    const/4 v5, 0x1

    .line 1092
    :cond_f
    invoke-static {v8, v4, v5}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    .line 1095
    :goto_8
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1096
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Lcom/flyersoft/components/cloud/Ftp;->errorMsg:Ljava/lang/String;

    :cond_10
    const/16 v18, 0x1

    .line 1099
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v2, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1100
    iget-object v0, v1, Lcom/flyersoft/components/cloud/Ftp$21;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp;->releaseBusy()V

    return-void
.end method
