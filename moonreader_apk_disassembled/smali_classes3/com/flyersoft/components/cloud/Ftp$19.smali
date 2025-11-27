.class Lcom/flyersoft/components/cloud/Ftp$19;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
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

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 887
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$19;->val$path:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$19;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 890
    const-string v0, "/"

    .line 0
    const-string v1, "dir:"

    .line 890
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v2}, Lcom/flyersoft/components/cloud/Ftp;->waitWhileBusy()V

    .line 891
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v2, p1}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mftpReady(Lcom/flyersoft/components/cloud/Ftp;Lio/reactivex/rxjava3/core/ObservableEmitter;)Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    .line 895
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$19;->val$path:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 896
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v3, v2, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/cloud/Ftp;->initPaths(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 897
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-eqz v2, :cond_1

    .line 899
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    if-nez v1, :cond_1

    .line 900
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v1, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 901
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 902
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object v0, v1, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 905
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 907
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v1, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/FTPClient;->listFiles(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v0

    if-nez v0, :cond_2

    .line 909
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    :cond_2
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 911
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 912
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/cloud/Ftp;->errorMsg:Ljava/lang/String;

    .line 913
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 915
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$19;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/Ftp;->releaseBusy()V

    return-void
.end method
