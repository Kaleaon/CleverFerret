.class Lcom/flyersoft/components/cloud/Ftp$15;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->delete(Landroid/content/Context;Ljava/util/ArrayList;)V
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

.field final synthetic val$files:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/util/ArrayList;)V
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 758
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$15;->val$files:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 761
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp;->waitWhileBusy()V

    .line 762
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v0, p1}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mftpReady(Lcom/flyersoft/components/cloud/Ftp;Lio/reactivex/rxjava3/core/ObservableEmitter;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 764
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Ftp;->mCanceled:Z

    if-nez v0, :cond_1

    .line 766
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$15;->val$files:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    .line 767
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 768
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 769
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v1, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/FTPClient;->deleteFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 770
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, v1, Lcom/flyersoft/components/cloud/Ftp;->mFilename:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/FTPClient;->removeDirectory(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 772
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 773
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/Ftp;->errorMsg:Ljava/lang/String;

    .line 776
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$15;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp;->releaseBusy()V

    const/4 v0, 0x1

    .line 777
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
