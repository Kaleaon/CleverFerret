.class public Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;
.super Lcom/facebook/fresco/ui/common/BaseControllerListener2;
.source "ImagePerfStateManager.java"

# interfaces
.implements Lcom/facebook/fresco/ui/common/ImagePerfNotifierHolder;
.implements Lcom/facebook/fresco/ui/common/OnDrawControllerListener;
.implements Ljava/io/Closeable;
.implements Lcom/facebook/fresco/ui/common/VisibilityAware;
.implements Lcom/facebook/drawee/drawable/VisibilityCallback;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/fresco/ui/common/BaseControllerListener2<",
        "Lcom/facebook/imagepipeline/image/ImageInfo;",
        ">;",
        "Lcom/facebook/fresco/ui/common/ImagePerfNotifierHolder;",
        "Lcom/facebook/fresco/ui/common/OnDrawControllerListener<",
        "Lcom/facebook/imagepipeline/image/ImageInfo;",
        ">;",
        "Ljava/io/Closeable;",
        "Lcom/facebook/fresco/ui/common/VisibilityAware;",
        "Lcom/facebook/drawee/drawable/VisibilityCallback;",
        "Ljava/lang/AutoCloseable;"
    }
.end annotation


# instance fields
.field private final mClock:Lcom/facebook/common/time/MonotonicClock;

.field private final mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

.field private final mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

.field private mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mReportVisibleOnSubmitAndRelease:Z


# direct methods
.method public constructor <init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImagePerfNotifier;)V
    .locals 1

    const/4 v0, 0x1

    .line 48
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;-><init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImagePerfNotifier;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImagePerfNotifier;Z)V
    .locals 1

    .line 55
    invoke-direct {p0}, Lcom/facebook/fresco/ui/common/BaseControllerListener2;-><init>()V

    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    .line 56
    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mClock:Lcom/facebook/common/time/MonotonicClock;

    .line 57
    iput-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 58
    iput-object p3, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    .line 59
    iput-boolean p4, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mReportVisibleOnSubmitAndRelease:Z

    return-void
.end method

