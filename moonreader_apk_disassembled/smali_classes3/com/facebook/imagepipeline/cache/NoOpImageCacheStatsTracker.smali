.class public Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;
.super Ljava/lang/Object;
.source "NoOpImageCacheStatsTracker.java"

# interfaces
.implements Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;


# static fields
.field private static sInstance:Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;
    .locals 2

    const-class v0, Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;

    monitor-enter v0

    .line 22
    :try_start_0
    sget-object v1, Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;->sInstance:Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;

    if-nez v1, :cond_0

    .line 23
    new-instance v1, Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;

    invoke-direct {v1}, Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;-><init>()V

    sput-object v1, Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;->sInstance:Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;

    .line 25
    :cond_0
    sget-object v1, Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;->sInstance:Lcom/facebook/imagepipeline/cache/NoOpImageCacheStatsTracker;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public onBitmapCacheHit(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onBitmapCacheMiss(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onBitmapCachePut(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onDiskCacheGetFail(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onDiskCacheHit(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onDiskCacheMiss(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onDiskCachePut(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onMemoryCacheHit(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onMemoryCacheMiss(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onMemoryCachePut(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onStagingAreaHit(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public onStagingAreaMiss(Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    return-void
.end method

.method public registerBitmapMemoryCache(Lcom/facebook/imagepipeline/cache/MemoryCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "**>;)V"
        }
    .end annotation

    return-void
.end method

.method public registerEncodedMemoryCache(Lcom/facebook/imagepipeline/cache/MemoryCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "**>;)V"
        }
    .end annotation

    return-void
.end method
