.class public final Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;
.super Ljava/lang/Object;
.source "RequestLoggingListener.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/listener/RequestLoggingListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0006\u0010\t\u001a\u00020\u0007H\u0002\u00a2\u0006\u0002\u0010\nR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\u00020\u00078BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "getElapsedTime",
        "",
        "startTime",
        "endTime",
        "(Ljava/lang/Long;J)J",
        "time",
        "getTime",
        "()J",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$getElapsedTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;Ljava/lang/Long;J)J
    .locals 0

    .line 213
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->getElapsedTime(Ljava/lang/Long;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$getTime(Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;)J
    .locals 2

    .line 213
    invoke-direct {p0}, Lcom/facebook/imagepipeline/listener/RequestLoggingListener$Companion;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method private final getElapsedTime(Ljava/lang/Long;J)J
    .locals 2

    if-eqz p1, :cond_0

    .line 218
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    sub-long/2addr p2, v0

    return-wide p2

    :cond_0
    const-wide/16 p1, -0x1

    return-wide p1
.end method

.method private final getTime()J
    .locals 2

    .line 224
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    return-wide v0
.end method
