.class final Lcom/vladsch/flexmark/util/ImageUtils$1;
.super Ljava/awt/image/RGBImageFilter;
.source "ImageUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/ImageUtils;->toTransparent(Ljava/awt/image/BufferedImage;Ljava/awt/Color;I)Ljava/awt/Image;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field public markerRGB:I

.field radius:I

.field final synthetic val$color:Ljava/awt/Color;

.field final synthetic val$tolerance:I


# direct methods
.method constructor <init>(Ljava/awt/Color;I)V
    .locals 1

    .line 670
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ImageUtils$1;->val$color:Ljava/awt/Color;

    iput p2, p0, Lcom/vladsch/flexmark/util/ImageUtils$1;->val$tolerance:I

    invoke-direct {p0}, Ljava/awt/image/RGBImageFilter;-><init>()V

    .line 673
    invoke-virtual {p1}, Ljava/awt/Color;->getRGB()I

    move-result p1

    const/high16 v0, -0x1000000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/vladsch/flexmark/util/ImageUtils$1;->markerRGB:I

    mul-int p2, p2, p2

    mul-int/lit8 p2, p2, 0x3

    .line 674
    iput p2, p0, Lcom/vladsch/flexmark/util/ImageUtils$1;->radius:I

    return-void
.end method


# virtual methods
.method public final filterRGB(III)I
    .locals 3

    .line 677
    iget p1, p0, Lcom/vladsch/flexmark/util/ImageUtils$1;->val$tolerance:I

    const p2, 0xffffff

    const/high16 v0, -0x1000000

    if-nez p1, :cond_0

    or-int p1, p3, v0

    iget v1, p0, Lcom/vladsch/flexmark/util/ImageUtils$1;->markerRGB:I

    if-ne p1, v1, :cond_0

    and-int p1, p3, p2

    return p1

    :cond_0
    and-int p1, p3, v0

    if-ne p1, v0, :cond_1

    const/high16 p1, 0xff0000

    and-int v0, p3, p1

    shr-int/lit8 v0, v0, 0x10

    .line 683
    iget v1, p0, Lcom/vladsch/flexmark/util/ImageUtils$1;->markerRGB:I

    and-int/2addr p1, v1

    shr-int/lit8 p1, p1, 0x10

    sub-int/2addr v0, p1

    const p1, 0xff00

    and-int v2, p3, p1

    shr-int/lit8 v2, v2, 0x8

    and-int/2addr p1, v1

    shr-int/lit8 p1, p1, 0x8

    sub-int/2addr v2, p1

    and-int/lit16 p1, p3, 0xff

    and-int/lit16 v1, v1, 0xff

    sub-int/2addr p1, v1

    mul-int v0, v0, v0

    mul-int v2, v2, v2

    add-int/2addr v0, v2

    mul-int p1, p1, p1

    add-int/2addr v0, p1

    .line 688
    iget p1, p0, Lcom/vladsch/flexmark/util/ImageUtils$1;->radius:I

    if-gt v0, p1, :cond_1

    and-int p1, p3, p2

    return p1

    :cond_1
    return p3
.end method
