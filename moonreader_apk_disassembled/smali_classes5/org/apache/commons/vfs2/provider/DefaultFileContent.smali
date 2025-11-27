.class public final Lorg/apache/commons/vfs2/provider/DefaultFileContent;
.super Ljava/lang/Object;
.source "DefaultFileContent.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileContent;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;,
        Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;,
        Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;
    }
.end annotation


# static fields
.field static final STATE_CLOSED:I = 0x0

.field static final STATE_OPENED:I = 0x1

.field private static final WRITE_BUFFER_SIZE:I = 0x1000


# instance fields
.field private attrs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private fileContentInfo:Lorg/apache/commons/vfs2/FileContentInfo;

.field private final fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

.field private final fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

.field private openStreams:I

.field private resetAttributes:Z

.field private roAttrs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final threadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lorg/apache/commons/vfs2/provider/FileContentThreadData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileObject;Lorg/apache/commons/vfs2/FileContentInfoFactory;)V
    .locals 1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    .line 71
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    .line 72
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->endInput(Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;)V

    return-void
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/RandomAccessContent;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->endRandomAccess(Lorg/apache/commons/vfs2/RandomAccessContent;)V

    return-void
.end method

.method static synthetic access$200(Lorg/apache/commons/vfs2/provider/DefaultFileContent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->endOutput()V

    return-void
.end method

.method private endInput(Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;)V
    .locals 1

    .line 481
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    if-eqz v0, :cond_0

    .line 483
    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->removeInstr(Ljava/io/InputStream;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 485
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->hasStreams()Z

    move-result p1

    if-nez p1, :cond_2

    .line 487
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->remove()V

    .line 489
    :cond_2
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->streamClosed()V

    return-void
.end method

.method private endOutput()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 511
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 513
    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->setOutstr(Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 515
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->hasStreams()Z

    move-result v0

    if-nez v0, :cond_2

    .line 517
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 519
    :cond_2
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->streamClosed()V

    .line 520
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->endOutput()V

    return-void
.end method

.method private endRandomAccess(Lorg/apache/commons/vfs2/RandomAccessContent;)V
    .locals 1

    .line 496
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    if-eqz v0, :cond_0

    .line 498
    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->removeRastr(Lorg/apache/commons/vfs2/RandomAccessContent;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 500
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->hasStreams()Z

    move-result p1

    if-nez p1, :cond_2

    .line 502
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->remove()V

    .line 504
    :cond_2
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->streamClosed()V

    return-void
.end method

.method private getOrCreateThreadData()Lorg/apache/commons/vfs2/provider/FileContentThreadData;
    .locals 2

    .line 76
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;-><init>()V

    .line 79
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_0
    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 432
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getOrCreateThreadData()Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    .line 435
    :goto_0
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->getInstrsSize()I

    move-result v3

    const/4 v4, 0x0

    if-lez v3, :cond_0

    .line 437
    invoke-virtual {v0, v4}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->removeInstr(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 439
    :try_start_1
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;->close()V
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    goto :goto_0

    .line 447
    :cond_0
    :goto_1
    :try_start_2
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->getRastrsSize()I

    move-result v3

    if-lez v3, :cond_1

    .line 449
    invoke-virtual {v0, v4}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->removeRastr(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 451
    :try_start_3
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;->close()V
    :try_end_3
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catch_1
    move-exception v2

    goto :goto_1

    .line 458
    :cond_1
    :try_start_4
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->getOutstr()Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 460
    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->setOutstr(Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 462
    :try_start_5
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->close()V
    :try_end_5
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    :catch_2
    move-exception v2

    .line 468
    :cond_2
    :goto_2
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    if-nez v2, :cond_3

    return-void

    .line 473
    :cond_3
    throw v2

    :catchall_0
    move-exception v0

    .line 468
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    throw v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 257
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getAttributes()Ljava/util/Map;

    .line 258
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->attrs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getAttributeNames()[Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 243
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getAttributes()Ljava/util/Map;

    .line 244
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->attrs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 245
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getAttributes()Ljava/util/Map;
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
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 209
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 212
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->resetAttributes:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->roAttrs:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 214
    :cond_0
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetAttributes()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->attrs:Ljava/util/Map;

    .line 216
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->roAttrs:Ljava/util/Map;

    const/4 v0, 0x0

    .line 217
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->resetAttributes:Z

    .line 218
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->roAttrs:Ljava/util/Map;

    return-object v0

    :catchall_0
    move-exception v0

    .line 218
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    .line 220
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/get-attributes.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    .line 210
    :cond_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/get-attributes-no-exist.error"

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public getCertificates()[Ljava/security/cert/Certificate;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 316
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 325
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    .line 329
    new-array v0, v0, [Ljava/security/cert/Certificate;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 331
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/get-certificates.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    .line 317
    :cond_1
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/get-certificates-no-exist.error"

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public getContentInfo()Lorg/apache/commons/vfs2/FileContentInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 672
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileContentInfo:Lorg/apache/commons/vfs2/FileContentInfo;

    if-nez v0, :cond_0

    .line 673
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileContentInfoFactory:Lorg/apache/commons/vfs2/FileContentInfoFactory;

    invoke-interface {v0, p0}, Lorg/apache/commons/vfs2/FileContentInfoFactory;->create(Lorg/apache/commons/vfs2/FileContent;)Lorg/apache/commons/vfs2/FileContentInfo;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileContentInfo:Lorg/apache/commons/vfs2/FileContentInfo;

    .line 676
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileContentInfo:Lorg/apache/commons/vfs2/FileContentInfo;

    return-object v0
.end method

.method public getFile()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 110
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 349
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 351
    new-instance v1, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v1, p0, v2, v0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentInputStream;-><init>(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/FileObject;Ljava/io/InputStream;)V

    .line 353
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getOrCreateThreadData()Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->addInstr(Ljava/io/InputStream;)V

    .line 354
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->streamOpened()V

    return-object v1
.end method

.method public getLastModifiedTime()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 150
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetLastModifiedTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception v0

    .line 156
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/get-last-modified.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    .line 151
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/get-last-modified-no-exist.error"

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 392
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getOutputStream(Z)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream(Z)Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 407
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getOrCreateThreadData()Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    move-result-object v0

    .line 408
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->getOutstr()Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

    move-result-object v1

    if-nez v1, :cond_0

    .line 413
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v1, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getOutputStream(Z)Ljava/io/OutputStream;

    move-result-object p1

    .line 416
    new-instance v1, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v1, p0, v2, p1}, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;-><init>(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/FileObject;Ljava/io/OutputStream;)V

    .line 417
    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->setOutstr(Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;)V

    .line 418
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->streamOpened()V

    return-object v1

    .line 409
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/write-in-use.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method

.method public getRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 374
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;

    move-result-object p1

    .line 376
    new-instance v0, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v0, p0, v1, p1}, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/provider/DefaultFileContent;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/RandomAccessContent;)V

    .line 378
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getOrCreateThreadData()Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    move-result-object p1

    invoke-virtual {p1, v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->addRastr(Lorg/apache/commons/vfs2/RandomAccessContent;)V

    .line 379
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->streamOpened()V

    return-object v0
.end method

.method public getSize()J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetContentSize()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception v0

    .line 134
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    const-string v2, "vfs.provider/get-size.error"

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v1

    .line 123
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/get-size-not-file.error"

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public hasAttribute(Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 194
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 197
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getAttributes()Ljava/util/Map;

    .line 198
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->attrs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 195
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/exists-attributes-no-exist.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method

.method public isOpen()Z
    .locals 1

    .line 532
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;

    if-eqz v0, :cond_0

    .line 533
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->hasStreams()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 537
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->threadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    const/4 v0, 0x0

    return v0
.end method

.method public isOpenGlobal()Z
    .locals 1

    .line 547
    monitor-enter p0

    .line 548
    :try_start_0
    iget v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->openStreams:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 549
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 293
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 298
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doRemoveAttribute(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 303
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->attrs:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 304
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void

    :catch_0
    move-exception v0

    .line 300
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 p1, 0x1

    aput-object v2, v3, p1

    const-string p1, "vfs.provider/remove-attribute.error"

    invoke-direct {v1, p1, v0, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v1

    .line 294
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/remove-attribute-no-exist.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method

.method public resetAttributes()V
    .locals 1

    const/4 v0, 0x1

    .line 232
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->resetAttributes:Z

    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 270
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasAttributes()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eqz v0, :cond_1

    .line 274
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doSetAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->attrs:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 280
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void

    :catch_0
    move-exception p2

    .line 276
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v4, v3, v1

    const-string p1, "vfs.provider/set-attribute.error"

    invoke-direct {v0, p1, p2, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v0

    .line 271
    :cond_1
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v0, v3, v1

    const-string p1, "vfs.provider/set-attribute-no-exist.error"

    invoke-direct {p2, p1, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p2
.end method

.method public setLastModifiedTime(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 172
    const-string v0, "vfs.provider/set-last-modified.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/FileType;->hasAttributes()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 176
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v1, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doSetLastModifiedTime(J)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 177
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {p1, v0, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 180
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {p2, v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw p2

    .line 173
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.provider/set-last-modified-no-exist.error"

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {p1, p2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method

.method streamClosed()V
    .locals 2

    .line 92
    monitor-enter p0

    .line 93
    :try_start_0
    iget v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->openStreams:I

    if-lez v0, :cond_0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 94
    iput v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->openStreams:I

    if-ge v0, v1, :cond_0

    .line 96
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->notifyAllStreamsClosed()V

    .line 99
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->streamClosed()V

    return-void

    :catchall_0
    move-exception v0

    .line 99
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method streamOpened()V
    .locals 1

    .line 85
    monitor-enter p0

    .line 86
    :try_start_0
    iget v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->openStreams:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->openStreams:I

    .line 87
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->fileObject:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->streamOpened()V

    return-void

    :catchall_0
    move-exception v0

    .line 87
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public write(Ljava/io/OutputStream;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x1000

    .line 720
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->write(Ljava/io/OutputStream;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public write(Ljava/io/OutputStream;I)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 734
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 738
    :try_start_0
    new-array p2, p2, [B

    const-wide/16 v1, 0x0

    .line 740
    :goto_0
    invoke-virtual {v0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v4, v3, :cond_0

    const/4 v4, 0x0

    .line 741
    invoke-virtual {p1, p2, v4, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v3, v3

    add-long/2addr v1, v3

    goto :goto_0

    .line 745
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    return-wide v1

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw p1
.end method

.method public write(Lorg/apache/commons/vfs2/FileContent;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 689
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileContent;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    .line 691
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->write(Ljava/io/OutputStream;)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 693
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    return-wide v0

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    throw v0
.end method

.method public write(Lorg/apache/commons/vfs2/FileObject;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 707
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;->write(Lorg/apache/commons/vfs2/FileContent;)J

    move-result-wide v0

    return-wide v0
.end method
