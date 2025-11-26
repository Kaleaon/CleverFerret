.class public final Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;
.super Ljava/lang/Object;
.source "IncreasingQualityImageSource.kt"

# interfaces
.implements Lcom/facebook/fresco/vito/source/ImageSource;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\u0008\u000b\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0008\u0086\u0008\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0001\u0012\u0016\u0008\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0010\u001a\u00020\u0006J\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0010\u001a\u00020\u0006J\u0013\u0010\u0012\u001a\u00020\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0007H\u0096\u0002J\u0008\u0010\u0015\u001a\u00020\u0016H\u0016J\t\u0010\u0017\u001a\u00020\u0001H\u00c6\u0003J\t\u0010\u0018\u001a\u00020\u0001H\u00c6\u0003J\u0017\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005H\u00c6\u0003J5\u0010\u001a\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00012\u0016\u0008\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005H\u00c6\u0001J\t\u0010\u001b\u001a\u00020\u0006H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0003\u001a\u00020\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\u000bR\u001f\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;",
        "Lcom/facebook/fresco/vito/source/ImageSource;",
        "lowResSource",
        "highResSource",
        "extras",
        "",
        "",
        "",
        "<init>",
        "(Lcom/facebook/fresco/vito/source/ImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Ljava/util/Map;)V",
        "getLowResSource",
        "()Lcom/facebook/fresco/vito/source/ImageSource;",
        "getHighResSource",
        "getExtras",
        "()Ljava/util/Map;",
        "getExtra",
        "key",
        "getStringExtra",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "component1",
        "component2",
        "component3",
        "copy",
        "toString",
        "source_release"
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
.field private final extras:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

.field private final lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;


# direct methods
.method public constructor <init>(Lcom/facebook/fresco/vito/source/ImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/fresco/vito/source/ImageSource;",
            "Lcom/facebook/fresco/vito/source/ImageSource;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "lowResSource"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "highResSource"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    .line 13
    iput-object p2, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    .line 14
    iput-object p3, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/facebook/fresco/vito/source/ImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Ljava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 11
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;-><init>(Lcom/facebook/fresco/vito/source/ImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic copy$default(Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Ljava/util/Map;ILjava/lang/Object;)Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->copy(Lcom/facebook/fresco/vito/source/ImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Ljava/util/Map;)Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/facebook/fresco/vito/source/ImageSource;
    .locals 1

    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    return-object v0
.end method

.method public final component2()Lcom/facebook/fresco/vito/source/ImageSource;
    .locals 1

    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    return-object v0
.end method

.method public final component3()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    return-object v0
.end method

.method public final copy(Lcom/facebook/fresco/vito/source/ImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Ljava/util/Map;)Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/fresco/vito/source/ImageSource;",
            "Lcom/facebook/fresco/vito/source/ImageSource;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;"
        }
    .end annotation

    const-string v0, "lowResSource"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "highResSource"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;

    invoke-direct {v0, p1, p2, p3}, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;-><init>(Lcom/facebook/fresco/vito/source/ImageSource;Lcom/facebook/fresco/vito/source/ImageSource;Ljava/util/Map;)V

    return-object v0
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
    const-string v1, "null cannot be cast to non-null type com.facebook.fresco.vito.source.IncreasingQualityImageSource"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;

    .line 31
    iget-object v1, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    iget-object v3, p1, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 32
    iget-object v1, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    iget-object v3, p1, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 33
    iget-object v1, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    iget-object p1, p1, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    return v0

    :cond_3
    return v2
.end method

.method public final getExtra(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final getExtras()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 14
    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    return-object v0
.end method

.method public final getHighResSource()Lcom/facebook/fresco/vito/source/ImageSource;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    return-object v0
.end method

.method public final getLowResSource()Lcom/facebook/fresco/vito/source/ImageSource;
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    return-object v0
.end method

.method public final getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    invoke-virtual {p0, p1}, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public hashCode()I
    .locals 2

    .line 37
    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 38
    iget-object v1, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 39
    iget-object v1, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->lowResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    iget-object v1, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->highResSource:Lcom/facebook/fresco/vito/source/ImageSource;

    iget-object v2, p0, Lcom/facebook/fresco/vito/source/IncreasingQualityImageSource;->extras:Ljava/util/Map;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "IncreasingQualityImageSource(lowResSource="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", highResSource="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", extras="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
