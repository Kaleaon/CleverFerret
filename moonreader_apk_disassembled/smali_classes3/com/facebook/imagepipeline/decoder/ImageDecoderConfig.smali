.class public Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;
.super Ljava/lang/Object;
.source "ImageDecoderConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;
    }
.end annotation


# instance fields
.field private final mCustomImageDecoders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/imageformat/ImageFormat;",
            "Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mCustomImageFormats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/imageformat/ImageFormat$FormatChecker;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-static {p1}, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;->-$$Nest$fgetmCustomImageDecoders(Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;->mCustomImageDecoders:Ljava/util/Map;

    .line 28
    invoke-static {p1}, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;->-$$Nest$fgetmCustomImageFormats(Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;->mCustomImageFormats:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;-><init>(Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;)V

    return-void
.end method

.method public static newBuilder()Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;
    .locals 1

    .line 42
    new-instance v0, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getCustomImageDecoders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/facebook/imageformat/ImageFormat;",
            "Lcom/facebook/imagepipeline/decoder/ImageDecoder;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 33
    iget-object v0, p0, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;->mCustomImageDecoders:Ljava/util/Map;

    return-object v0
.end method

.method public getCustomImageFormats()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/imageformat/ImageFormat$FormatChecker;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/facebook/imagepipeline/decoder/ImageDecoderConfig;->mCustomImageFormats:Ljava/util/List;

    return-object v0
.end method
