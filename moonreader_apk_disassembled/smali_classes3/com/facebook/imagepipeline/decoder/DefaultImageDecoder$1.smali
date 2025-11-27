.class Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;
.super Ljava/lang/Object;
.source "DefaultImageDecoder.java"

# interfaces
.implements Lcom/facebook/imagepipeline/decoder/ImageDecoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;->this$0:Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;
    .locals 8
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 66
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getImageFormat()Lcom/facebook/imageformat/ImageFormat;

    move-result-object v0

    .line 68
    iget-object v1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;->this$0:Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;

    invoke-static {v1}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->-$$Nest$fgetmEnableEncodedImageColorSpaceUsage(Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;)Lcom/facebook/common/internal/Supplier;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/common/internal/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 70
    iget-object v1, p4, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->colorSpace:Landroid/graphics/ColorSpace;

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getColorSpace()Landroid/graphics/ColorSpace;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, p4, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->colorSpace:Landroid/graphics/ColorSpace;

    goto :goto_0

    .line 72
    :cond_1
    iget-object v1, p4, Lcom/facebook/imagepipeline/common/ImageDecodeOptions;->colorSpace:Landroid/graphics/ColorSpace;

    :goto_0
    move-object v7, v1

    .line 74
    sget-object v1, Lcom/facebook/imageformat/DefaultImageFormats;->JPEG:Lcom/facebook/imageformat/ImageFormat;

    if-ne v0, v1, :cond_2

    .line 75
    iget-object v2, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;->this$0:Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v2 .. v7}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->decodeJpeg(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;Landroid/graphics/ColorSpace;)Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;

    move-result-object p1

    return-object p1

    :cond_2
    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    .line 76
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->GIF:Lcom/facebook/imageformat/ImageFormat;

    if-ne v0, p1, :cond_3

    .line 77
    iget-object p1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;->this$0:Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;

    invoke-virtual {p1, v3, v4, v5, v6}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->decodeGif(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object p1

    return-object p1

    .line 78
    :cond_3
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->WEBP_ANIMATED:Lcom/facebook/imageformat/ImageFormat;

    if-ne v0, p1, :cond_4

    .line 79
    iget-object p1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;->this$0:Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;

    invoke-virtual {p1, v3, v4, v5, v6}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->decodeAnimatedWebp(Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object p1

    return-object p1

    .line 80
    :cond_4
    sget-object p1, Lcom/facebook/imageformat/DefaultImageFormats;->BINARY_XML:Lcom/facebook/imageformat/ImageFormat;

    if-ne v0, p1, :cond_5

    .line 81
    iget-object p1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;->this$0:Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;

    invoke-static {p1, v3, v4, v5, v6}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->-$$Nest$mdecodeXml(Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;Lcom/facebook/imagepipeline/image/EncodedImage;ILcom/facebook/imagepipeline/image/QualityInfo;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableImage;

    move-result-object p1

    return-object p1

    .line 82
    :cond_5
    sget-object p1, Lcom/facebook/imageformat/ImageFormat;->UNKNOWN:Lcom/facebook/imageformat/ImageFormat;

    if-eq v0, p1, :cond_6

    .line 85
    iget-object p1, p0, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder$1;->this$0:Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;

    invoke-virtual {p1, v3, v6}, Lcom/facebook/imagepipeline/decoder/DefaultImageDecoder;->decodeStaticImage(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/common/ImageDecodeOptions;)Lcom/facebook/imagepipeline/image/CloseableStaticBitmap;

    move-result-object p1

    return-object p1

    .line 83
    :cond_6
    new-instance p1, Lcom/facebook/imagepipeline/decoder/DecodeException;

    const-string p2, "unknown image format"

    invoke-direct {p1, p2, v3}, Lcom/facebook/imagepipeline/decoder/DecodeException;-><init>(Ljava/lang/String;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    throw p1
.end method
