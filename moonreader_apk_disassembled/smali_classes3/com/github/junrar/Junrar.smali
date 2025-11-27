.class public Lcom/github/junrar/Junrar;
.super Ljava/lang/Object;
.source "Junrar.java"


# static fields
.field private static fileSystem:Lcom/github/junrar/vfs2/provider/rar/FileSystem;

.field private static final logger:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-class v0, Lcom/github/junrar/Junrar;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/github/junrar/Junrar;->logger:Lorg/apache/commons/logging/Log;

    .line 20
    new-instance v0, Lcom/github/junrar/vfs2/provider/rar/FileSystem;

    invoke-direct {v0}, Lcom/github/junrar/vfs2/provider/rar/FileSystem;-><init>()V

    sput-object v0, Lcom/github/junrar/Junrar;->fileSystem:Lcom/github/junrar/vfs2/provider/rar/FileSystem;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createArchiveOrThrowException(Lorg/apache/commons/logging/Log;Ljava/io/File;)Lcom/github/junrar/Archive;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 93
    :try_start_0
    new-instance v0, Lcom/github/junrar/Archive;

    new-instance v1, Lcom/github/junrar/impl/FileVolumeManager;

    invoke-direct {v1, p1}, Lcom/github/junrar/impl/FileVolumeManager;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Lcom/github/junrar/Archive;-><init>(Lcom/github/junrar/VolumeManager;)V
    :try_end_0
    .catch Lcom/github/junrar/exception/RarException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 98
    invoke-interface {p0, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 99
    throw p1

    :catch_1
    move-exception p1

    .line 95
    invoke-interface {p0, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 96
    throw p1
.end method

.method private static createArchiveOrThrowException(Lorg/apache/commons/logging/Log;Ljava/io/InputStream;)Lcom/github/junrar/Archive;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    :try_start_0
    new-instance v0, Lcom/github/junrar/Archive;

    invoke-direct {v0, p1}, Lcom/github/junrar/Archive;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Lcom/github/junrar/exception/RarException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 83
    invoke-interface {p0, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 84
    throw p1

    :catch_1
    move-exception p1

    .line 80
    invoke-interface {p0, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 81
    throw p1
.end method

.method public static extract(Lcom/github/junrar/ExtractDestination;Lcom/github/junrar/VolumeManager;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/junrar/ExtractDestination;",
            "Lcom/github/junrar/VolumeManager;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    new-instance v0, Lcom/github/junrar/Archive;

    invoke-direct {v0, p1}, Lcom/github/junrar/Archive;-><init>(Lcom/github/junrar/VolumeManager;)V

    .line 53
    invoke-static {v0, p0}, Lcom/github/junrar/Junrar;->extractArchiveTo(Lcom/github/junrar/Archive;Lcom/github/junrar/ExtractDestination;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static extract(Ljava/io/File;Ljava/io/File;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    invoke-static {p0}, Lcom/github/junrar/Junrar;->validateRarPath(Ljava/io/File;)V

    .line 33
    invoke-static {p1}, Lcom/github/junrar/Junrar;->validateDestinationPath(Ljava/io/File;)V

    .line 35
    sget-object v0, Lcom/github/junrar/Junrar;->logger:Lorg/apache/commons/logging/Log;

    invoke-static {v0, p0}, Lcom/github/junrar/Junrar;->createArchiveOrThrowException(Lorg/apache/commons/logging/Log;Ljava/io/File;)Lcom/github/junrar/Archive;

    move-result-object p0

    .line 36
    new-instance v0, Lcom/github/junrar/LocalFolderExtractor;

    sget-object v1, Lcom/github/junrar/Junrar;->fileSystem:Lcom/github/junrar/vfs2/provider/rar/FileSystem;

    invoke-direct {v0, p1, v1}, Lcom/github/junrar/LocalFolderExtractor;-><init>(Ljava/io/File;Lcom/github/junrar/vfs2/provider/rar/FileSystem;)V

    .line 37
    invoke-static {p0, v0}, Lcom/github/junrar/Junrar;->extractArchiveTo(Lcom/github/junrar/Archive;Lcom/github/junrar/ExtractDestination;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static extract(Ljava/io/InputStream;Ljava/io/File;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    invoke-static {p1}, Lcom/github/junrar/Junrar;->validateDestinationPath(Ljava/io/File;)V

    .line 43
    sget-object v0, Lcom/github/junrar/Junrar;->logger:Lorg/apache/commons/logging/Log;

    invoke-static {v0, p0}, Lcom/github/junrar/Junrar;->createArchiveOrThrowException(Lorg/apache/commons/logging/Log;Ljava/io/InputStream;)Lcom/github/junrar/Archive;

    move-result-object p0

    .line 44
    new-instance v0, Lcom/github/junrar/LocalFolderExtractor;

    sget-object v1, Lcom/github/junrar/Junrar;->fileSystem:Lcom/github/junrar/vfs2/provider/rar/FileSystem;

    invoke-direct {v0, p1, v1}, Lcom/github/junrar/LocalFolderExtractor;-><init>(Ljava/io/File;Lcom/github/junrar/vfs2/provider/rar/FileSystem;)V

    .line 45
    invoke-static {p0, v0}, Lcom/github/junrar/Junrar;->extractArchiveTo(Lcom/github/junrar/Archive;Lcom/github/junrar/ExtractDestination;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static extract(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 26
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 27
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    invoke-static {v0, p0}, Lcom/github/junrar/Junrar;->extract(Ljava/io/File;Ljava/io/File;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 24
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "archive and destination must me set"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static extractArchiveTo(Lcom/github/junrar/Archive;Lcom/github/junrar/ExtractDestination;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/junrar/Archive;",
            "Lcom/github/junrar/ExtractDestination;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    .line 125
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->isEncrypted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    sget-object p1, Lcom/github/junrar/Junrar;->logger:Lorg/apache/commons/logging/Log;

    const-string v0, "archive is encrypted cannot extract"

    invoke-interface {p1, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 127
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V

    .line 128
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0

    .line 131
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 133
    :try_start_0
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/junrar/rarfile/FileHeader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    :try_start_1
    sget-object v3, Lcom/github/junrar/Junrar;->logger:Lorg/apache/commons/logging/Log;

    invoke-static {v3, p1, p0, v2}, Lcom/github/junrar/Junrar;->tryToExtract(Lorg/apache/commons/logging/Log;Lcom/github/junrar/ExtractDestination;Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;)Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 137
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/github/junrar/exception/RarException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 143
    :try_start_2
    sget-object v0, Lcom/github/junrar/Junrar;->logger:Lorg/apache/commons/logging/Log;

    const-string v1, "error extraction the file"

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 144
    throw p1

    :catch_1
    move-exception p1

    .line 140
    sget-object v0, Lcom/github/junrar/Junrar;->logger:Lorg/apache/commons/logging/Log;

    const-string v1, "error extracting the file"

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 141
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    :cond_2
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V

    return-object v0

    :catchall_0
    move-exception p1

    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V

    throw p1
.end method

.method public static getContentsDescription(Ljava/io/File;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List<",
            "Lcom/github/junrar/ContentDescription;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/junrar/exception/RarException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 57
    invoke-static {p0}, Lcom/github/junrar/Junrar;->validateRarPath(Ljava/io/File;)V

    .line 59
    sget-object v0, Lcom/github/junrar/Junrar;->logger:Lorg/apache/commons/logging/Log;

    invoke-static {v0, p0}, Lcom/github/junrar/Junrar;->createArchiveOrThrowException(Lorg/apache/commons/logging/Log;Ljava/io/File;)Lcom/github/junrar/Archive;

    move-result-object p0

    .line 61
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 63
    :try_start_0
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->isEncrypted()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 64
    const-string v1, "archive is encrypted cannot extract"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V

    return-object v0

    .line 67
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/junrar/rarfile/FileHeader;

    .line 68
    new-instance v3, Lcom/github/junrar/ContentDescription;

    invoke-virtual {v2}, Lcom/github/junrar/rarfile/FileHeader;->getFileNameString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/github/junrar/rarfile/FileHeader;->getUnpSize()J

    move-result-wide v5

    invoke-direct {v3, v4, v5, v6}, Lcom/github/junrar/ContentDescription;-><init>(Ljava/lang/String;J)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V

    return-object v1

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/github/junrar/Archive;->close()V

    throw v0
.end method

.method private static tryToExtract(Lorg/apache/commons/logging/Log;Lcom/github/junrar/ExtractDestination;Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;)Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    .line 159
    invoke-virtual {p3}, Lcom/github/junrar/rarfile/FileHeader;->getFileNameString()Ljava/lang/String;

    move-result-object v0

    .line 160
    invoke-virtual {p3}, Lcom/github/junrar/rarfile/FileHeader;->isEncrypted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 161
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "file is encrypted cannot extract: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0

    .line 164
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "extracting: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 165
    invoke-virtual {p3}, Lcom/github/junrar/rarfile/FileHeader;->isDirectory()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 166
    invoke-interface {p1, p3}, Lcom/github/junrar/ExtractDestination;->createDirectory(Lcom/github/junrar/rarfile/FileHeader;)Ljava/io/File;

    move-result-object p0

    return-object p0

    .line 168
    :cond_1
    invoke-interface {p1, p2, p3}, Lcom/github/junrar/ExtractDestination;->extract(Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method private static validateDestinationPath(Ljava/io/File;)V
    .locals 3

    if-eqz p0, :cond_1

    .line 107
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 108
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "the destination must exist and point to a directory: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "archive and destination must me set"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static validateRarPath(Ljava/io/File;)V
    .locals 3

    if-eqz p0, :cond_2

    .line 116
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 119
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 120
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "First argument should be a file but was "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "the archive does not exit: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_2
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "archive and destination must me set"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
