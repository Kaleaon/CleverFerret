.class public Lorg/apache/commons/vfs2/provider/local/LocalFile;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "LocalFile.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;",
        ">;"
    }
.end annotation


# instance fields
.field private file:Ljava/io/File;

.field private final rootFile:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;Ljava/lang/String;Lorg/apache/commons/vfs2/provider/AbstractFileName;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 54
    invoke-direct {p0, p3, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 55
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->rootFile:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected doAttach()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    if-nez v0, :cond_0

    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->rootFile:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/LocalFile;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getPathDecoded()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 77
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    :cond_0
    return-void
.end method

.method protected doCreateFolder()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 140
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 141
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.local/create-folder.error"

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected doDelete()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 118
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 119
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.local/delete-file.error"

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected doGetContentSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 231
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 215
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 197
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 223
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method

.method protected doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 236
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;-><init>(Ljava/io/File;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    return-object v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    .line 89
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 92
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 93
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 99
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doIsExecutable()Z
    .locals 1

    .line 163
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canExecute()Z

    move-result v0

    return v0
.end method

.method protected doIsHidden()Z
    .locals 1

    .line 171
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isHidden()Z

    move-result v0

    return v0
.end method

.method protected doIsReadable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v0

    return v0
.end method

.method protected doIsSameFile(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 241
    const-class v0, Lorg/apache/commons/vfs2/provider/local/LocalFile;

    invoke-static {p1, v0}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->isInstanceOf(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/Class;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 245
    :cond_0
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/local/LocalFile;

    .line 246
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/LocalFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/local/LocalFile;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 251
    :cond_1
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 253
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_2
    :goto_0
    return v1
.end method

.method protected doIsWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 150
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v0

    return v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->encode([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected doRename(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 128
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/local/LocalFile;

    .line 130
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/local/LocalFile;->getLocalFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 131
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v1, 0x1

    aput-object p1, v2, v1

    const-string p1, "vfs.provider.local/rename-file.error"

    invoke-direct {v0, p1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0
.end method

.method protected doSetExecutable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 189
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0, p1, p2}, Ljava/io/File;->setExecutable(ZZ)Z

    move-result p1

    return p1
.end method

.method protected doSetLastModifiedTime(J)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 207
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0, p1, p2}, Ljava/io/File;->setLastModified(J)Z

    move-result p1

    return p1
.end method

.method protected doSetReadable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 184
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0, p1, p2}, Ljava/io/File;->setReadable(ZZ)Z

    move-result p1

    return p1
.end method

.method protected doSetWritable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 155
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    invoke-virtual {v0, p1, p2}, Ljava/io/File;->setWritable(ZZ)Z

    move-result p1

    return p1
.end method

.method protected getLocalFile()Ljava/io/File;
    .locals 1

    .line 64
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFile;->file:Ljava/io/File;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 267
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/LocalFile;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 269
    :catch_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/LocalFile;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
