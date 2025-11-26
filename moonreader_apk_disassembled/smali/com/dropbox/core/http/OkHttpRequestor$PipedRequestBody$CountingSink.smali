.class final Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody$CountingSink;
.super Lokio/ForwardingSink;
.source "OkHttpRequestor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CountingSink"
.end annotation


# instance fields
.field private bytesWritten:J

.field final synthetic this$0:Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;Lokio/Sink;)V
    .locals 0

    .line 353
    iput-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody$CountingSink;->this$0:Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;

    .line 354
    invoke-direct {p0, p2}, Lokio/ForwardingSink;-><init>(Lokio/Sink;)V

    const-wide/16 p1, 0x0

    .line 351
    iput-wide p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody$CountingSink;->bytesWritten:J

    return-void
.end method


# virtual methods
.method public write(Lokio/Buffer;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 359
    invoke-super {p0, p1, p2, p3}, Lokio/ForwardingSink;->write(Lokio/Buffer;J)V

    .line 361
    iget-wide v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody$CountingSink;->bytesWritten:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody$CountingSink;->bytesWritten:J

    .line 363
    iget-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody$CountingSink;->this$0:Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;

    invoke-static {p1}, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;->access$300(Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;)Lcom/dropbox/core/util/IOUtil$ProgressListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 364
    iget-object p1, p0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody$CountingSink;->this$0:Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;

    invoke-static {p1}, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;->access$300(Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody;)Lcom/dropbox/core/util/IOUtil$ProgressListener;

    move-result-object p1

    iget-wide p2, p0, Lcom/dropbox/core/http/OkHttpRequestor$PipedRequestBody$CountingSink;->bytesWritten:J

    invoke-interface {p1, p2, p3}, Lcom/dropbox/core/util/IOUtil$ProgressListener;->onProgress(J)V

    :cond_0
    return-void
.end method
