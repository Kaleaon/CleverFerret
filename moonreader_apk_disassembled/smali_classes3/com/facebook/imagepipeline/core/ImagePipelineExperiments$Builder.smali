.class public final Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
.super Ljava/lang/Object;
.source "ImagePipelineExperiments.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0002\u0008\u0010\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008+\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0016\u00106\u001a\u00020\u00002\u000c\u00107\u001a\u0008\u0012\u0004\u0012\u00020908H\u0002J\u000e\u0010:\u001a\u00020\u00002\u0006\u0010,\u001a\u00020\u0007J\u000e\u0010;\u001a\u00020\u00002\u0006\u0010-\u001a\u00020\u0007J\u000e\u0010<\u001a\u00020\u00002\u0006\u0010.\u001a\u00020\u0007J\u000e\u0010=\u001a\u00020\u00002\u0006\u0010\u0008\u001a\u00020\u0007J\u000e\u0010>\u001a\u00020\u00002\u0006\u00102\u001a\u00020\u0007J\u0006\u0010\u0006\u001a\u00020\u0007J\u000e\u0010?\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0007J\u000e\u0010@\u001a\u00020\u00002\u0006\u0010\u000e\u001a\u00020\u0007J\u000e\u0010A\u001a\u00020\u00002\u0006\u0010B\u001a\u00020\u0007J\u000e\u0010C\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u0007J\u0010\u0010D\u001a\u00020\u00002\u0008\u0010\t\u001a\u0004\u0018\u00010\nJ\u0010\u0010E\u001a\u00020\u00002\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rJ&\u0010F\u001a\u00020\u00002\u0006\u0010\u000f\u001a\u00020\u00072\u0006\u0010G\u001a\u00020\u00122\u0006\u0010H\u001a\u00020\u00122\u0006\u0010I\u001a\u00020\u0007J\u000e\u0010J\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u0007J\u000e\u0010K\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u0012J\u000e\u0010L\u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\u0012J\u000e\u0010M\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u0007J\u0010\u0010N\u001a\u00020\u00002\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u001aJ\u0016\u0010O\u001a\u00020\u00002\u000e\u0010\u001b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u001cJ\u000e\u0010P\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\u0007J\u000e\u0010Q\u001a\u00020\u00002\u0006\u0010\u001e\u001a\u00020\u0007J\u0014\u0010R\u001a\u00020\u00002\u000c\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u001cJ\u000e\u0010S\u001a\u00020\u00002\u0006\u0010!\u001a\u00020\u0007J\u000e\u0010T\u001a\u00020\u00002\u0006\u0010U\u001a\u00020#J\u000e\u0010V\u001a\u00020\u00002\u0006\u0010$\u001a\u00020\u0007J\u000e\u0010W\u001a\u00020\u00002\u0006\u0010%\u001a\u00020\u0007J\u000e\u0010X\u001a\u00020\u00002\u0006\u0010&\u001a\u00020\u0007J\u000e\u0010Y\u001a\u00020\u00002\u0006\u0010\'\u001a\u00020\u0007J\u000e\u0010Z\u001a\u00020\u00002\u0006\u0010)\u001a\u00020\u0007J\u000e\u0010[\u001a\u00020\u00002\u0006\u0010(\u001a\u00020\u0007J\u000e\u0010\\\u001a\u00020\u00002\u0006\u0010*\u001a\u00020\u0012J\u000e\u0010]\u001a\u00020\u00002\u0006\u0010+\u001a\u00020\u0007J\u000e\u0010^\u001a\u00020\u00002\u0006\u0010/\u001a\u00020\u0007J\u000e\u0010_\u001a\u00020\u00002\u0006\u00100\u001a\u00020\u0012J\u000e\u0010`\u001a\u00020\u00002\u0006\u00101\u001a\u00020\u0007J\u000e\u0010a\u001a\u00020\u00002\u0006\u00103\u001a\u000204J\u000e\u0010b\u001a\u00020\u00002\u0006\u0010c\u001a\u00020\u0007J\u0006\u0010d\u001a\u00020eR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0008\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0004\u0018\u00010\n8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000b\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0004\u0018\u00010\r8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000e\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000f\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0010\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0011\u001a\u00020\u00128\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0013\u001a\u00020\u00128\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0014\u001a\u00020\u00128\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0015\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0016\u001a\u00020\u00128\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0017\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0018\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0019\u001a\u0004\u0018\u00010\u001a8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u001c8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u001d\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u001e\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R \u0010\u001f\u001a\u0010\u0012\u000c\u0012\n  *\u0004\u0018\u00010\u00070\u00070\u001c8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010!\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\"\u001a\u00020#8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010$\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010%\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010&\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\'\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010(\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010)\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010*\u001a\u00020\u00128\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010+\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010,\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010-\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010.\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010/\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u00100\u001a\u00020\u00128\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u00101\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u00102\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u00103\u001a\u0002048\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u00105\u001a\u00020\u00078\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006f"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;",
        "",
        "configBuilder",
        "Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;",
        "<init>",
        "(Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;)V",
        "shouldUseDecodingBufferHelper",
        "",
        "webpSupportEnabled",
        "webpErrorLogger",
        "Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;",
        "decodeCancellationEnabled",
        "webpBitmapFactory",
        "Lcom/facebook/common/webp/WebpBitmapFactory;",
        "useDownsamplingRatioForResizing",
        "useBitmapPrepareToDraw",
        "useBalancedAnimationStrategy",
        "animationStrategyBufferLengthMilliseconds",
        "",
        "bitmapPrepareToDrawMinSizeBytes",
        "bitmapPrepareToDrawMaxSizeBytes",
        "bitmapPrepareToDrawForPrefetch",
        "maxBitmapDimension",
        "nativeCodeDisabled",
        "isPartialImageCachingEnabled",
        "producerFactoryMethod",
        "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;",
        "lazyDataSource",
        "Lcom/facebook/common/internal/Supplier;",
        "gingerbreadDecoderEnabled",
        "downscaleFrameToDrawableDimensions",
        "suppressBitmapPrefetchingSupplier",
        "kotlin.jvm.PlatformType",
        "experimentalThreadHandoffQueueEnabled",
        "memoryType",
        "",
        "keepCancelledFetchAsLowPriority",
        "downsampleIfLargeBitmap",
        "encodedCacheEnabled",
        "ensureTranscoderLibraryLoaded",
        "isEncodedMemoryCacheProbingEnabled",
        "isDiskCacheProbingEnabled",
        "trackedKeysSize",
        "allowDelay",
        "handOffOnUiThreadOnly",
        "shouldStoreCacheEntrySize",
        "shouldIgnoreCacheSizeMismatch",
        "allowProgressiveOnPrefetch",
        "animationRenderFpsLimit",
        "cancelDecodeOnCacheMiss",
        "prefetchShortcutEnabled",
        "platformDecoderOptions",
        "Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;",
        "isBinaryXmlEnabled",
        "asBuilder",
        "block",
        "Lkotlin/Function0;",
        "",
        "setHandOffOnUiThreadOnly",
        "setStoreCacheEntrySize",
        "setIgnoreCacheSizeMismatch",
        "setWebpSupportEnabled",
        "setPrefetchShortcutEnabled",
        "setShouldUseDecodingBufferHelper",
        "setUseDownsampligRatioForResizing",
        "setPartialImageCachingEnabled",
        "partialImageCachingEnabled",
        "setDecodeCancellationEnabled",
        "setWebpErrorLogger",
        "setWebpBitmapFactory",
        "setBitmapPrepareToDraw",
        "minBitmapSizeBytes",
        "maxBitmapSizeBytes",
        "preparePrefetch",
        "setBalancedAnimationStrategy",
        "setAnimationStrategyBufferLengthMilliseconds",
        "setMaxBitmapDimension",
        "setNativeCodeDisabled",
        "setProducerFactoryMethod",
        "setLazyDataSource",
        "setGingerbreadDecoderEnabled",
        "setShouldDownscaleFrameToDrawableDimensions",
        "setSuppressBitmapPrefetchingSupplier",
        "setExperimentalThreadHandoffQueueEnabled",
        "setExperimentalMemoryType",
        "MemoryType",
        "setKeepCancelledFetchAsLowPriority",
        "setDownsampleIfLargeBitmap",
        "setEncodedCacheEnabled",
        "setEnsureTranscoderLibraryLoaded",
        "setIsDiskCacheProbingEnabled",
        "setIsEncodedMemoryCacheProbingEnabled",
        "setTrackedKeysSize",
        "setAllowDelay",
        "setAllowProgressiveOnPrefetch",
        "setAnimationRenderFpsLimit",
        "setCancelDecodeOnCacheMiss",
        "setPlatformDecoderOptions",
        "setBinaryXmlEnabled",
        "binaryXmlEnabled",
        "build",
        "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;",
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
.field public allowDelay:Z

