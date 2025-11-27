.class final Lcom/facebook/imageutils/TiffUtil$TiffHeader;
.super Ljava/lang/Object;
.source "TiffUtil.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imageutils/TiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TiffHeader"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0008\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0004\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u001a\u0010\t\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR\u001a\u0010\u000f\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u000c\"\u0004\u0008\u0011\u0010\u000e\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/facebook/imageutils/TiffUtil$TiffHeader;",
        "",
        "<init>",
        "()V",
        "isLittleEndian",
        "",
        "()Z",
        "setLittleEndian",
        "(Z)V",
        "byteOrder",
        "",
        "getByteOrder",
        "()I",
        "setByteOrder",
        "(I)V",
        "firstIfdOffset",
        "getFirstIfdOffset",
        "setFirstIfdOffset",
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


# instance fields
.field private byteOrder:I

.field private firstIfdOffset:I

.field private isLittleEndian:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getByteOrder()I
    .locals 1

    .line 183
    iget v0, p0, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->byteOrder:I

    return v0
.end method

.method public final getFirstIfdOffset()I
    .locals 1

    .line 184
    iget v0, p0, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->firstIfdOffset:I

    return v0
.end method

.method public final isLittleEndian()Z
    .locals 1

    .line 182
    iget-boolean v0, p0, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->isLittleEndian:Z

    return v0
.end method

.method public final setByteOrder(I)V
    .locals 0

    .line 183
    iput p1, p0, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->byteOrder:I

    return-void
.end method

.method public final setFirstIfdOffset(I)V
    .locals 0

    .line 184
    iput p1, p0, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->firstIfdOffset:I

    return-void
.end method

.method public final setLittleEndian(Z)V
    .locals 0

    .line 182
    iput-boolean p1, p0, Lcom/facebook/imageutils/TiffUtil$TiffHeader;->isLittleEndian:Z

    return-void
.end method
