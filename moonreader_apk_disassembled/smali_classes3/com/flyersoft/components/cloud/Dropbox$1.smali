.class Lcom/flyersoft/components/cloud/Dropbox$1;
.super Ljava/lang/Thread;
.source "Dropbox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Dropbox;

.field final synthetic val$cloudFilename:Ljava/lang/String;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;)V
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

    .line 92
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->val$cloudFilename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const-string v0, ">>download:"

    const-wide/16 v1, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 96
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v6, v3, [Ljava/lang/Object;

    aput-object v0, v6, v5

    invoke-static {v6}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 97
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 98
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v6}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v6

    invoke-virtual {v6}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v6

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->download(Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/dropbox/core/DbxDownloader;->download(Ljava/io/OutputStream;)Ljava/lang/Object;

    .line 99
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v6, :cond_1

    .line 100
    invoke-interface {v6, v0, v4, v1, v2}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 102
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "###download err:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v6, v3, v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 103
    invoke-static {v0, v5}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 104
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v3, :cond_1

    .line 105
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Dropbox$1;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v5, v0}, Lcom/flyersoft/components/cloud/Dropbox;->isFolderNotExistError(Ljava/lang/Throwable;)Z

    move-result v5

    if-eqz v5, :cond_0

    move-object v0, v4

    goto :goto_0

    :cond_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-interface {v3, v4, v0, v1, v2}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V

    :cond_1
    return-void
.end method
