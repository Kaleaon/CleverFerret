.class public Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;
.super Ljava/lang/Object;
.source "ImagePerfMonitor.java"

# interfaces
.implements Lcom/facebook/fresco/ui/common/ImagePerfNotifier;


# instance fields
.field private mEnabled:Z

.field private mForwardingRequestListener:Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mImagePerfDataListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/fresco/ui/common/ImagePerfDataListener;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mImagePerfRequestListener:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

.field private mImagePerfStateManager:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mMonotonicClock:Lcom/facebook/common/time/MonotonicClock;

.field private final mPipelineDraweeController:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;


# direct methods
.method public constructor <init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mMonotonicClock:Lcom/facebook/common/time/MonotonicClock;

    .line 47
    iput-object p2, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mPipelineDraweeController:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;

    .line 48
    new-instance p1, Lcom/facebook/fresco/ui/common/ImagePerfState;

    sget-object p2, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->DRAWEE:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    invoke-direct {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;-><init>(Lcom/facebook/fresco/ui/common/ImageRenderingInfra;)V

    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    return-void
.end method

.method private setupListeners()V
    .locals 4

    .line 131
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfStateManager:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;

    if-nez v0, :cond_0

    .line 132
    new-instance v0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;

    iget-object v1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mMonotonicClock:Lcom/facebook/common/time/MonotonicClock;

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    invoke-direct {v0, v1, v2, p0}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;-><init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImagePerfNotifier;)V

    iput-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfStateManager:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfRequestListener:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;

    if-nez v0, :cond_1

    .line 135
    new-instance v0, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;

    iget-object v1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mMonotonicClock:Lcom/facebook/common/time/MonotonicClock;

    iget-object v2, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    invoke-direct {v0, v1, v2}, Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;-><init>(Lcom/facebook/common/time/MonotonicClock;Lcom/facebook/fresco/ui/common/ImagePerfState;)V

    iput-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfRequestListener:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;

    .line 137
    :cond_1
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mForwardingRequestListener:Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;

    if-nez v0, :cond_2

    .line 138
    new-instance v0, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/facebook/imagepipeline/listener/RequestListener;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfRequestListener:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfRequestListener;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;-><init>([Lcom/facebook/imagepipeline/listener/RequestListener;)V

    iput-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mForwardingRequestListener:Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;

    :cond_2
    return-void
.end method


# virtual methods
.method public addImagePerfDataListener(Lcom/facebook/fresco/ui/common/ImagePerfDataListener;)V
    .locals 1
    .param p1    # Lcom/facebook/fresco/ui/common/ImagePerfDataListener;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    return-void

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    if-nez v0, :cond_1

    .line 76
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    .line 78
    :cond_1
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addViewportData()V
    .locals 3

    .line 122
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mPipelineDraweeController:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;

    invoke-virtual {v0}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 123
    invoke-interface {v0}, Lcom/facebook/drawee/interfaces/DraweeHierarchy;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 124
    invoke-interface {v0}, Lcom/facebook/drawee/interfaces/DraweeHierarchy;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 125
    iget-object v1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setOnScreenWidth(I)V

    .line 126
    iget-object v1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setOnScreenHeight(I)V

    :cond_0
    return-void
.end method

.method public clearImagePerfDataListeners()V
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 90
    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_0
    return-void
.end method

.method public notifyStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V
    .locals 2

    .line 96
    invoke-virtual {p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfState;->setImageLoadStatus(Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 97
    iget-boolean v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mEnabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 100
    :cond_0
    sget-object v0, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->SUCCESS:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    if-ne p2, v0, :cond_1

    .line 101
    invoke-virtual {p0}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->addViewportData()V

    .line 103
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->snapshot()Lcom/facebook/fresco/ui/common/ImagePerfData;

    move-result-object p1

    .line 104
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/fresco/ui/common/ImagePerfDataListener;

    .line 105
    invoke-interface {v1, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfDataListener;->onImageLoadStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfData;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public notifyVisibilityUpdated(Lcom/facebook/fresco/ui/common/ImagePerfState;Lcom/facebook/fresco/ui/common/VisibilityState;)V
    .locals 2

    .line 111
    iget-boolean v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mEnabled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 115
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/fresco/ui/common/ImagePerfState;->snapshot()Lcom/facebook/fresco/ui/common/ImagePerfData;

    move-result-object p1

    .line 116
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/fresco/ui/common/ImagePerfDataListener;

    .line 117
    invoke-interface {v1, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfDataListener;->onImageVisibilityUpdated(Lcom/facebook/fresco/ui/common/ImagePerfData;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public removeImagePerfDataListener(Lcom/facebook/fresco/ui/common/ImagePerfDataListener;)V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfDataListeners:Ljava/util/List;

    if-nez v0, :cond_0

    return-void

    .line 85
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public reset()V
    .locals 1

    .line 143
    invoke-virtual {p0}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->clearImagePerfDataListeners()V

    const/4 v0, 0x0

    .line 144
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->setEnabled(Z)V

    .line 145
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfState:Lcom/facebook/fresco/ui/common/ImagePerfState;

    invoke-virtual {v0}, Lcom/facebook/fresco/ui/common/ImagePerfState;->reset()V

    return-void
.end method

.method public setEnabled(Z)V
    .locals 1

    .line 52
    iput-boolean p1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mEnabled:Z

    if-eqz p1, :cond_1

    .line 54
    invoke-direct {p0}, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->setupListeners()V

    .line 55
    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfStateManager:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;

    if-eqz p1, :cond_0

    .line 56
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mPipelineDraweeController:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;->addControllerListener2(Lcom/facebook/fresco/ui/common/ControllerListener2;)V

    .line 58
    :cond_0
    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mForwardingRequestListener:Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;

    if-eqz p1, :cond_3

    .line 59
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mPipelineDraweeController:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;->addRequestListener(Lcom/facebook/imagepipeline/listener/RequestListener;)V

    return-void

    .line 62
    :cond_1
    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mImagePerfStateManager:Lcom/facebook/drawee/backends/pipeline/info/internal/ImagePerfStateManager;

    if-eqz p1, :cond_2

    .line 63
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mPipelineDraweeController:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;->removeControllerListener2(Lcom/facebook/fresco/ui/common/ControllerListener2;)V

    .line 65
    :cond_2
    iget-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mForwardingRequestListener:Lcom/facebook/imagepipeline/listener/ForwardingRequestListener;

    if-eqz p1, :cond_3

    .line 66
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ImagePerfMonitor;->mPipelineDraweeController:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;

    invoke-virtual {v0, p1}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeController;->removeRequestListener(Lcom/facebook/imagepipeline/listener/RequestListener;)V

    :cond_3
    return-void
.end method
