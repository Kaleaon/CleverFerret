.class Lcom/flyersoft/components/cloud/Dropbox$2;
.super Ljava/lang/Thread;
.source "Dropbox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Dropbox;

.field final synthetic val$cloudFilename:Ljava/lang/String;

.field final synthetic val$is:Ljava/io/InputStream;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;Ljava/io/InputStream;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;)V
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

    .line 116
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$cloudFilename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$is:Ljava/io/InputStream;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const-string v0, ">>upload:"

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 120
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v3, v1, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 121
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v0

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadBuilder;

    move-result-object v0

    sget-object v3, Lcom/dropbox/core/v2/files/WriteMode;->OVERWRITE:Lcom/dropbox/core/v2/files/WriteMode;

    invoke-virtual {v0, v3}, Lcom/dropbox/core/v2/files/UploadBuilder;->withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/UploadBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$is:Ljava/io/InputStream;

    invoke-virtual {v0, v3}, Lcom/dropbox/core/v2/files/UploadBuilder;->uploadAndFinish(Ljava/io/InputStream;)Ljava/lang/Object;

    .line 122
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v0, :cond_0

    const/4 v3, 0x0

    .line 123
    invoke-interface {v0, v3}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 125
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "###upload err:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 126
    invoke-static {v0, v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 127
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$2;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v1, :cond_0

    .line 128
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
