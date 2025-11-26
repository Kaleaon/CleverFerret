.class Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;
.super Ljava/io/OutputStream;
.source "HttpEntityDigester.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->outputStream()Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;


# direct methods
.method constructor <init>(Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;)V
    .locals 0

    .line 183
    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-virtual {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->close()V

    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-static {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->access$000(Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-virtual {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->flush()V

    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".outputStream()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 186
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-static {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->access$000(Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    iget-object v0, v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->buffer:Lokio/Buffer;

    int-to-byte p1, p1

    invoke-virtual {v0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 189
    iget-object p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-virtual {p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->emitCompleteSegments()Lokio/BufferedSink;

    return-void

    .line 187
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 194
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-static {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->access$000(Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    iget-object v0, v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->buffer:Lokio/Buffer;

    invoke-virtual {v0, p1, p2, p3}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 197
    iget-object p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester$1;->this$0:Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-virtual {p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->emitCompleteSegments()Lokio/BufferedSink;

    return-void

    .line 195
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
