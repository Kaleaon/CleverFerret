.class Lcom/flyersoft/components/cloud/WebDav$6;
.super Ljava/lang/Thread;
.source "WebDav.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav;

.field final synthetic val$cloudFilename:Ljava/lang/String;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;)V
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

    .line 241
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$6;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$6;->val$cloudFilename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$6;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const-string v0, ">>download:"

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 245
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$6;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v4

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 246
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    iget-object v5, p0, Lcom/flyersoft/components/cloud/WebDav$6;->val$cloudFilename:Ljava/lang/String;

    invoke-direct {v0, v5}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->download()Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 247
    iget-object v5, p0, Lcom/flyersoft/components/cloud/WebDav$6;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v5, :cond_0

    .line 248
    invoke-interface {v5, v0, v3, v1, v2}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 250
    invoke-static {v0, v4}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 251
    iget-object v4, p0, Lcom/flyersoft/components/cloud/WebDav$6;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterDownload;

    if-eqz v4, :cond_0

    .line 252
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v3, v0, v1, v2}, Lcom/flyersoft/components/cloud/Cloud$AfterDownload;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V

    :cond_0
    return-void
.end method
