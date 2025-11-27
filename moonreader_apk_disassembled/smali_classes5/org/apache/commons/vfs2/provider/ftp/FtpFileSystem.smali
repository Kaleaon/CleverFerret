.class public Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;
.super Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
.source "FtpFileSystem.java"


# static fields
.field private static final LOG:Lorg/apache/commons/logging/Log;


# instance fields
.field private final idleClient:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lorg/apache/commons/vfs2/provider/ftp/FtpClient;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const-class v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->LOG:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 1

    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1, v0, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 46
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->idleClient:Ljava/util/concurrent/atomic/AtomicReference;

    .line 60
    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method private closeConnection(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V
    .locals 3

    .line 88
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    invoke-interface {p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->disconnect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 93
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->LOG:Lorg/apache/commons/logging/Log;

    const-string v2, "vfs.provider.ftp/close-connection.error"

    invoke-static {v0, v1, v2, p1}, Lorg/apache/commons/vfs2/VfsLog;->warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V

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

    .line 77
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected createFile(Lorg/apache/commons/vfs2/provider/AbstractFileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 142
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getRootName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-direct {v0, p1, p0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;Lorg/apache/commons/vfs2/FileName;)V

    return-object v0
.end method

.method protected createWrapper()Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 121
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getRoot()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/GenericFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v0
.end method

.method protected doCloseCommunicationLink()V
    .locals 2

    .line 65
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->idleClient:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    if-eqz v0, :cond_0

    .line 68
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->closeConnection(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    :cond_0
    return-void
.end method

.method public getClient()Lorg/apache/commons/vfs2/provider/ftp/FtpClient;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->idleClient:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;

    if-eqz v0, :cond_1

    .line 106
    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpClient;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    return-object v0

    .line 107
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->createWrapper()Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;

    move-result-object v0

    return-object v0
.end method

.method public putClient(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V
    .locals 2

    .line 131
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->idleClient:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-static {v0, v1, p1}, Landroidx/lifecycle/LifecycleKt$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 133
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;->closeConnection(Lorg/apache/commons/vfs2/provider/ftp/FtpClient;)V

    :cond_0
    return-void
.end method
