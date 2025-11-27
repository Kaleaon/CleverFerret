.class public Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "FtpFileObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpOutputStream;,
        Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;",
        ">;"
    }
.end annotation


# static fields
.field private static final EMPTY_FTP_FILE_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/commons/net/ftp/FTPFile;",
            ">;"
        }
    .end annotation
.end field

.field private static final UNKNOWN:Lorg/apache/commons/net/ftp/FTPFile;

.field private static final log:Lorg/apache/commons/logging/Log;


# instance fields
.field private children:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/commons/net/ftp/FTPFile;",
            ">;"
        }
    .end annotation
.end field

.field private fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

.field private inRefresh:Z

.field private linkDestination:Lorg/apache/commons/vfs2/FileObject;

.field private final relPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 52
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->EMPTY_FTP_FILE_MAP:Ljava/util/Map;

    .line 53
    new-instance v0, Lorg/apache/commons/net/ftp/FTPFile;

    invoke-direct {v0}, Lorg/apache/commons/net/ftp/FTPFile;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->UNKNOWN:Lorg/apache/commons/net/ftp/FTPFile;

    .line 54
    const-class v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;Lorg/apache/commons/vfs2/FileName;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 68
    invoke-interface {p3, p1}, Lorg/apache/commons/vfs2/FileName;->getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 69
    const-string p2, "."

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 74
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    return-void

    .line 76
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
    .locals 0

    .line 50
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
    .locals 0

    .line 50
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p0

    return-object p0
.end method

