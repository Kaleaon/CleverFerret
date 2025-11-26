.class public final Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;
.super Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;
.source "UriModifierInterface.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Unmodified"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003H\u00c6\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003\u00a2\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u00c6\u0001\u00a2\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u00d6\u0003J\t\u0010\u0015\u001a\u00020\u0005H\u00d6\u0001J\t\u0010\u0016\u001a\u00020\u0003H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0018\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0096\u0004\u00a2\u0006\n\n\u0002\u0010\u000c\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;",
        "reason",
        "",
        "bestAllowlistedSize",
        "",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/Integer;)V",
        "getReason",
        "()Ljava/lang/String;",
        "getBestAllowlistedSize",
        "()Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "component1",
        "component2",
        "copy",
        "(Ljava/lang/String;Ljava/lang/Integer;)Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "toString",
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
.field private final bestAllowlistedSize:Ljava/lang/Integer;

.field private final reason:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 2

    const-string v0, "reason"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unmodified(reason=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;-><init>(Ljava/lang/String;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 51
    iput-object p1, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->reason:Ljava/lang/String;

    iput-object p2, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->bestAllowlistedSize:Ljava/lang/Integer;

    return-void
.end method

.method public static synthetic copy$default(Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;Ljava/lang/String;Ljava/lang/Integer;ILjava/lang/Object;)Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->reason:Ljava/lang/String;

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-object p2, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->bestAllowlistedSize:Ljava/lang/Integer;

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->copy(Ljava/lang/String;Ljava/lang/Integer;)Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->bestAllowlistedSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/Integer;)Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;
    .locals 1

    const-string v0, "reason"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;

    invoke-direct {v0, p1, p2}, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;

    iget-object v1, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->reason:Ljava/lang/String;

    iget-object v3, p1, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->reason:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->bestAllowlistedSize:Ljava/lang/Integer;

    iget-object p1, p1, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->bestAllowlistedSize:Ljava/lang/Integer;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public getBestAllowlistedSize()Ljava/lang/Integer;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->bestAllowlistedSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getReason()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->reason:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->bestAllowlistedSize:Ljava/lang/Integer;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->reason:Ljava/lang/String;

    iget-object v1, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;->bestAllowlistedSize:Ljava/lang/Integer;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unmodified(reason="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", bestAllowlistedSize="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
