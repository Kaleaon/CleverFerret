.class public Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;
.super Ljava/io/OutputStream;
.source "RamFileOutputStream.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# instance fields
.field protected buffer1:[B

.field protected closed:Z

.field private exception:Ljava/io/IOException;

.field protected file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    const/4 v0, 0x1

    .line 37
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->buffer1:[B

    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->closed:Z

    .line 49
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 93
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->exception:Ljava/io/IOException;

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 97
    :try_start_0
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->closed:Z

    .line 99
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->endOutput()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 101
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 94
    :cond_1
    throw v0
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public write(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->buffer1:[B

    const/4 v1, 0x0

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    .line 80
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->write([B)V

    return-void
.end method

.method public write([BII)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->size()I

    move-result v1

    add-int v2, v1, p3

    .line 64
    :try_start_0
    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->file:Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    int-to-long v4, v2

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->resize(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getContent()[B

    move-result-object v0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    :catch_0
    move-exception p1

    .line 66
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;->exception:Ljava/io/IOException;

    .line 67
    throw p1
.end method
