.class Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;
.super Lokhttp3/RequestBody;
.source "OkHttp3Requestor.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/http/OkHttp3Requestor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PipedRequestBody"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody$CountingSink;
    }
.end annotation


# instance fields
.field private listener:Lcom/dropbox/core/util/IOUtil$ProgressListener;

.field private final stream:Lcom/dropbox/core/http/OkHttpUtil$PipedStream;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 327
    invoke-direct {p0}, Lokhttp3/RequestBody;-><init>()V

    .line 328
    new-instance v0, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;

    invoke-direct {v0}, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;-><init>()V

    iput-object v0, p0, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;->stream:Lcom/dropbox/core/http/OkHttpUtil$PipedStream;

    return-void
.end method

.method static synthetic access$300(Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;)Lcom/dropbox/core/util/IOUtil$ProgressListener;
    .locals 0

    .line 322
    iget-object p0, p0, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;->listener:Lcom/dropbox/core/util/IOUtil$ProgressListener;

    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 344
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;->stream:Lcom/dropbox/core/http/OkHttpUtil$PipedStream;

    invoke-virtual {v0}, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->close()V

    return-void
.end method

.method public contentLength()J
    .locals 2

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public contentType()Lokhttp3/MediaType;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .line 334
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;->stream:Lcom/dropbox/core/http/OkHttpUtil$PipedStream;

    invoke-virtual {v0}, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public isOneShot()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setListener(Lcom/dropbox/core/util/IOUtil$ProgressListener;)V
    .locals 0

    .line 331
    iput-object p1, p0, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;->listener:Lcom/dropbox/core/util/IOUtil$ProgressListener;

    return-void
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 359
    new-instance v0, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody$CountingSink;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody$CountingSink;-><init>(Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;Lokio/Sink;)V

    .line 360
    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object p1

    .line 361
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;->stream:Lcom/dropbox/core/http/OkHttpUtil$PipedStream;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->writeTo(Lokio/BufferedSink;)V

    .line 362
    invoke-interface {p1}, Lokio/BufferedSink;->flush()V

    .line 363
    invoke-virtual {p0}, Lcom/dropbox/core/http/OkHttp3Requestor$PipedRequestBody;->close()V

    return-void
.end method
