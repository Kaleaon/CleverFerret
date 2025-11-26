.class public Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "ZipFileSystem.java"


# static fields
.field private static final LOG:Lorg/apache/commons/logging/Log;


# instance fields
.field private final cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation
.end field

.field private final file:Ljava/io/File;

.field private zipFile:Ljava/util/zip/ZipFile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    const-class v0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->LOG:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 59
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 55
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->cache:Ljava/util/Map;

    .line 62
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    sget-object p3, Lorg/apache/commons/vfs2/Selectors;->SELECT_SELF:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {p1, p2, p3}, Lorg/apache/commons/vfs2/FileSystem;->replicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->file:Ljava/io/File;

    .line 65
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 67
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->zipFile:Ljava/util/zip/ZipFile;

    :cond_0
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

    .line 164
    sget-object v0, Lorg/apache/commons/vfs2/provider/zip/ZipFileProvider;->capabilities:Ljava/util/Collection;

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

    .line 173
    new-instance v0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, p0, v2}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;Z)V

    return-object v0
.end method

.method protected createZipFile(Ljava/io/File;)Ljava/util/zip/ZipFile;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 139
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipFile;

    invoke-direct {v0, p1}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 141
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.zip/open-zip-file.error"

    invoke-direct {v1, v2, p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected createZipFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;)Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 134
    new-instance v0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, p0, v1}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;Z)V

    return-object v0
.end method

.method protected doCloseCommunicationLink()V
    .locals 5

    .line 149
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->zipFile:Ljava/util/zip/ZipFile;

    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->close()V

    const/4 v0, 0x0

    .line 151
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->zipFile:Ljava/util/zip/ZipFile;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 155
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->LOG:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "vfs.provider.zip/close-zip-file.error :"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->file:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/VfsLog;->warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method protected getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 189
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->cache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/FileObject;

    return-object p1
.end method

.method protected getZipFile()Ljava/util/zip/ZipFile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->zipFile:Ljava/util/zip/ZipFile;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->file:Ljava/io/File;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->createZipFile(Ljava/io/File;)Ljava/util/zip/ZipFile;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->zipFile:Ljava/util/zip/ZipFile;

    .line 129
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->zipFile:Ljava/util/zip/ZipFile;

    return-object v0
.end method

.method public init()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 76
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->init()V

    .line 80
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getZipFile()Ljava/util/zip/ZipFile;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/zip/ZipFile;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 81
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getZipFile()Ljava/util/zip/ZipFile;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 82
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 83
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/zip/ZipEntry;

    .line 84
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    .line 85
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 84
    invoke-interface {v3, v4, v5}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    .line 89
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 90
    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;

    .line 91
    invoke-virtual {v3, v2}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->setZipEntry(Ljava/util/zip/ZipEntry;)V

    goto :goto_0

    .line 95
    :cond_1
    invoke-virtual {p0, v3, v2}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->createZipFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;)Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;

    move-result-object v2

    .line 96
    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    .line 97
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->holdObject(Ljava/lang/Object;)V

    .line 104
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    :goto_1
    if-eqz v3, :cond_0

    .line 107
    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;

    if-nez v4, :cond_2

    const/4 v4, 0x0

    .line 109
    invoke-virtual {p0, v3, v4}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->createZipFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;)Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;

    move-result-object v4

    .line 110
    invoke-virtual {p0, v4}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V

    .line 111
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    invoke-virtual {v4, v0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->holdObject(Ljava/lang/Object;)V

    .line 116
    :cond_2
    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-virtual {v4, v2}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->attachChild(Lorg/apache/commons/vfs2/FileName;)V

    .line 105
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lorg/apache/commons/vfs2/provider/AbstractFileName;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v2, v4

    goto :goto_1

    .line 120
    :cond_3
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->closeCommunicationLink()V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->closeCommunicationLink()V

    throw v0
.end method

.method protected putFileToCache(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 2

    .line 181
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->cache:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected removeFileFromCache(Lorg/apache/commons/vfs2/FileName;)V
    .locals 1

    .line 197
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->cache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->file:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
