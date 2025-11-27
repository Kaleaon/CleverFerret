.class public Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;
.super Ljava/lang/Object;
.source "DefaultFileMonitor.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lorg/apache/commons/vfs2/FileMonitor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;
    }
.end annotation


# static fields
.field private static final DEFAULT_DELAY:J = 0x3e8L

.field private static final DEFAULT_MAX_FILES:I = 0x3e8

.field private static final LOG:Lorg/apache/commons/logging/Log;


# instance fields
.field private final addStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation
.end field

.field private checksPerRun:I

.field private delay:J

.field private final deleteStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation
.end field

.field private final listener:Lorg/apache/commons/vfs2/FileListener;

.field private final monitorMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileName;",
            "Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;",
            ">;"
        }
    .end annotation
.end field

.field private monitorThread:Ljava/lang/Thread;

.field private recursive:Z

.field private volatile shouldRun:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 71
    const-class v0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->LOG:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/FileListener;)V
    .locals 2

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    .line 90
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->deleteStack:Ljava/util/Stack;

    .line 95
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->addStack:Ljava/util/Stack;

    const/4 v0, 0x1

    .line 100
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->shouldRun:Z

    const-wide/16 v0, 0x3e8

    .line 110
    iput-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->delay:J

    const/16 v0, 0x3e8

    .line 115
    iput v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->checksPerRun:I

    .line 123
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->listener:Lorg/apache/commons/vfs2/FileListener;

    return-void
.end method

.method static synthetic access$300()Lorg/apache/commons/logging/Log;
    .locals 1

    .line 70
    sget-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->LOG:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method private doAddFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 5

    .line 181
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    monitor-enter v0

    .line 182
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 183
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    new-instance v3, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;

    const/4 v4, 0x0

    invoke-direct {v3, p0, p1, v4}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;-><init>(Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$1;)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    :try_start_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->listener:Lorg/apache/commons/vfs2/FileListener;

    if-eqz v1, :cond_0

    .line 187
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->listener:Lorg/apache/commons/vfs2/FileListener;

    invoke-interface {v1, p1, v2}, Lorg/apache/commons/vfs2/FileSystem;->addListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    .line 190
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->recursive:Z

    if-eqz v1, :cond_1

    .line 192
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 193
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 194
    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->addFile(Lorg/apache/commons/vfs2/FileObject;)V
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 199
    :try_start_2
    sget-object v1, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->LOG:Lorg/apache/commons/logging/Log;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileSystemException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 203
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method


# virtual methods
.method public addFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 3

    .line 160
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->doAddFile(Lorg/apache/commons/vfs2/FileObject;)V

    .line 163
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    .line 166
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 167
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->doAddFile(Lorg/apache/commons/vfs2/FileObject;)V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 171
    sget-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->LOG:Lorg/apache/commons/logging/Log;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileSystemException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public getChecksPerRun()I
    .locals 1

    .line 272
    iget v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->checksPerRun:I

    return v0
.end method

.method public getDelay()J
    .locals 2

    .line 250
    iget-wide v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->delay:J

    return-wide v0
.end method

.method getFileListener()Lorg/apache/commons/vfs2/FileListener;
    .locals 1

    .line 150
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->listener:Lorg/apache/commons/vfs2/FileListener;

    return-object v0
.end method

.method public isRecursive()Z
    .locals 1

    .line 132
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->recursive:Z

    return v0
.end method

.method protected queueAddFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1

    .line 290
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->addStack:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected queueRemoveFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1

    .line 241
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->deleteStack:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public removeFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 3

    .line 213
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    monitor-enter v0

    .line 214
    :try_start_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    .line 215
    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 218
    :try_start_1
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    .line 223
    :goto_0
    :try_start_2
    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_0

    .line 226
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;

    if-eqz p1, :cond_0

    .line 228
    invoke-static {p1}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->access$100(Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;)V

    .line 232
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public run()V
    .locals 5

    .line 317
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_7

    iget-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->shouldRun:Z

    if-eqz v0, :cond_7

    .line 320
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    monitor-enter v0

    .line 321
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 322
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v0, 0x0

    .line 323
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_4

    .line 324
    aget-object v2, v1, v0

    check-cast v2, Lorg/apache/commons/vfs2/FileName;

    .line 326
    iget-object v3, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    monitor-enter v3

    .line 327
    :try_start_1
    iget-object v4, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorMap:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;

    .line 328
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_1

    .line 330
    invoke-static {v2}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;->access$200(Lorg/apache/commons/vfs2/impl/DefaultFileMonitor$FileMonitorAgent;)V

    .line 333
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getChecksPerRun()I

    move-result v2

    if-lez v2, :cond_2

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getChecksPerRun()I

    move-result v3

    rem-int/2addr v2, v3

    if-nez v2, :cond_2

    .line 335
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getDelay()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    :catch_0
    nop

    .line 341
    :cond_2
    :goto_2
    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->shouldRun:Z

    if-nez v2, :cond_3

    goto :goto_0

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 328
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    .line 346
    :cond_4
    :goto_3
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->addStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->empty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 347
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->addStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->addFile(Lorg/apache/commons/vfs2/FileObject;)V

    goto :goto_3

    .line 350
    :cond_5
    :goto_4
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->deleteStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->empty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 351
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->deleteStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->removeFile(Lorg/apache/commons/vfs2/FileObject;)V

    goto :goto_4

    .line 355
    :cond_6
    :try_start_4
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->getDelay()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    :catch_1
    nop

    goto/16 :goto_0

    :catchall_1
    move-exception v1

    .line 322
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v1

    :cond_7
    const/4 v0, 0x1

    .line 361
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->shouldRun:Z

    return-void
.end method

.method public setChecksPerRun(I)V
    .locals 0

    .line 281
    iput p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->checksPerRun:I

    return-void
.end method

.method public setDelay(J)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    .line 260
    iput-wide p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->delay:J

    return-void

    :cond_0
    const-wide/16 p1, 0x3e8

    .line 262
    iput-wide p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->delay:J

    return-void
.end method

.method public setRecursive(Z)V
    .locals 0

    .line 141
    iput-boolean p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->recursive:Z

    return-void
.end method

.method public start()V
    .locals 2

    .line 297
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 298
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    .line 299
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 300
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 302
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public stop()V
    .locals 1

    const/4 v0, 0x0

    .line 309
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileMonitor;->shouldRun:Z

    return-void
.end method
