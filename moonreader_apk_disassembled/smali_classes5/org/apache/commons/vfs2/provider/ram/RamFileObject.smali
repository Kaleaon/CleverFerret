.class public Lorg/apache/commons/vfs2/provider/ram/RamFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "RamFileObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;",
        ">;"
    }
.end annotation


# instance fields
.field private data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 50
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    invoke-virtual {p1, p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->attach(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V

    return-void
.end method

.method private save()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    invoke-virtual {v0, p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->save(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V

    return-void
.end method


# virtual methods
.method protected doAttach()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 191
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    invoke-virtual {v0, p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->attach(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V

    return-void
.end method

.method protected doCreateFolder()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 158
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->injectType(Lorg/apache/commons/vfs2/FileType;)V

    .line 159
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->save()V

    return-void
.end method

.method protected doDelete()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 123
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->isContentOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 126
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    invoke-virtual {v0, p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->delete(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V

    return-void

    .line 124
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " cannot be deleted while the file is openg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected doGetContentSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 84
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->size()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 95
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getContent()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0

    .line 96
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/read-not-file.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 136
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getLastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    .line 110
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    sget-object v0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->EMPTY:[B

    invoke-virtual {p1, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->setContent([B)V

    .line 112
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;

    invoke-direct {p1, p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileOutputStream;-><init>(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V

    return-object p1
.end method

.method protected doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 181
    new-instance v0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    return-object v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    return-object v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 74
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->listChildren(Lorg/apache/commons/vfs2/FileName;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected doRename(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 169
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;

    .line 170
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->rename(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;Lorg/apache/commons/vfs2/provider/ram/RamFileObject;)V

    return-void
.end method

.method protected doSetLastModifiedTime(J)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 147
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->setLastModified(J)V

    const/4 p1, 0x1

    return p1
.end method

.method protected endOutput()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 226
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->endOutput()V

    .line 227
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->save()V

    return-void
.end method

.method getData()Lorg/apache/commons/vfs2/provider/ram/RamFileData;
    .locals 1

    .line 198
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    return-object v0
.end method

.method protected injectType(Lorg/apache/commons/vfs2/FileType;)V
    .locals 1

    .line 215
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->setType(Lorg/apache/commons/vfs2/FileType;)V

    .line 216
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->injectType(Lorg/apache/commons/vfs2/FileType;)V

    return-void
.end method

.method declared-synchronized resize(J)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "FileSystem capacity ("

    monitor-enter p0

    .line 242
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    .line 243
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 245
    invoke-static {}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;->getLongMaxSize(Lorg/apache/commons/vfs2/FileSystemOptions;)J

    move-result-wide v2

    .line 246
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;->size()J

    move-result-wide v4

    add-long/2addr v4, p1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->size()I

    move-result v1

    int-to-long v6, v1

    sub-long/2addr v4, v6

    cmp-long v1, v4, v2

    if-gtz v1, :cond_0

    goto :goto_0

    .line 247
    :cond_0
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ") exceeded."

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 250
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->resize(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 251
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method setData(Lorg/apache/commons/vfs2/provider/ram/RamFileData;)V
    .locals 0

    .line 205
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    return-void
.end method

.method size()I
    .locals 1

    .line 234
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileObject;->data:Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->size()I

    move-result v0

    return v0
.end method
