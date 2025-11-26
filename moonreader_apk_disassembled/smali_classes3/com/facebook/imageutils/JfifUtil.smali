.class public final Lcom/facebook/imageutils/JfifUtil;
.super Ljava/lang/Object;
.source "JfifUtil.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u000e\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0010\u001a\u00020\u00052\u0006\u0010\u0011\u001a\u00020\u0005H\u0007J\u0012\u0010\u0012\u001a\u00020\u00052\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0007J\u0010\u0010\u0012\u001a\u00020\u00052\u0006\u0010\u0015\u001a\u00020\u0016H\u0007J\u0018\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u0005H\u0007J\u0010\u0010\u001a\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u0005H\u0002J\u0010\u0010\u001c\u001a\u00020\u00052\u0006\u0010\u0015\u001a\u00020\u0016H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001d"
    }
    d2 = {
        "Lcom/facebook/imageutils/JfifUtil;",
        "",
        "<init>",
        "()V",
        "MARKER_FIRST_BYTE",
        "",
        "MARKER_ESCAPE_BYTE",
        "MARKER_SOI",
        "MARKER_TEM",
        "MARKER_EOI",
        "MARKER_SOS",
        "MARKER_APP1",
        "MARKER_SOFn",
        "MARKER_RST0",
        "MARKER_RST7",
        "APP1_EXIF_MAGIC",
        "getAutoRotateAngleFromOrientation",
        "orientation",
        "getOrientation",
        "jpeg",
        "",
        "inputStream",
        "Ljava/io/InputStream;",
        "moveToMarker",
        "",
        "markerToFind",
        "isSOFn",
        "marker",
        "moveToAPP1EXIF",
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
.field public static final APP1_EXIF_MAGIC:I = 0x45786966

.field public static final INSTANCE:Lcom/facebook/imageutils/JfifUtil;

.field public static final MARKER_APP1:I = 0xe1

.field public static final MARKER_EOI:I = 0xd9

.field public static final MARKER_ESCAPE_BYTE:I = 0x0

.field public static final MARKER_FIRST_BYTE:I = 0xff

.field public static final MARKER_RST0:I = 0xd0

.field public static final MARKER_RST7:I = 0xd7

.field public static final MARKER_SOFn:I = 0xc0

.field public static final MARKER_SOI:I = 0xd8

.field public static final MARKER_SOS:I = 0xda

.field public static final MARKER_TEM:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imageutils/JfifUtil;

    invoke-direct {v0}, Lcom/facebook/imageutils/JfifUtil;-><init>()V

    sput-object v0, Lcom/facebook/imageutils/JfifUtil;->INSTANCE:Lcom/facebook/imageutils/JfifUtil;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getAutoRotateAngleFromOrientation(I)I
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 41
    invoke-static {p0}, Lcom/facebook/imageutils/TiffUtil;->getAutoRotateAngleFromOrientation(I)I

    move-result p0

    return p0
.end method

.method public static final getOrientation(Ljava/io/InputStream;)I
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "inputStream"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 65
    :try_start_0
    sget-object v1, Lcom/facebook/imageutils/JfifUtil;->INSTANCE:Lcom/facebook/imageutils/JfifUtil;

    invoke-direct {v1, p0}, Lcom/facebook/imageutils/JfifUtil;->moveToAPP1EXIF(Ljava/io/InputStream;)I

    move-result v1

    if-nez v1, :cond_0

    return v0

    .line 69
    :cond_0
    invoke-static {p0, v1}, Lcom/facebook/imageutils/TiffUtil;->readOrientationFromTIFF(Ljava/io/InputStream;I)I

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    return v0
.end method

.method public static final getOrientation([B)I
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 52
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    check-cast v0, Ljava/io/InputStream;

    invoke-static {v0}, Lcom/facebook/imageutils/JfifUtil;->getOrientation(Ljava/io/InputStream;)I

    move-result p0

    return p0
.end method

.method private final isSOFn(I)Z
    .locals 0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    const/4 p1, 0x0

    return p1

    :pswitch_1
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0xc0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private final moveToAPP1EXIF(Ljava/io/InputStream;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xe1

    .line 147
    invoke-static {p1, v0}, Lcom/facebook/imageutils/JfifUtil;->moveToMarker(Ljava/io/InputStream;I)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    .line 150
    invoke-static {p1, v0, v1}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v2

    add-int/lit8 v3, v2, -0x2

    const/4 v4, 0x6

    if-le v3, v4, :cond_0

    const/4 v3, 0x4

    .line 152
    invoke-static {p1, v3, v1}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v3

    .line 154
    invoke-static {p1, v0, v1}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result p1

    add-int/lit8 v2, v2, -0x8

    const v0, 0x45786966

    if-ne v3, v0, :cond_0

    if-nez p1, :cond_0

    return v2

    :cond_0
    return v1
.end method

.method public static final moveToMarker(Ljava/io/InputStream;I)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "inputStream"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    :goto_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 88
    invoke-static {p0, v0, v1}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v2

    const/16 v3, 0xff

    if-ne v2, v3, :cond_4

    const/16 v2, 0xff

    :goto_1
    if-ne v2, v3, :cond_1

    .line 91
    invoke-static {p0, v0, v1}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v2

    goto :goto_1

    :cond_1
    const/16 v3, 0xc0

    if-ne p1, v3, :cond_2

    .line 93
    sget-object v3, Lcom/facebook/imageutils/JfifUtil;->INSTANCE:Lcom/facebook/imageutils/JfifUtil;

    invoke-direct {v3, v2}, Lcom/facebook/imageutils/JfifUtil;->isSOFn(I)Z

    move-result v3

    if-eqz v3, :cond_2

    return v0

    :cond_2
    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    if-eq v2, v0, :cond_0

    const/16 v0, 0xd8

    if-eq v2, v0, :cond_0

    const/16 v0, 0xd9

    if-eq v2, v0, :cond_4

    const/16 v0, 0xda

    if-eq v2, v0, :cond_4

    const/4 v0, 0x2

    .line 113
    invoke-static {p0, v0, v1}, Lcom/facebook/imageutils/StreamProcessor;->readPackedInt(Ljava/io/InputStream;IZ)I

    move-result v1

    sub-int/2addr v1, v0

    int-to-long v0, v1

    .line 115
    invoke-virtual {p0, v0, v1}, Ljava/io/InputStream;->skip(J)J

    goto :goto_0

    :cond_4
    return v1
.end method
