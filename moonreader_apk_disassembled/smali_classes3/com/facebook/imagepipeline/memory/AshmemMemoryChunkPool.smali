.class public Lcom/facebook/imagepipeline/memory/AshmemMemoryChunkPool;
.super Lcom/facebook/imagepipeline/memory/MemoryChunkPool;
.source "AshmemMemoryChunkPool.java"


# direct methods
.method public constructor <init>(Lcom/facebook/common/memory/MemoryTrimmableRegistry;Lcom/facebook/imagepipeline/memory/PoolParams;Lcom/facebook/imagepipeline/memory/PoolStatsTracker;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/memory/MemoryChunkPool;-><init>(Lcom/facebook/common/memory/MemoryTrimmableRegistry;Lcom/facebook/imagepipeline/memory/PoolParams;Lcom/facebook/imagepipeline/memory/PoolStatsTracker;)V

    return-void
.end method


# virtual methods
.method public alloc(I)Lcom/facebook/imagepipeline/memory/AshmemMemoryChunk;
    .locals 1

    .line 33
    new-instance v0, Lcom/facebook/imagepipeline/memory/AshmemMemoryChunk;

    invoke-direct {v0, p1}, Lcom/facebook/imagepipeline/memory/AshmemMemoryChunk;-><init>(I)V

    return-object v0
.end method

.method public bridge synthetic alloc(I)Lcom/facebook/imagepipeline/memory/MemoryChunk;
    .locals 0

    .line 17
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/AshmemMemoryChunkPool;->alloc(I)Lcom/facebook/imagepipeline/memory/AshmemMemoryChunk;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic alloc(I)Ljava/lang/Object;
    .locals 0

    .line 17
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/memory/AshmemMemoryChunkPool;->alloc(I)Lcom/facebook/imagepipeline/memory/AshmemMemoryChunk;

    move-result-object p1

    return-object p1
.end method
