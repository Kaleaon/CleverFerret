.class public Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;
.super Ljava/lang/Object;
.source "RandomAccessContentAccess.java"

# interfaces
.implements Lcom/github/junrar/io/IReadOnlyAccess;


# instance fields
.field private final rac:Lorg/apache/commons/vfs2/RandomAccessContent;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 26
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    sget-object v0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->READ:Lorg/apache/commons/vfs2/util/RandomAccessMode;

    invoke-interface {p1, v0}, Lorg/apache/commons/vfs2/FileContent;->getRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;-><init>(Lorg/apache/commons/vfs2/RandomAccessContent;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/RandomAccessContent;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;->rac:Lorg/apache/commons/vfs2/RandomAccessContent;

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

    .line 50
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;->rac:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->close()V

    return-void
.end method

.method public getPosition()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;->rac:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->getFilePointer()J

    move-result-wide v0

    return-wide v0
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;->rac:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->readByte()B

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;->rac:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public readFully([BI)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;->rac:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/RandomAccessContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p2}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public setPosition(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;->rac:Lorg/apache/commons/vfs2/RandomAccessContent;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/RandomAccessContent;->seek(J)V

    return-void
.end method
