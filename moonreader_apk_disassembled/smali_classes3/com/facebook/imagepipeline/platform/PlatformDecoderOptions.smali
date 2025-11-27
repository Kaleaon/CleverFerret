.class public final Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;
.super Ljava/lang/Object;
.source "PlatformDecoderOptions.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u001b\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;",
        "",
        "avoidPoolGet",
        "",
        "avoidPoolRelease",
        "<init>",
        "(ZZ)V",
        "getAvoidPoolGet",
        "()Z",
        "getAvoidPoolRelease",
        "imagepipeline_release"
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
.field private final avoidPoolGet:Z

.field private final avoidPoolRelease:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v2, v0, v1}, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;-><init>(ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;->avoidPoolGet:Z

    .line 12
    iput-boolean p2, p0, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;->avoidPoolRelease:Z

    return-void
.end method

.method public synthetic constructor <init>(ZZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p4, p3, 0x1

    const/4 v0, 0x0

    if-eqz p4, :cond_0

    const/4 p1, 0x0

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    const/4 p2, 0x0

    .line 10
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;-><init>(ZZ)V

    return-void
.end method


# virtual methods
.method public final getAvoidPoolGet()Z
    .locals 1

    .line 11
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;->avoidPoolGet:Z

    return v0
.end method

.method public final getAvoidPoolRelease()Z
    .locals 1

    .line 12
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/platform/PlatformDecoderOptions;->avoidPoolRelease:Z

    return v0
.end method
