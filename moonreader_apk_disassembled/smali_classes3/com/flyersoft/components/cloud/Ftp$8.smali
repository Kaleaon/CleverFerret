.class Lcom/flyersoft/components/cloud/Ftp$8;
.super Ljava/lang/Thread;
.source "Ftp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->verifyFtp(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Ftp;

.field final synthetic val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
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

    .line 479
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$8;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$8;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$8;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const-string v0, "Connected to FTP: "

    const/4 v1, 0x0

    .line 482
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    sput-object v2, Lcom/flyersoft/components/cloud/Ftp;->ok:Ljava/lang/Boolean;

    const/4 v2, 0x1

    .line 485
    :try_start_0
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$8;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    const/4 v4, 0x0

    iput-object v4, v3, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    .line 486
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$8;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    invoke-static {v3}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mcreateFtpClient(Lcom/flyersoft/components/cloud/Ftp;)V

    .line 487
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/flyersoft/components/cloud/Ftp;->ftpUrl:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v0, v3, v1

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 488
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$8;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$8;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyCode()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/ftp/FTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/Ftp;->ok:Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 490
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 491
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    .line 494
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v3, "ftp"

    invoke-virtual {v0, v3, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/components/cloud/Ftp;->ok:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const-string v3, "ok"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 495
    sget-object v0, Lcom/flyersoft/components/cloud/Ftp;->ok:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 496
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_2
    if-ltz v0, :cond_2

    .line 497
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 498
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 501
    :cond_2
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$8;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/flyersoft/components/cloud/Ftp$8$1;

    invoke-direct {v1, p0, v4}, Lcom/flyersoft/components/cloud/Ftp$8$1;-><init>(Lcom/flyersoft/components/cloud/Ftp$8;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
