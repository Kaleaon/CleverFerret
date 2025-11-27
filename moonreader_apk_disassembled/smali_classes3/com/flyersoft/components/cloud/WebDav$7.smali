.class Lcom/flyersoft/components/cloud/WebDav$7;
.super Ljava/lang/Thread;
.source "WebDav.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav;

.field final synthetic val$cloudFilename:Ljava/lang/String;

.field final synthetic val$is:Ljava/io/InputStream;

.field final synthetic val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;Ljava/io/InputStream;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;)V
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

    .line 263
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$7;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$cloudFilename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$is:Ljava/io/InputStream;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const-string v0, ">>upload:"

    const/4 v1, 0x0

    .line 267
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$cloudFilename:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v0, v3, v1

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 268
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$7;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$cloudFilename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flyersoft/components/cloud/WebDav;->initPaths(Ljava/lang/String;)Ljava/lang/String;

    .line 269
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$cloudFilename:Ljava/lang/String;

    invoke-direct {v0, v3}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$is:Ljava/io/InputStream;

    invoke-virtual {v0, v3}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->upload(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 271
    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v1

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 272
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v2, :cond_1

    .line 273
    invoke-interface {v2, v0}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 275
    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 276
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$7;->val$onDone:Lcom/flyersoft/components/cloud/Cloud$AfterUpload;

    if-eqz v1, :cond_1

    .line 277
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/flyersoft/components/cloud/Cloud$AfterUpload;->afterUpload(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
