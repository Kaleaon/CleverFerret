.class final Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;
.super Lcom/dropbox/core/v1/DbxClientV1$Uploader;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxClientV1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ChunkedUploader"
.end annotation


# instance fields
.field private final body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

.field private final numBytes:J

.field private final targetPath:Ljava/lang/String;

.field final synthetic this$0:Lcom/dropbox/core/v1/DbxClientV1;

.field private final writeMode:Lcom/dropbox/core/v1/DbxWriteMode;


# direct methods
.method private constructor <init>(Lcom/dropbox/core/v1/DbxClientV1;Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)V
    .locals 0

    .line 1274
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->this$0:Lcom/dropbox/core/v1/DbxClientV1;

    invoke-direct {p0}, Lcom/dropbox/core/v1/DbxClientV1$Uploader;-><init>()V

    .line 1275
    iput-object p2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->targetPath:Ljava/lang/String;

    .line 1276
    iput-object p3, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->writeMode:Lcom/dropbox/core/v1/DbxWriteMode;

    .line 1277
    iput-wide p4, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->numBytes:J

    .line 1278
    iput-object p6, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    return-void
.end method

.method synthetic constructor <init>(Lcom/dropbox/core/v1/DbxClientV1;Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;Lcom/dropbox/core/v1/DbxClientV1$1;)V
    .locals 0

    .line 1266
    invoke-direct/range {p0 .. p6}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;-><init>(Lcom/dropbox/core/v1/DbxClientV1;Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;)Lcom/dropbox/core/v1/DbxWriteMode;
    .locals 0

    .line 1266
    iget-object p0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->writeMode:Lcom/dropbox/core/v1/DbxWriteMode;

    return-object p0
.end method

.method static synthetic access$900(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;)Ljava/lang/String;
    .locals 0

    .line 1266
    iget-object p0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->targetPath:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public abort()V
    .locals 0

    return-void
.end method

.method public close()V
    .locals 0

    return-void
.end method

.method public finish()Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1297
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    invoke-static {v0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->access$400(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1300
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->this$0:Lcom/dropbox/core/v1/DbxClientV1;

    iget-object v2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->targetPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->writeMode:Lcom/dropbox/core/v1/DbxWriteMode;

    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    invoke-static {v0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->access$500(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)I

    move-result v0

    int-to-long v4, v0

    new-instance v6, Lcom/dropbox/core/DbxStreamWriter$ByteArrayCopier;

    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    .line 1301
    invoke-static {v0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->access$600(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)[B

    move-result-object v0

    iget-object v7, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    invoke-static {v7}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->access$500(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)I

    move-result v7

    const/4 v8, 0x0

    invoke-direct {v6, v0, v8, v7}, Lcom/dropbox/core/DbxStreamWriter$ByteArrayCopier;-><init>([BII)V

    .line 1300
    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->uploadFileSingle(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object v0

    return-object v0

    .line 1304
    :cond_0
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    invoke-static {v0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->access$400(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)Ljava/lang/String;

    move-result-object v0

    .line 1305
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    invoke-static {v1}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->access$700(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)V

    .line 1308
    iget-wide v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->numBytes:J

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-eqz v5, :cond_2

    .line 1310
    iget-object v3, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    invoke-static {v3}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->access$800(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    goto :goto_0

    .line 1311
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\'numBytes\' is "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->numBytes:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " but you wrote "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    invoke-static {v2}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->access$800(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " bytes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1317
    :cond_2
    :goto_0
    new-instance v1, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;

    invoke-direct {v1, p0, v0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader$1;-><init>(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;Ljava/lang/String;)V

    const/4 v0, 0x3

    invoke-static {v0, v1}, Lcom/dropbox/core/DbxRequestUtil;->runAndRetry(ILcom/dropbox/core/DbxRequestUtil$RequestMaker;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v1/DbxEntry$File;

    return-object v0
.end method

.method public getBody()Ljava/io/OutputStream;
    .locals 1

    .line 1284
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;->body:Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    return-object v0
.end method
