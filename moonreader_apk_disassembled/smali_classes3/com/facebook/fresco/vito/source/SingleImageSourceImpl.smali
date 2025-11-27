.class public final Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;
.super Ljava/lang/Object;
.source "SingleImageSourceImpl.kt"

# interfaces
.implements Lcom/facebook/fresco/vito/source/SingleImageSource;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\u0008\n\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0016\u0008\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u000f\u001a\u00020\u0006J\u0012\u0010\u0010\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\u0006H\u0016J\u0013\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0007H\u0096\u0002J\u0008\u0010\u0014\u001a\u00020\u0015H\u0016J\t\u0010\u0018\u001a\u00020\u0003H\u00c6\u0003J\u0017\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005H\u00c6\u0003J+\u0010\u001a\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0016\u0008\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005H\u00c6\u0001J\t\u0010\u001b\u001a\u00020\u0006H\u00d6\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\"\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0014\u0010\u0016\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u000b\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;",
        "Lcom/facebook/fresco/vito/source/SingleImageSource;",
        "uri",
        "Landroid/net/Uri;",
        "extras",
        "",
        "",
        "",
        "<init>",
        "(Landroid/net/Uri;Ljava/util/Map;)V",
        "getUri",
        "()Landroid/net/Uri;",
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
        "imageUri",
        "getImageUri",
        "component1",
        "component2",
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

.field private final imageUri:Landroid/net/Uri;

.field private final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "uri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->uri:Landroid/net/Uri;

    .line 15
    iput-object p2, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->extras:Ljava/util/Map;

    .line 41
    invoke-virtual {p0}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getUri()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->imageUri:Landroid/net/Uri;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/net/Uri;Ljava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 13
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;-><init>(Landroid/net/Uri;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic copy$default(Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;Landroid/net/Uri;Ljava/util/Map;ILjava/lang/Object;)Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->uri:Landroid/net/Uri;

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-object p2, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->extras:Ljava/util/Map;

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->copy(Landroid/net/Uri;Ljava/util/Map;)Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->uri:Landroid/net/Uri;

    return-object v0
.end method

.method public final component2()Ljava/util/Map;
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

    iget-object v0, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->extras:Ljava/util/Map;

    return-object v0
.end method

.method public final copy(Landroid/net/Uri;Ljava/util/Map;)Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;"
        }
    .end annotation

    const-string v0, "uri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;

    invoke-direct {v0, p1, p2}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;-><init>(Landroid/net/Uri;Ljava/util/Map;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 26
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

    .line 30
    :cond_2
    const-string v1, "null cannot be cast to non-null type com.facebook.fresco.vito.source.SingleImageSourceImpl"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;

    .line 32
    invoke-virtual {p0}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getImageUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getImageUri()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getExtras()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p1}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getExtras()Ljava/util/Map;

    move-result-object p1

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

    .line 18
    invoke-virtual {p0}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getExtras()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getExtras()Ljava/util/Map;
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

    .line 15
    iget-object v0, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->extras:Ljava/util/Map;

    return-object v0
.end method

.method public getImageUri()Landroid/net/Uri;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->imageUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0, p1}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->uri:Landroid/net/Uri;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 36
    invoke-virtual {p0}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getImageUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 37
    invoke-virtual {p0}, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->getExtras()Ljava/util/Map;

    move-result-object v1

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
    .locals 4

    iget-object v0, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->uri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/facebook/fresco/vito/source/SingleImageSourceImpl;->extras:Ljava/util/Map;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SingleImageSourceImpl(uri="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", extras="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
