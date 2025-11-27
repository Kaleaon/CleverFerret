.class public Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;
.super Ljava/lang/Object;
.source "PrivilegedFileReplicator.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/FileReplicator;
.implements Lorg/apache/commons/vfs2/provider/VfsComponent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$CloseAction;,
        Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;,
        Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$InitAction;
    }
.end annotation


# instance fields
.field private final replicator:Lorg/apache/commons/vfs2/provider/FileReplicator;

.field private final replicatorComponent:Lorg/apache/commons/vfs2/provider/VfsComponent;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/FileReplicator;)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicator:Lorg/apache/commons/vfs2/provider/FileReplicator;

    .line 42
    instance-of v0, p1, Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v0, :cond_0

    .line 43
    check-cast p1, Lorg/apache/commons/vfs2/provider/VfsComponent;

    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicatorComponent:Lorg/apache/commons/vfs2/provider/VfsComponent;

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 45
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicatorComponent:Lorg/apache/commons/vfs2/provider/VfsComponent;

    return-void
.end method

.method static synthetic access$200(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;)Lorg/apache/commons/vfs2/provider/VfsComponent;
    .locals 0

    .line 36
    iget-object p0, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicatorComponent:Lorg/apache/commons/vfs2/provider/VfsComponent;

    return-object p0
.end method

.method static synthetic access$300(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;)Lorg/apache/commons/vfs2/provider/FileReplicator;
    .locals 0

    .line 36
    iget-object p0, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicator:Lorg/apache/commons/vfs2/provider/FileReplicator;

    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 94
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicatorComponent:Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v0, :cond_0

    .line 95
    new-instance v0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$CloseAction;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$CloseAction;-><init>(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$1;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public init()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 80
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicatorComponent:Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v0, :cond_0

    .line 82
    :try_start_0
    new-instance v0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$InitAction;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$InitAction;-><init>(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$1;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 84
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.impl/init-replicator.error"

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_0
    return-void
.end method

.method public replicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 110
    :try_start_0
    new-instance v0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;-><init>(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V

    .line 111
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/io/File;
    :try_end_0
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :catch_0
    move-exception p2

    .line 113
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "vfs.impl/replicate-file.error"

    invoke-direct {v0, p1, p2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v0
.end method

.method public setContext(Lorg/apache/commons/vfs2/provider/VfsComponentContext;)V
    .locals 1

    .line 68
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicatorComponent:Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v0, :cond_0

    .line 69
    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/provider/VfsComponent;->setContext(Lorg/apache/commons/vfs2/provider/VfsComponentContext;)V

    :cond_0
    return-void
.end method

.method public setLogger(Lorg/apache/commons/logging/Log;)V
    .locals 1

    .line 56
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->replicatorComponent:Lorg/apache/commons/vfs2/provider/VfsComponent;

    if-eqz v0, :cond_0

    .line 57
    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/provider/VfsComponent;->setLogger(Lorg/apache/commons/logging/Log;)V

    :cond_0
    return-void
.end method
