.class public final Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;
.super Ljava/lang/Object;
.source "DiskCachesStoreFactory.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/core/DiskCachesStore;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;-><init>(Lcom/facebook/imagepipeline/core/FileCacheFactory;Lcom/facebook/imagepipeline/memory/PoolFactory;Lcom/facebook/imagepipeline/core/ExecutorSupplier;Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;ILcom/facebook/cache/disk/DiskCacheConfig;Lcom/facebook/cache/disk/DiskCacheConfig;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDiskCachesStoreFactory.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DiskCachesStoreFactory.kt\ncom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1\n+ 2 Maps.kt\nkotlin/collections/MapsKt__MapsKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,101:1\n462#2:102\n412#2:103\n462#2:109\n412#2:110\n1246#3,4:104\n1246#3,4:111\n1#4:108\n*S KotlinDebug\n*F\n+ 1 DiskCachesStoreFactory.kt\ncom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1\n*L\n79#1:102\n79#1:103\n86#1:109\n86#1:110\n79#1:104,4\n86#1:111,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000/\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001R\u001b\u0010\u0002\u001a\u00020\u00038VX\u0096\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0006\u0010\u0007\u001a\u0004\u0008\u0004\u0010\u0005R\u001b\u0010\u0008\u001a\u00020\t8VX\u0096\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\u0007\u001a\u0004\u0008\n\u0010\u000bR\u001b\u0010\r\u001a\u00020\u00038VX\u0096\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0007\u001a\u0004\u0008\u000e\u0010\u0005R\u001b\u0010\u0010\u001a\u00020\t8VX\u0096\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0007\u001a\u0004\u0008\u0011\u0010\u000bR\'\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00030\u00148VX\u0096\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u0007\u001a\u0004\u0008\u0016\u0010\u0017R\'\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\t0\u001a8VX\u0096\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001d\u0010\u0007\u001a\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001e"
    }
    d2 = {
        "com/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1",
        "Lcom/facebook/imagepipeline/core/DiskCachesStore;",
        "mainFileCache",
        "Lcom/facebook/cache/disk/FileCache;",
        "getMainFileCache",
        "()Lcom/facebook/cache/disk/FileCache;",
        "mainFileCache$delegate",
        "Lkotlin/Lazy;",
        "mainBufferedDiskCache",
        "Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
        "getMainBufferedDiskCache",
        "()Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
        "mainBufferedDiskCache$delegate",
        "smallImageFileCache",
        "getSmallImageFileCache",
        "smallImageFileCache$delegate",
        "smallImageBufferedDiskCache",
        "getSmallImageBufferedDiskCache",
        "smallImageBufferedDiskCache$delegate",
        "dynamicFileCaches",
        "",
        "",
        "getDynamicFileCaches",
        "()Ljava/util/Map;",
        "dynamicFileCaches$delegate",
        "dynamicBufferedDiskCaches",
        "Lcom/facebook/common/internal/ImmutableMap;",
        "getDynamicBufferedDiskCaches",
        "()Lcom/facebook/common/internal/ImmutableMap;",
        "dynamicBufferedDiskCaches$delegate",
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


# instance fields
.field private final dynamicBufferedDiskCaches$delegate:Lkotlin/Lazy;

.field private final dynamicFileCaches$delegate:Lkotlin/Lazy;

.field private final mainBufferedDiskCache$delegate:Lkotlin/Lazy;

.field private final mainFileCache$delegate:Lkotlin/Lazy;

.field private final smallImageBufferedDiskCache$delegate:Lkotlin/Lazy;

.field private final smallImageFileCache$delegate:Lkotlin/Lazy;


# direct methods
.method public static synthetic $r8$lambda$3UpBfAjd8OgRWNbeAASFcTR1y3A(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/FileCache;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->smallImageFileCache_delegate$lambda$2(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/FileCache;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$apTyEB63NskwOR7jKmBrcxFUihM(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->smallImageBufferedDiskCache_delegate$lambda$3(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$c7UdFIcNIPqkGst2fqdHmn7kkE8(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->mainBufferedDiskCache_delegate$lambda$1(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$mUGPUsc-VUEbCI14AeTC4rp5ujI(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/FileCache;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->mainFileCache_delegate$lambda$0(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/FileCache;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$oghhGNYgSf675rBPBYUco4nvl1E(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/common/internal/ImmutableMap;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->dynamicBufferedDiskCaches_delegate$lambda$9(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/common/internal/ImmutableMap;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$v-kINtWC6VaK74fKoqZBHHqk8Og(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;)Ljava/util/Map;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->dynamicFileCaches_delegate$lambda$7(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method constructor <init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->SYNCHRONIZED:Lkotlin/LazyThreadSafetyMode;

    new-instance v1, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)V

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->mainFileCache$delegate:Lkotlin/Lazy;

    .line 50
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->SYNCHRONIZED:Lkotlin/LazyThreadSafetyMode;

    new-instance v1, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)V

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->mainBufferedDiskCache$delegate:Lkotlin/Lazy;

    .line 61
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->SYNCHRONIZED:Lkotlin/LazyThreadSafetyMode;

    new-instance v1, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)V

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->smallImageFileCache$delegate:Lkotlin/Lazy;

    .line 66
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->SYNCHRONIZED:Lkotlin/LazyThreadSafetyMode;

    new-instance v1, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)V

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->smallImageBufferedDiskCache$delegate:Lkotlin/Lazy;

    .line 77
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->SYNCHRONIZED:Lkotlin/LazyThreadSafetyMode;

    new-instance v1, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1, p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;)V

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->dynamicFileCaches$delegate:Lkotlin/Lazy;

    .line 84
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->SYNCHRONIZED:Lkotlin/LazyThreadSafetyMode;

    new-instance v1, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda5;-><init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)V

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->dynamicBufferedDiskCaches$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private static final dynamicBufferedDiskCaches_delegate$lambda$9(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/common/internal/ImmutableMap;
    .locals 10

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "this$1"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->getDynamicFileCaches()Ljava/util/Map;

    move-result-object p0

    .line 109
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    check-cast v0, Ljava/util/Map;

    .line 110
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    .line 111
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 112
    check-cast v1, Ljava/util/Map$Entry;

    .line 110
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 86
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/facebook/cache/disk/FileCache;

    .line 87
    new-instance v3, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    .line 89
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getPoolFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/memory/PoolFactory;

    move-result-object v1

    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getMemoryChunkType$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getPooledByteBufferFactory(I)Lcom/facebook/common/memory/PooledByteBufferFactory;

    move-result-object v5

    const-string v1, "getPooledByteBufferFactory(...)"

    invoke-static {v5, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getPoolFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/memory/PoolFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getPooledByteStreams()Lcom/facebook/common/memory/PooledByteStreams;

    move-result-object v6

    const-string v1, "getPooledByteStreams(...)"

    invoke-static {v6, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getExecutorSupplier$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/imagepipeline/core/ExecutorSupplier;->forLocalStorageRead()Ljava/util/concurrent/Executor;

    move-result-object v7

    const-string v1, "forLocalStorageRead(...)"

    invoke-static {v7, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getExecutorSupplier$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/imagepipeline/core/ExecutorSupplier;->forLocalStorageWrite()Ljava/util/concurrent/Executor;

    move-result-object v8

    const-string v1, "forLocalStorageWrite(...)"

    invoke-static {v8, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getImageCacheStatsTracker$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    move-result-object v9

    .line 87
    invoke-direct/range {v3 .. v9}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;-><init>(Lcom/facebook/cache/disk/FileCache;Lcom/facebook/common/memory/PooledByteBufferFactory;Lcom/facebook/common/memory/PooledByteStreams;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;)V

    .line 112
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 85
    :cond_0
    invoke-static {v0}, Lcom/facebook/common/internal/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/facebook/common/internal/ImmutableMap;

    move-result-object p0

    return-object p0
.end method

.method private static final dynamicFileCaches_delegate$lambda$7(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;)Ljava/util/Map;
    .locals 4

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "this$1"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    invoke-static {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getDynamicDiskCacheConfigMap$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 102
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v1}, Lkotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    check-cast v0, Ljava/util/Map;

    .line 103
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 104
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 105
    check-cast v1, Ljava/util/Map$Entry;

    .line 103
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 79
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/cache/disk/DiskCacheConfig;

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getFileCacheFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/FileCacheFactory;

    move-result-object v3

    invoke-interface {v3, v1}, Lcom/facebook/imagepipeline/core/FileCacheFactory;->get(Lcom/facebook/cache/disk/DiskCacheConfig;)Lcom/facebook/cache/disk/FileCache;

    move-result-object v1

    .line 105
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object v0

    .line 80
    :cond_1
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method private static final mainBufferedDiskCache_delegate$lambda$1(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .locals 8

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "this$1"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    new-instance v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    .line 52
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->getMainFileCache()Lcom/facebook/cache/disk/FileCache;

    move-result-object v2

    .line 53
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getPoolFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/memory/PoolFactory;

    move-result-object p0

    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getMemoryChunkType$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getPooledByteBufferFactory(I)Lcom/facebook/common/memory/PooledByteBufferFactory;

    move-result-object v3

    const-string p0, "getPooledByteBufferFactory(...)"

    invoke-static {v3, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getPoolFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/memory/PoolFactory;

    move-result-object p0

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getPooledByteStreams()Lcom/facebook/common/memory/PooledByteStreams;

    move-result-object v4

    const-string p0, "getPooledByteStreams(...)"

    invoke-static {v4, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getExecutorSupplier$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    move-result-object p0

    invoke-interface {p0}, Lcom/facebook/imagepipeline/core/ExecutorSupplier;->forLocalStorageRead()Ljava/util/concurrent/Executor;

    move-result-object v5

    const-string p0, "forLocalStorageRead(...)"

    invoke-static {v5, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getExecutorSupplier$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    move-result-object p0

    invoke-interface {p0}, Lcom/facebook/imagepipeline/core/ExecutorSupplier;->forLocalStorageWrite()Ljava/util/concurrent/Executor;

    move-result-object v6

    const-string p0, "forLocalStorageWrite(...)"

    invoke-static {v6, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getImageCacheStatsTracker$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    move-result-object v7

    .line 51
    invoke-direct/range {v1 .. v7}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;-><init>(Lcom/facebook/cache/disk/FileCache;Lcom/facebook/common/memory/PooledByteBufferFactory;Lcom/facebook/common/memory/PooledByteStreams;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;)V

    return-object v1
.end method

.method private static final mainFileCache_delegate$lambda$0(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/FileCache;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    invoke-static {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getFileCacheFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/FileCacheFactory;

    move-result-object v0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getMainDiskCacheConfig$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/DiskCacheConfig;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/facebook/imagepipeline/core/FileCacheFactory;->get(Lcom/facebook/cache/disk/DiskCacheConfig;)Lcom/facebook/cache/disk/FileCache;

    move-result-object p0

    return-object p0
.end method

.method private static final smallImageBufferedDiskCache_delegate$lambda$3(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .locals 8

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "this$1"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    new-instance v1, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    .line 68
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->getSmallImageFileCache()Lcom/facebook/cache/disk/FileCache;

    move-result-object v2

    .line 69
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getPoolFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/memory/PoolFactory;

    move-result-object p0

    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getMemoryChunkType$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getPooledByteBufferFactory(I)Lcom/facebook/common/memory/PooledByteBufferFactory;

    move-result-object v3

    const-string p0, "getPooledByteBufferFactory(...)"

    invoke-static {v3, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getPoolFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/memory/PoolFactory;

    move-result-object p0

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getPooledByteStreams()Lcom/facebook/common/memory/PooledByteStreams;

    move-result-object v4

    const-string p0, "getPooledByteStreams(...)"

    invoke-static {v4, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getExecutorSupplier$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    move-result-object p0

    invoke-interface {p0}, Lcom/facebook/imagepipeline/core/ExecutorSupplier;->forLocalStorageRead()Ljava/util/concurrent/Executor;

    move-result-object v5

    const-string p0, "forLocalStorageRead(...)"

    invoke-static {v5, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getExecutorSupplier$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/ExecutorSupplier;

    move-result-object p0

    invoke-interface {p0}, Lcom/facebook/imagepipeline/core/ExecutorSupplier;->forLocalStorageWrite()Ljava/util/concurrent/Executor;

    move-result-object v6

    const-string p0, "forLocalStorageWrite(...)"

    invoke-static {v6, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 73
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getImageCacheStatsTracker$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;

    move-result-object v7

    .line 67
    invoke-direct/range {v1 .. v7}, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;-><init>(Lcom/facebook/cache/disk/FileCache;Lcom/facebook/common/memory/PooledByteBufferFactory;Lcom/facebook/common/memory/PooledByteStreams;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Lcom/facebook/imagepipeline/cache/ImageCacheStatsTracker;)V

    return-object v1
.end method

.method private static final smallImageFileCache_delegate$lambda$2(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/FileCache;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    invoke-static {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getFileCacheFactory$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/core/FileCacheFactory;

    move-result-object v0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;->access$getSmallImageDiskCacheConfig$p(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/DiskCacheConfig;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/facebook/imagepipeline/core/FileCacheFactory;->get(Lcom/facebook/cache/disk/DiskCacheConfig;)Lcom/facebook/cache/disk/FileCache;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getDynamicBufferedDiskCaches()Lcom/facebook/common/internal/ImmutableMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/common/internal/ImmutableMap<",
            "Ljava/lang/String;",
            "Lcom/facebook/imagepipeline/cache/BufferedDiskCache;",
            ">;"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->dynamicBufferedDiskCaches$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "getValue(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/common/internal/ImmutableMap;

    return-object v0
.end method

.method public getDynamicFileCaches()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/cache/disk/FileCache;",
            ">;"
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->dynamicFileCaches$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method public getMainBufferedDiskCache()Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->mainBufferedDiskCache$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    return-object v0
.end method

.method public getMainFileCache()Lcom/facebook/cache/disk/FileCache;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->mainFileCache$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/cache/disk/FileCache;

    return-object v0
.end method

.method public getSmallImageBufferedDiskCache()Lcom/facebook/imagepipeline/cache/BufferedDiskCache;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->smallImageBufferedDiskCache$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    return-object v0
.end method

.method public getSmallImageFileCache()Lcom/facebook/cache/disk/FileCache;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->smallImageFileCache$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/cache/disk/FileCache;

    return-object v0
.end method
