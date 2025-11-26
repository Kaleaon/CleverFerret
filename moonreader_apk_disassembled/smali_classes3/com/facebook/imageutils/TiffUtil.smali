.class public final Lcom/facebook/imageutils/TiffUtil;
.super Ljava/lang/Object;
.source "TiffUtil.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imageutils/TiffUtil$TiffHeader;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u00c0\u0002\u0018\u00002\u00020\u0001:\u0001\u0019B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u000b\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u0007H\u0007J\u0018\u0010\r\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0007H\u0007J \u0010\u0011\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0013H\u0002J(\u0010\u0014\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0007H\u0002J \u0010\u0018\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00072\u0006\u0010\u0015\u001a\u00020\u0016H\u0002R\u0012\u0010\u0004\u001a\u0006\u0012\u0002\u0008\u00030\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0007X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/facebook/imageutils/TiffUtil;",
        "",
        "<init>",
        "()V",
        "TAG",
        "Ljava/lang/Class;",
        "TIFF_BYTE_ORDER_BIG_END",
        "",
        "TIFF_BYTE_ORDER_LITTLE_END",
        "TIFF_TAG_ORIENTATION",
        "TIFF_TYPE_SHORT",
        "getAutoRotateAngleFromOrientation",
        "orientation",
        "readOrientationFromTIFF",
        "stream",
        "Ljava/io/InputStream;",
        "length",
        "readTiffHeader",
        "tiffHeader",
        "Lcom/facebook/imageutils/TiffUtil$TiffHeader;",
        "moveToTiffEntryWithTag",
        "isLittleEndian",
        "",
        "tagToFind",
        "getOrientationFromTiffEntry",
        "TiffHeader",
        "imagepipeline-base_release"
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
.field public static final INSTANCE:Lcom/facebook/imageutils/TiffUtil;

.field private static final TAG:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final TIFF_BYTE_ORDER_BIG_END:I = 0x4d4d002a

.field public static final TIFF_BYTE_ORDER_LITTLE_END:I = 0x49492a00

.field public static final TIFF_TAG_ORIENTATION:I = 0x112

.field public static final TIFF_TYPE_SHORT:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imageutils/TiffUtil;

    invoke-direct {v0}, Lcom/facebook/imageutils/TiffUtil;-><init>()V

    sput-object v0, Lcom/facebook/imageutils/TiffUtil;->INSTANCE:Lcom/facebook/imageutils/TiffUtil;

    .line 18
    const-class v0, Lcom/facebook/imageutils/TiffUtil;

    sput-object v0, Lcom/facebook/imageutils/TiffUtil;->TAG:Ljava/lang/Class;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getAutoRotateAngleFromOrientation(I)I
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    const/4 v1, 0x1

    if-eq p0, v1, :cond_3

    const/4 v1, 0x3

    if-eq p0, v1, :cond_2

    const/4 v1, 0x6

    if-eq p0, v1, :cond_1

    const/16 v1, 0x8

    if-eq p0, v1, :cond_0

    return v0

    :cond_0
    const/16 p0, 0x10e

    return p0

    :cond_1
    const/16 p0, 0x5a

    return p0

    :cond_2
    const/16 p0, 0xb4

    return p0

    :cond_3
    return v0
.end method

.method private final getOrientationFromTiffEntry(Ljava/io/InputStream;IZ)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xa

    const/4 v1, 0x0

    if-ge p2, v0, :cond_0

    return v1

    :cond_0
    const/4 p2, 0x2

    .line 168
    invoke-static {p1, p2, p3}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x4

    .line 173
    invoke-static {p1, v0, p3}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    return v1

    .line 177
    :cond_2
    invoke-static {p1, p2, p3}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result p1

    return p1
.end method

