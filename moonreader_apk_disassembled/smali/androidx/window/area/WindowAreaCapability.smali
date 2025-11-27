.class public final Landroidx/window/area/WindowAreaCapability;
.super Ljava/lang/Object;
.source "WindowAreaCapability.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/window/area/WindowAreaCapability$Operation;,
        Landroidx/window/area/WindowAreaCapability$Status;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\u0012\u0013B\u0017\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0013\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u000e\u001a\u00020\u000fH\u0016J\u0008\u0010\u0010\u001a\u00020\u0011H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u0014"
    }
    d2 = {
        "Landroidx/window/area/WindowAreaCapability;",
        "",
        "operation",
        "Landroidx/window/area/WindowAreaCapability$Operation;",
        "status",
        "Landroidx/window/area/WindowAreaCapability$Status;",
        "(Landroidx/window/area/WindowAreaCapability$Operation;Landroidx/window/area/WindowAreaCapability$Status;)V",
        "getOperation",
        "()Landroidx/window/area/WindowAreaCapability$Operation;",
        "getStatus",
        "()Landroidx/window/area/WindowAreaCapability$Status;",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "Operation",
        "Status",
        "window_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final operation:Landroidx/window/area/WindowAreaCapability$Operation;

.field private final status:Landroidx/window/area/WindowAreaCapability$Status;


# direct methods
.method public constructor <init>(Landroidx/window/area/WindowAreaCapability$Operation;Landroidx/window/area/WindowAreaCapability$Status;)V
    .locals 1

    const-string v0, "operation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Landroidx/window/area/WindowAreaCapability;->operation:Landroidx/window/area/WindowAreaCapability$Operation;

    iput-object p2, p0, Landroidx/window/area/WindowAreaCapability;->status:Landroidx/window/area/WindowAreaCapability$Status;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 84
    instance-of v0, p1, Landroidx/window/area/WindowAreaCapability;

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Landroidx/window/area/WindowAreaCapability;->operation:Landroidx/window/area/WindowAreaCapability$Operation;

    check-cast p1, Landroidx/window/area/WindowAreaCapability;

    iget-object v1, p1, Landroidx/window/area/WindowAreaCapability;->operation:Landroidx/window/area/WindowAreaCapability$Operation;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Landroidx/window/area/WindowAreaCapability;->status:Landroidx/window/area/WindowAreaCapability$Status;

    iget-object p1, p1, Landroidx/window/area/WindowAreaCapability;->status:Landroidx/window/area/WindowAreaCapability$Status;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final getOperation()Landroidx/window/area/WindowAreaCapability$Operation;
    .locals 1

    .line 24
    iget-object v0, p0, Landroidx/window/area/WindowAreaCapability;->operation:Landroidx/window/area/WindowAreaCapability$Operation;

    return-object v0
.end method

.method public final getStatus()Landroidx/window/area/WindowAreaCapability$Status;
    .locals 1

    .line 24
    iget-object v0, p0, Landroidx/window/area/WindowAreaCapability;->status:Landroidx/window/area/WindowAreaCapability$Status;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 90
    iget-object v0, p0, Landroidx/window/area/WindowAreaCapability;->operation:Landroidx/window/area/WindowAreaCapability$Operation;

    invoke-virtual {v0}, Landroidx/window/area/WindowAreaCapability$Operation;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 91
    iget-object v1, p0, Landroidx/window/area/WindowAreaCapability;->status:Landroidx/window/area/WindowAreaCapability$Status;

    invoke-virtual {v1}, Landroidx/window/area/WindowAreaCapability$Status;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Operation: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroidx/window/area/WindowAreaCapability;->operation:Landroidx/window/area/WindowAreaCapability$Operation;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ": Status: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/window/area/WindowAreaCapability;->status:Landroidx/window/area/WindowAreaCapability$Status;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