.field public allowProgressiveOnPrefetch:Z

.field public animationRenderFpsLimit:I

.field public animationStrategyBufferLengthMilliseconds:I

.field public bitmapPrepareToDrawForPrefetch:Z

.field public bitmapPrepareToDrawMaxSizeBytes:I

.field public bitmapPrepareToDrawMinSizeBytes:I

.field public cancelDecodeOnCacheMiss:Z

.field private final configBuilder:Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

.field public decodeCancellationEnabled:Z

.field public downsampleIfLargeBitmap:Z

.field public downscaleFrameToDrawableDimensions:Z

.field public encodedCacheEnabled:Z

.field public ensureTranscoderLibraryLoaded:Z

.field public experimentalThreadHandoffQueueEnabled:Z

.field public gingerbreadDecoderEnabled:Z

.field public handOffOnUiThreadOnly:Z

.field public isBinaryXmlEnabled:Z

.field public isDiskCacheProbingEnabled:Z

.field public isEncodedMemoryCacheProbingEnabled:Z

.field public isPartialImageCachingEnabled:Z

.field public keepCancelledFetchAsLowPriority:Z

.field public lazyDataSource:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public maxBitmapDimension:I

.field public memoryType:J

.field public nativeCodeDisabled:Z

.field public platformDecoderOptions:Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;