.method private final moveToTiffEntryWithTag(Ljava/io/InputStream;IZI)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xe

    const/4 v1, 0x0

    if-ge p2, v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x2

    .line 134
    invoke-static {p1, v0, p3}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v2

    add-int/lit8 p2, p2, -0x2

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_2

    const/16 v2, 0xc

    if-lt p2, v2, :cond_2

    .line 138
    invoke-static {p1, v0, p3}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v2

    add-int/lit8 v4, p2, -0x2

    if-ne v2, p4, :cond_1

    return v4

    :cond_1
    const-wide/16 v4, 0xa

    .line 143
    invoke-virtual {p1, v4, v5}, Ljava/io/InputStream;->skip(J)J

    add-int/lit8 p2, p2, -0xc

    move v2, v3

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static final readOrientationFromTIFF(Ljava/io/InputStream;I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "stream"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    new-instance v0, Lcom/facebook/imageutils/TiffUtil$TiffHeader;

    invoke-direct {v0}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;-><init>()V

    .line 53
    sget-object v1, Lcom/facebook/imageutils/TiffUtil;->INSTANCE:Lcom/facebook/imageutils/TiffUtil;

    invoke-direct {v1, p0, p1, v0}, Lcom/facebook/imageutils/TiffUtil;->readTiffHeader(Ljava/io/InputStream;ILcom/facebook/imageutils/TiffUtil$TiffHeader;)I

    move-result p1

    .line 58
    invoke-virtual {v0}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->getFirstIfdOffset()I

    move-result v2

    add-int/lit8 v2, v2, -0x8

    if-eqz p1, :cond_1

    if-le v2, p1, :cond_0

    goto :goto_0

    :cond_0
    int-to-long v3, v2

    .line 62
    invoke-virtual {p0, v3, v4}, Ljava/io/InputStream;->skip(J)J

    sub-int/2addr p1, v2

    .line 68
    invoke-virtual {v0}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->isLittleEndian()Z

    move-result v2

    const/16 v3, 0x112

    .line 67
    invoke-direct {v1, p0, p1, v2, v3}, Lcom/facebook/imageutils/TiffUtil;->moveToTiffEntryWithTag(Ljava/io/InputStream;IZI)I

    move-result p1

    .line 71
    invoke-virtual {v0}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->isLittleEndian()Z

    move-result v0

    invoke-direct {v1, p0, p1, v0}, Lcom/facebook/imageutils/TiffUtil;->getOrientationFromTiffEntry(Ljava/io/InputStream;IZ)I

    move-result p0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private final readTiffHeader(Ljava/io/InputStream;ILcom/facebook/imageutils/TiffUtil$TiffHeader;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-gt p2, v1, :cond_0

    return v0

    :cond_0
    const/4 v2, 0x4

    .line 91
    invoke-static {p1, v2, v0}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v3

    invoke-virtual {p3, v3}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->setByteOrder(I)V

    .line 93
    invoke-virtual {p3}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->getByteOrder()I

    move-result v3

    const v4, 0x49492a00    # 823968.0f

    if-eq v3, v4, :cond_1

    .line 94
    invoke-virtual {p3}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->getByteOrder()I

    move-result v3

    const v5, 0x4d4d002a    # 2.14958752E8f

    if-eq v3, v5, :cond_1

    .line 95
    sget-object p1, Lcom/facebook/imageutils/TiffUtil;->TAG:Ljava/lang/Class;

    const-string p2, "Invalid TIFF header"

    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;)V

    return v0

    .line 98
    :cond_1
    invoke-virtual {p3}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->getByteOrder()I

    move-result v3

    if-ne v3, v4, :cond_2

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {p3, v3}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->setLittleEndian(Z)V

    .line 101
    invoke-virtual {p3}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->isLittleEndian()Z

    move-result v3

    invoke-static {p1, v2, v3}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result p1

    invoke-virtual {p3, p1}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->setFirstIfdOffset(I)V

    add-int/lit8 p2, p2, -0x8

    .line 103
    invoke-virtual {p3}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->getFirstIfdOffset()I

    move-result p1

    if-lt p1, v1, :cond_4

    invoke-virtual {p3}, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->getFirstIfdOffset()I

    move-result p1

    sub-int/2addr p1, v1

    if-le p1, p2, :cond_3

    goto :goto_1

    :cond_3
    return p2

    .line 104
    :cond_4
    :goto_1
    sget-object p1, Lcom/facebook/imageutils/TiffUtil;->TAG:Ljava/lang/Class;

    const-string p2, "Invalid offset"

    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/Class;Ljava/lang/String;)V

    return v0
.end method
