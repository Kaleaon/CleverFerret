.class public Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "HdfsFileSystem.java"


# static fields
.field private static final log:Lorg/apache/commons/logging/Log;


# instance fields
.field private fs:Lorg/apache/hadoop/fs/FileSystem;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const-class v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 1

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-void
.end method


# virtual methods
.method protected addCapabilities(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;)V"
        }
    .end annotation

    .line 65
    sget-object v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileProvider;->CAPABILITIES:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public close()V
    .locals 3

    .line 74
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->fs:Lorg/apache/hadoop/fs/FileSystem;

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FileSystem;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :cond_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->close()V

    return-void

    :catch_0
    move-exception v0

    .line 78
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Error closing HDFS client"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 88
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "Operation not supported"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    move-object/from16 v1, p0

    .line 100
    monitor-enter p0

    .line 101
    :try_start_0
    iget-object v0, v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->fs:Lorg/apache/hadoop/fs/FileSystem;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_5

    .line 102
    invoke-interface/range {p1 .. p1}, Lorg/apache/commons/vfs2/FileName;->getRootURI()Ljava/lang/String;

    move-result-object v4

    .line 103
    invoke-static {}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;

    move-result-object v0

    .line 104
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v5

    .line 105
    invoke-virtual {v0, v5}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getConfigNames(Lorg/apache/commons/vfs2/FileSystemOptions;)[Ljava/lang/String;

    move-result-object v6

    .line 106
    invoke-virtual {v0, v5}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getConfigPaths(Lorg/apache/commons/vfs2/FileSystemOptions;)[Lorg/apache/hadoop/fs/Path;

    move-result-object v7

    .line 107
    invoke-virtual {v0, v5}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getConfigURLs(Lorg/apache/commons/vfs2/FileSystemOptions;)[Ljava/net/URL;

    move-result-object v8

    .line 108
    invoke-virtual {v0, v5}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getConfigInputStream(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/io/InputStream;

    move-result-object v9

    .line 109
    invoke-virtual {v0, v5}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getConfigConfiguration(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/hadoop/conf/Configuration;

    move-result-object v0

    .line 111
    new-instance v5, Lorg/apache/hadoop/conf/Configuration;

    invoke-direct {v5, v3}, Lorg/apache/hadoop/conf/Configuration;-><init>(Z)V

    .line 112
    const-string v10, "fs.defaultFS"

    invoke-virtual {v5, v10, v4}, Lorg/apache/hadoop/conf/Configuration;->set(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v6, :cond_0

    .line 117
    array-length v10, v6

    const/4 v11, 0x0

    :goto_0
    if-ge v11, v10, :cond_0

    aget-object v12, v6, v11

    .line 118
    sget-object v13, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->log:Lorg/apache/commons/logging/Log;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Adding HDFS configuration resource: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 119
    invoke-virtual {v5, v12}, Lorg/apache/hadoop/conf/Configuration;->addResource(Ljava/lang/String;)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    :cond_0
    if-eqz v7, :cond_1

    .line 123
    array-length v6, v7

    const/4 v10, 0x0

    :goto_1
    if-ge v10, v6, :cond_1

    aget-object v11, v7, v10

    .line 124
    sget-object v12, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->log:Lorg/apache/commons/logging/Log;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Adding HDFS configuration path: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 125
    invoke-virtual {v5, v11}, Lorg/apache/hadoop/conf/Configuration;->addResource(Lorg/apache/hadoop/fs/Path;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    :cond_1
    if-eqz v8, :cond_2

    .line 129
    array-length v6, v8

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v6, :cond_2

    aget-object v10, v8, v7

    .line 130
    sget-object v11, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->log:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Adding HDFS configuration URL: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 131
    invoke-virtual {v5, v10}, Lorg/apache/hadoop/conf/Configuration;->addResource(Ljava/net/URL;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_2
    if-eqz v9, :cond_3

    .line 135
    sget-object v6, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Adding HDFS configuration stream"

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 136
    invoke-virtual {v5, v9}, Lorg/apache/hadoop/conf/Configuration;->addResource(Ljava/io/InputStream;)V

    :cond_3
    if-eqz v0, :cond_4

    .line 139
    sget-object v6, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Adding HDFS configuration object"

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 140
    invoke-virtual {v5, v0}, Lorg/apache/hadoop/conf/Configuration;->addResource(Lorg/apache/hadoop/conf/Configuration;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    :cond_4
    :try_start_1
    invoke-static {v5}, Lorg/apache/hadoop/fs/FileSystem;->get(Lorg/apache/hadoop/conf/Configuration;)Lorg/apache/hadoop/fs/FileSystem;

    move-result-object v0

    iput-object v0, v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->fs:Lorg/apache/hadoop/fs/FileSystem;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 146
    :try_start_2
    sget-object v2, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error connecting to filesystem "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 147
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error connecting to filesystem "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 150
    :cond_5
    :goto_3
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileSystemManager;->getFilesCache()Lorg/apache/commons/vfs2/FilesCache;

    move-result-object v0

    if-eqz v0, :cond_6

    const/4 v2, 0x1

    :cond_6
    if-eqz v2, :cond_7

    .line 155
    invoke-virtual/range {p0 .. p1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    goto :goto_4

    :cond_7
    const/4 v0, 0x0

    :goto_4
    if-nez v0, :cond_8

    .line 162
    :try_start_3
    invoke-interface/range {p1 .. p1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v3, "UTF-8"

    invoke-static {v0, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_5

    .line 164
    :catch_1
    invoke-interface/range {p1 .. p1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 166
    :goto_5
    new-instance v3, Lorg/apache/hadoop/fs/Path;

    invoke-direct {v3, v0}, Lorg/apache/hadoop/fs/Path;-><init>(Ljava/lang/String;)V

    .line 167
    new-instance v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;

    move-object/from16 v4, p1

    check-cast v4, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    iget-object v5, v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->fs:Lorg/apache/hadoop/fs/FileSystem;

    invoke-direct {v0, v4, v1, v5, v3}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;Lorg/apache/hadoop/fs/FileSystem;Lorg/apache/hadoop/fs/Path;)V

    if-eqz v2, :cond_8

    .line 169
    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    .line 175
    :cond_8
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileSystemManager;->getCacheStrategy()Lorg/apache/commons/vfs2/CacheStrategy;

    move-result-object v2

    sget-object v3, Lorg/apache/commons/vfs2/CacheStrategy;->ON_RESOLVE:Lorg/apache/commons/vfs2/CacheStrategy;

    invoke-virtual {v2, v3}, Lorg/apache/commons/vfs2/CacheStrategy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 176
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->refresh()V

    :cond_9
    return-object v0

    :catchall_0
    move-exception v0

    .line 150
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0
.end method
