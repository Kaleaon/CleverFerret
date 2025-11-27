.class Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;
.super Lcom/dropbox/core/http/HttpRequestor$Uploader;
.source "StandardHttpRequestor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/http/StandardHttpRequestor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Uploader"
.end annotation


# instance fields
.field private conn:Ljava/net/HttpURLConnection;

.field private final out:Lcom/dropbox/core/util/ProgressOutputStream;

.field final synthetic this$0:Lcom/dropbox/core/http/StandardHttpRequestor;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/http/StandardHttpRequestor;Ljava/net/HttpURLConnection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    iput-object p1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->this$0:Lcom/dropbox/core/http/StandardHttpRequestor;

    invoke-direct {p0}, Lcom/dropbox/core/http/HttpRequestor$Uploader;-><init>()V

    .line 142
    iput-object p2, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    .line 143
    new-instance p1, Lcom/dropbox/core/util/ProgressOutputStream;

    invoke-static {p2}, Lcom/dropbox/core/http/StandardHttpRequestor;->access$000(Ljava/net/HttpURLConnection;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/dropbox/core/util/ProgressOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object p1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->out:Lcom/dropbox/core/util/ProgressOutputStream;

    .line 145
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->connect()V

    return-void
.end method


# virtual methods
.method public abort()V
    .locals 2

    .line 155
    iget-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    .line 160
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    const/4 v0, 0x0

    .line 161
    iput-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    return-void

    .line 156
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t abort().  Uploader already closed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_0

    return-void

    .line 169
    :cond_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getDoOutput()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 171
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/dropbox/core/util/IOUtil;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    const/4 v0, 0x0

    .line 178
    iput-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    return-void
.end method

.method public finish()Lcom/dropbox/core/http/HttpRequestor$Response;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 188
    :try_start_0
    iget-object v2, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->this$0:Lcom/dropbox/core/http/StandardHttpRequestor;

    invoke-static {v2, v0}, Lcom/dropbox/core/http/StandardHttpRequestor;->access$100(Lcom/dropbox/core/http/StandardHttpRequestor;Ljava/net/HttpURLConnection;)Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 190
    iput-object v1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    return-object v0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->conn:Ljava/net/HttpURLConnection;

    .line 191
    throw v0

    .line 184
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t finish().  Uploader already closed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBody()Ljava/io/OutputStream;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->out:Lcom/dropbox/core/util/ProgressOutputStream;

    return-object v0
.end method

.method public setProgressListener(Lcom/dropbox/core/util/IOUtil$ProgressListener;)V
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Uploader;->out:Lcom/dropbox/core/util/ProgressOutputStream;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/util/ProgressOutputStream;->setListener(Lcom/dropbox/core/util/IOUtil$ProgressListener;)V

    return-void
.end method
