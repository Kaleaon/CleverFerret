.class public Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "TarFileSystem.java"


# static fields
.field private static final DEFAULT_INDEX_SIZE:I = 0x64

.field private static final LOG:Lorg/apache/commons/logging/Log;


# instance fields
.field private final file:Ljava/io/File;

.field private tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    const-class v0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->LOG:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 56
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 59
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    sget-object p3, Lorg/apache/commons/vfs2/Selectors;->SELECT_SELF:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystem;->replicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->file:Ljava/io/File;

    .line 62
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 64
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    :cond_0
    return-void
.end method

.method private recreateTarFile()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    if-eqz v0, :cond_0

    .line 145
    :try_start_0
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x0

    .line 149
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    goto :goto_0

    :catch_0
    move-exception v0

    .line 147
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.tar/close-tar-file.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->file:Ljava/io/File;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    .line 151
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->file:Ljava/io/File;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->createTarFile(Ljava/io/File;)Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    move-result-object v0

    .line 152
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

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

    .line 201
    sget-object v0, Lorg/apache/commons/vfs2/provider/tar/TarFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 210
    new-instance v0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, p0, v2}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;Z)V

    return-object v0
.end method

.method protected createTarFile(Ljava/io/File;)Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 170
    :try_start_0
    const-string v0, "tgz"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    new-instance v1, Ljava/util/zip/GZIPInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0

    .line 172
    :cond_0
    const-string v0, "tbz2"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 173
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    .line 174
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v1, v2}, Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileObject;->wrapInputStream(Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0

    .line 176
    :cond_1
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 178
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.tar/open-tar-file.error"

    invoke-direct {v1, v2, p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected createTarFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)Lorg/apache/commons/vfs2/provider/tar/TarFileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 165
    new-instance v0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, p0, v1}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;Z)V

    return-object v0
.end method

.method protected doCloseCommunicationLink()V
    .locals 5

    .line 186
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    if-eqz v0, :cond_0

    .line 187
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->close()V

    const/4 v0, 0x0

    .line 188
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 192
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->LOG:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "vfs.provider.tar/close-tar-file.error :"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->file:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/VfsLog;->warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public getInputStream(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 123
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->resetTarFile()V

    .line 125
    :goto_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 127
    :cond_0
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 129
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method protected getTarFile()Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 156
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->recreateTarFile()V

    .line 160
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->tarFile:Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    return-object v0
.end method

.method public init()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 73
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->init()V

    .line 77
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 79
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getTarFile()Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextTarEntry()Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 80
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    .line 81
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 80
    invoke-interface {v2, v3, v4}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    .line 85
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 86
    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;

    .line 87
    invoke-virtual {v2, v1}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->setTarEntry(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V

    goto :goto_0

    .line 91
    :cond_1
    invoke-virtual {p0, v2, v1}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->createTarFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)Lorg/apache/commons/vfs2/provider/tar/TarFileObject;

    move-result-object v1

    .line 92
    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    .line 93
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->holdObject(Ljava/lang/Object;)V

    .line 100
    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    :goto_1
    if-eqz v2, :cond_0

    .line 103
    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;

    if-nez v3, :cond_2

    const/4 v3, 0x0

    .line 105
    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->createTarFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)Lorg/apache/commons/vfs2/provider/tar/TarFileObject;

    move-result-object v3

    .line 106
    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    .line 107
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    invoke-virtual {v3, v0}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->holdObject(Ljava/lang/Object;)V

    .line 112
    :cond_2
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-virtual {v3, v1}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->attachChild(Lorg/apache/commons/vfs2/FileName;)V

    .line 101
    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lorg/apache/commons/vfs2/provider/AbstractFileName;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v3

    goto :goto_1

    .line 118
    :cond_3
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->closeCommunicationLink()V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 116
    :try_start_1
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 118
    :goto_2
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->closeCommunicationLink()V

    throw v0
.end method

.method protected resetTarFile()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->recreateTarFile()V

    :cond_0
    return-void
.end method
