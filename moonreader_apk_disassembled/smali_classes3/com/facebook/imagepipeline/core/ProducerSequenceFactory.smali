.class public final Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;
.super Ljava/lang/Object;
.source "ProducerSequenceFactory.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nProducerSequenceFactory.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ProducerSequenceFactory.kt\ncom/facebook/imagepipeline/core/ProducerSequenceFactory\n+ 2 FrescoSystrace.kt\ncom/facebook/imagepipeline/systrace/FrescoSystrace\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,636:1\n40#2,9:637\n40#2,9:646\n40#2,2:655\n44#2,5:658\n40#2,9:663\n40#2,9:672\n40#2,9:681\n40#2,9:690\n40#2,9:699\n40#2,9:708\n40#2,9:717\n40#2,9:726\n40#2,9:735\n40#2,9:744\n40#2,9:753\n40#2,9:762\n40#2,9:771\n1#3:657\n*S KotlinDebug\n*F\n+ 1 ProducerSequenceFactory.kt\ncom/facebook/imagepipeline/core/ProducerSequenceFactory\n*L\n79#1:637,9\n167#1:646,9\n198#1:655,2\n198#1:658,5\n298#1:663,9\n483#1:672,9\n511#1:681,9\n109#1:690,9\n118#1:699,9\n129#1:708,9\n257#1:717,9\n267#1:726,9\n279#1:735,9\n289#1:744,9\n317#1:753,9\n327#1:762,9\n341#1:771,9\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0014\n\u0002\u0018\u0002\n\u0002\u0008-\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0018\u0000 \u0084\u00012\u00020\u0001:\u0002\u0084\u0001B\u008b\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\t\u0012\u0006\u0010\u0010\u001a\u00020\t\u0012\u0006\u0010\u0011\u001a\u00020\t\u0012\u0006\u0010\u0012\u001a\u00020\u0013\u0012\u0006\u0010\u0014\u001a\u00020\t\u0012\u0006\u0010\u0015\u001a\u00020\t\u0012\u0006\u0010\u0016\u001a\u00020\t\u0012\u000e\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u001a\u00100\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002010\u001f0\u001e2\u0006\u00102\u001a\u000203J\u0016\u0010@\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010(0\u001e2\u0006\u00102\u001a\u000203J\u001a\u0010A\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u0006\u00102\u001a\u000203J\u0016\u0010B\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010(0\u001e2\u0006\u00102\u001a\u000203J\u001c\u0010C\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u0006\u00102\u001a\u000203H\u0002J\u0018\u0010Q\u001a\u0008\u0012\u0004\u0012\u00020H0\u001e2\n\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u0007J\"\u0010s\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u000c\u0010t\u001a\u0008\u0012\u0004\u0012\u00020H0\u001eH\u0002J;\u0010s\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u000c\u0010t\u001a\u0008\u0012\u0004\u0012\u00020H0\u001e2\u0012\u0010u\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020H0w0vH\u0002\u00a2\u0006\u0002\u0010xJ \u0010y\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u000c\u0010t\u001a\u0008\u0012\u0004\u0012\u00020H0\u001eJ\u001c\u0010z\u001a\u0008\u0012\u0004\u0012\u00020H0\u001e2\u000c\u0010t\u001a\u0008\u0012\u0004\u0012\u00020H0\u001eH\u0002J\u001c\u0010{\u001a\u0008\u0012\u0004\u0012\u00020H0\u001e2\u000c\u0010t\u001a\u0008\u0012\u0004\u0012\u00020H0\u001eH\u0002J(\u0010|\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u0012\u0010t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001eH\u0002J5\u0010}\u001a\u0008\u0012\u0004\u0012\u00020H0\u001e2\u000c\u0010t\u001a\u0008\u0012\u0004\u0012\u00020H0\u001e2\u0012\u0010u\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020H0w0vH\u0002\u00a2\u0006\u0002\u0010xJ\'\u0010~\u001a\u0008\u0012\u0004\u0012\u00020H0\u001e2\u0012\u0010u\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020H0w0vH\u0002\u00a2\u0006\u0002\u0010\u007fJ)\u0010\u0080\u0001\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u0012\u0010t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001eH\u0002J%\u0010\u0081\u0001\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010(0\u001e2\u0012\u0010t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001eH\u0002J)\u0010\u0082\u0001\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u0012\u0010t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001eH\u0002J)\u0010\u0083\u0001\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e2\u0012\u0010t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001eH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u0006\u0012\u0002\u0008\u00030\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000RH\u0010\u001c\u001a&\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e0\u001d8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0014\n\u0000\u0012\u0004\u0008!\u0010\"\u001a\u0004\u0008#\u0010$\"\u0004\u0008%\u0010&RD\u0010\'\u001a\"\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010(0\u001e0\u001d8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0014\n\u0000\u0012\u0004\u0008)\u0010\"\u001a\u0004\u0008*\u0010$\"\u0004\u0008+\u0010&RH\u0010,\u001a&\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e0\u001d8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0014\n\u0000\u0012\u0004\u0008-\u0010\"\u001a\u0004\u0008.\u0010$\"\u0004\u0008/\u0010&R\'\u00104\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002010\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u00087\u00108\u001a\u0004\u00085\u00106R-\u00109\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002010\u001f0\u001e8FX\u0087\u0084\u0002\u00a2\u0006\u0012\n\u0004\u0008<\u00108\u0012\u0004\u0008:\u0010\"\u001a\u0004\u0008;\u00106R\'\u0010=\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002010\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008?\u00108\u001a\u0004\u0008>\u00106R\'\u0010D\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008F\u00108\u001a\u0004\u0008E\u00106R#\u0010G\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010H0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008J\u00108\u001a\u0004\u0008I\u00106R#\u0010K\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010(0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008M\u00108\u001a\u0004\u0008L\u00106R!\u0010N\u001a\u0008\u0012\u0004\u0012\u00020H0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008P\u00108\u001a\u0004\u0008O\u00106R#\u0010R\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010(0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008T\u00108\u001a\u0004\u0008S\u00106R#\u0010U\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010H0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008W\u00108\u001a\u0004\u0008V\u00106R#\u0010X\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010H0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008Z\u00108\u001a\u0004\u0008Y\u00106R\'\u0010[\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008]\u00108\u001a\u0004\u0008\\\u00106R\'\u0010^\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008`\u00108\u001a\u0004\u0008_\u00106R\'\u0010a\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008c\u00108\u001a\u0004\u0008b\u00106R\'\u0010d\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8GX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008f\u00108\u001a\u0004\u0008e\u00106R\'\u0010g\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008i\u00108\u001a\u0004\u0008h\u00106R\'\u0010j\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008l\u00108\u001a\u0004\u0008k\u00106R\'\u0010m\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008o\u00108\u001a\u0004\u0008n\u00106R\'\u0010p\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u001f0\u001e8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008r\u00108\u001a\u0004\u0008q\u00106\u00a8\u0006\u0085\u0001"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;",
        "",
        "contentResolver",
        "Landroid/content/ContentResolver;",
        "producerFactory",
        "Lcom/facebook/imagepipeline/core/ProducerFactory;",
        "networkFetcher",
        "Lcom/facebook/imagepipeline/producers/NetworkFetcher;",
        "resizeAndRotateEnabledForNetwork",
        "",
        "webpSupportEnabled",
        "threadHandoffProducerQueue",
        "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;",
        "downsampleMode",
        "Lcom/facebook/imagepipeline/core/DownsampleMode;",
        "useBitmapPrepareToDraw",
        "partialImageCachingEnabled",
        "diskCacheEnabled",
        "imageTranscoderFactory",
        "Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;",
        "isEncodedMemoryCacheProbingEnabled",
        "isDiskCacheProbingEnabled",
        "allowDelay",
        "customProducerSequenceFactories",
        "",
        "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
        "<init>",
        "(Landroid/content/ContentResolver;Lcom/facebook/imagepipeline/core/ProducerFactory;Lcom/facebook/imagepipeline/producers/NetworkFetcher;ZZLcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;Lcom/facebook/imagepipeline/core/DownsampleMode;ZZZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;ZZZLjava/util/Set;)V",
        "postprocessorSequences",
        "",
        "Lcom/facebook/imagepipeline/producers/Producer;",
        "Lcom/facebook/common/references/CloseableReference;",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        "getPostprocessorSequences$annotations",
        "()V",
        "getPostprocessorSequences",
        "()Ljava/util/Map;",
        "setPostprocessorSequences",
        "(Ljava/util/Map;)V",
        "closeableImagePrefetchSequences",
        "Ljava/lang/Void;",
        "getCloseableImagePrefetchSequences$annotations",
        "getCloseableImagePrefetchSequences",
        "setCloseableImagePrefetchSequences",
        "bitmapPrepareSequences",
        "getBitmapPrepareSequences$annotations",
        "getBitmapPrepareSequences",
        "setBitmapPrepareSequences",
        "getEncodedImageProducerSequence",
        "Lcom/facebook/common/memory/PooledByteBuffer;",
        "imageRequest",
        "Lcom/facebook/imagepipeline/request/ImageRequest;",
        "networkFetchEncodedImageProducerSequence",
        "getNetworkFetchEncodedImageProducerSequence",
        "()Lcom/facebook/imagepipeline/producers/Producer;",
        "networkFetchEncodedImageProducerSequence$delegate",
        "Lkotlin/Lazy;",
        "localFileFetchEncodedImageProducerSequence",
        "getLocalFileFetchEncodedImageProducerSequence$annotations",
        "getLocalFileFetchEncodedImageProducerSequence",
        "localFileFetchEncodedImageProducerSequence$delegate",
        "localContentUriFetchEncodedImageProducerSequence",
        "getLocalContentUriFetchEncodedImageProducerSequence",
        "localContentUriFetchEncodedImageProducerSequence$delegate",
        "getEncodedImagePrefetchProducerSequence",
        "getDecodedImageProducerSequence",
        "getDecodedImagePrefetchProducerSequence",
        "getBasicDecodedImageSequence",
        "networkFetchSequence",
        "getNetworkFetchSequence",
        "networkFetchSequence$delegate",
        "backgroundNetworkFetchToEncodedMemorySequence",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "getBackgroundNetworkFetchToEncodedMemorySequence",
        "backgroundNetworkFetchToEncodedMemorySequence$delegate",
        "networkFetchToEncodedMemoryPrefetchSequence",
        "getNetworkFetchToEncodedMemoryPrefetchSequence",
        "networkFetchToEncodedMemoryPrefetchSequence$delegate",
        "commonNetworkFetchToEncodedMemorySequence",
        "getCommonNetworkFetchToEncodedMemorySequence",
        "commonNetworkFetchToEncodedMemorySequence$delegate",
        "newCommonNetworkFetchToEncodedMemorySequence",
        "localFileFetchToEncodedMemoryPrefetchSequence",
        "getLocalFileFetchToEncodedMemoryPrefetchSequence",
        "localFileFetchToEncodedMemoryPrefetchSequence$delegate",
        "backgroundLocalFileFetchToEncodeMemorySequence",
        "getBackgroundLocalFileFetchToEncodeMemorySequence",
        "backgroundLocalFileFetchToEncodeMemorySequence$delegate",
        "backgroundLocalContentUriFetchToEncodeMemorySequence",
        "getBackgroundLocalContentUriFetchToEncodeMemorySequence",
        "backgroundLocalContentUriFetchToEncodeMemorySequence$delegate",
        "localImageFileFetchSequence",
        "getLocalImageFileFetchSequence",
        "localImageFileFetchSequence$delegate",
        "localVideoFileFetchSequence",
        "getLocalVideoFileFetchSequence",
        "localVideoFileFetchSequence$delegate",
        "localContentUriFetchSequence",
        "getLocalContentUriFetchSequence",
        "localContentUriFetchSequence$delegate",
        "localThumbnailBitmapSdk29FetchSequence",
        "getLocalThumbnailBitmapSdk29FetchSequence",
        "localThumbnailBitmapSdk29FetchSequence$delegate",
        "qualifiedResourceFetchSequence",
        "getQualifiedResourceFetchSequence",
        "qualifiedResourceFetchSequence$delegate",
        "localResourceFetchSequence",
        "getLocalResourceFetchSequence",
        "localResourceFetchSequence$delegate",
        "localAssetFetchSequence",
        "getLocalAssetFetchSequence",
        "localAssetFetchSequence$delegate",
        "dataFetchSequence",
        "getDataFetchSequence",
        "dataFetchSequence$delegate",
        "newBitmapCacheGetToLocalTransformSequence",
        "inputProducer",
        "thumbnailProducers",
        "",
        "Lcom/facebook/imagepipeline/producers/ThumbnailProducer;",
        "(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;",
        "newBitmapCacheGetToDecodeSequence",
        "newEncodedCacheMultiplexToTranscodeSequence",
        "newDiskCacheSequence",
        "newBitmapCacheGetToBitmapCacheSequence",
        "newLocalTransformationsSequence",
        "newLocalThumbnailProducer",
        "([Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;",
        "getPostprocessorSequence",
        "getDecodedImagePrefetchSequence",
        "getBitmapPrepareSequence",
        "getDelaySequence",
        "Companion",
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
.field public static final Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;


