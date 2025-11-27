.class public Lcom/facebook/fresco/ui/common/BaseControllerListener2;
.super Ljava/lang/Object;
.source "BaseControllerListener2.kt"

# interfaces
.implements Lcom/facebook/fresco/ui/common/ControllerListener2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/fresco/ui/common/BaseControllerListener2$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<INFO:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/fresco/ui/common/ControllerListener2<",
        "TINFO;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u0003\n\u0002\u0008\u0004\u0008\u0016\u0018\u0000 \u0019*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u0002:\u0001\u0019B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J$\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cH\u0016J)\u0010\r\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\u000e\u001a\u0004\u0018\u00018\u00002\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0002\u0010\u0010J\u001f\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\u000e\u001a\u0004\u0018\u00018\u0000H\u0016\u00a2\u0006\u0002\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0016J$\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cH\u0016J\u001a\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cH\u0016J\u0012\u0010\u0018\u001a\u00020\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0016\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/facebook/fresco/ui/common/BaseControllerListener2;",
        "INFO",
        "Lcom/facebook/fresco/ui/common/ControllerListener2;",
        "<init>",
        "()V",
        "onSubmit",
        "",
        "id",
        "",
        "callerContext",
        "",
        "extras",
        "Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;",
        "onFinalImageSet",
        "imageInfo",
        "extraData",
        "(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V",
        "onIntermediateImageSet",
        "(Ljava/lang/String;Ljava/lang/Object;)V",
        "onIntermediateImageFailed",
        "onFailure",
        "throwable",
        "",
        "onRelease",
        "onEmptyEvent",
        "Companion",
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


# static fields
.field public static final Companion:Lcom/facebook/fresco/ui/common/BaseControllerListener2$Companion;

.field private static final NO_OP_LISTENER:Lcom/facebook/fresco/ui/common/ControllerListener2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/fresco/ui/common/ControllerListener2<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/fresco/ui/common/BaseControllerListener2$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/fresco/ui/common/BaseControllerListener2$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/fresco/ui/common/BaseControllerListener2;->Companion:Lcom/facebook/fresco/ui/common/BaseControllerListener2$Companion;

    .line 29
    new-instance v0, Lcom/facebook/fresco/ui/common/BaseControllerListener2;

    invoke-direct {v0}, Lcom/facebook/fresco/ui/common/BaseControllerListener2;-><init>()V

    check-cast v0, Lcom/facebook/fresco/ui/common/ControllerListener2;

    sput-object v0, Lcom/facebook/fresco/ui/common/BaseControllerListener2;->NO_OP_LISTENER:Lcom/facebook/fresco/ui/common/ControllerListener2;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$getNO_OP_LISTENER$cp()Lcom/facebook/fresco/ui/common/ControllerListener2;
    .locals 1

    .line 12
    sget-object v0, Lcom/facebook/fresco/ui/common/BaseControllerListener2;->NO_OP_LISTENER:Lcom/facebook/fresco/ui/common/ControllerListener2;

    return-object v0
.end method

.method public static final getNoOpListener()Lcom/facebook/fresco/ui/common/ControllerListener2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/facebook/fresco/ui/common/ControllerListener2<",
            "TI;>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/fresco/ui/common/BaseControllerListener2;->Companion:Lcom/facebook/fresco/ui/common/BaseControllerListener2$Companion;

    invoke-virtual {v0}, Lcom/facebook/fresco/ui/common/BaseControllerListener2$Companion;->getNoOpListener()Lcom/facebook/fresco/ui/common/ControllerListener2;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public onEmptyEvent(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public onFailure(Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 0

    const-string p2, "id"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public onFinalImageSet(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TINFO;",
            "Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;",
            ")V"
        }
    .end annotation

    const-string p2, "id"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public onIntermediateImageFailed(Ljava/lang/String;)V
    .locals 1

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public onIntermediateImageSet(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TINFO;)V"
        }
    .end annotation

    const-string p2, "id"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public onRelease(Ljava/lang/String;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 0

    const-string p2, "id"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public onSubmit(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 0

    const-string p2, "id"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
