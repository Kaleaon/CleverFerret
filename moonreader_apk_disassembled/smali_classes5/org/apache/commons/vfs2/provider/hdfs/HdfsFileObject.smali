.class public Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "HdfsFileObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;",
        ">;"
    }
.end annotation


# instance fields
.field private final fs:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;

.field private final hdfs:Lorg/apache/hadoop/fs/FileSystem;

.field private final path:Lorg/apache/hadoop/fs/Path;

.field private stat:Lorg/apache/hadoop/fs/FileStatus;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;Lorg/apache/hadoop/fs/FileSystem;Lorg/apache/hadoop/fs/Path;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 58
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->fs:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;

    .line 59
    iput-object p3, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->hdfs:Lorg/apache/hadoop/fs/FileSystem;

    .line 60
    iput-object p4, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->path:Lorg/apache/hadoop/fs/Path;

    return-void
.end method


# virtual methods
.method public canRenameTo(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 0

    .line 68
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected doAttach()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 77
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->hdfs:Lorg/apache/hadoop/fs/FileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->path:Lorg/apache/hadoop/fs/Path;

    invoke-virtual {v0, v1}, Lorg/apache/hadoop/fs/FileSystem;->getFileStatus(Lorg/apache/hadoop/fs/Path;)Lorg/apache/hadoop/fs/FileStatus;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const/4 v0, 0x0

    .line 79
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    return-void
.end method

.method protected doGetAttributes()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 89
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    if-nez v0, :cond_0

    .line 90
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetAttributes()Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 92
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 93
    sget-object v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->LAST_ACCESS_TIME:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    invoke-virtual {v2}, Lorg/apache/hadoop/fs/FileStatus;->getAccessTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->BLOCK_SIZE:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    invoke-virtual {v2}, Lorg/apache/hadoop/fs/FileStatus;->getBlockSize()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->GROUP:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    invoke-virtual {v2}, Lorg/apache/hadoop/fs/FileStatus;->getGroup()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->OWNER:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    invoke-virtual {v2}, Lorg/apache/hadoop/fs/FileStatus;->getOwner()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->PERMISSIONS:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    invoke-virtual {v2}, Lorg/apache/hadoop/fs/FileStatus;->getPermission()Lorg/apache/hadoop/fs/permission/FsPermission;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/hadoop/fs/permission/FsPermission;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->LENGTH:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    invoke-virtual {v2}, Lorg/apache/hadoop/fs/FileStatus;->getLen()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->MODIFICATION_TIME:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    invoke-virtual {v2}, Lorg/apache/hadoop/fs/FileStatus;->getModificationTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method protected doGetContentSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FileStatus;->getLen()J

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

    .line 116
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->hdfs:Lorg/apache/hadoop/fs/FileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->path:Lorg/apache/hadoop/fs/Path;

    invoke-virtual {v0, v1}, Lorg/apache/hadoop/fs/FileSystem;->open(Lorg/apache/hadoop/fs/Path;)Lorg/apache/hadoop/fs/FSDataInputStream;

    move-result-object v0

    return-object v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FileStatus;->getModificationTime()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method protected doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 136
    sget-object v0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->READWRITE:Lorg/apache/commons/vfs2/util/RandomAccessMode;

    invoke-virtual {p1, v0}, Lorg/apache/commons/vfs2/util/RandomAccessMode;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 139
    new-instance p1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->path:Lorg/apache/hadoop/fs/Path;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->hdfs:Lorg/apache/hadoop/fs/FileSystem;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;-><init>(Lorg/apache/hadoop/fs/Path;Lorg/apache/hadoop/fs/FileSystem;)V

    return-object p1

    .line 137
    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 148
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->doAttach()V

    .line 149
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;

    if-nez v0, :cond_0

    .line 150
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 152
    :cond_0
    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FileStatus;->isDir()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 153
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 155
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 157
    :catch_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doIsHidden()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected doIsReadable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    return v0
.end method

.method protected doIsWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 190
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->doGetType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    if-ne v0, v1, :cond_1

    .line 194
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->hdfs:Lorg/apache/hadoop/fs/FileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->path:Lorg/apache/hadoop/fs/Path;

    invoke-virtual {v0, v1}, Lorg/apache/hadoop/fs/FileSystem;->listStatus(Lorg/apache/hadoop/fs/Path;)[Lorg/apache/hadoop/fs/FileStatus;

    move-result-object v0

    .line 195
    array-length v1, v0

    new-array v1, v1, [Ljava/lang/String;

    .line 197
    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v5, v0, v3

    add-int/lit8 v6, v4, 0x1

    .line 198
    invoke-virtual {v5}, Lorg/apache/hadoop/fs/FileStatus;->getPath()Lorg/apache/hadoop/fs/Path;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/hadoop/fs/Path;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v4

    add-int/lit8 v3, v3, 0x1

    move v4, v6

    goto :goto_0

    :cond_0
    return-object v1

    .line 191
    :cond_1
    new-instance v0, Lorg/apache/commons/vfs2/FileNotFolderException;

    invoke-direct {v0, p0}, Lorg/apache/commons/vfs2/FileNotFolderException;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method protected doListChildrenResolved()[Lorg/apache/commons/vfs2/FileObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 208
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->doGetType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 211
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->doListChildren()[Ljava/lang/String;

    move-result-object v0

    .line 212
    array-length v1, v0

    new-array v1, v1, [Lorg/apache/commons/vfs2/FileObject;

    const/4 v2, 0x0

    .line 213
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 214
    new-instance v3, Lorg/apache/hadoop/fs/Path;

    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->path:Lorg/apache/hadoop/fs/Path;

    aget-object v5, v0, v2

    invoke-direct {v3, v4, v5}, Lorg/apache/hadoop/fs/Path;-><init>(Lorg/apache/hadoop/fs/Path;Ljava/lang/String;)V

    .line 215
    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->fs:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;

    invoke-virtual {v3}, Lorg/apache/hadoop/fs/Path;->toUri()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method protected doRemoveAttribute(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 225
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected doSetAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 233
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected doSetLastModifiedTime(J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 241
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public exists()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 251
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->doAttach()V

    .line 252
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;->stat:Lorg/apache/hadoop/fs/FileStatus;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :catch_0
    move-exception v0

    .line 256
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "Unable to check existance "

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    return v0
.end method