.method private doGetChildren()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    if-eqz v0, :cond_0

    return-void

    .line 117
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getClient()Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    move-result-object v0

    .line 119
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isSymbolicLink()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 120
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v3}, Lorg/apache/commons/net/ftp/FTPFile;->getLink()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    .line 121
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    .line 123
    :goto_0
    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->listFiles(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 124
    array-length v2, v1

    if-nez v2, :cond_2

    goto :goto_3

    .line 127
    :cond_2
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 130
    :goto_1
    array-length v4, v1

    if-ge v3, v4, :cond_6

    .line 131
    aget-object v4, v1, v3

    if-nez v4, :cond_3

    .line 133
    sget-object v4, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 134
    const-string v5, "vfs.provider.ftp/invalid-directory-entry.debug"

    .line 135
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v6, v8, v2

    const/4 v6, 0x1

    aput-object v7, v8, v6

    .line 134
    invoke-static {v5, v8}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_2

    .line 139
    :cond_3
    const-string v5, "."

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, ".."

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 140
    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    invoke-virtual {v4}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 125
    :cond_5
    :goto_3
    sget-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->EMPTY_FTP_FILE_MAP:Ljava/util/Map;

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    :cond_6
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    return-void

    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    throw v1
.end method

.method private getChildFile(Ljava/lang/String;Z)Lorg/apache/commons/net/ftp/FTPFile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 92
    iget-boolean p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->inRefresh:Z

    if-nez p2, :cond_0

    .line 93
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    .line 97
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->doGetChildren()V

    .line 100
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    if-nez p2, :cond_1

    return-object v0

    .line 105
    :cond_1
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/net/ftp/FTPFile;

    return-object p1
.end method

.method private getInfo(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    if-eqz v0, :cond_0

    .line 165
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getChildFile(Ljava/lang/String;Z)Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object p1

    goto :goto_0

    .line 168
    :cond_0
    new-instance p1, Lorg/apache/commons/net/ftp/FTPFile;

    invoke-direct {p1}, Lorg/apache/commons/net/ftp/FTPFile;-><init>()V

    const/4 v0, 0x1

    .line 169
    invoke-virtual {p1, v0}, Lorg/apache/commons/net/ftp/FTPFile;->setType(I)V

    :goto_0
    if-nez p1, :cond_1

    .line 173
    sget-object p1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->UNKNOWN:Lorg/apache/commons/net/ftp/FTPFile;

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    return-void

    .line 175
    :cond_1
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    return-void
.end method

.method private getLinkDestination()Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 285
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->linkDestination:Lorg/apache/commons/vfs2/FileObject;

    if-nez v0, :cond_1

    .line 287
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    .line 288
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getLink()Ljava/lang/String;

    move-result-object v1

    .line 289
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    if-nez v0, :cond_0

    .line 292
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    .line 294
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v2

    invoke-interface {v2, v0, v1}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    .line 295
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/apache/commons/vfs2/FileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->linkDestination:Lorg/apache/commons/vfs2/FileObject;

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 289
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 298
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->linkDestination:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method private getTimestamp()J
    .locals 2

    .line 536
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPFile;->getTimestamp()Ljava/util/Calendar;

    move-result-object v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 537
    :cond_0
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method private isCircular(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 544
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getPathDecoded()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getPathDecoded()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method


# virtual methods
.method protected doAttach()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method protected doCreateFolder()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 431
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getClient()Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    move-result-object v0

    .line 433
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->makeDirectory(Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 435
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    if-eqz v1, :cond_0

    return-void

    .line 439
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.ftp/create-folder.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    :catchall_0
    move-exception v1

    .line 435
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    throw v1
.end method

.method protected doDelete()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 380
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    .line 382
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getClient()Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 384
    :try_start_1
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPFile;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 385
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->removeDirectory(Ljava/lang/String;)Z

    move-result v2

    goto :goto_0

    .line 387
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->deleteFile(Ljava/lang/String;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 390
    :goto_0
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v3, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    if-eqz v2, :cond_1

    const/4 v1, 0x0

    .line 396
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    .line 397
    sget-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->EMPTY_FTP_FILE_MAP:Ljava/util/Map;

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    .line 398
    monitor-exit v0

    return-void

    .line 394
    :cond_1
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.ftp/delete-file.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v1

    :catchall_0
    move-exception v2

    .line 390
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v3, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    throw v2

    :catchall_1
    move-exception v1

    .line 398
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method protected doDetach()V
    .locals 2

    .line 208
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x0

    .line 209
    :try_start_0
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    .line 210
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    .line 211
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected doGetContentSize()J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 448
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    .line 449
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isSymbolicLink()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 450
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getLinkDestination()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    .line 452
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->isCircular(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 453
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getSize()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    .line 455
    :cond_0
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileContent;->getSize()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    .line 457
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->getSize()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    :catchall_0
    move-exception v1

    .line 458
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 486
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getClient()Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    move-result-object v0

    .line 488
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->retrieveFileStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 493
    new-instance v2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;

    invoke-direct {v2, p0, v0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Ljava/io/InputStream;)V

    return-object v2

    .line 491
    :cond_0
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    .line 495
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v2, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    .line 496
    throw v1
.end method

.method protected doGetLastModifiedTime()J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 468
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    .line 469
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isSymbolicLink()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 470
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getLinkDestination()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    .line 472
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->isCircular(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 473
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getTimestamp()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    .line 475
    :cond_0
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    .line 477
    :cond_1
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getTimestamp()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    :catchall_0
    move-exception v1

    .line 478
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 510
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getClient()Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 514
    :try_start_0
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->appendFileStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1

    goto :goto_0

    .line 516
    :cond_0
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->storeFileStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_1

    .line 524
    new-instance v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpOutputStream;

    invoke-direct {v1, p0, v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpOutputStream;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Ljava/io/OutputStream;)V

    return-object v1

    .line 520
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.ftp/output-error.debug"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    .line 521
    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->getReplyString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v2, 0x1

    aput-object v3, v4, v2

    invoke-direct {p1, v1, v4}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 526
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    .line 527
    throw p1
.end method

.method protected doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 502
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    return-object v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 256
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    .line 257
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    .line 258
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getInfo(Z)V

    .line 261
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    sget-object v2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->UNKNOWN:Lorg/apache/commons/net/ftp/FTPFile;

    if-ne v1, v2, :cond_1

    .line 262
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    monitor-exit v0

    return-object v1

    .line 263
    :cond_1
    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 264
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    monitor-exit v0

    return-object v1

    .line 265
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isFile()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 266
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    monitor-exit v0

    return-object v1

    .line 267
    :cond_3
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isSymbolicLink()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 268
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getLinkDestination()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    .line 270
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->isCircular(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 275
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    monitor-exit v0

    return-object v1

    .line 277
    :cond_4
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 280
    :cond_5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.ftp/get-type.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    :catchall_0
    move-exception v1

    .line 280
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 355
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->doGetChildren()V

    .line 358
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 363
    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    .line 365
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, -0x1

    .line 366
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    .line 368
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/net/ftp/FTPFile;

    .line 369
    invoke-virtual {v3}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    goto :goto_0

    .line 372
    :cond_1
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->encode([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected doListChildrenResolved()[Lorg/apache/commons/vfs2/FileObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 303
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    .line 304
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isSymbolicLink()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 305
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getLinkDestination()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    .line 307
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->isCircular(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 308
    monitor-exit v0

    return-object v2

    .line 310
    :cond_0
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 312
    :cond_1
    monitor-exit v0

    return-object v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected doRename(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 406
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    .line 408
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getClient()Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 410
    :try_start_1
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    .line 411
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getRelPath()Ljava/lang/String;

    move-result-object v3

    .line 412
    invoke-interface {v1, v2, v3}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 414
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v3, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    if-eqz v2, :cond_0

    const/4 p1, 0x0

    .line 420
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    .line 421
    sget-object p1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->EMPTY_FTP_FILE_MAP:Ljava/util/Map;

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    .line 422
    monitor-exit v0

    return-void

    .line 418
    :cond_0
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.ftp/rename-file.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    const/4 v3, 0x1

    aput-object p1, v4, v3

    invoke-direct {v1, v2, v4}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1

    :catchall_0
    move-exception p1

    .line 414
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v2, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    throw p1

    :catchall_1
    move-exception p1

    .line 422
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method

.method public getChildren()[Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 327
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->doGetType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 342
    :try_start_1
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->inRefresh:Z

    .line 343
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 345
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->inRefresh:Z

    return-object v0

    :catchall_0
    move-exception v0

    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->inRefresh:Z

    throw v0

    .line 328
    :cond_0
    :try_start_2
    new-instance v0, Lorg/apache/commons/vfs2/FileNotFolderException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileNotFolderException;-><init>(Ljava/lang/Object;)V

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    .line 331
    new-instance v1, Lorg/apache/commons/vfs2/FileNotFolderException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/FileNotFolderException;-><init>(Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method getInputStream(J)Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 548
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getClient()Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    move-result-object v0

    .line 550
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->retrieveFileStream(Ljava/lang/String;J)Ljava/io/InputStream;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 555
    new-instance p2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;

    invoke-direct {p2, p0, v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject$FtpInputStream;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Ljava/io/InputStream;)V

    return-object p2

    .line 552
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.provider.ftp/input-error.debug"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    .line 553
    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v1, 0x1

    aput-object v2, v3, v1

    invoke-direct {p1, p2, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 557
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object p2

    check-cast p2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    .line 558
    throw p1
.end method

.method getRelPath()Ljava/lang/String;
    .locals 1

    .line 532
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->relPath:Ljava/lang/String;

    return-object v0
.end method

.method protected onChange()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 237
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    .line 239
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/FileType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0

    .line 242
    :try_start_0
    sget-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->UNKNOWN:Lorg/apache/commons/net/ftp/FTPFile;

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    .line 243
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_0
    const/4 v0, 0x1

    .line 247
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getInfo(Z)V

    return-void
.end method

.method protected onChildrenChanged(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V
    .locals 1

    .line 219
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p2, v0}, Lorg/apache/commons/vfs2/FileType;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 221
    :try_start_0
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 223
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileSystemException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_0
    const/4 p1, 0x0

    .line 228
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->children:Ljava/util/Map;

    return-void
.end method

.method public refresh()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 184
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->inRefresh:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 186
    :try_start_0
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->inRefresh:Z

    .line 187
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->refresh()V

    .line 189
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v2, 0x0

    .line 190
    :try_start_1
    iput-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->fileInfo:Lorg/apache/commons/net/ftp/FTPFile;

    .line 191
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->inRefresh:Z

    return-void

    :catchall_0
    move-exception v2

    .line 191
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    .line 198
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;->inRefresh:Z

    throw v0

    :cond_0
    return-void
.end method
