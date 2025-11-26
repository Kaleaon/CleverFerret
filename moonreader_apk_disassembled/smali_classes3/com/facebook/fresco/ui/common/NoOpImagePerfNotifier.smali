.class public final Lcom/facebook/fresco/ui/common/NoOpImagePerfNotifier;
.super Ljava/lang/Object;
.source "NoOpImagePerfNotifier.kt"

# interfaces
.implements Lcom/facebook/fresco/ui/common/ImagePerfNotifier;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u0018\u0010\n\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u000cH\u0016\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/facebook/fresco/ui/common/NoOpImagePerfNotifier;",
        "Lcom/facebook/fresco/ui/common/ImagePerfNotifier;",
        "<init>",
        "()V",
        "notifyVisibilityUpdated",
        "",
        "state",
        "Lcom/facebook/fresco/ui/common/ImagePerfState;",
        "visibilityState",
        "Lcom/facebook/fresco/ui/common/VisibilityState;",
        "notifyStatusUpdated",
        "imageLoadStatus",
        "Lcom/facebook/fresco/ui/common/ImageLoadStatus;",
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
.field public static final INSTANCE:Lcom/facebook/fresco/ui/common/NoOpImagePerfNotifier;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/fresco/ui/common/NoOpImagePerfNotifier;

    invoke-direct {v0}, Lcom/facebook/fresco/ui/common/NoOpImagePerfNotifier;-><init>()V

    sput-object v0, Lcom/facebook/fresco/ui/common/NoOpImagePerfNotifier;->INSTANCE:Lcom/facebook/fresco/ui/common/NoOpImagePerfNotifier;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V
    .locals 1

    const-string v0, "state"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "imageLoadStatus"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public notifyVisibilityUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V
    .locals 1

    const-string v0, "state"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "visibilityState"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
