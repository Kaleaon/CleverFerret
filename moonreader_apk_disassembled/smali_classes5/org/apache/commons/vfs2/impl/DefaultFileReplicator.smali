.class public Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;
.super Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;
.source "DefaultFileReplicator.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/FileReplicator;
.implements Lorg/apache/commons/vfs2/provider/TemporaryFileStore;


# static fields
.field private static final MASK:I = 0xffff

.field private static final TMP_RESERVED_CHARS:[C

.field private static final log:Lorg/apache/commons/logging/Log;

.field private static final random:Ljava/util/Random;


# instance fields
.field private final copies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private filecount:J

.field private tempDir:Ljava/io/File;

.field private tempDirMessageLogged:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    const-class v0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->log:Lorg/apache/commons/logging/Log;

    .line 42
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->random:Ljava/util/Random;

    const/16 v0, 0xe

    .line 44
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->TMP_RESERVED_CHARS:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x3fs
        0x2fs
        0x5cs
        0x20s
        0x26s
        0x22s
        0x27s
        0x2as
        0x23s
        0x3bs
        0x3as
        0x3cs
        0x3es
        0x7cs
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1

    .line 60
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    .line 61
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    return-void
.end method


# virtual methods
.method protected addFile(Ljava/lang/Object;)V
    .locals 2

    .line 65
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    monitor-enter v0

    .line 66
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public allocateFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 80
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->createFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 81
    monitor-enter p0

    .line 82
    :try_start_0
    iget-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->filecount:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->filecount:J

    .line 83
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->createAndAddFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 83
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public close()V
    .locals 2

    .line 94
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    monitor-enter v0

    .line 95
    :goto_0
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 96
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->removeFile()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 97
    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->deleteFile(Ljava/io/File;)V

    goto :goto_0

    .line 99
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_1

    .line 103
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    const/4 v0, 0x0

    .line 104
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    .line 99
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected createAndAddFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 109
    iget-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->createFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 112
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->addFile(Ljava/lang/Object;)V

    return-object p1
.end method

.method protected createFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 126
    new-instance v0, Ljava/io/File;

    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method protected createFilename(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 141
    sget-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->TMP_RESERVED_CHARS:[C

    invoke-static {p1, v0}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x25

    const/16 v1, 0x5f

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "tmp_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->getFilecount()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected deleteFile(Ljava/io/File;)V
    .locals 3

    .line 152
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->toFileObject(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 153
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->deleteAll()I
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 155
    const-string v1, "vfs.impl/delete-temp.warn"

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 156
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->log:Lorg/apache/commons/logging/Log;

    invoke-static {v1, v2, p1, v0}, Lorg/apache/commons/vfs2/VfsLog;->warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method protected getFilecount()J
    .locals 2

    .line 161
    iget-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->filecount:J

    return-wide v0
.end method

.method public init()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 171
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    if-nez v0, :cond_0

    .line 172
    const-string v0, "java.io.tmpdir"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 174
    new-instance v1, Ljava/io/File;

    const-string v2, "vfs_cache"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    .line 177
    :cond_0
    sget-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->filecount:J

    .line 179
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDirMessageLogged:Z

    if-nez v0, :cond_1

    .line 180
    const-string v0, "vfs.impl/temp-dir.debug"

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDir:Ljava/io/File;

    invoke-static {v0, v1}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 181
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->log:Lorg/apache/commons/logging/Log;

    invoke-static {v1, v2, v0}, Lorg/apache/commons/vfs2/VfsLog;->debug(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 183
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->tempDirMessageLogged:Z

    :cond_1
    return-void
.end method

.method protected removeFile()Ljava/lang/Object;
    .locals 3

    .line 195
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    monitor-enter v0

    .line 196
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 197
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected removeFile(Ljava/lang/Object;)V
    .locals 2

    .line 206
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    monitor-enter v0

    .line 207
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->copies:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 208
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public replicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 221
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object v0

    .line 222
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->allocateFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 225
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileReplicator;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->toFileObject(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    .line 226
    invoke-interface {v1, p1, p2}, Lorg/apache/commons/vfs2/FileObject;->copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V

    return-object v0
.end method
