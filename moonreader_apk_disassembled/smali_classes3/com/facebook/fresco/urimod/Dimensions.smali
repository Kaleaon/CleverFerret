.class public final Lcom/facebook/fresco/urimod/Dimensions;
.super Ljava/lang/Object;
.source "Dimensions.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0008\u0010\n\u001a\u00020\u000bH\u0016J\u0013\u0010\u000c\u001a\u00020\r2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u000f\u001a\u00020\u0003H\u0016J\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0003H\u00c6\u0003J\u001d\u0010\u0012\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0003H\u00c6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0008\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/facebook/fresco/urimod/Dimensions;",
        "",
        "w",
        "",
        "h",
        "<init>",
        "(II)V",
        "getW",
        "()I",
        "getH",
        "toString",
        "",
        "equals",
        "",
        "other",
        "hashCode",
        "component1",
        "component2",
        "copy",
        "urimod_release"
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
.field private final h:I

.field private final w:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/facebook/fresco/urimod/Dimensions;->w:I

    iput p2, p0, Lcom/facebook/fresco/urimod/Dimensions;->h:I

    return-void
.end method

.method public static synthetic copy$default(Lcom/facebook/fresco/urimod/Dimensions;IIILjava/lang/Object;)Lcom/facebook/fresco/urimod/Dimensions;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget p1, p0, Lcom/facebook/fresco/urimod/Dimensions;->w:I

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget p2, p0, Lcom/facebook/fresco/urimod/Dimensions;->h:I

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/facebook/fresco/urimod/Dimensions;->copy(II)Lcom/facebook/fresco/urimod/Dimensions;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/urimod/Dimensions;->w:I

    return v0
.end method

.method public final component2()I
    .locals 1

    iget v0, p0, Lcom/facebook/fresco/urimod/Dimensions;->h:I

    return v0
.end method

.method public final copy(II)Lcom/facebook/fresco/urimod/Dimensions;
    .locals 1

    new-instance v0, Lcom/facebook/fresco/urimod/Dimensions;

    invoke-direct {v0, p1, p2}, Lcom/facebook/fresco/urimod/Dimensions;-><init>(II)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 19
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

    .line 23
    :cond_2
    const-string v1, "null cannot be cast to non-null type com.facebook.fresco.urimod.Dimensions"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/fresco/urimod/Dimensions;

    .line 25
    iget v1, p0, Lcom/facebook/fresco/urimod/Dimensions;->w:I

    iget v3, p1, Lcom/facebook/fresco/urimod/Dimensions;->w:I

    if-ne v1, v3, :cond_3

    iget v1, p0, Lcom/facebook/fresco/urimod/Dimensions;->h:I

    iget p1, p1, Lcom/facebook/fresco/urimod/Dimensions;->h:I

    if-ne v1, p1, :cond_3

    return v0

    :cond_3
    return v2
.end method

.method public final getH()I
    .locals 1

    .line 11
    iget v0, p0, Lcom/facebook/fresco/urimod/Dimensions;->h:I

    return v0
.end method

.method public final getW()I
    .locals 1

    .line 11
    iget v0, p0, Lcom/facebook/fresco/urimod/Dimensions;->w:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 28
    iget v0, p0, Lcom/facebook/fresco/urimod/Dimensions;->w:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/facebook/fresco/urimod/Dimensions;->h:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 13
    iget v0, p0, Lcom/facebook/fresco/urimod/Dimensions;->w:I

    iget v1, p0, Lcom/facebook/fresco/urimod/Dimensions;->h:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
