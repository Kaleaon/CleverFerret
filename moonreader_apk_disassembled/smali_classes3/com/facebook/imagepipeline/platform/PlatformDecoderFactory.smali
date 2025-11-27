.class public final Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;
.super Ljava/lang/Object;
.source "PlatformDecoderFactory.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J*\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u000cH\u0007J\u001e\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH\u0007\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;",
        "",
        "<init>",
        "()V",
        "buildPlatformDecoder",
        "Lcom/facebook/imagepipeline/platform/PlatformDecoder;",
        "poolFactory",
        "Lcom/facebook/imagepipeline/memory/PoolFactory;",
        "gingerbreadDecoderEnabled",
        "",
        "useDecodeBufferHelper",
        "platformDecoderOptions",
        "Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;",
        "createPool",
        "Landroidx/core/util/Pools$Pool;",
        "Ljava/nio/ByteBuffer;",
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


# static fields
.field public static final INSTANCE:Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;->INSTANCE:Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final buildPlatformDecoder(Lcom/facebook/imagepipeline/memory/PoolFactory;ZLcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)Lcom/facebook/imagepipeline/platform/PlatformDecoder;
    .locals 7
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "poolFactory"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "platformDecoderOptions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v1, p0

    move v2, p1

    move-object v4, p2

    invoke-static/range {v1 .. v6}, Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;->buildPlatformDecoder$default(Lcom/facebook/imagepipeline/memory/PoolFactory;ZZLcom/facebook/imagepipeline/platform/PlatformDecoderOptions;ILjava/lang/Object;)Lcom/facebook/imagepipeline/platform/PlatformDecoder;

    move-result-object p0

    return-object p0
.end method

.method public static final buildPlatformDecoder(Lcom/facebook/imagepipeline/memory/PoolFactory;ZZLcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)Lcom/facebook/imagepipeline/platform/PlatformDecoder;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string p1, "poolFactory"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "platformDecoderOptions"

    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    const-string v1, "getBitmapPool(...)"

    if-lt p1, v0, :cond_0

    .line 38
    new-instance p1, Lcom/facebook/imagepipeline/platform/OreoDecoder;

    .line 39
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getBitmapPool()Lcom/facebook/imagepipeline/memory/BitmapPool;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    invoke-static {p0, p2}, Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;->createPool(Lcom/facebook/imagepipeline/memory/PoolFactory;Z)Landroidx/core/util/Pools$Pool;

    move-result-object p0

    .line 38
    invoke-direct {p1, v0, p0, p3}, Lcom/facebook/imagepipeline/platform/OreoDecoder;-><init>(Lcom/facebook/imagepipeline/memory/BitmapPool;Landroidx/core/util/Pools$Pool;Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)V

    check-cast p1, Lcom/facebook/imagepipeline/platform/PlatformDecoder;

    return-object p1

    .line 44
    :cond_0
    new-instance p1, Lcom/facebook/imagepipeline/platform/ArtDecoder;

    .line 45
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getBitmapPool()Lcom/facebook/imagepipeline/memory/BitmapPool;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    invoke-static {p0, p2}, Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;->createPool(Lcom/facebook/imagepipeline/memory/PoolFactory;Z)Landroidx/core/util/Pools$Pool;

    move-result-object p0

    .line 44
    invoke-direct {p1, v0, p0, p3}, Lcom/facebook/imagepipeline/platform/ArtDecoder;-><init>(Lcom/facebook/imagepipeline/memory/BitmapPool;Landroidx/core/util/Pools$Pool;Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)V

    check-cast p1, Lcom/facebook/imagepipeline/platform/PlatformDecoder;

    return-object p1
.end method

.method public static synthetic buildPlatformDecoder$default(Lcom/facebook/imagepipeline/memory/PoolFactory;ZZLcom/facebook/imagepipeline/platform/PlatformDecoderOptions;ILjava/lang/Object;)Lcom/facebook/imagepipeline/platform/PlatformDecoder;
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p2, 0x0

    .line 29
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/platform/PlatformDecoderFactory;->buildPlatformDecoder(Lcom/facebook/imagepipeline/memory/PoolFactory;ZZLcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)Lcom/facebook/imagepipeline/platform/PlatformDecoder;

    move-result-object p0

    return-object p0
.end method

.method public static final createPool(Lcom/facebook/imagepipeline/memory/PoolFactory;Z)Landroidx/core/util/Pools$Pool;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/memory/PoolFactory;",
            "Z)",
            "Landroidx/core/util/Pools$Pool<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "poolFactory"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 76
    sget-object p0, Lcom/facebook/common/memory/DecodeBufferHelper;->INSTANCE:Lcom/facebook/common/memory/DecodeBufferHelper;

    const-string p1, "INSTANCE"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Landroidx/core/util/Pools$Pool;

    return-object p0

    .line 78
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/PoolFactory;->getFlexByteArrayPoolMaxNumThreads()I

    move-result p0

    .line 79
    new-instance p1, Landroidx/core/util/Pools$SynchronizedPool;

    invoke-direct {p1, p0}, Landroidx/core/util/Pools$SynchronizedPool;-><init>(I)V

    check-cast p1, Landroidx/core/util/Pools$Pool;

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_1

    .line 81
    invoke-static {}, Lcom/facebook/common/memory/DecodeBufferHelper;->getRecommendedDecodeBufferSize()I

    move-result v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    const-string v2, "allocate(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p1, v1}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object p1
.end method
