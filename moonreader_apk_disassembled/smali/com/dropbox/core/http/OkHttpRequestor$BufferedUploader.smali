.class Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;
.super Lcom/dropbox/core/http/HttpRequestor$Uploader;
.source "OkHttpRequestor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/http/OkHttpRequestor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BufferedUploader"
.end annotation


# instance fields
.field private body:Lcom/squareup/okhttp/RequestBody;

.field private call:Lcom/squareup/okhttp/Call;

.field private callback:Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;

.field private cancelled:Z

.field private closed:Z

.field private final method:Ljava/lang/String;

.field private final request:Lcom/squareup/okhttp/Request$Builder;

.field final synthetic this$0:Lcom/dropbox/core/http/OkHttpRequestor;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/http/OkHttpRequestor;Ljava/lang/String;Lcom/squareup/okhttp/Request$Builder;)V
    .locals 0

    .line 170
    iput-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->this$0:Lcom/dropbox/core/http/OkHttpRequestor;

    invoke-direct {p0}, Lcom/dropbox/core/http/HttpRequestor$Uploader;-><init>()V

    .line 171
    iput-object p2, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->method:Ljava/lang/String;

    .line 172
    iput-object p3, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->request:Lcom/squareup/okhttp/Request$Builder;

    const/4 p1, 0x0

    .line 174
    iput-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->body:Lcom/squareup/okhttp/RequestBody;

    .line 175
    iput-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->call:Lcom/squareup/okhttp/Call;

    .line 176
    iput-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->callback:Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;

    const/4 p1, 0x0

    .line 178
    iput-boolean p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->closed:Z

    .line 179
    iput-boolean p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->cancelled:Z

    return-void
.end method

.method private assertNoBody()V
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->body:Lcom/squareup/okhttp/RequestBody;

    if-nez v0, :cond_0

    return-void

    .line 184
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Request body already set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setBody(Lcom/squareup/okhttp/RequestBody;)V
    .locals 2

    .line 210
    invoke-direct {p0}, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->assertNoBody()V

    .line 211
    iput-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->body:Lcom/squareup/okhttp/RequestBody;

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->request:Lcom/squareup/okhttp/Request$Builder;

    iget-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->method:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/squareup/okhttp/Request$Builder;->method(Ljava/lang/String;Lcom/squareup/okhttp/RequestBody;)Lcom/squareup/okhttp/Request$Builder;

    .line 213
    iget-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->this$0:Lcom/dropbox/core/http/OkHttpRequestor;

    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->request:Lcom/squareup/okhttp/Request$Builder;

    invoke-virtual {p1, v0}, Lcom/dropbox/core/http/OkHttpRequestor;->configureRequest(Lcom/squareup/okhttp/Request$Builder;)V

    return-void
.end method


# virtual methods
.method public abort()V
    .locals 1

    .line 240
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->call:Lcom/squareup/okhttp/Call;

    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call;->cancel()V

    :cond_0
    const/4 v0, 0x1

    .line 243
    iput-boolean v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->cancelled:Z

    .line 244
    invoke-virtual {p0}, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->close()V

    return-void
.end method

.method public close()V
    .locals 2

    .line 228
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->body:Lcom/squareup/okhttp/RequestBody;

    if-eqz v0, :cond_0

    instance-of v1, v0, Ljava/io/Closeable;

    if-eqz v1, :cond_0

    .line 230
    :try_start_0
    check-cast v0, Ljava/io/Closeable;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x1

    .line 235
    iput-boolean v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->closed:Z

    return-void
.end method

