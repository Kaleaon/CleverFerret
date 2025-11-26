.class public interface abstract Lcom/facebook/imagepipeline/core/DiskCachesStore;
.super Ljava/lang/Object;
.source "DiskCachesStore.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008f\u0018\u00002\u00020\u0001R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00020\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\tR\u0012\u0010\n\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\u0005R\u0012\u0010\u000c\u001a\u00020\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\tR\u001e\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00030\u000fX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u0012R\u001e\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00070\u0014X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/core/DiskCachesStore;",
        "",
        "mainFileCache",
        "Lcom/facebook/cache/disk/FileCache;",
        "getMainFileCache",
        "()Lcom/facebook/cache/disk/FileCache;",
        "mainBufferedDiskCache",
        "Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
        "getMainBufferedDiskCache",
        "()Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
        "smallImageFileCache",
        "getSmallImageFileCache",
        "smallImageBufferedDiskCache",
        "getSmallImageBufferedDiskCache",
        "dynamicFileCaches",
        "",
        "",
        "getDynamicFileCaches",
        "()Ljava/util/Map;",
        "dynamicBufferedDiskCaches",
        "Lcom/facebook/common/internal/ImmutableMap;",
        "getDynamicBufferedDiskCaches",
        "()Lcom/facebook/common/internal/ImmutableMap;",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract getDynamicBufferedDiskCaches()Lcom/facebook/common/internal/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/common/internal/ImmutableMap<",
            "Ljava/lang/String;",
            "Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDynamicFileCaches()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/cache/disk/FileCache;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getMainBufferedDiskCache()Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
.end method

.method public abstract getMainFileCache()Lcom/facebook/cache/disk/FileCache;
.end method

.method public abstract getSmallImageBufferedDiskCache()Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
.end method

.method public abstract getSmallImageFileCache()Lcom/facebook/cache/disk/FileCache;
.end method