# instance fields
.field private final allowDelay:Z

.field private final backgroundLocalContentUriFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

.field private final backgroundLocalFileFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

.field private final backgroundNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

.field private bitmapPrepareSequences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private closeableImagePrefetchSequences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private final commonNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

.field private final contentResolver:Landroid/content/ContentResolver;

.field private final customProducerSequenceFactories:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final dataFetchSequence$delegate:Lkotlin/Lazy;

.field private final diskCacheEnabled:Z

.field private final downsampleMode:Lcom/facebook/imagepipeline/core/DownsampleMode;

.field private final imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

.field private final isDiskCacheProbingEnabled:Z

.field private final isEncodedMemoryCacheProbingEnabled:Z

.field private final localAssetFetchSequence$delegate:Lkotlin/Lazy;

.field private final localContentUriFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

.field private final localContentUriFetchSequence$delegate:Lkotlin/Lazy;

.field private final localFileFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

.field private final localFileFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

.field private final localImageFileFetchSequence$delegate:Lkotlin/Lazy;

.field private final localResourceFetchSequence$delegate:Lkotlin/Lazy;

.field private final localThumbnailBitmapSdk29FetchSequence$delegate:Lkotlin/Lazy;

.field private final localVideoFileFetchSequence$delegate:Lkotlin/Lazy;