.method private reportViewInvisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V
    .locals 1

    const/4 v0, 0x0

    .line 178
    invoke-virtual {p1, v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisible(Z)V

    .line 179
    invoke-virtual {p1, p2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setInvisibilityEventTimeMs(J)V

    .line 181
    sget-object p2, Lcom/facebook/fresco/ui/common/VisibilityState;->INVISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->updateVisibility(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    return-void
.end method

.method private updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V
    .locals 1

    .line 185
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageLoadStatus(Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 187
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    invoke-interface {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 188
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    if-eqz v0, :cond_0

    .line 190
    invoke-interface {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    :cond_0
    return-void
.end method

.method private updateVisibility(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    invoke-interface {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyVisibilityUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    .line 196
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    if-eqz v0, :cond_0

    .line 198
    invoke-interface {v0, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyVisibilityUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 173
    invoke-virtual {p0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->resetState()V

    return-void
.end method

.method public onDraw()V
    .locals 0

    return-void
.end method

.method public onEmptyEvent(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 204
    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 205
    sget-object v0, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->EMPTY_EVENT:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-virtual {p1, v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageLoadStatus(Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 206
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    sget-object v1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->EMPTY_EVENT:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-interface {v0, p1, v1}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 207
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    if-eqz v0, :cond_0

    .line 209
    sget-object v1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->EMPTY_EVENT:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-interface {v0, p1, v1}, Lcom/facebook/fresco/ui/common/ImagePerfNotifier;->notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    :cond_0
    return-void
.end method

.method public onFailure(Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p2    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 120
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mClock:Lcom/facebook/common/time/MonotonicClock;

    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    .line 122
    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 124
    invoke-virtual {v2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    .line 126
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerFailureTimeMs(J)V

    .line 127
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setErrorThrowable(Ljava/lang/Throwable;)V

    .line 130
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->ERROR:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 132
    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->reportViewInvisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V

    return-void
.end method

.method public onFinalImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p2    # Lcom/facebook/imagepipeline/image/ImageInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 103
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mClock:Lcom/facebook/common/time/MonotonicClock;

    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    .line 105
    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 107
    invoke-virtual {v2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    .line 109
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerFinalImageSetTimeMs(J)V

    .line 110
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageRequestEndTimeMs(J)V

    .line 111
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 112
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageInfo(Ljava/lang/Object;)V

    .line 114
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->SUCCESS:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    return-void
.end method

.method public bridge synthetic onFinalImageSet(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->onFinalImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    return-void
.end method

.method public onImageDrawn(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V
    .locals 0

    .line 153
    iget-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 155
    invoke-virtual {p2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 156
    invoke-virtual {p2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setDimensionsInfo(Lcom/facebook/fresco/ui/common/DimensionsInfo;)V

    return-void
.end method

.method public bridge synthetic onImageDrawn(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V
    .locals 0

    .line 28
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->onImageDrawn(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Lcom/facebook/fresco/ui/common/DimensionsInfo;)V

    return-void
.end method

.method public onIntermediateImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;)V
    .locals 3
    .param p2    # Lcom/facebook/imagepipeline/image/ImageInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 89
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mClock:Lcom/facebook/common/time/MonotonicClock;

    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    .line 91
    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 93
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerIntermediateImageSetTimeMs(J)V

    .line 94
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 95
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageInfo(Ljava/lang/Object;)V

    .line 97
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->INTERMEDIATE_AVAILABLE:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    return-void
.end method

.method public bridge synthetic onIntermediateImageSet(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->onIntermediateImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;)V

    return-void
.end method

.method public onRelease(Ljava/lang/String;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p2    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 137
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mClock:Lcom/facebook/common/time/MonotonicClock;

    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    .line 139
    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 141
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    .line 142
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 144
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->RELEASED:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 146
    iget-boolean p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mReportVisibleOnSubmitAndRelease:Z

    if-eqz p1, :cond_0

    .line 147
    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->reportViewInvisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V

    :cond_0
    return-void
.end method

.method public onSubmit(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V
    .locals 3
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 70
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mClock:Lcom/facebook/common/time/MonotonicClock;

    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    .line 72
    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    .line 73
    invoke-virtual {v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->resetPointsTimestamps()V

    .line 75
    invoke-virtual {v2, v0, v1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerSubmitTimeMs(J)V

    .line 76
    invoke-virtual {v2, p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setControllerId(Ljava/lang/String;)V

    .line 77
    invoke-virtual {v2, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setCallerContext(Ljava/lang/Object;)V

    .line 79
    invoke-virtual {v2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setExtraData(Lcom/facebook/fresco/ui/common/ControllerListener2$Extras;)V

    .line 81
    sget-object p1, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->REQUESTED:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    invoke-direct {p0, v2, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->updateStatus(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 82
    iget-boolean p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mReportVisibleOnSubmitAndRelease:Z

    if-eqz p1, :cond_0

    .line 83
    invoke-virtual {p0, v2, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->reportViewVisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V

    :cond_0
    return-void
.end method

.method public onVisibilityChange(Z)V
    .locals 2

    if-eqz p1, :cond_0

    .line 221
    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mClock:Lcom/facebook/common/time/MonotonicClock;

    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->reportViewVisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V

    return-void

    .line 223
    :cond_0
    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mClock:Lcom/facebook/common/time/MonotonicClock;

    invoke-interface {v0}, Lcom/facebook/common/time/MonotonicClock;->now()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->reportViewInvisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V

    return-void
.end method

.method public reportViewVisible(Lcom/facebook/fresco/ui/common/ImagePerfState;J)V
    .locals 1

    const/4 v0, 0x1

    .line 161
    invoke-virtual {p1, v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisible(Z)V

    .line 162
    invoke-virtual {p1, p2, p3}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setVisibilityEventTimeMs(J)V

    .line 164
    sget-object p2, Lcom/facebook/fresco/ui/common/VisibilityState;->VISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-direct {p0, p1, p2}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->updateVisibility(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    return-void
.end method

.method public reportVisible(Z)V
    .locals 0

    .line 215
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->onVisibilityChange(Z)V

    return-void
.end method

.method public resetState()V
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    invoke-virtual {v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->reset()V

    return-void
.end method

.method public setImagePerfNotifier(Lcom/facebook/fresco/ui/common/ImagePerfNotifier;)V
    .locals 0
    .param p1    # Lcom/facebook/fresco/ui/common/ImagePerfNotifier;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 64
    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;->mLocalImagePerfNotifier:Lcom/facebook/fresco/ui/common/ImagePerfNotifier;

    return-void
.end method
