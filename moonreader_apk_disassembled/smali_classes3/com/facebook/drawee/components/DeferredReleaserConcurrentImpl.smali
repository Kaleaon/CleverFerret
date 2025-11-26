.class Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;
.super Lcom/facebook/drawee/components/DeferredReleaser;
.source "DeferredReleaserConcurrentImpl.java"


# instance fields
.field private final mLock:Ljava/lang/Object;

.field private mPendingReleasables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/facebook/drawee/components/DeferredReleaser$Releasable;",
            ">;"
        }
    .end annotation
.end field

.field private mTempList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/facebook/drawee/components/DeferredReleaser$Releasable;",
            ">;"
        }
    .end annotation
.end field

.field private final mUiHandler:Landroid/os/Handler;

.field private final releaseRunnable:Ljava/lang/Runnable;


# direct methods
.method static bridge synthetic -$$Nest$fgetmLock(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPendingReleasables(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mPendingReleasables:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmTempList(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mTempList:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmPendingReleasables(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mPendingReleasables:Ljava/util/ArrayList;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmTempList(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mTempList:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 50
    invoke-direct {p0}, Lcom/facebook/drawee/components/DeferredReleaser;-><init>()V

    .line 20
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mLock:Ljava/lang/Object;

    .line 30
    new-instance v0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;

    invoke-direct {v0, p0}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;-><init>(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)V

    iput-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->releaseRunnable:Ljava/lang/Runnable;

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mPendingReleasables:Ljava/util/ArrayList;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mTempList:Ljava/util/ArrayList;

    .line 53
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mUiHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public cancelDeferredRelease(Lcom/facebook/drawee/components/DeferredReleaser$Releasable;)V
    .locals 2

    .line 85
    iget-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 86
    :try_start_0
    iget-object v1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mPendingReleasables:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 87
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public scheduleDeferredRelease(Lcom/facebook/drawee/components/DeferredReleaser$Releasable;)V
    .locals 2

    .line 59
    invoke-static {}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->isOnUiThread()Z

    move-result v0

    if-nez v0, :cond_0

    .line 60
    invoke-interface {p1}, Lcom/facebook/drawee/components/DeferredReleaser$Releasable;->release()V

    return-void

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 66
    :try_start_0
    iget-object v1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mPendingReleasables:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 67
    monitor-exit v0

    return-void

    .line 69
    :cond_1
    iget-object v1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mPendingReleasables:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    iget-object p1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mPendingReleasables:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    .line 71
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_3

    .line 76
    iget-object p1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->mUiHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->releaseRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3
    return-void

    :catchall_0
    move-exception p1

    .line 71
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
