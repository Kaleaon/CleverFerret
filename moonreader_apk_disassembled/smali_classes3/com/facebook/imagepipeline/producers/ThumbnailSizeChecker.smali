.class public final Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;
.super Ljava/lang/Object;
.source "ThumbnailSizeChecker.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\"\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u00072\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0007J\u001c\u0010\t\u001a\u00020\n2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0007J\u0010\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0007H\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;",
        "",
        "<init>",
        "()V",
        "ACCEPTABLE_REQUESTED_TO_ACTUAL_SIZE_RATIO",
        "",
        "ROTATED_90_DEGREES_CLOCKWISE",
        "",
        "ROTATED_90_DEGREES_COUNTER_CLOCKWISE",
        "isImageBigEnough",
        "",
        "width",
        "height",
        "resizeOptions",
        "Lcom/facebook/imagepipeline/common/ResizeOptions;",
        "encodedImage",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "getAcceptableSize",
        "size",
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
.field public static final ACCEPTABLE_REQUESTED_TO_ACTUAL_SIZE_RATIO:F = 1.3333334f

.field public static final INSTANCE:Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;

.field private static final ROTATED_90_DEGREES_CLOCKWISE:I = 0x5a

.field private static final ROTATED_90_DEGREES_COUNTER_CLOCKWISE:I = 0x10e


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;->INSTANCE:Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getAcceptableSize(I)I
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    int-to-float p0, p0

    const v0, 0x3faaaaab

    mul-float p0, p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static final isImageBigEnough(IILcom/facebook/imagepipeline/common/ResizeOptions;)Z
    .locals 3
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p2, :cond_1

    .line 41
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;->getAcceptableSize(I)I

    move-result p0

    int-to-float p0, p0

    const/high16 p2, 0x45000000    # 2048.0f

    cmpl-float p0, p0, p2

    if-ltz p0, :cond_0

    .line 42
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;->getAcceptableSize(I)I

    move-result p0

    const/16 p1, 0x800

    if-lt p0, p1, :cond_0

    return v0

    :cond_0
    return v1

    .line 44
    :cond_1
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;->getAcceptableSize(I)I

    move-result p0

    iget v2, p2, Lcom/facebook/imagepipeline/common/ResizeOptions;->width:I

    if-lt p0, v2, :cond_2

    .line 45
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;->getAcceptableSize(I)I

    move-result p0

    iget p1, p2, Lcom/facebook/imagepipeline/common/ResizeOptions;->height:I

    if-lt p0, p1, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public static final isImageBigEnough(Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/imagepipeline/common/ResizeOptions;)Z
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getRotationAngle()I

    move-result v0

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    const/16 v1, 0x10e

    if-eq v0, v1, :cond_1

    .line 58
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getHeight()I

    move-result p0

    invoke-static {v0, p0, p1}, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;->isImageBigEnough(IILcom/facebook/imagepipeline/common/ResizeOptions;)Z

    move-result p0

    return p0

    .line 57
    :cond_1
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/EncodedImage;->getWidth()I

    move-result p0

    invoke-static {v0, p0, p1}, Lcom/facebook/imagepipeline/producers/ThumbnailSizeChecker;->isImageBigEnough(IILcom/facebook/imagepipeline/common/ResizeOptions;)Z

    move-result p0

    return p0
.end method
