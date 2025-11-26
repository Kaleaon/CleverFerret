.class final Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;
.super Lcom/dropbox/core/v1/DbxClientV1$Uploader;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxClientV1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SingleUploader"
.end annotation


# instance fields
.field private final body:Lcom/dropbox/core/util/CountingOutputStream;

.field private final claimedBytes:J

.field private httpUploader:Lcom/dropbox/core/http/HttpRequestor$Uploader;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;J)V
    .locals 3

    .line 768
    invoke-direct {p0}, Lcom/dropbox/core/v1/DbxClientV1$Uploader;-><init>()V

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_0

    .line 773
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->httpUploader:Lcom/dropbox/core/http/HttpRequestor$Uploader;

    .line 774
    iput-wide p2, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->claimedBytes:J

    .line 775
    new-instance p2, Lcom/dropbox/core/util/CountingOutputStream;

    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->getBody()Ljava/io/OutputStream;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/dropbox/core/util/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object p2, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->body:Lcom/dropbox/core/util/CountingOutputStream;

    return-void

    .line 770
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'numBytes\' must be greater than or equal to 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public abort()V
    .locals 2

    .line 788
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->httpUploader:Lcom/dropbox/core/http/HttpRequestor$Uploader;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 792
    iput-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->httpUploader:Lcom/dropbox/core/http/HttpRequestor$Uploader;

    .line 794
    invoke-virtual {v0}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->abort()V

    return-void

    .line 789
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "already called \'finish\', \'abort\', or \'close\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .locals 1

    .line 805
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->httpUploader:Lcom/dropbox/core/http/HttpRequestor$Uploader;

    if-nez v0, :cond_0

    return-void

    .line 807
    :cond_0
    invoke-virtual {p0}, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->abort()V

    return-void
.end method

.method public finish()Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const-string v0, "You said you were going to upload "

    .line 818
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->httpUploader:Lcom/dropbox/core/http/HttpRequestor$Uploader;

    if-eqz v1, :cond_1

    const/4 v2, 0x0

    .line 822
    iput-object v2, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->httpUploader:Lcom/dropbox/core/http/HttpRequestor$Uploader;

    .line 827
    :try_start_0
    iget-object v2, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->body:Lcom/dropbox/core/util/CountingOutputStream;

    invoke-virtual {v2}, Lcom/dropbox/core/util/CountingOutputStream;->getBytesWritten()J

    move-result-wide v2

    .line 830
    iget-wide v4, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->claimedBytes:J

    cmp-long v6, v4, v2

    if-nez v6, :cond_0

    .line 836
    invoke-virtual {v1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->finish()Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 842
    invoke-virtual {v1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->close()V

    .line 848
    new-instance v1, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader$1;

    invoke-direct {v1, p0, v2, v3}, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader$1;-><init>(Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;J)V

    invoke-static {v0, v1}, Lcom/dropbox/core/DbxRequestUtil;->finishResponse(Lcom/dropbox/core/http/HttpRequestor$Response;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v1/DbxEntry$File;

    return-object v0

    .line 831
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->abort()V

    .line 832
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v6, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->claimedBytes:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " bytes, but you wrote "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " bytes to the Uploader\'s \'body\' stream."

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 839
    :try_start_2
    new-instance v2, Lcom/dropbox/core/NetworkIOException;

    invoke-direct {v2, v0}, Lcom/dropbox/core/NetworkIOException;-><init>(Ljava/io/IOException;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 842
    :goto_0
    invoke-virtual {v1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->close()V

    .line 843
    throw v0

    .line 819
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "already called \'finish\', \'abort\', or \'close\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBody()Ljava/io/OutputStream;
    .locals 1

    .line 780
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;->body:Lcom/dropbox/core/util/CountingOutputStream;

    return-object v0
.end method
