.class public Lcom/github/junrar/vfs2/provider/rar/VFSVolume;
.super Ljava/lang/Object;
.source "VFSVolume.java"

# interfaces
.implements Lcom/github/junrar/Volume;


# instance fields
.field private final archive:Lcom/github/junrar/Archive;

.field private final file:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method public constructor <init>(Lcom/github/junrar/Archive;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;->archive:Lcom/github/junrar/Archive;

    .line 29
    iput-object p2, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;->file:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method


# virtual methods
.method public getArchive()Lcom/github/junrar/Archive;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;->archive:Lcom/github/junrar/Archive;

    return-object v0
.end method

.method public getFile()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;->file:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public getLength()J
    .locals 2

    .line 47
    :try_start_0
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getSize()J

    move-result-wide v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getReadOnlyAccess()Lcom/github/junrar/io/IReadOnlyAccess;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/util/RandomAccessMode;->READ:Lorg/apache/commons/vfs2/util/RandomAccessMode;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/FileContent;->getRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;

    move-result-object v0

    .line 37
    new-instance v1, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;

    invoke-direct {v1, v0}, Lcom/github/junrar/vfs2/provider/rar/RandomAccessContentAccess;-><init>(Lorg/apache/commons/vfs2/RandomAccessContent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 39
    :catch_0
    new-instance v0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;

    iget-object v1, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method
