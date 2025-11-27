.class final Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;
.super Ljava/lang/Object;
.source "DefaultFileMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FileMonitorAgent"
.end annotation


# instance fields
.field private children:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private exists:Z

.field private final file:Lorg/apache/commons/vfs2/FileObject;

.field private final fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

.field private timestamp:J


# direct methods
.method private constructor <init>(Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 2

    .line 375
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 376
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    .line 377
    iput-object p2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    .line 379
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->refresh()V

    .line 380
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->resetChildrenList()V

    const-wide/16 v0, -0x1

    .line 383
    :try_start_0
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result p1

    iput-boolean p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->exists:Z
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    .line 385
    iput-boolean p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->exists:Z

    .line 386
    iput-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->timestamp:J

    .line 389
    :goto_0
    iget-boolean p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->exists:Z

    if-eqz p1, :cond_0

    .line 391
    :try_start_1
    iget-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide p1

    iput-wide p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->timestamp:J
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 393
    :catch_1
    iput-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->timestamp:J

    :cond_0
    :goto_1
    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$1;)V
    .locals 0

    .line 367
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;-><init>(Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;)V
    .locals 0

    .line 367
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->resetChildrenList()V

    return-void
.end method

.method static synthetic access$200(Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;)V
    .locals 0

    .line 367
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->check()V

    return-void
.end method

.method private check()V
    .locals 5

    .line 504
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->refresh()V

    .line 508
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->exists:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 509
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->exists:Z

    const-wide/16 v0, -0x1

    .line 510
    iput-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->timestamp:J

    .line 514
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireFileDeleted(Lorg/apache/commons/vfs2/FileObject;)V

    .line 517
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getFileListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 518
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getFileListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystem;->removeListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    .line 522
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->queueRemoveFile(Lorg/apache/commons/vfs2/FileObject;)V

    goto/16 :goto_0

    .line 523
    :cond_1
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->exists:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 526
    iget-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->timestamp:J

    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-eqz v4, :cond_3

    .line 527
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->timestamp:J

    .line 532
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-nez v0, :cond_3

    .line 533
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireFileChanged(Lorg/apache/commons/vfs2/FileObject;)V

    goto :goto_0

    .line 537
    :cond_2
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->exists:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 538
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->exists:Z

    .line 539
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->timestamp:J

    .line 542
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-nez v0, :cond_3

    .line 543
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireFileCreated(Lorg/apache/commons/vfs2/FileObject;)V

    .line 547
    :cond_3
    :goto_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->checkForNewChildren()V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 550
    invoke-static {}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->access$300()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileSystemException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method private checkForNewChildren()V
    .locals 7

    .line 461
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 462
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 463
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->children:Ljava/util/Map;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 465
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 466
    new-instance v3, Ljava/util/Stack;

    invoke-direct {v3}, Ljava/util/Stack;-><init>()V

    .line 468
    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_1

    .line 469
    aget-object v4, v0, v2

    invoke-interface {v4}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    new-instance v5, Ljava/lang/Object;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    iget-object v4, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->children:Ljava/util/Map;

    aget-object v5, v0, v2

    invoke-interface {v5}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 472
    aget-object v4, v0, v2

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 476
    :cond_1
    iput-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->children:Ljava/util/Map;

    .line 479
    invoke-virtual {v3}, Ljava/util/Stack;->empty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 481
    :goto_1
    invoke-virtual {v3}, Ljava/util/Stack;->empty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 482
    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/FileObject;

    .line 483
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fireAllCreate(Lorg/apache/commons/vfs2/FileObject;)V

    goto :goto_1

    .line 489
    :cond_2
    array-length v1, v0

    if-lez v1, :cond_3

    .line 490
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->children:Ljava/util/Map;

    .line 492
    :cond_3
    array-length v1, v0

    :goto_2
    if-ge v2, v1, :cond_4

    aget-object v3, v0, v2

    .line 493
    iget-object v4, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->children:Ljava/util/Map;

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v5

    new-instance v6, Ljava/lang/Object;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    invoke-direct {p0, v3}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fireAllCreate(Lorg/apache/commons/vfs2/FileObject;)V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :catch_0
    move-exception v0

    .line 499
    invoke-static {}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->access$300()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileSystemException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_4
    return-void
.end method

.method private fireAllCreate(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 3

    .line 431
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getFileListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 432
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getFileListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lorg/apache/commons/vfs2/FileSystem;->addListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    .line 435
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireFileCreated(Lorg/apache/commons/vfs2/FileObject;)V

    .line 438
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getFileListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 439
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getFileListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lorg/apache/commons/vfs2/FileSystem;->removeListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    .line 442
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->queueAddFile(Lorg/apache/commons/vfs2/FileObject;)V

    .line 445
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fm:Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->isRecursive()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 446
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 447
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p1, v1

    .line 448
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->fireAllCreate(Lorg/apache/commons/vfs2/FileObject;)V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 452
    invoke-static {}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->access$300()Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileSystemException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_2
    return-void
.end method

.method private refresh()V
    .locals 3

    .line 417
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->refresh()V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 419
    invoke-static {}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->access$300()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileSystemException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method private resetChildrenList()V
    .locals 6

    .line 400
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 401
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->children:Ljava/util/Map;

    .line 402
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 403
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 404
    iget-object v4, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->children:Ljava/util/Map;

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    new-instance v5, Ljava/lang/Object;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 408
    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->children:Ljava/util/Map;

    :cond_0
    return-void
.end method
