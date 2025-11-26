.class public final Lcom/facebook/fresco/ui/common/DimensionsInfo;
.super Ljava/lang/Object;
.source "DimensionsInfo.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0002\u0008\u000c\u0008\u0086\u0008\u0018\u00002\u00020\u0001B?\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0013\u0010\u0016\u001a\u00020\u00172\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u0019\u001a\u00020\u0003H\u0016J\t\u0010\u001a\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001b\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001c\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001d\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001e\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001f\u001a\u00020\u0003H\u00c6\u0003J\t\u0010 \u001a\u00020\nH\u00c6\u0003JO\u0010!\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00032\u0008\u0008\u0002\u0010\t\u001a\u00020\nH\u00c6\u0001J\t\u0010\"\u001a\u00020\nH\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u000eR\u0011\u0010\u0008\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u000eR\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006#"
    }
    d2 = {
        "Lcom/facebook/fresco/ui/common/DimensionsInfo;",
        "",
        "viewportWidth",
        "",
        "viewportHeight",
        "encodedImageWidth",
        "encodedImageHeight",
        "decodedImageWidth",
        "decodedImageHeight",
        "scaleType",
        "",
        "<init>",
        "(IIIIIILjava/lang/String;)V",
        "getViewportWidth",
        "()I",
        "getViewportHeight",
        "getEncodedImageWidth",
        "getEncodedImageHeight",
        "getDecodedImageWidth",
        "getDecodedImageHeight",
        "getScaleType",
        "()Ljava/lang/String;",
        "equals",
        "",
        "other",
        "hashCode",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "copy",
        "toString",
        "ui-common_release"
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
.field private final decodedImageHeight:I

.field private final decodedImageWidth:I

.field private final encodedImageHeight:I

.field private final encodedImageWidth:I

.field private final scaleType:Ljava/lang/String;

.field private final viewportHeight:I

.field private final viewportWidth:I


# direct methods
.method public constructor <init>(IIIIIILjava/lang/String;)V
    .locals 1

    const-string v0, "scaleType"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput p1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportWidth:I

    .line 13
    iput p2, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportHeight:I

    .line 14
    iput p3, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageWidth:I

    .line 15
    iput p4, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageHeight:I

    .line 16
    iput p5, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageWidth:I

    .line 17
    iput p6, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageHeight:I

    .line 18
    iput-object p7, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->scaleType:Ljava/lang/String;

    return-void
.end method

.method public static synthetic copy$default(Lcom/facebook/fresco/ui/common/DimensionsInfo;IIIIIILjava/lang/String;ILjava/lang/Object;)Lcom/facebook/fresco/ui/common/DimensionsInfo;
    .locals 0

    and-int/lit8 p9, p8, 0x1

    if-eqz p9, :cond_0

    iget p1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportWidth:I

    :cond_0
    and-int/lit8 p9, p8, 0x2

    if-eqz p9, :cond_1

    iget p2, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportHeight:I

    :cond_1
    and-int/lit8 p9, p8, 0x4

    if-eqz p9, :cond_2

    iget p3, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageWidth:I

    :cond_2
    and-int/lit8 p9, p8, 0x8

    if-eqz p9, :cond_3

    iget p4, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageHeight:I

    :cond_3
    and-int/lit8 p9, p8, 0x10

    if-eqz p9, :cond_4

    iget p5, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageWidth:I

    :cond_4
    and-int/lit8 p9, p8, 0x20

    if-eqz p9, :cond_5

    iget p6, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageHeight:I

    :cond_5
    and-int/lit8 p8, p8, 0x40

    if-eqz p8, :cond_6

    iget-object p7, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->scaleType:Ljava/lang/String;

    :cond_6
    move p8, p6

    move-object p9, p7

    move p6, p4

    move p7, p5

    move p4, p2

    move p5, p3

    move-object p2, p0

    move p3, p1

    invoke-virtual/range {p2 .. p9}, Lcom/facebook/fresco/ui/common/DimensionsInfo;->copy(IIIIIILjava/lang/String;)Lcom/facebook/fresco/ui/common/DimensionsInfo;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportWidth:I

    return v0
.end method

.method public final component2()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportHeight:I

    return v0
.end method

.method public final component3()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageWidth:I

    return v0
.end method

.method public final component4()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageHeight:I

    return v0
.end method

.method public final component5()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageWidth:I

    return v0
.end method

.method public final component6()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageHeight:I

    return v0
.end method

.method public final component7()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->scaleType:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(IIIIIILjava/lang/String;)Lcom/facebook/fresco/ui/common/DimensionsInfo;
    .locals 9

    const-string v0, "scaleType"

    move-object/from16 v8, p7

    invoke-static {v8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/facebook/fresco/ui/common/DimensionsInfo;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v1 .. v8}, Lcom/facebook/fresco/ui/common/DimensionsInfo;-><init>(IIIIIILjava/lang/String;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 25
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    return v2

    .line 29
    :cond_2
    const-string v1, "null cannot be cast to non-null type com.facebook.fresco.ui.common.DimensionsInfo"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/fresco/ui/common/DimensionsInfo;

    .line 31
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportWidth:I

    iget v3, p1, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportWidth:I

    if-ne v1, v3, :cond_3

    .line 32
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportHeight:I

    iget v3, p1, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportHeight:I

    if-ne v1, v3, :cond_3

    .line 33
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageWidth:I

    iget v3, p1, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageWidth:I

    if-ne v1, v3, :cond_3

    .line 34
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageHeight:I

    iget v3, p1, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageHeight:I

    if-ne v1, v3, :cond_3

    .line 35
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageWidth:I

    iget v3, p1, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageWidth:I

    if-ne v1, v3, :cond_3

    .line 36
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageHeight:I

    iget v3, p1, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageHeight:I

    if-ne v1, v3, :cond_3

    .line 37
    iget-object v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->scaleType:Ljava/lang/String;

    iget-object p1, p1, Lcom/facebook/fresco/ui/common/DimensionsInfo;->scaleType:Ljava/lang/String;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    return v0

    :cond_3
    return v2
.end method

.method public final getDecodedImageHeight()I
    .locals 1

    .line 17
    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageHeight:I

    return v0
.end method

.method public final getDecodedImageWidth()I
    .locals 1

    .line 16
    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageWidth:I

    return v0
.end method

.method public final getEncodedImageHeight()I
    .locals 1

    .line 15
    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageHeight:I

    return v0
.end method

.method public final getEncodedImageWidth()I
    .locals 1

    .line 14
    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageWidth:I

    return v0
.end method

.method public final getScaleType()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->scaleType:Ljava/lang/String;

    return-object v0
.end method

.method public final getViewportHeight()I
    .locals 1

    .line 13
    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportHeight:I

    return v0
.end method

.method public final getViewportWidth()I
    .locals 1

    .line 12
    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportWidth:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 41
    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportWidth:I

    mul-int/lit8 v0, v0, 0x1f

    .line 42
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportHeight:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 43
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageWidth:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 44
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageHeight:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 45
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageWidth:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 46
    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageHeight:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 47
    iget-object v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->scaleType:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    iget v0, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportWidth:I

    iget v1, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->viewportHeight:I

    iget v2, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageWidth:I

    iget v3, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->encodedImageHeight:I

    iget v4, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageWidth:I

    iget v5, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->decodedImageHeight:I

    iget-object v6, p0, Lcom/facebook/fresco/ui/common/DimensionsInfo;->scaleType:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "DimensionsInfo(viewportWidth="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", viewportHeight="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", encodedImageWidth="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", encodedImageHeight="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", decodedImageWidth="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", decodedImageHeight="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", scaleType="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
