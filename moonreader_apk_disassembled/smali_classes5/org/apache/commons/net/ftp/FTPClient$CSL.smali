.class Lorg/apache/commons/net/ftp/FTPClient$CSL;
.super Ljava/lang/Object;
.source "FTPClient.java"

# interfaces
.implements Lorg/apache/commons/net/io/CopyStreamListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/ftp/FTPClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CSL"
.end annotation


# instance fields
.field private acksAcked:I

.field private final currentSoTimeoutMillis:I

.field private final idleMillis:J

.field private ioErrors:I

.field private notAcked:I

.field private final parent:Lorg/apache/commons/net/ftp/FTPClient;

.field private timeMillis:J


# direct methods
.method constructor <init>(Lorg/apache/commons/net/ftp/FTPClient;JI)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 306
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->timeMillis:J

    .line 312
    iput-wide p2, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->idleMillis:J

    .line 313
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->parent:Lorg/apache/commons/net/ftp/FTPClient;

    .line 314
    invoke-virtual {p1}, Lorg/apache/commons/net/ftp/FTPClient;->getSoTimeout()I

    move-result p2

    iput p2, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->currentSoTimeoutMillis:I

    .line 315
    invoke-virtual {p1, p4}, Lorg/apache/commons/net/ftp/FTPClient;->setSoTimeout(I)V

    return-void
.end method


# virtual methods
.method public bytesTransferred(JIJ)V
    .locals 2

    .line 326
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    .line 327
    iget-wide p3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->timeMillis:J

    sub-long p3, p1, p3

    iget-wide v0, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->idleMillis:J

    cmp-long p5, p3, v0

    if-lez p5, :cond_0

    .line 329
    :try_start_0
    iget-object p3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->parent:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {p3}, Lorg/apache/commons/net/ftp/FTPClient;->__noop()V

    .line 330
    iget p3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->acksAcked:I

    add-int/lit8 p3, p3, 0x1

    iput p3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->acksAcked:I
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 334
    :catch_0
    iget p3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->ioErrors:I

    add-int/lit8 p3, p3, 0x1

    iput p3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->ioErrors:I

    goto :goto_0

    .line 332
    :catch_1
    iget p3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->notAcked:I

    add-int/lit8 p3, p3, 0x1

    iput p3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->notAcked:I

    .line 337
    :goto_0
    iput-wide p1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->timeMillis:J

    :cond_0
    return-void
.end method

.method public bytesTransferred(Lorg/apache/commons/net/io/CopyStreamEvent;)V
    .locals 6

    .line 320
    invoke-virtual {p1}, Lorg/apache/commons/net/io/CopyStreamEvent;->getTotalBytesTransferred()J

    move-result-wide v1

    invoke-virtual {p1}, Lorg/apache/commons/net/io/CopyStreamEvent;->getBytesTransferred()I

    move-result v3

    invoke-virtual {p1}, Lorg/apache/commons/net/io/CopyStreamEvent;->getStreamSize()J

    move-result-wide v4

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/net/ftp/FTPClient$CSL;->bytesTransferred(JIJ)V

    return-void
.end method

.method cleanUp()[I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 342
    iget v0, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->notAcked:I

    .line 344
    :goto_0
    :try_start_0
    iget v1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->notAcked:I

    if-lez v1, :cond_0

    .line 345
    iget-object v1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->parent:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPClient;->getReply()I

    .line 346
    iget v1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->notAcked:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->notAcked:I
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 351
    iget-object v1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->parent:Lorg/apache/commons/net/ftp/FTPClient;

    iget v2, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->currentSoTimeoutMillis:I

    invoke-virtual {v1, v2}, Lorg/apache/commons/net/ftp/FTPClient;->setSoTimeout(I)V

    .line 352
    throw v0

    .line 351
    :catch_0
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->parent:Lorg/apache/commons/net/ftp/FTPClient;

    iget v2, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->currentSoTimeoutMillis:I

    invoke-virtual {v1, v2}, Lorg/apache/commons/net/ftp/FTPClient;->setSoTimeout(I)V

    .line 353
    iget v1, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->acksAcked:I

    iget v2, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->notAcked:I

    iget v3, p0, Lorg/apache/commons/net/ftp/FTPClient$CSL;->ioErrors:I

    filled-new-array {v1, v0, v2, v3}, [I

    move-result-object v0

    return-object v0
.end method
