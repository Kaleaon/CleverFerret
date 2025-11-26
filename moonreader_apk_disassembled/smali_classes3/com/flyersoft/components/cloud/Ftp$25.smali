.class Lcom/flyersoft/components/cloud/Ftp$25;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->getBackupList(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V
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


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1274
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$25;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1276
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$25;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp;->waitWhileBusy()V

    .line 1277
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$25;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v0, p1}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mftpReady(Lcom/flyersoft/components/cloud/Ftp;Lio/reactivex/rxjava3/core/ObservableEmitter;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1279
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/16 v1, 0x8

    .line 1281
    :try_start_0
    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object v1

    .line 1282
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$25;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 1284
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$25;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$25;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/Backup"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lorg/apache/commons/net/ftp/FTPClient;->listFiles(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v1

    .line 1285
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, v1, v3

    .line 1286
    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1287
    const-string v5, ".mrpro"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1288
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " (pro)"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1289
    :cond_1
    const-string v5, ".mrstd"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1290
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " (std)"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1292
    :cond_3
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 1294
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1295
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1297
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$25;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/Ftp;->releaseBusy()V

    return-void
.end method
