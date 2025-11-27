.class public Lcom/facebook/imagepipeline/cache/EncodedMemoryCacheFactory;
.super Ljava/lang/Object;
.source "EncodedMemoryCacheFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Lcom/facebook/imagepipeline/cache/MemoryCache;Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;)Lcom/facebook/imagepipeline/cache/InstrumentedMemoryCache;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/cache/MemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;",
            "Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;",
            ")",
            "Lcom/facebook/imagepipeline/cache/InstrumentedMemoryCache<",
            "Lcom/facebook/cache/common/CacheKey;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation

    .line 21
    invoke-interface {p1, p0}, Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;->registerEncodedMemoryCache(Lcom/facebook/imagepipeline/cache/MemoryCache;)V

    .line 23
    new-instance v0, Lcom/facebook/imagepipeline/cache/EncodedMemoryCacheFactory$1;

    invoke-direct {v0, p1}, Lcom/facebook/imagepipeline/cache/EncodedMemoryCacheFactory$1;-><init>(Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;)V

    .line 41
    new-instance p1, Lcom/facebook/imagepipeline/cache/InstrumentedMemoryCache;

    invoke-direct {p1, p0, v0}, Lcom/facebook/imagepipeline/cache/InstrumentedMemoryCache;-><init>(Lcom/facebook/imagepipeline/cache/MemoryCache;Lcom/facebook/imagepipeline/cache/MemoryCacheTracker;)V

    return-object p1
.end method