.field public prefetchShortcutEnabled:Z

.field public producerFactoryMethod:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;

.field public shouldIgnoreCacheSizeMismatch:Z

.field public shouldStoreCacheEntrySize:Z

.field public shouldUseDecodingBufferHelper:Z

.field public suppressBitmapPrefetchingSupplier:Lcom/facebook/common/internal/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public trackedKeysSize:I

.field public useBalancedAnimationStrategy:Z

.field public useBitmapPrepareToDraw:Z

.field public useDownsamplingRatioForResizing:Z

.field public webpBitmapFactory:Lcom/facebook/common/webp/WebpBitmapFactory;

.field public webpErrorLogger:Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;

.field public webpSupportEnabled:Z


# direct methods
.method public static synthetic $r8$lambda$0T6ykDoimquzKc8iN4LFZ584ejE(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;J)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setExperimentalMemoryType$lambda$22(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;J)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$4SlexBXSYgny0XJOkMJxWGRrqQ0(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setProducerFactoryMethod$lambda$16(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$Cope210vrOz_secCd3Wp9hOEEVk(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setIgnoreCacheSizeMismatch$lambda$2(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$EP2xoACP_8kvhqB26dVE6aaPWg4(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setPartialImageCachingEnabled$lambda$7(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$En9gjvSsP5iIfhuIco43tyREyLI(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setWebpErrorLogger$lambda$9(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$F0NIchz-JWBc-Iwsl7AAhJ8E9oo(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setEnsureTranscoderLibraryLoaded$lambda$26(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$FPDDEfMfQclBeLbwOMQhNLBLsn0(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setBinaryXmlEnabled$lambda$35(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$GNuzDTba5exv5qFQcXkUpyPGSAA(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setNativeCodeDisabled$lambda$15(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$GcDlD4eCrHPzHc2ohKmTb4eoFcg(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setAllowDelay$lambda$30(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$Gn3LrLHEWcXmkgntJ9pUV6F4ndA(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setAnimationStrategyBufferLengthMilliseconds$lambda$13(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$HOTewhyx0sEZ9H2PqzOsFB2PYeQ(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setHandOffOnUiThreadOnly$lambda$0(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$HnNPkrOsViHyy92Lf3iDcYsJLy8(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setExperimentalThreadHandoffQueueEnabled$lambda$21(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$MFTObCCX6A2ziXjIfgtEkjGewKU(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setWebpSupportEnabled$lambda$3(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$PrNLrNMvi3pEoJ5RQyXDr6VyrrQ(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setCancelDecodeOnCacheMiss$lambda$33(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$PxTbYrR_csdGV0f9tDjRecVPCa4(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setPrefetchShortcutEnabled$lambda$4(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$TQXzrObRw-2WYi_nLwVNukMc1fY(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setDecodeCancellationEnabled$lambda$8(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ZmDsWuZoKaIemN4yZEHqjfjRutc(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setShouldDownscaleFrameToDrawableDimensions$lambda$19(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$eT9EPAIRq2EC56EdAstWDgs2Dgs(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setStoreCacheEntrySize$lambda$1(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$jBpKJTC-gEtNIdOG1C0rmLaAcFs(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setTrackedKeysSize$lambda$29(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$kI4LLXQ3Xdeauvlikd98PmUEANA(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setPlatformDecoderOptions$lambda$34(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$k_s7aioCZQbpAuUftm-LT7TWb7s(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setLazyDataSource$lambda$17(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ku1OEm5x0IX0j28N2po9r2yQoEs(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setAnimationRenderFpsLimit$lambda$32(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$mVz_Zgk0ejyx-OyCy7P1uSVi87Q(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setBalancedAnimationStrategy$lambda$12(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$mg4YuPLHHlwbMKw8--aGS5zSJJg(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setDownsampleIfLargeBitmap$lambda$24(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$mmkKhJ5mLy17omJsWZY3crez6O0(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setAllowProgressiveOnPrefetch$lambda$31(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$o5tfGl6TYYnz8HRvPdbb2dIZanY(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setShouldUseDecodingBufferHelper$lambda$5(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$q-6A2AQfKXNAm17odF4wuDUko7Q(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setIsDiskCacheProbingEnabled$lambda$27(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$rhBZaxmhaJufX1PY1ORxgThtYh4(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setEncodedCacheEnabled$lambda$25(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$t_5sfSkg2W4NIYqVha9jxsRHRT0(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setKeepCancelledFetchAsLowPriority$lambda$23(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ty0tub164ONsIF4RZnxJjAQ-0BM(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setIsEncodedMemoryCacheProbingEnabled$lambda$28(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$u1OKJPotV_hgHTNydULaFe1lX2E(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setSuppressBitmapPrefetchingSupplier$lambda$20(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ua6uqV3j4lgMptp6rWKYqUkmViA(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;ZIIZ)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setBitmapPrepareToDraw$lambda$11(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;ZIIZ)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$vqE6Vvw0O2lhdA9946p4yaZ6QEI(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setWebpBitmapFactory$lambda$10(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$weantRlnJ1pVXjw57pKxDWAeY-I(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setMaxBitmapDimension$lambda$14(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$x79kHOIafrGj57Ew8ik3fcy1R6w(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setUseDownsampligRatioForResizing$lambda$6(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$z-fEhi05mGo6kUM4I-OGqMplxRs(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->setGingerbreadDecoderEnabled$lambda$18(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;)V
    .locals 3

    const-string v0, "configBuilder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->configBuilder:Lcom/facebook/imagepipeline/core/ImagePipelineConfig$Builder;

    const/16 p1, 0x3e8

    .line 88
    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->animationStrategyBufferLengthMilliseconds:I

    const/16 p1, 0x800

    .line 93
    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->maxBitmapDimension:I

    const/4 p1, 0x0

    .line 104
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Suppliers;->of(Ljava/lang/Object;)Lcom/facebook/common/internal/Supplier;

    move-result-object v0

    const-string v1, "of(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->suppressBitmapPrefetchingSupplier:Lcom/facebook/common/internal/Supplier;

    const/4 v0, 0x1

    .line 113
    iput-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->encodedCacheEnabled:Z

    .line 115
    iput-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->ensureTranscoderLibraryLoaded:Z

    const/16 v0, 0x14

    .line 118
    iput v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->trackedKeysSize:I

    const/16 v0, 0x1e

    .line 125
    iput v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->animationRenderFpsLimit:I

    .line 129
    new-instance v0, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, p1, p1, v1, v2}, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;-><init>(ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->platformDecoderOptions:Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;

    return-void
.end method

.method private final asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;"
        }
    .end annotation

    .line 134
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-object p0
.end method

.method private static final setAllowDelay$lambda$30(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 312
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->allowDelay:Z

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setAllowProgressiveOnPrefetch$lambda$31(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 315
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->allowProgressiveOnPrefetch:Z

    .line 316
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setAnimationRenderFpsLimit$lambda$32(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 319
    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->animationRenderFpsLimit:I

    .line 320
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setAnimationStrategyBufferLengthMilliseconds$lambda$13(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 229
    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->animationStrategyBufferLengthMilliseconds:I

    .line 230
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setBalancedAnimationStrategy$lambda$12(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 222
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->useBalancedAnimationStrategy:Z

    .line 223
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setBinaryXmlEnabled$lambda$35(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 331
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->isBinaryXmlEnabled:Z

    .line 332
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setBitmapPrepareToDraw$lambda$11(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;ZIIZ)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 214
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->useBitmapPrepareToDraw:Z

    .line 215
    iput p2, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->bitmapPrepareToDrawMinSizeBytes:I

    .line 216
    iput p3, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->bitmapPrepareToDrawMaxSizeBytes:I

    .line 217
    iput-boolean p4, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->bitmapPrepareToDrawForPrefetch:Z

    .line 218
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setCancelDecodeOnCacheMiss$lambda$33(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 323
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->cancelDecodeOnCacheMiss:Z

    .line 324
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setDecodeCancellationEnabled$lambda$8(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 183
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->decodeCancellationEnabled:Z

    .line 184
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setDownsampleIfLargeBitmap$lambda$24(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 288
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->downsampleIfLargeBitmap:Z

    .line 289
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setEncodedCacheEnabled$lambda$25(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 292
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->encodedCacheEnabled:Z

    .line 293
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setEnsureTranscoderLibraryLoaded$lambda$26(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 296
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->ensureTranscoderLibraryLoaded:Z

    .line 297
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setExperimentalMemoryType$lambda$22(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;J)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 281
    iput-wide p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->memoryType:J

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setExperimentalThreadHandoffQueueEnabled$lambda$21(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 278
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->experimentalThreadHandoffQueueEnabled:Z

    .line 279
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setGingerbreadDecoderEnabled$lambda$18(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 263
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->gingerbreadDecoderEnabled:Z

    .line 264
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setHandOffOnUiThreadOnly$lambda$0(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 139
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->handOffOnUiThreadOnly:Z

    .line 140
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setIgnoreCacheSizeMismatch$lambda$2(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 147
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->shouldIgnoreCacheSizeMismatch:Z

    .line 148
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setIsDiskCacheProbingEnabled$lambda$27(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 300
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->isDiskCacheProbingEnabled:Z

    .line 301
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setIsEncodedMemoryCacheProbingEnabled$lambda$28(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 305
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->isEncodedMemoryCacheProbingEnabled:Z

    .line 306
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setKeepCancelledFetchAsLowPriority$lambda$23(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 284
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->keepCancelledFetchAsLowPriority:Z

    .line 285
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setLazyDataSource$lambda$17(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 259
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->lazyDataSource:Lcom/facebook/common/internal/Supplier;

    .line 260
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setMaxBitmapDimension$lambda$14(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 236
    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->maxBitmapDimension:I

    .line 237
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setNativeCodeDisabled$lambda$15(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 246
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->nativeCodeDisabled:Z

    .line 247
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setPartialImageCachingEnabled$lambda$7(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 173
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->isPartialImageCachingEnabled:Z

    .line 174
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setPlatformDecoderOptions$lambda$34(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$platformDecoderOptions"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 327
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->platformDecoderOptions:Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;

    .line 328
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setPrefetchShortcutEnabled$lambda$4(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->prefetchShortcutEnabled:Z

    .line 156
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setProducerFactoryMethod$lambda$16(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 254
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->producerFactoryMethod:Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;

    .line 255
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setShouldDownscaleFrameToDrawableDimensions$lambda$19(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 268
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->downscaleFrameToDrawableDimensions:Z

    .line 269
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setShouldUseDecodingBufferHelper$lambda$5(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 161
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->shouldUseDecodingBufferHelper:Z

    .line 162
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setStoreCacheEntrySize$lambda$1(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 143
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->shouldStoreCacheEntrySize:Z

    .line 144
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setSuppressBitmapPrefetchingSupplier$lambda$20(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$suppressBitmapPrefetchingSupplier"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 273
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->suppressBitmapPrefetchingSupplier:Lcom/facebook/common/internal/Supplier;

    .line 274
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setTrackedKeysSize$lambda$29(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 309
    iput p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->trackedKeysSize:I

    .line 310
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setUseDownsampligRatioForResizing$lambda$6(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 165
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->useDownsamplingRatioForResizing:Z

    .line 166
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setWebpBitmapFactory$lambda$10(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 191
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->webpBitmapFactory:Lcom/facebook/common/webp/WebpBitmapFactory;

    .line 192
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setWebpErrorLogger$lambda$9(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 187
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->webpErrorLogger:Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;

    .line 188
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setWebpSupportEnabled$lambda$3(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)Lkotlin/Unit;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 151
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->webpSupportEnabled:Z

    .line 152
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final build()Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;
    .locals 2

    .line 334
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final setAllowDelay(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 312
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda13;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda13;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setAllowProgressiveOnPrefetch(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 314
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda30;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda30;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setAnimationRenderFpsLimit(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 318
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda14;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda14;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setAnimationStrategyBufferLengthMilliseconds(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 228
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda28;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda28;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setBalancedAnimationStrategy(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 221
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda12;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setBinaryXmlEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 330
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda8;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setBitmapPrepareToDraw(ZIIZ)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 6

    .line 213
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda10;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda10;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;ZIIZ)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setCancelDecodeOnCacheMiss(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 322
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda5;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setDecodeCancellationEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 182
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda25;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda25;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setDownsampleIfLargeBitmap(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 287
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda20;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda20;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setEncodedCacheEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 291
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda29;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda29;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setEnsureTranscoderLibraryLoaded(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 295
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda26;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda26;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setExperimentalMemoryType(J)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 281
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda32;

    invoke-direct {v0, p0, p1, p2}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda32;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;J)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setExperimentalThreadHandoffQueueEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 277
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setGingerbreadDecoderEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 262
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda24;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda24;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setHandOffOnUiThreadOnly(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 138
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda11;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setIgnoreCacheSizeMismatch(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 146
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda7;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setIsDiskCacheProbingEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 299
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda18;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setIsEncodedMemoryCacheProbingEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 304
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda27;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda27;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setKeepCancelledFetchAsLowPriority(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 283
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setLazyDataSource(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;"
        }
    .end annotation

    .line 258
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda23;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda23;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setMaxBitmapDimension(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 235
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda22;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda22;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setNativeCodeDisabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 245
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda6;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setPartialImageCachingEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 172
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda34;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda34;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setPlatformDecoderOptions(Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    const-string v0, "platformDecoderOptions"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 326
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda35;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda35;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setPrefetchShortcutEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 154
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda33;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda33;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setProducerFactoryMethod(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 253
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda16;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda16;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$ProducerFactoryMethod;)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setShouldDownscaleFrameToDrawableDimensions(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 267
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda19;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda19;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setShouldUseDecodingBufferHelper(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 160
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setStoreCacheEntrySize(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 142
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda9;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setSuppressBitmapPrefetchingSupplier(Lcom/facebook/common/internal/Supplier;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/Supplier<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;"
        }
    .end annotation

    const-string v0, "suppressBitmapPrefetchingSupplier"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 272
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/internal/Supplier;)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setTrackedKeysSize(I)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 308
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda17;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda17;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;I)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setUseDownsampligRatioForResizing(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 164
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda21;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda21;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setWebpBitmapFactory(Lcom/facebook/common/webp/WebpBitmapFactory;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 190
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda31;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda31;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory;)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setWebpErrorLogger(Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 186
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Lcom/facebook/common/webp/WebpBitmapFactory$WebpErrorLogger;)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final setWebpSupportEnabled(Z)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;
    .locals 1

    .line 150
    new-instance v0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda15;

    invoke-direct {v0, p0, p1}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder$$ExternalSyntheticLambda15;-><init>(Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;Z)V

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->asBuilder(Lkotlin/jvm/functions/Function0;)Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final shouldUseDecodingBufferHelper()Z
    .locals 1

    .line 158
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ImagePipelineExperiments$Builder;->shouldUseDecodingBufferHelper:Z

    return v0
.end method
