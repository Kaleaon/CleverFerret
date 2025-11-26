.class public final Lcom/facebook/fresco/ui/common/ImagePerfData;
.super Ljava/lang/Object;
.source "ImagePerfData.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/fresco/ui/common/ImagePerfData$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u0007\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008D\u0018\u0000 q2\u00020\u0001:\u0001qB\u00fd\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0001\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0001\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\u0001\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\u000c\u001a\u00020\u000b\u0012\u0006\u0010\r\u001a\u00020\u000b\u0012\u0006\u0010\u000e\u001a\u00020\u000b\u0012\u0006\u0010\u000f\u001a\u00020\u000b\u0012\u0006\u0010\u0010\u001a\u00020\u000b\u0012\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u000b\u0012\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\u0013\u001a\u00020\u0014\u0012\u0006\u0010\u0015\u001a\u00020\u0016\u0012\u0006\u0010\u0017\u001a\u00020\u0016\u0012\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u0012\u0006\u0010\u001a\u001a\u00020\u001b\u0012\u0006\u0010\u001c\u001a\u00020\u000b\u0012\u0006\u0010\u001d\u001a\u00020\u000b\u0012\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001f\u0012\u0008\u0010 \u001a\u0004\u0018\u00010!\u0012\u0008\u0010\"\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010#\u001a\u0004\u0018\u00010\u0005\u0012\u000e\u0010$\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010%\u0012\u0008\u0010&\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\'\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010(\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010)\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010*\u001a\u0004\u0018\u00010\u000b\u0012\u0008\u0010+\u001a\u0004\u0018\u00010\u0005\u0012\u0018\u0010,\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000b0.0-\u0012\u0006\u0010/\u001a\u00020\u0014\u0012\u0008\u00100\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u00101\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u00102\u001a\u0004\u0018\u00010\u0016\u0012\u0008\u00103\u001a\u0004\u0018\u00010\u0016\u00a2\u0006\u0004\u00084\u00105J\u0006\u0010p\u001a\u00020\u0005R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00086\u00107R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00088\u00109R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008:\u00109R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008;\u0010<R\u0013\u0010\u0008\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008=\u0010<R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008>\u0010<R\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008?\u0010@R\u0011\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008A\u0010@R\u0011\u0010\r\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008B\u0010@R\u0011\u0010\u000e\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008C\u0010@R\u0011\u0010\u000f\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008D\u0010@R\u0011\u0010\u0010\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008E\u0010@R\u0015\u0010\u0011\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\n\n\u0002\u0010H\u001a\u0004\u0008F\u0010GR\u0015\u0010\u0012\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\n\n\u0002\u0010H\u001a\u0004\u0008I\u0010GR\u0011\u0010\u0013\u001a\u00020\u0014\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010JR\u0011\u0010\u0015\u001a\u00020\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008K\u0010LR\u0011\u0010\u0017\u001a\u00020\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008M\u0010LR\u0013\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008N\u0010OR\u0011\u0010\u001a\u001a\u00020\u001b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008P\u0010QR\u0011\u0010\u001c\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008R\u0010@R\u0011\u0010\u001d\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008S\u0010@R\u0013\u0010\u001e\u001a\u0004\u0018\u00010\u001f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008T\u0010UR\u0013\u0010 \u001a\u0004\u0018\u00010!\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008V\u0010WR\u0013\u0010\"\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008X\u00109R\u0013\u0010#\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008Y\u00109R\u001b\u0010$\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010%\u00a2\u0006\n\n\u0002\u0010\\\u001a\u0004\u0008Z\u0010[R\u0013\u0010&\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008]\u00109R\u0013\u0010\'\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008^\u00109R\u0013\u0010(\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008_\u00109R\u0013\u0010)\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008`\u00109R\u0015\u0010*\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\n\n\u0002\u0010H\u001a\u0004\u0008a\u0010GR\u0013\u0010+\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008b\u00109R#\u0010,\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000b0.0-\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008c\u0010dR\u0011\u0010/\u001a\u00020\u0014\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008e\u0010JR\u0013\u00100\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008f\u00109R\u0013\u00101\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008g\u00109R\u0015\u00102\u001a\u0004\u0018\u00010\u0016\u00a2\u0006\n\n\u0002\u0010j\u001a\u0004\u0008h\u0010iR\u0015\u00103\u001a\u0004\u0018\u00010\u0016\u00a2\u0006\n\n\u0002\u0010j\u001a\u0004\u0008k\u0010iR\u0011\u0010l\u001a\u00020\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008m\u0010LR\u0011\u0010n\u001a\u00020\u000b8F\u00a2\u0006\u0006\u001a\u0004\u0008o\u0010@\u00a8\u0006r"
    }
    d2 = {
        "Lcom/facebook/fresco/ui/common/ImagePerfData;",
        "",
        "infra",
        "Lcom/facebook/fresco/ui/common/ImageRenderingInfra;",
        "controllerId",
        "",
        "requestId",
        "imageRequest",
        "callerContext",
        "imageInfo",
        "controllerSubmitTimeMs",
        "",
        "intermediateImageLoadTimeMs",
        "controllerFinalImageSetTimeMs",
        "controllerFailureTimeMs",
        "imageRequestStartTimeMs",
        "imageRequestEndTimeMs",
        "emptyEventTimestampNs",
        "releasedEventTimestampNs",
        "isPrefetch",
        "",
        "onScreenWidthPx",
        "",
        "onScreenHeightPx",
        "errorThrowable",
        "",
        "visibilityState",
        "Lcom/facebook/fresco/ui/common/VisibilityState;",
        "visibilityEventTimeMs",
        "invisibilityEventTimeMs",
        "dimensionsInfo",
        "Lcom/facebook/fresco/ui/common/DimensionsInfo;",
        "extraData",
        "Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;",
        "callingClassNameOnVisible",
        "rootContextNameOnVisible",
        "contextChainArrayOnVisible",
        "",
        "contextChainExtrasOnVisible",
        "contentIdOnVisible",
        "surfaceOnVisible",
        "subSurfaceOnVisible",
        "msSinceLastNavigationOnVisible",
        "startupStatusOnVisible",
        "intermediateImageSetTimes",
        "",
        "Lkotlin/Pair;",
        "newIntermediateImageSetPointAvailable",
        "errorMessageOnFailure",
        "errorStacktraceStringOnFailure",
        "errorCodeOnFailure",
        "densityDpiOnSuccess",
        "<init>",
        "(Lcom/facebook/fresco/ui/common/ImageRenderingInfra;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JJJJJJLjava/lang/Long;Ljava/lang/Long;ZIILjava/lang/Throwable;Lcom/facebook/fresco/ui/common/VisibilityState;JJLcom/facebook/fresco/ui/common/DimensionsInfo;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V",
        "getInfra",
        "()Lcom/facebook/fresco/ui/common/ImageRenderingInfra;",
        "getControllerId",
        "()Ljava/lang/String;",
        "getRequestId",
        "getImageRequest",
        "()Ljava/lang/Object;",
        "getCallerContext",
        "getImageInfo",
        "getControllerSubmitTimeMs",
        "()J",
        "getIntermediateImageLoadTimeMs",
        "getControllerFinalImageSetTimeMs",
        "getControllerFailureTimeMs",
        "getImageRequestStartTimeMs",
        "getImageRequestEndTimeMs",
        "getEmptyEventTimestampNs",
        "()Ljava/lang/Long;",
        "Ljava/lang/Long;",
        "getReleasedEventTimestampNs",
        "()Z",
        "getOnScreenWidthPx",
        "()I",
        "getOnScreenHeightPx",
        "getErrorThrowable",
        "()Ljava/lang/Throwable;",
        "getVisibilityState",
        "()Lcom/facebook/fresco/ui/common/VisibilityState;",
        "getVisibilityEventTimeMs",
        "getInvisibilityEventTimeMs",
        "getDimensionsInfo",
        "()Lcom/facebook/fresco/ui/common/DimensionsInfo;",
        "getExtraData",
        "()Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;",
        "getCallingClassNameOnVisible",
        "getRootContextNameOnVisible",
        "getContextChainArrayOnVisible",
        "()[Ljava/lang/String;",
        "[Ljava/lang/String;",
        "getContextChainExtrasOnVisible",
        "getContentIdOnVisible",
        "getSurfaceOnVisible",
        "getSubSurfaceOnVisible",
        "getMsSinceLastNavigationOnVisible",
        "getStartupStatusOnVisible",
        "getIntermediateImageSetTimes",
        "()Ljava/util/List;",
        "getNewIntermediateImageSetPointAvailable",
        "getErrorMessageOnFailure",
        "getErrorStacktraceStringOnFailure",
        "getErrorCodeOnFailure",
        "()Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "getDensityDpiOnSuccess",
        "instanceId",
        "getInstanceId",
        "finalImageLoadTimeMs",
        "getFinalImageLoadTimeMs",
        "createDebugString",
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
.field public static final Companion:Lcom/facebook/fresco/ui/common/ImagePerfData$Companion;

.field public static final UNSET:J = -0x1L


# instance fields
.field private final callerContext:Ljava/lang/Object;

.field private final callingClassNameOnVisible:Ljava/lang/String;

.field private final contentIdOnVisible:Ljava/lang/String;

.field private final contextChainArrayOnVisible:[Ljava/lang/String;

.field private final contextChainExtrasOnVisible:Ljava/lang/String;

.field private final controllerFailureTimeMs:J

.field private final controllerFinalImageSetTimeMs:J

.field private final controllerId:Ljava/lang/String;

.field private final controllerSubmitTimeMs:J

.field private final densityDpiOnSuccess:Ljava/lang/Integer;

.field private final dimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

.field private final emptyEventTimestampNs:Ljava/lang/Long;

.field private final errorCodeOnFailure:Ljava/lang/Integer;

.field private final errorMessageOnFailure:Ljava/lang/String;

.field private final errorStacktraceStringOnFailure:Ljava/lang/String;

.field private final errorThrowable:Ljava/lang/Throwable;

.field private final extraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

.field private final imageInfo:Ljava/lang/Object;

.field private final imageRequest:Ljava/lang/Object;

.field private final imageRequestEndTimeMs:J

.field private final imageRequestStartTimeMs:J

.field private final infra:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

.field private final instanceId:I

.field private final intermediateImageLoadTimeMs:J

.field private final intermediateImageSetTimes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lkotlin/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private final invisibilityEventTimeMs:J

.field private final isPrefetch:Z

.field private final msSinceLastNavigationOnVisible:Ljava/lang/Long;

.field private final newIntermediateImageSetPointAvailable:Z

.field private final onScreenHeightPx:I

.field private final onScreenWidthPx:I

.field private final releasedEventTimestampNs:Ljava/lang/Long;

.field private final requestId:Ljava/lang/String;

.field private final rootContextNameOnVisible:Ljava/lang/String;

.field private final startupStatusOnVisible:Ljava/lang/String;

.field private final subSurfaceOnVisible:Ljava/lang/String;

.field private final surfaceOnVisible:Ljava/lang/String;

.field private final visibilityEventTimeMs:J

.field private final visibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/fresco/ui/common/ImagePerfData$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfData$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/fresco/ui/common/ImagePerfData;->Companion:Lcom/facebook/fresco/ui/common/ImagePerfData$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/fresco/ui/common/ImageRenderingInfra;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JJJJJJLjava/lang/Long;Ljava/lang/Long;ZIILjava/lang/Throwable;Lcom/facebook/fresco/ui/common/VisibilityState;JJLcom/facebook/fresco/ui/common/DimensionsInfo;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/fresco/ui/common/ImageRenderingInfra;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "JJJJJJ",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "ZII",
            "Ljava/lang/Throwable;",
            "Lcom/facebook/fresco/ui/common/VisibilityState;",
            "JJ",
            "Lcom/facebook/fresco/ui/common/DimensionsInfo;",
            "Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lkotlin/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p25

    move-object/from16 v1, p41

    const-string v2, "infra"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "visibilityState"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "intermediateImageSetTimes"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->infra:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 15
    iput-object p2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerId:Ljava/lang/String;

    .line 16
    iput-object p3, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->requestId:Ljava/lang/String;

    .line 17
    iput-object p4, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequest:Ljava/lang/Object;

    .line 18
    iput-object p5, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->callerContext:Ljava/lang/Object;

    .line 19
    iput-object p6, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageInfo:Ljava/lang/Object;

    .line 20
    iput-wide p7, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerSubmitTimeMs:J

    .line 21
    iput-wide p9, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->intermediateImageLoadTimeMs:J

    .line 22
    iput-wide p11, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerFinalImageSetTimeMs:J

    move-wide/from16 p3, p13

    .line 23
    iput-wide p3, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerFailureTimeMs:J

    move-wide/from16 p3, p15

    .line 24
    iput-wide p3, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequestStartTimeMs:J

    move-wide/from16 p3, p17

    .line 25
    iput-wide p3, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequestEndTimeMs:J

    move-object/from16 p1, p19

    .line 26
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->emptyEventTimestampNs:Ljava/lang/Long;

    move-object/from16 p1, p20

    .line 27
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->releasedEventTimestampNs:Ljava/lang/Long;

    move/from16 p1, p21

    .line 28
    iput-boolean p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->isPrefetch:Z

    move/from16 p1, p22

    .line 29
    iput p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->onScreenWidthPx:I

    move/from16 p1, p23

    .line 30
    iput p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->onScreenHeightPx:I

    move-object/from16 p1, p24

    .line 31
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->errorThrowable:Ljava/lang/Throwable;

    .line 32
    iput-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->visibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    move-wide/from16 p3, p26

    .line 33
    iput-wide p3, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->visibilityEventTimeMs:J

    move-wide/from16 p3, p28

    .line 34
    iput-wide p3, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->invisibilityEventTimeMs:J

    move-object/from16 p1, p30

    .line 35
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->dimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    move-object/from16 p1, p31

    .line 36
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->extraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    move-object/from16 p1, p32

    .line 37
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->callingClassNameOnVisible:Ljava/lang/String;

    move-object/from16 p1, p33

    .line 38
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->rootContextNameOnVisible:Ljava/lang/String;

    move-object/from16 p1, p34

    .line 39
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->contextChainArrayOnVisible:[Ljava/lang/String;

    move-object/from16 p1, p35

    .line 40
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->contextChainExtrasOnVisible:Ljava/lang/String;

    move-object/from16 p1, p36

    .line 41
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->contentIdOnVisible:Ljava/lang/String;

    move-object/from16 p1, p37

    .line 42
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->surfaceOnVisible:Ljava/lang/String;

    move-object/from16 p1, p38

    .line 43
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->subSurfaceOnVisible:Ljava/lang/String;

    move-object/from16 p1, p39

    .line 44
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->msSinceLastNavigationOnVisible:Ljava/lang/Long;

    move-object/from16 p1, p40

    .line 45
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->startupStatusOnVisible:Ljava/lang/String;

    .line 46
    iput-object v1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->intermediateImageSetTimes:Ljava/util/List;

    move/from16 p1, p42

    .line 47
    iput-boolean p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->newIntermediateImageSetPointAvailable:Z

    move-object/from16 p1, p43

    .line 48
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->errorMessageOnFailure:Ljava/lang/String;

    move-object/from16 p1, p44

    .line 49
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->errorStacktraceStringOnFailure:Ljava/lang/String;

    move-object/from16 p1, p45

    .line 50
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->errorCodeOnFailure:Ljava/lang/Integer;

    move-object/from16 p1, p46

    .line 51
    iput-object p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->densityDpiOnSuccess:Ljava/lang/Integer;

    if-eqz p2, :cond_0

    .line 54
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput p1, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->instanceId:I

    return-void
.end method


# virtual methods
.method public final createDebugString()Ljava/lang/String;
    .locals 4

    .line 65
    invoke-static {p0}, Lcom/facebook/common/internal/Objects;->toStringHelper(Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 66
    const-string v1, "rendering Infra"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->infra:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 67
    const-string v1, "controller ID"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 68
    const-string v1, "request ID"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->requestId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 69
    const-string v1, "controller submit"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerSubmitTimeMs:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 70
    const-string v1, "controller final image"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerFinalImageSetTimeMs:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 71
    const-string v1, "controller failure"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerFailureTimeMs:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 72
    const-string v1, "start time"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequestStartTimeMs:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 73
    const-string v1, "end time"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequestEndTimeMs:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 74
    const-string v1, "prefetch"

    iget-boolean v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->isPrefetch:Z

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Z)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 75
    const-string v1, "caller context"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->callerContext:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 76
    const-string v1, "image request"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequest:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 77
    const-string v1, "image info"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageInfo:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 78
    const-string v1, "on-screen width"

    iget v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->onScreenWidthPx:I

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 79
    const-string v1, "on-screen height"

    iget v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->onScreenHeightPx:I

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 80
    const-string v1, "visibility state"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->visibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 81
    const-string v1, "visibility event"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->visibilityEventTimeMs:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 82
    const-string v1, "invisibility event"

    iget-wide v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->invisibilityEventTimeMs:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 83
    const-string v1, "dimensions info"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->dimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 84
    const-string v1, "extra data"

    iget-object v2, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->extraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/common/internal/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/common/internal/Objects$ToStringHelper;

    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lcom/facebook/common/internal/Objects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "toString(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final getCallerContext()Ljava/lang/Object;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->callerContext:Ljava/lang/Object;

    return-object v0
.end method

.method public final getCallingClassNameOnVisible()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->callingClassNameOnVisible:Ljava/lang/String;

    return-object v0
.end method

.method public final getContentIdOnVisible()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->contentIdOnVisible:Ljava/lang/String;

    return-object v0
.end method

.method public final getContextChainArrayOnVisible()[Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->contextChainArrayOnVisible:[Ljava/lang/String;

    return-object v0
.end method

.method public final getContextChainExtrasOnVisible()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->contextChainExtrasOnVisible:Ljava/lang/String;

    return-object v0
.end method

.method public final getControllerFailureTimeMs()J
    .locals 2

    .line 23
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerFailureTimeMs:J

    return-wide v0
.end method

.method public final getControllerFinalImageSetTimeMs()J
    .locals 2

    .line 22
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerFinalImageSetTimeMs:J

    return-wide v0
.end method

.method public final getControllerId()Ljava/lang/String;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerId:Ljava/lang/String;

    return-object v0
.end method

.method public final getControllerSubmitTimeMs()J
    .locals 2

    .line 20
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->controllerSubmitTimeMs:J

    return-wide v0
.end method

.method public final getDensityDpiOnSuccess()Ljava/lang/Integer;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->densityDpiOnSuccess:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getDimensionsInfo()Lcom/facebook/fresco/ui/common/DimensionsInfo;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->dimensionsInfo:Lcom/facebook/fresco/ui/common/DimensionsInfo;

    return-object v0
.end method

.method public final getEmptyEventTimestampNs()Ljava/lang/Long;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->emptyEventTimestampNs:Ljava/lang/Long;

    return-object v0
.end method

.method public final getErrorCodeOnFailure()Ljava/lang/Integer;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->errorCodeOnFailure:Ljava/lang/Integer;

    return-object v0
.end method

.method public final getErrorMessageOnFailure()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->errorMessageOnFailure:Ljava/lang/String;

    return-object v0
.end method

.method public final getErrorStacktraceStringOnFailure()Ljava/lang/String;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->errorStacktraceStringOnFailure:Ljava/lang/String;

    return-object v0
.end method

.method public final getErrorThrowable()Ljava/lang/Throwable;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->errorThrowable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public final getExtraData()Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->extraData:Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;

    return-object v0
.end method

.method public final getFinalImageLoadTimeMs()J
    .locals 7

    .line 58
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequestEndTimeMs:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    iget-wide v4, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequestStartTimeMs:J

    cmp-long v6, v4, v2

    if-nez v6, :cond_0

    goto :goto_0

    :cond_0
    sub-long/2addr v0, v4

    return-wide v0

    :cond_1
    :goto_0
    return-wide v2
.end method

.method public final getImageInfo()Ljava/lang/Object;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageInfo:Ljava/lang/Object;

    return-object v0
.end method

.method public final getImageRequest()Ljava/lang/Object;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequest:Ljava/lang/Object;

    return-object v0
.end method

.method public final getImageRequestEndTimeMs()J
    .locals 2

    .line 25
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequestEndTimeMs:J

    return-wide v0
.end method

.method public final getImageRequestStartTimeMs()J
    .locals 2

    .line 24
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->imageRequestStartTimeMs:J

    return-wide v0
.end method

.method public final getInfra()Lcom/facebook/fresco/ui/common/ImageRenderingInfra;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->infra:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    return-object v0
.end method

.method public final getInstanceId()I
    .locals 1

    .line 54
    iget v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->instanceId:I

    return v0
.end method

.method public final getIntermediateImageLoadTimeMs()J
    .locals 2

    .line 21
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->intermediateImageLoadTimeMs:J

    return-wide v0
.end method

.method public final getIntermediateImageSetTimes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkotlin/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->intermediateImageSetTimes:Ljava/util/List;

    return-object v0
.end method

.method public final getInvisibilityEventTimeMs()J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->invisibilityEventTimeMs:J

    return-wide v0
.end method

.method public final getMsSinceLastNavigationOnVisible()Ljava/lang/Long;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->msSinceLastNavigationOnVisible:Ljava/lang/Long;

    return-object v0
.end method

.method public final getNewIntermediateImageSetPointAvailable()Z
    .locals 1

    .line 47
    iget-boolean v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->newIntermediateImageSetPointAvailable:Z

    return v0
.end method

.method public final getOnScreenHeightPx()I
    .locals 1

    .line 30
    iget v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->onScreenHeightPx:I

    return v0
.end method

.method public final getOnScreenWidthPx()I
    .locals 1

    .line 29
    iget v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->onScreenWidthPx:I

    return v0
.end method

.method public final getReleasedEventTimestampNs()Ljava/lang/Long;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->releasedEventTimestampNs:Ljava/lang/Long;

    return-object v0
.end method

.method public final getRequestId()Ljava/lang/String;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->requestId:Ljava/lang/String;

    return-object v0
.end method

.method public final getRootContextNameOnVisible()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->rootContextNameOnVisible:Ljava/lang/String;

    return-object v0
.end method

.method public final getStartupStatusOnVisible()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->startupStatusOnVisible:Ljava/lang/String;

    return-object v0
.end method

.method public final getSubSurfaceOnVisible()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->subSurfaceOnVisible:Ljava/lang/String;

    return-object v0
.end method

.method public final getSurfaceOnVisible()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->surfaceOnVisible:Ljava/lang/String;

    return-object v0
.end method

.method public final getVisibilityEventTimeMs()J
    .locals 2

    .line 33
    iget-wide v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->visibilityEventTimeMs:J

    return-wide v0
.end method

.method public final getVisibilityState()Lcom/facebook/fresco/ui/common/VisibilityState;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->visibilityState:Lcom/facebook/fresco/ui/common/VisibilityState;

    return-object v0
.end method

.method public final isPrefetch()Z
    .locals 1

    .line 28
    iget-boolean v0, p0, Lcom/facebook/fresco/ui/common/ImagePerfData;->isPrefetch:Z

    return v0
.end method
