.class final Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;
.super Ljava/lang/Thread;
.source "SoftRefFilesCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SoftRefReleaseThread"
.end annotation


# instance fields
.field private volatile requestEnd:Z

.field final synthetic this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;


# direct methods
.method private constructor <init>(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 65
    const-class p1, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->setName(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 66
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->setDaemon(Z)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$1;)V
    .locals 0

    .line 61
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;-><init>(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)V

    return-void
.end method

.method static synthetic access$802(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;Z)Z
    .locals 0

    .line 61
    iput-boolean p1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->requestEnd:Z

    return p1
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 71
    :goto_0
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->requestEnd:Z

    if-nez v0, :cond_2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_2

    .line 73
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-static {v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$000(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Ljava/lang/ref/ReferenceQueue;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Ljava/lang/ref/ReferenceQueue;->remove(J)Ljava/lang/ref/Reference;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 78
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-static {v1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$100(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :try_start_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-static {v1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$200(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;

    if-eqz v0, :cond_1

    .line 82
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-static {v1, v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$300(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 83
    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/cache/FileSystemAndNameKey;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    invoke-static {v1, v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$400(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;Lorg/apache/commons/vfs2/FileSystem;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-static {v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$100(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-static {v1}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$100(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    nop

    .line 89
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->requestEnd:Z

    if-nez v0, :cond_2

    .line 90
    iget-object v0, p0, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache$SoftRefReleaseThread;->this$0:Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;

    invoke-static {v0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$500(Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-static {}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;->access$600()Lorg/apache/commons/logging/Log;

    move-result-object v1

    const-string v2, "vfs.impl/SoftRefReleaseThread-interrupt.info"

    .line 91
    invoke-static {v2}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 90
    invoke-static {v0, v1, v2}, Lorg/apache/commons/vfs2/VfsLog;->warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
