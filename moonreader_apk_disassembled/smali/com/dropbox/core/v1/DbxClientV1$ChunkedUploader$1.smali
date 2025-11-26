.class Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;
.super Lcom/dropbox/core/DbxRequestUtil$RequestMaker;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->finish()Lcom/dropbox/core/v1/DbxEntry$File;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/DbxRequestUtil$RequestMaker<",
        "Lcom/dropbox/core/v1/DbxEntry$File;",
        "Ljava/lang/RuntimeException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;

.field final synthetic val$uploadId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;Ljava/lang/String;)V
    .locals 0

    .line 1317
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;->this$1:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;

    iput-object p2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;->val$uploadId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/dropbox/core/DbxRequestUtil$RequestMaker;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1319
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;->this$1:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;

    iget-object v0, v0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->this$0:Lcom/dropbox/core/v1/DbxClientV1;

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;->this$1:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;

    invoke-static {v1}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->access$900(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;->this$1:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;

    invoke-static {v2}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->access$1000(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;)Lcom/dropbox/core/v1/DbxWriteMode;

    move-result-object v2

    iget-object v3, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;->val$uploadId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadFinish(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1317
    invoke-virtual {p0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;->run()Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object v0

    return-object v0
.end method
