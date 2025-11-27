.class public final Lcom/dropbox/core/http/OkHttpUtil$PipedStream;
.super Ljava/lang/Object;
.source "OkHttpUtil.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/http/OkHttpUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PipedStream"
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x500000


# instance fields
.field private final in:Ljava/io/PipedInputStream;

.field private final out:Ljava/io/PipedOutputStream;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/io/PipedInputStream;

    const/high16 v1, 0x500000

    invoke-direct {v0, v1}, Ljava/io/PipedInputStream;-><init>(I)V

    iput-object v0, p0, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->in:Ljava/io/PipedInputStream;

    .line 54
    :try_start_0
    new-instance v1, Ljava/io/PipedOutputStream;

    invoke-direct {v1, v0}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    iput-object v1, p0, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->out:Ljava/io/PipedOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 56
    :catch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to create piped stream for async upload request."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 67
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->out:Ljava/io/PipedOutputStream;

    invoke-virtual {v0}, Ljava/io/PipedOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    :catch_0
    :try_start_1
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->in:Ljava/io/PipedInputStream;

    invoke-virtual {v0}, Ljava/io/PipedInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->out:Ljava/io/PipedOutputStream;

    return-object v0
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lcom/dropbox/core/http/OkHttpUtil$PipedStream;->in:Ljava/io/PipedInputStream;

    invoke-static {v0}, Lokio/Okio;->source(Ljava/io/InputStream;)Lokio/Source;

    move-result-object v0

    invoke-interface {p1, v0}, Lokio/BufferedSink;->writeAll(Lokio/Source;)J

    return-void
.end method
