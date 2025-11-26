.class public Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;
.super Ljava/lang/Object;
.source "LocalThumbnailBitmapSdk29Producer.java"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/Producer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/producers/Producer<",
        "Lcom/facebook/common/references/CloseableReference<",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        ">;>;"
    }
.end annotation


# static fields
.field static final CREATED_THUMBNAIL:Ljava/lang/String; = "createdThumbnail"

.field public static final PRODUCER_NAME:Ljava/lang/String; = "LocalThumbnailBitmapSdk29Producer"


# instance fields
.field private final mContentResolver:Landroid/content/ContentResolver;

.field private final mExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method static bridge synthetic -$$Nest$fgetmContentResolver(Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;)Landroid/content/ContentResolver;
    .locals 0

    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;->mContentResolver:Landroid/content/ContentResolver;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetLocalFilePath(Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;->getLocalFilePath(Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Landroid/content/ContentResolver;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;->mExecutor:Ljava/util/concurrent/Executor;

    .line 50
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;->mContentResolver:Landroid/content/ContentResolver;

    return-void
.end method

.method private getLocalFilePath(Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 149
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->getSourceUri()Landroid/net/Uri;

    move-result-object p1

    .line 150
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;->mContentResolver:Landroid/content/ContentResolver;

    invoke-static {v0, p1}, Lcom/facebook/common/util/UriUtil;->getRealPathFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "Lcom/facebook/common/references/CloseableReference<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")V"
        }
    .end annotation

    .line 57
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getProducerListener()Lcom/facebook/imagepipeline/producers/ProducerListener2;

    move-result-object v3

    .line 58
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v8

    .line 59
    const-string v0, "local"

    const-string v1, "thumbnail_bitmap"

    invoke-interface {p2, v0, v1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putOriginExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    new-instance v9, Landroid/os/CancellationSignal;

    invoke-direct {v9}, Landroid/os/CancellationSignal;-><init>()V

    .line 61
    new-instance v0, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer$1;

    const-string v5, "LocalThumbnailBitmapSdk29Producer"

    move-object v6, v3

    move-object v7, p2

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v9}, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer$1;-><init>(Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/os/CancellationSignal;)V

    .line 137
    new-instance p1, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer$2;

    invoke-direct {p1, p0, v0}, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer$2;-><init>(Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;)V

    invoke-interface {v4, p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    .line 144
    iget-object p1, v1, Lcom/facebook/imagepipeline/producers/LocalThumbnailBitmapSdk29Producer;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
