.class public Lcom/facebook/drawee/backends/pipeline/info/ForwardingImagePerfDataListener;
.super Ljava/lang/Object;
.source "ForwardingImagePerfDataListener.java"

# interfaces
.implements Lcom/facebook/fresco/ui/common/ImagePerfDataListener;


# instance fields
.field private final mListeners:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/facebook/fresco/ui/common/ImagePerfDataListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/facebook/fresco/ui/common/ImagePerfDataListener;",
            ">;)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/facebook/drawee/backends/pipeline/info/ForwardingImagePerfDataListener;->mListeners:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method public onImageLoadStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfData;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V
    .locals 2

    .line 29
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ForwardingImagePerfDataListener;->mListeners:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/fresco/ui/common/ImagePerfDataListener;

    .line 30
    invoke-interface {v1, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfDataListener;->onImageLoadStatusUpdated(Lcom/facebook/fresco/ui/common/ImagePerfData;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onImageVisibilityUpdated(Lcom/facebook/fresco/ui/common/ImagePerfData;Lcom/facebook/fresco/ui/common/VisibilityState;)V
    .locals 2

    .line 37
    iget-object v0, p0, Lcom/facebook/drawee/backends/pipeline/info/ForwardingImagePerfDataListener;->mListeners:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/fresco/ui/common/ImagePerfDataListener;

    .line 38
    invoke-interface {v1, p1, p2}, Lcom/facebook/fresco/ui/common/ImagePerfDataListener;->onImageVisibilityUpdated(Lcom/facebook/fresco/ui/common/ImagePerfData;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    goto :goto_0

    :cond_0
    return-void
.end method