.field private final networkFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

.field private final networkFetchSequence$delegate:Lkotlin/Lazy;

.field private final networkFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

.field private final networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;"
        }
    .end annotation
.end field

.field private final partialImageCachingEnabled:Z

.field private postprocessorSequences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

.field private final qualifiedResourceFetchSequence$delegate:Lkotlin/Lazy;

.field private final resizeAndRotateEnabledForNetwork:Z

.field private final threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

.field private final useBitmapPrepareToDraw:Z

.field private final webpSupportEnabled:Z


# direct methods
.method public static synthetic $r8$lambda$-dosnkqMFi1g6PahlxQLeUSIoLU(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->qualifiedResourceFetchSequence_delegate$lambda$29(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$7zmbuhCQcAd_1NgRBftEdpJgVG4(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundNetworkFetchToEncodedMemorySequence_delegate$lambda$13(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$BnLQ4vxb7b16FhdANqKzyzFLaic(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalContentUriFetchToEncodeMemorySequence_delegate$lambda$24(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$FrBuXFzG37Fy64DidYaglUOKzNw(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->dataFetchSequence_delegate$lambda$32(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$G1eThlW_wp2eePWLWAU7y0WsSCk(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchEncodedImageProducerSequence_delegate$lambda$2(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$K3BA_FM_xsgJBMT9tE1rFZeYRtg(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchToEncodedMemoryPrefetchSequence_delegate$lambda$15(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$M5J_tvXYdtm3AG9ORCYUaRlwpEk(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchSequence_delegate$lambda$27(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$OkmqWgQXCiPRIlXhoyiAlokwj54(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localThumbnailBitmapSdk29FetchSequence_delegate$lambda$28(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$WMdV3P-HoEiIGEQFORkGyKYccAc(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchEncodedImageProducerSequence_delegate$lambda$6(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$WdSCQdMTKnenc9akgjejlZm5ZNE(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalFileFetchToEncodeMemorySequence_delegate$lambda$22(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$d9RTSYA_O5-3fmU7ZcvX1snI8PY(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->commonNetworkFetchToEncodedMemorySequence_delegate$lambda$17(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$eiY4ha8e5lZsku5PGBC_lPXSglo(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localImageFileFetchSequence_delegate$lambda$25(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$hyg9rXK4hfxpCwLoTDPM5_P7X2M(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localAssetFetchSequence_delegate$lambda$31(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$iqRiYEHHWhpYu1n9wdmaFji1L2I(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchToEncodedMemoryPrefetchSequence_delegate$lambda$20(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$iryvfLcHLNl33iaqktoQXmP-fiQ(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localVideoFileFetchSequence_delegate$lambda$26(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$jp4XLEcuZPfCcplgWfZKBTMZYTY(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchEncodedImageProducerSequence_delegate$lambda$4(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$ve48219FzV3nu5MOHthe59oUofU(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localResourceFetchSequence_delegate$lambda$30(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$wQKiXDSu4iV3tLQrfzdVC3N9-gE(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0

    invoke-static {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchSequence_delegate$lambda$11(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/ContentResolver;Lcom/facebook/imagepipeline/core/ProducerFactory;Lcom/facebook/imagepipeline/producers/NetworkFetcher;ZZLcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;Lcom/facebook/imagepipeline/core/DownsampleMode;ZZZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;ZZZLjava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Lcom/facebook/imagepipeline/core/ProducerFactory;",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;ZZ",
            "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;",
            "Lcom/facebook/imagepipeline/core/DownsampleMode;",
            "ZZZ",
            "Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;",
            "ZZZ",
            "Ljava/util/Set<",
            "+",
            "Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;",
            ">;)V"
        }
    .end annotation

    const-string v0, "contentResolver"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerFactory"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "networkFetcher"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "threadHandoffProducerQueue"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "downsampleMode"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "imageTranscoderFactory"

    invoke-static {p11, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->contentResolver:Landroid/content/ContentResolver;

    .line 34
    iput-object p2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 35
    iput-object p3, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    .line 36
    iput-boolean p4, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->resizeAndRotateEnabledForNetwork:Z

    .line 37
    iput-boolean p5, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->webpSupportEnabled:Z

    .line 38
    iput-object p6, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 39
    iput-object p7, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->downsampleMode:Lcom/facebook/imagepipeline/core/DownsampleMode;

    .line 40
    iput-boolean p8, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->useBitmapPrepareToDraw:Z

    .line 41
    iput-boolean p9, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->partialImageCachingEnabled:Z

    .line 42
    iput-boolean p10, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->diskCacheEnabled:Z

    .line 43
    iput-object p11, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    .line 44
    iput-boolean p12, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isEncodedMemoryCacheProbingEnabled:Z

    .line 45
    iput-boolean p13, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isDiskCacheProbingEnabled:Z

    .line 46
    iput-boolean p14, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->allowDelay:Z

    move-object/from16 p1, p15

    .line 47
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->customProducerSequenceFactories:Ljava/util/Set;

    .line 55
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    .line 60
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    .line 67
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    .line 108
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda0;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 117
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda17;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda17;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 128
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda1;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    .line 256
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda2;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda2;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchSequence$delegate:Lkotlin/Lazy;

    .line 266
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda3;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda3;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

    .line 278
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda4;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda4;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

    .line 288
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda5;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda5;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->commonNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

    .line 316
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda6;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda6;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

    .line 326
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda7;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda7;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalFileFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

    .line 340
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda8;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda8;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalContentUriFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

    .line 357
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda9;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda9;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localImageFileFetchSequence$delegate:Lkotlin/Lazy;

    .line 363
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda10;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda10;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localVideoFileFetchSequence$delegate:Lkotlin/Lazy;

    .line 374
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda11;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda11;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchSequence$delegate:Lkotlin/Lazy;

    .line 389
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda12;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda12;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localThumbnailBitmapSdk29FetchSequence$delegate:Lkotlin/Lazy;

    .line 403
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda13;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda13;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->qualifiedResourceFetchSequence$delegate:Lkotlin/Lazy;

    .line 414
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda14;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda14;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localResourceFetchSequence$delegate:Lkotlin/Lazy;

    .line 425
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda15;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda15;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localAssetFetchSequence$delegate:Lkotlin/Lazy;

    .line 434
    new-instance p1, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda16;

    invoke-direct {p1, p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$$ExternalSyntheticLambda16;-><init>(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->dataFetchSequence$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private static final backgroundLocalContentUriFetchToEncodeMemorySequence_delegate$lambda$24(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 341
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 771
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "newLocalContentUriFetchProducer(...)"

    if-nez v0, :cond_0

    .line 343
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalContentUriFetchProducer()Lcom/facebook/imagepipeline/producers/LocalContentUriFetchProducer;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 345
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 346
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 347
    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 346
    invoke-virtual {v1, v0, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBackgroundThreadHandoffProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0

    .line 775
    :cond_0
    const-string v0, "ProducerSequenceFactory#getBackgroundLocalContentUriFetchToEncodeMemorySequence:init"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 343
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalContentUriFetchProducer()Lcom/facebook/imagepipeline/producers/LocalContentUriFetchProducer;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 345
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 346
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 347
    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 346
    invoke-virtual {v1, v0, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBackgroundThreadHandoffProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 779
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final backgroundLocalFileFetchToEncodeMemorySequence_delegate$lambda$22(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 327
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 762
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "newLocalFileFetchProducer(...)"

    if-nez v0, :cond_0

    .line 328
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalFileFetchProducer()Lcom/facebook/imagepipeline/producers/LocalFileFetchProducer;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 330
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 331
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 332
    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 331
    invoke-virtual {v1, v0, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBackgroundThreadHandoffProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0

    .line 766
    :cond_0
    const-string v0, "ProducerSequenceFactory#getBackgroundLocalFileFetchToEncodeMemorySequence"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 328
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalFileFetchProducer()Lcom/facebook/imagepipeline/producers/LocalFileFetchProducer;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 330
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 331
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 332
    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 331
    invoke-virtual {v1, v0, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBackgroundThreadHandoffProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 770
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final backgroundNetworkFetchToEncodedMemorySequence_delegate$lambda$13(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 267
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 726
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 269
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 270
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getCommonNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v1

    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 269
    invoke-virtual {v0, v1, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBackgroundThreadHandoffProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0

    .line 730
    :cond_0
    const-string v0, "ProducerSequenceFactory#getBackgroundNetworkFetchToEncodedMemorySequence:init"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 269
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 270
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getCommonNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v1

    iget-object p0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 269
    invoke-virtual {v0, v1, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBackgroundThreadHandoffProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 734
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final commonNetworkFetchToEncodedMemorySequence_delegate$lambda$17(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 289
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 744
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 290
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newCommonNetworkFetchToEncodedMemorySequence(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0

    .line 748
    :cond_0
    const-string v0, "ProducerSequenceFactory#getCommonNetworkFetchToEncodedMemorySequence"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 290
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetcher:Lcom/facebook/imagepipeline/producers/NetworkFetcher;

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newCommonNetworkFetchToEncodedMemorySequence(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 752
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final dataFetchSequence_delegate$lambda$32(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 4

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 435
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDataFetchProducer()Lcom/facebook/imagepipeline/producers/DataFetchProducer;

    move-result-object v0

    const-string v1, "newDataFetchProducer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    .line 436
    invoke-static {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newAddImageTransformMetaDataProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/AddImageTransformMetaDataProducer;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    .line 438
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    invoke-virtual {v1, v0, v2, v3}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    .line 439
    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToDecodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method private final getBasicDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 198
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 655
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "Unsupported uri scheme! Uri is: "

    const-string v2, "Uri is null."

    const-string v3, "getSourceUri(...)"

    if-nez v0, :cond_8

    .line 199
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v0, :cond_7

    .line 201
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result v2

    if-eqz v2, :cond_6

    packed-switch v2, :pswitch_data_0

    .line 230
    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->customProducerSequenceFactories:Ljava/util/Set;

    if-eqz v2, :cond_1

    .line 231
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;

    .line 236
    iget-object v7, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 237
    iget-object v8, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 238
    iget-boolean v9, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isEncodedMemoryCacheProbingEnabled:Z

    .line 239
    iget-boolean v10, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isDiskCacheProbingEnabled:Z

    move-object v6, p0

    move-object v5, p1

    .line 233
    invoke-virtual/range {v4 .. v10}, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;->getCustomDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;Lcom/facebook/imagepipeline/core/ProducerFactory;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;ZZ)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    move-object v4, v5

    move-object v5, v6

    if-eqz p1, :cond_0

    return-object p1

    :cond_0
    move-object p1, v4

    goto :goto_0

    :cond_1
    move-object v5, p0

    .line 245
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 246
    sget-object v2, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v2, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 245
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    move-object v5, p0

    .line 227
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getQualifiedResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :pswitch_1
    move-object v5, p0

    .line 228
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDataFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :pswitch_2
    move-object v5, p0

    .line 226
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :pswitch_3
    move-object v5, p0

    .line 225
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalAssetFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :pswitch_4
    move-object v5, p0

    move-object v4, p1

    .line 218
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getLoadThumbnailOnlyForAndroidSdkAboveQ()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 219
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalThumbnailBitmapSdk29FetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 220
    :cond_2
    iget-object p1, v5, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->contentResolver:Landroid/content/ContentResolver;

    invoke-virtual {p1, v0}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/common/media/MediaUtils;->isVideo(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 221
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 223
    :cond_3
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :pswitch_5
    move-object v5, p0

    move-object v4, p1

    .line 211
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getLoadThumbnailOnlyForAndroidSdkAboveQ()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 212
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalThumbnailBitmapSdk29FetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 214
    :cond_4
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalImageFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :pswitch_6
    move-object v5, p0

    move-object v4, p1

    .line 204
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getLoadThumbnailOnlyForAndroidSdkAboveQ()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 205
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalThumbnailBitmapSdk29FetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 207
    :cond_5
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :cond_6
    move-object v5, p0

    .line 202
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :cond_7
    move-object v5, p0

    .line 200
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    move-object v5, p0

    move-object v4, p1

    .line 658
    const-string p1, "ProducerSequenceFactory#getBasicDecodedImageSequence"

    invoke-static {p1}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 199
    :try_start_0
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p1, :cond_10

    .line 201
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result v0

    if-eqz v0, :cond_f

    packed-switch v0, :pswitch_data_1

    .line 230
    iget-object v0, v5, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->customProducerSequenceFactories:Ljava/util/Set;

    if-eqz v0, :cond_a

    .line 231
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;

    .line 236
    iget-object v6, v5, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 237
    iget-object v7, v5, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 238
    iget-boolean v8, v5, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isEncodedMemoryCacheProbingEnabled:Z

    .line 239
    iget-boolean v9, v5, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isDiskCacheProbingEnabled:Z

    .line 233
    invoke-virtual/range {v3 .. v9}, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;->getCustomDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;Lcom/facebook/imagepipeline/core/ProducerFactory;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;ZZ)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_9

    .line 662
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object v2

    .line 245
    :cond_a
    :try_start_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 246
    sget-object v2, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v2, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 245
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :pswitch_7
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getQualifiedResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 228
    :pswitch_8
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDataFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 226
    :pswitch_9
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 225
    :pswitch_a
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalAssetFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 218
    :pswitch_b
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getLoadThumbnailOnlyForAndroidSdkAboveQ()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 219
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalThumbnailBitmapSdk29FetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 662
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    .line 220
    :cond_b
    :try_start_2
    iget-object v0, v5, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->contentResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/common/media/MediaUtils;->isVideo(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 221
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 662
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    .line 223
    :cond_c
    :try_start_3
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 211
    :pswitch_c
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getLoadThumbnailOnlyForAndroidSdkAboveQ()Z

    move-result p1

    if-eqz p1, :cond_d

    .line 212
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalThumbnailBitmapSdk29FetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 662
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    .line 214
    :cond_d
    :try_start_4
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalImageFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 204
    :pswitch_d
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getLoadThumbnailOnlyForAndroidSdkAboveQ()Z

    move-result p1

    if-eqz p1, :cond_e

    .line 205
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalThumbnailBitmapSdk29FetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 662
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    .line 207
    :cond_e
    :try_start_5
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_1

    .line 202
    :cond_f
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 662
    :goto_1
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    .line 200
    :cond_10
    :try_start_6
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 662
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method

.method private final declared-synchronized getBitmapPrepareSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    .line 608
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    if-nez v0, :cond_0

    .line 610
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapPrepareProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapPrepareProducer;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    .line 611
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 613
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public static synthetic getBitmapPrepareSequences$annotations()V
    .locals 0

    return-void
.end method

.method public static synthetic getCloseableImagePrefetchSequences$annotations()V
    .locals 0

    return-void
.end method

.method private final declared-synchronized getDecodedImagePrefetchSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 595
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    if-nez v0, :cond_0

    .line 597
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newSwallowResultProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    .line 598
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 600
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private final declared-synchronized getDelaySequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    .line 620
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDelayProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DelayProducer;

    move-result-object p1

    const-string v0, "newDelayProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public static synthetic getLocalFileFetchEncodedImageProducerSequence$annotations()V
    .locals 0

    return-void
.end method

.method private final declared-synchronized getPostprocessorSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    .line 581
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    if-nez v0, :cond_0

    .line 583
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newPostprocessorProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/PostprocessorProducer;

    move-result-object v0

    const-string v1, "newPostprocessorProducer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 584
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v1, v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newPostprocessorBitmapMemoryCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/PostprocessedBitmapMemoryCacheProducer;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    .line 585
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 587
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public static synthetic getPostprocessorSequences$annotations()V
    .locals 0

    return-void
.end method

.method private static final localAssetFetchSequence_delegate$lambda$31(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 426
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalAssetFetchProducer()Lcom/facebook/imagepipeline/producers/LocalAssetFetchProducer;

    move-result-object v0

    const-string v1, "newLocalAssetFetchProducer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 427
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method private static final localContentUriFetchEncodedImageProducerSequence_delegate$lambda$6(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 129
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 708
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 131
    new-instance v0, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundLocalContentUriFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;-><init>(Lcom/facebook/imagepipeline/producers/Producer;)V

    return-object v0

    .line 712
    :cond_0
    const-string v0, "ProducerSequenceFactory#getLocalContentUriFetchEncodedImageProducerSequence:init"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 131
    :try_start_0
    new-instance v0, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundLocalContentUriFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;-><init>(Lcom/facebook/imagepipeline/producers/Producer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 716
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object v0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final localContentUriFetchSequence_delegate$lambda$27(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 4

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 375
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalContentUriFetchProducer()Lcom/facebook/imagepipeline/producers/LocalContentUriFetchProducer;

    move-result-object v0

    const-string v1, "newLocalContentUriFetchProducer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 378
    new-array v1, v1, [Lcom/facebook/imagepipeline/producers/ThumbnailProducer;

    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v2}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalContentUriThumbnailFetchProducer()Lcom/facebook/imagepipeline/producers/LocalContentUriThumbnailFetchProducer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 379
    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v2}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalExifThumbnailProducer()Lcom/facebook/imagepipeline/producers/LocalExifThumbnailProducer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 381
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0, v1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method private static final localFileFetchEncodedImageProducerSequence_delegate$lambda$4(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 699
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 119
    new-instance v0, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundLocalFileFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;-><init>(Lcom/facebook/imagepipeline/producers/Producer;)V

    return-object v0

    .line 703
    :cond_0
    const-string v0, "ProducerSequenceFactory#getLocalFileFetchEncodedImageProducerSequence:init"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 119
    :try_start_0
    new-instance v0, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundLocalFileFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;-><init>(Lcom/facebook/imagepipeline/producers/Producer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 707
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object v0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final localFileFetchToEncodedMemoryPrefetchSequence_delegate$lambda$20(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 317
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 753
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 318
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundLocalFileFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newSwallowResultProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;

    move-result-object p0

    return-object p0

    .line 757
    :cond_0
    const-string v0, "ProducerSequenceFactory#getLocalFileFetchToEncodedMemoryPrefetchSequence:init"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 318
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundLocalFileFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newSwallowResultProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 761
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final localImageFileFetchSequence_delegate$lambda$25(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 358
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalFileFetchProducer()Lcom/facebook/imagepipeline/producers/LocalFileFetchProducer;

    move-result-object v0

    const-string v1, "newLocalFileFetchProducer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 359
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method private static final localResourceFetchSequence_delegate$lambda$30(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 415
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalResourceFetchProducer()Lcom/facebook/imagepipeline/producers/LocalResourceFetchProducer;

    move-result-object v0

    const-string v1, "newLocalResourceFetchProducer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 416
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method private static final localThumbnailBitmapSdk29FetchSequence_delegate$lambda$28(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 390
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 391
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalThumbnailBitmapSdk29Producer()Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;

    move-result-object v0

    const-string v1, "newLocalThumbnailBitmapSdk29Producer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0

    .line 393
    :cond_0
    new-instance p0, Ljava/lang/Throwable;

    const-string v0, "Unreachable exception. Just to make linter happy for the lazy block."

    invoke-direct {p0, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final localVideoFileFetchSequence_delegate$lambda$26(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 364
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalVideoThumbnailProducer()Lcom/facebook/imagepipeline/producers/LocalVideoThumbnailProducer;

    move-result-object v0

    const-string v1, "newLocalVideoThumbnailProducer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 365
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method

.method private static final networkFetchEncodedImageProducerSequence_delegate$lambda$2(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 690
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;-><init>(Lcom/facebook/imagepipeline/producers/Producer;)V

    return-object v0

    .line 694
    :cond_0
    const-string v0, "ProducerSequenceFactory#getNetworkFetchEncodedImageProducerSequence:init"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 110
    :try_start_0
    new-instance v0, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/facebook/imagepipeline/producers/RemoveImageTransformMetaDataProducer;-><init>(Lcom/facebook/imagepipeline/producers/Producer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 698
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object v0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final networkFetchSequence_delegate$lambda$11(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 257
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 717
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 258
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getCommonNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToDecodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0

    .line 721
    :cond_0
    const-string v0, "ProducerSequenceFactory#getNetworkFetchSequence:init"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 258
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getCommonNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToDecodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 725
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private static final networkFetchToEncodedMemoryPrefetchSequence_delegate$lambda$15(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 279
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 735
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 280
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newSwallowResultProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;

    move-result-object p0

    return-object p0

    .line 739
    :cond_0
    const-string v0, "ProducerSequenceFactory#getNetworkFetchToEncodedMemoryPrefetchSequence"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 280
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBackgroundNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newSwallowResultProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/SwallowResultProducer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 743
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p0
.end method

.method private final newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 532
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapMemoryCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapMemoryCacheProducer;

    move-result-object p1

    const-string v0, "newBitmapMemoryCacheProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 534
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapMemoryCacheKeyMultiplexProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapMemoryCacheKeyMultiplexProducer;

    move-result-object p1

    const-string v0, "newBitmapMemoryCacheKeyMultiplexProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 536
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 537
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 536
    invoke-virtual {v0, p1, v1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBackgroundThreadHandoffProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    const-string v0, "newBackgroundThreadHandoffProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 538
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isEncodedMemoryCacheProbingEnabled:Z

    const-string v1, "newBitmapMemoryCacheGetProducer(...)"

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isDiskCacheProbingEnabled:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 543
    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapMemoryCacheGetProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapMemoryCacheGetProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1

    .line 540
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapMemoryCacheGetProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapMemoryCacheGetProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 541
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBitmapProbeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BitmapProbeProducer;

    move-result-object p1

    const-string v0, "newBitmapProbeProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1
.end method

.method private final newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 452
    new-array v0, v0, [Lcom/facebook/imagepipeline/producers/ThumbnailProducer;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newLocalExifThumbnailProducer()Lcom/facebook/imagepipeline/producers/LocalExifThumbnailProducer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 453
    invoke-direct {p0, p1, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1
.end method

.method private final newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;[",
            "Lcom/facebook/imagepipeline/producers/ThumbnailProducer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 469
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 470
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newLocalTransformationsSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 471
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToDecodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1
.end method

.method private final newDiskCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 511
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 681
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "newDiskCacheReadProducer(...)"

    const-string v2, "newPartialDiskCacheProducer(...)"

    if-nez v0, :cond_1

    .line 513
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->partialImageCachingEnabled:Z

    if-eqz v0, :cond_0

    .line 515
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newPartialDiskCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

    move-result-object p1

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    .line 516
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheWriteProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheWriteProducer;

    move-result-object p1

    goto :goto_0

    .line 518
    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheWriteProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheWriteProducer;

    move-result-object p1

    .line 515
    :goto_0
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 520
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheReadProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1

    .line 685
    :cond_1
    const-string v0, "ProducerSequenceFactory#newDiskCacheSequence"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 513
    :try_start_0
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->partialImageCachingEnabled:Z

    if-eqz v0, :cond_2

    .line 515
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newPartialDiskCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

    move-result-object p1

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    .line 516
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheWriteProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheWriteProducer;

    move-result-object p1

    goto :goto_1

    .line 518
    :cond_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheWriteProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheWriteProducer;

    move-result-object p1

    .line 515
    :goto_1
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 520
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDiskCacheReadProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DiskCacheReadProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 689
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method private final newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 499
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->diskCacheEnabled:Z

    if-eqz v0, :cond_0

    .line 500
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newDiskCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 502
    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newEncodedMemoryCacheProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    const-string v0, "newEncodedMemoryCacheProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 503
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->isDiskCacheProbingEnabled:Z

    const-string v1, "newEncodedCacheKeyMultiplexProducer(...)"

    if-eqz v0, :cond_1

    .line 504
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newEncodedProbeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/EncodedProbeProducer;

    move-result-object p1

    const-string v0, "newEncodedProbeProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 505
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newEncodedCacheKeyMultiplexProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/EncodedCacheKeyMultiplexProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1

    .line 507
    :cond_1
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newEncodedCacheKeyMultiplexProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/EncodedCacheKeyMultiplexProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1
.end method

.method private final newLocalThumbnailProducer([Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/facebook/imagepipeline/producers/ThumbnailProducer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 571
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newThumbnailBranchProducer([Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/ThumbnailBranchProducer;

    move-result-object p1

    const-string v0, "newThumbnailBranchProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 572
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 573
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    .line 572
    invoke-virtual {v0, p1, v1, v2}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object p1

    const-string v0, "newResizeAndRotateProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1
.end method

.method private final newLocalTransformationsSequence(Lcom/facebook/imagepipeline/producers/Producer;[Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;[",
            "Lcom/facebook/imagepipeline/producers/ThumbnailProducer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 560
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newAddImageTransformMetaDataProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/AddImageTransformMetaDataProducer;

    move-result-object p1

    const-string v0, "newAddImageTransformMetaDataProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    .line 562
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    invoke-virtual {v0, p1, v1, v2}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    .line 563
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newThrottlingProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/ThrottlingProducer;

    move-result-object p1

    const-string v0, "newThrottlingProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 565
    invoke-direct {p0, p2}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newLocalThumbnailProducer([Lcom/facebook/imagepipeline/producers/ThumbnailProducer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p2

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    .line 564
    invoke-static {p2, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newBranchOnSeparateImagesProducer(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/BranchOnSeparateImagesProducer;

    move-result-object p1

    const-string p2, "newBranchOnSeparateImagesProducer(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    return-object p1
.end method

.method private static final qualifiedResourceFetchSequence_delegate$lambda$29(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 404
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newQualifiedResourceFetchProducer()Lcom/facebook/imagepipeline/producers/QualifiedResourceFetchProducer;

    move-result-object v0

    const-string v1, "newQualifiedResourceFetchProducer(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 405
    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToLocalTransformSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final getBackgroundLocalContentUriFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 340
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalContentUriFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "getValue(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getBackgroundLocalFileFetchToEncodeMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 326
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundLocalFileFetchToEncodeMemorySequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "getValue(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getBackgroundNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 266
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->backgroundNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "getValue(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getBitmapPrepareSequences()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;"
        }
    .end annotation

    .line 62
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    return-object v0
.end method

.method public final getCloseableImagePrefetchSequences()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    return-object v0
.end method

.method public final getCommonNetworkFetchToEncodedMemorySequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    .line 288
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->commonNetworkFetchToEncodedMemorySequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getDataFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 434
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->dataFetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getDecodedImagePrefetchProducerSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "imageRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 188
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBasicDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 189
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->useBitmapPrepareToDraw:Z

    if-eqz v0, :cond_0

    .line 190
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBitmapPrepareSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 192
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDecodedImagePrefetchSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1
.end method

.method public final getDecodedImageProducerSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    const-string v0, "imageRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 167
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 646
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    if-nez v0, :cond_3

    .line 168
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBasicDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 169
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getPostprocessor()Lcom/facebook/imagepipeline/request/Postprocessor;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 170
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getPostprocessorSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 172
    :cond_0
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->useBitmapPrepareToDraw:Z

    if-eqz v1, :cond_1

    .line 173
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBitmapPrepareSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 175
    :cond_1
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->allowDelay:Z

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getDelayMs()I

    move-result p1

    if-lez p1, :cond_2

    .line 176
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDelaySequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v0

    .line 650
    :cond_3
    const-string v0, "ProducerSequenceFactory#getDecodedImageProducerSequence"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 168
    :try_start_0
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBasicDecodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 169
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getPostprocessor()Lcom/facebook/imagepipeline/request/Postprocessor;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 170
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getPostprocessorSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 172
    :cond_4
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->useBitmapPrepareToDraw:Z

    if-eqz v1, :cond_5

    .line 173
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getBitmapPrepareSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0

    .line 175
    :cond_5
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->allowDelay:Z

    if-eqz v1, :cond_6

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getDelayMs()I

    move-result p1

    if-lez p1, :cond_6

    .line 176
    invoke-direct {p0, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getDelaySequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 654
    :cond_6
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object v0

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method public final getEncodedImagePrefetchProducerSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const-string v0, "imageRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    sget-object v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$validateEncodedImageRequest(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 146
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result v1

    if-eqz v1, :cond_2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 151
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object p1

    const-string v1, "getSourceUri(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 152
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 153
    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Unsupported uri scheme for encoded image fetch! Uri is: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 152
    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 149
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalFileFetchToEncodedMemoryPrefetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 147
    :cond_2
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchToEncodedMemoryPrefetchSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1
.end method

.method public final getEncodedImageProducerSequence(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ")",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    const-string v0, "imageRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 637
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "Unsupported uri scheme for encoded image fetch! Uri is: "

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x2

    const-string v5, "getSourceUri(...)"

    if-nez v0, :cond_5

    .line 80
    sget-object v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$validateEncodedImageRequest(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 81
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result v5

    if-eqz v5, :cond_4

    if-eq v5, v4, :cond_3

    if-eq v5, v3, :cond_3

    if-eq v5, v2, :cond_2

    .line 89
    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->customProducerSequenceFactories:Ljava/util/Set;

    if-eqz v2, :cond_1

    .line 90
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;

    .line 93
    iget-object v4, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    iget-object v5, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 92
    invoke-virtual {v3, p1, p0, v4, v5}, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;->getCustomEncodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;Lcom/facebook/imagepipeline/core/ProducerFactory;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v3

    if-eqz v3, :cond_0

    return-object v3

    .line 99
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 101
    sget-object v2, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v2, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 87
    :cond_2
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 85
    :cond_3
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalFileFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 83
    :cond_4
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 641
    :cond_5
    const-string v0, "ProducerSequenceFactory#getEncodedImageProducerSequence"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 80
    :try_start_0
    sget-object v0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$validateEncodedImageRequest(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 81
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUriType()I

    move-result v5

    if-eqz v5, :cond_a

    if-eq v5, v4, :cond_9

    if-eq v5, v3, :cond_9

    if-eq v5, v2, :cond_8

    .line 89
    iget-object v2, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->customProducerSequenceFactories:Ljava/util/Set;

    if-eqz v2, :cond_7

    .line 90
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;

    .line 93
    iget-object v4, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    iget-object v5, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 92
    invoke-virtual {v3, p1, p0, v4, v5}, Lcom/facebook/imagepipeline/producers/CustomProducerSequenceFactory;->getCustomEncodedImageSequence(Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;Lcom/facebook/imagepipeline/core/ProducerFactory;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_6

    .line 645
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object v3

    .line 99
    :cond_7
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 101
    sget-object v2, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->Companion:Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;

    invoke-static {v2, v0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;->access$getShortenedUriString(Lcom/facebook/imagepipeline/core/ProducerSequenceFactory$Companion;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 87
    :cond_8
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalContentUriFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 85
    :cond_9
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getLocalFileFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    goto :goto_0

    .line 83
    :cond_a
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->getNetworkFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 645
    :goto_0
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method public final getLocalAssetFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 425
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localAssetFetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalContentUriFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    .line 128
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalContentUriFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 374
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localContentUriFetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalFileFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalFileFetchToEncodedMemoryPrefetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 316
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localFileFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "getValue(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalImageFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 357
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localImageFileFetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 414
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localResourceFetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalThumbnailBitmapSdk29FetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 389
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localThumbnailBitmapSdk29FetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getLocalVideoFileFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 363
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->localVideoFileFetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getNetworkFetchEncodedImageProducerSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;"
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchEncodedImageProducerSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getNetworkFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 256
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getNetworkFetchToEncodedMemoryPrefetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 278
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->networkFetchToEncodedMemoryPrefetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "getValue(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getPostprocessorSequences()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;"
        }
    .end annotation

    .line 50
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    return-object v0
.end method

.method public final getQualifiedResourceFetchSequence()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    .line 403
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->qualifiedResourceFetchSequence$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final newBitmapCacheGetToDecodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation

    const-string v0, "inputProducer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 483
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 672
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const-string v1, "newDecodeProducer(...)"

    if-nez v0, :cond_0

    .line 484
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDecodeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DecodeProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 485
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    return-object p1

    .line 676
    :cond_0
    const-string v0, "ProducerSequenceFactory#newBitmapCacheGetToDecodeSequence"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 484
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newDecodeProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/DecodeProducer;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 485
    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newBitmapCacheGetToBitmapCacheSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 680
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method

.method public final declared-synchronized newCommonNetworkFetchToEncodedMemorySequence(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/producers/Producer;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/NetworkFetcher<",
            "*>;)",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "networkFetcher"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 298
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    const-string v0, "ProducerSequenceFactory#createCommonNetworkFetchToEncodedMemorySequence"

    .line 663
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    .line 301
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newNetworkFetchProducer(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    const-string v0, "newNetworkFetchProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 300
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 303
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newAddImageTransformMetaDataProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/AddImageTransformMetaDataProducer;

    move-result-object p1

    const-string v0, "newAddImageTransformMetaDataProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    .line 305
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 307
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->resizeAndRotateEnabledForNetwork:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->downsampleMode:Lcom/facebook/imagepipeline/core/DownsampleMode;

    sget-object v4, Lcom/facebook/imagepipeline/core/DownsampleMode;->NEVER:Lcom/facebook/imagepipeline/core/DownsampleMode;

    if-eq v1, v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 308
    :goto_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    .line 305
    invoke-virtual {v0, p1, v2, v1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 309
    monitor-exit p0

    return-object p1

    .line 667
    :cond_1
    :try_start_1
    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 301
    :try_start_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newNetworkFetchProducer(Lcom/facebook/imagepipeline/producers/NetworkFetcher;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    const-string v0, "newNetworkFetchProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 300
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->newEncodedCacheMultiplexToTranscodeSequence(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/Producer;

    move-result-object p1

    .line 303
    invoke-static {p1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newAddImageTransformMetaDataProducer(Lcom/facebook/imagepipeline/producers/Producer;)Lcom/facebook/imagepipeline/producers/AddImageTransformMetaDataProducer;

    move-result-object p1

    const-string v0, "newAddImageTransformMetaDataProducer(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;

    .line 305
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->producerFactory:Lcom/facebook/imagepipeline/core/ProducerFactory;

    .line 307
    iget-boolean v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->resizeAndRotateEnabledForNetwork:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->downsampleMode:Lcom/facebook/imagepipeline/core/DownsampleMode;

    sget-object v4, Lcom/facebook/imagepipeline/core/DownsampleMode;->NEVER:Lcom/facebook/imagepipeline/core/DownsampleMode;

    if-eq v1, v4, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    .line 308
    :goto_1
    iget-object v1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->imageTranscoderFactory:Lcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;

    .line 305
    invoke-virtual {v0, p1, v2, v1}, Lcom/facebook/imagepipeline/core/ProducerFactory;->newResizeAndRotateProducer(Lcom/facebook/imagepipeline/producers/Producer;ZLcom/facebook/imagepipeline/transcoder/ImageTranscoderFactory;)Lcom/facebook/imagepipeline/producers/ResizeAndRotateProducer;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/producers/Producer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 671
    :try_start_3
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_4
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1

    :catchall_1
    move-exception p1

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p1
.end method

.method public final setBitmapPrepareSequences(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->bitmapPrepareSequences:Ljava/util/Map;

    return-void
.end method

.method public final setCloseableImagePrefetchSequences(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->closeableImagePrefetchSequences:Ljava/util/Map;

    return-void
.end method

.method public final setPostprocessorSequences(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ProducerSequenceFactory;->postprocessorSequences:Ljava/util/Map;

    return-void
.end method
