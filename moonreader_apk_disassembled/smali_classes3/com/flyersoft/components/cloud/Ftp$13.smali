.class Lcom/flyersoft/components/cloud/Ftp$13;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
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

.field final synthetic val$newName:Ljava/lang/String;

.field final synthetic val$oldName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;Ljava/lang/String;)V
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

    .line 712
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$13;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$13;->val$oldName:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$13;->val$newName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 715
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$13;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp;->waitWhileBusy()V

    .line 716
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$13;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v0, p1}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mftpReady(Lcom/flyersoft/components/cloud/Ftp;Lio/reactivex/rxjava3/core/ObservableEmitter;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 719
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$13;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$13;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$13;->val$oldName:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$13;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$13;->val$newName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/net/ftp/FTPClient;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    const/4 v0, 0x1

    .line 720
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 722
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 723
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$13;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/Ftp;->errorMsg:Ljava/lang/String;

    const/4 v0, -0x1

    .line 724
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 726
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$13;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/Ftp;->releaseBusy()V

    return-void
.end method