.method public finish()Lcom/dropbox/core/http/HttpRequestor$Response;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 249
    iget-boolean v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->cancelled:Z

    if-nez v0, :cond_2

    .line 252
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->body:Lcom/squareup/okhttp/RequestBody;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 253
    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->upload([B)V

    .line 256
    :cond_0
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->callback:Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;

    if-eqz v0, :cond_1

    .line 259
    :try_start_0
    invoke-virtual {p0}, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->getBody()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    :catch_0
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->callback:Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;

    invoke-virtual {v0}, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    goto :goto_0

    .line 265
    :cond_1
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->this$0:Lcom/dropbox/core/http/OkHttpRequestor;

    invoke-static {v0}, Lcom/dropbox/core/http/OkHttpRequestor;->access$100(Lcom/dropbox/core/http/OkHttpRequestor;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->request:Lcom/squareup/okhttp/Request$Builder;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/OkHttpClient;->newCall(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Call;

    move-result-object v0

    iput-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->call:Lcom/squareup/okhttp/Call;

    .line 266
    invoke-virtual {v0}, Lcom/squareup/okhttp/Call;->execute()Lcom/squareup/okhttp/Response;

    move-result-object v0

    .line 268
    :goto_0
    iget-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->this$0:Lcom/dropbox/core/http/OkHttpRequestor;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/http/OkHttpRequestor;->interceptResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    .line 269
    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-static {v1}, Lcom/dropbox/core/http/OkHttpRequestor;->access$200(Lcom/squareup/okhttp/Headers;)Ljava/util/Map;

    move-result-object v1

    .line 270
    new-instance v2, Lcom/dropbox/core/http/HttpRequestor$Response;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v3

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v2, v3, v0, v1}, Lcom/dropbox/core/http/HttpRequestor$Response;-><init>(ILjava/io/InputStream;Ljava/util/Map;)V

    return-object v2

    .line 250
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already aborted"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBody()Ljava/io/OutputStream;
    .locals 3

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->body:Lcom/squareup/okhttp/RequestBody;

    instance-of v1, v0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;

    if-eqz v1, :cond_0

    .line 193
    check-cast v0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;

    invoke-virtual {v0}, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0

    .line 195
    :cond_0
    new-instance v0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;

    invoke-direct {v0}, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;-><init>()V

    .line 196
    iget-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->progressListener:Lcom/dropbox/core/util/IOUtil$ProgressListener;

    if-eqz v1, :cond_1

    .line 197
    iget-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->progressListener:Lcom/dropbox/core/util/IOUtil$ProgressListener;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;->setListener(Lcom/dropbox/core/util/IOUtil$ProgressListener;)V

    .line 199
    :cond_1
    invoke-direct {p0, v0}, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->setBody(Lcom/squareup/okhttp/RequestBody;)V

    .line 201
    new-instance v1, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;-><init>(Lcom/dropbox/core/http/OkHttpRequestor$1;)V

    iput-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->callback:Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;

    .line 202
    iget-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->this$0:Lcom/dropbox/core/http/OkHttpRequestor;

    invoke-static {v1}, Lcom/dropbox/core/http/OkHttpRequestor;->access$100(Lcom/dropbox/core/http/OkHttpRequestor;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->request:Lcom/squareup/okhttp/Request$Builder;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/OkHttpClient;->newCall(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Call;

    move-result-object v1

    iput-object v1, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->call:Lcom/squareup/okhttp/Call;

    .line 204
    iget-object v2, p0, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->callback:Lcom/dropbox/core/http/OkHttpRequestor$AsyncCallback;

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Call;->enqueue(Lcom/squareup/okhttp/Callback;)V

    .line 205
    invoke-virtual {v0}, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public upload(Ljava/io/File;)V
    .locals 1

    const/4 v0, 0x0

    .line 218
    invoke-static {v0, p1}, Lcom/squareup/okhttp/RequestBody;->create(Lcom/squareup/okhttp/MediaType;Ljava/io/File;)Lcom/squareup/okhttp/RequestBody;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->setBody(Lcom/squareup/okhttp/RequestBody;)V

    return-void
.end method

.method public upload([B)V
    .locals 1

    const/4 v0, 0x0

    .line 223
    invoke-static {v0, p1}, Lcom/squareup/okhttp/RequestBody;->create(Lcom/squareup/okhttp/MediaType;[B)Lcom/squareup/okhttp/RequestBody;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/dropbox/core/http/OkHttpRequestor$BufferedUploader;->setBody(Lcom/squareup/okhttp/RequestBody;)V

    return-void
.end method
