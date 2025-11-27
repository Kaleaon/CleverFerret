.class public abstract Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;
.super Lcom/facebook/common/executors/StatefulRunnable;
.source "StatefulProducerRunnable.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/facebook/common/executors/StatefulRunnable<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0008\u0008\u0008&\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u0002B-\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00018\u0000H\u0014\u00a2\u0006\u0002\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\u0012\u001a\u00020\u0013H\u0014J\u0008\u0010\u0014\u001a\u00020\u000eH\u0014J)\u0010\u0015\u001a\u0014\u0012\u0006\u0012\u0004\u0018\u00010\n\u0012\u0006\u0012\u0004\u0018\u00010\n\u0018\u00010\u00162\u0008\u0010\u000f\u001a\u0004\u0018\u00018\u0000H\u0014\u00a2\u0006\u0002\u0010\u0017J \u0010\u0018\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u00162\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u0013H\u0014J\u0017\u0010\u001d\u001a\u00020\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00018\u0000H$\u00a2\u0006\u0002\u0010\u0010R\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\u001a\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u00168TX\u0094\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;",
        "T",
        "Lcom/facebook/common/executors/StatefulRunnable;",
        "consumer",
        "Lcom/facebook/imagepipeline/producers/Consumer;",
        "producerListener",
        "Lcom/facebook/imagepipeline/producers/ProducerListener2;",
        "producerContext",
        "Lcom/facebook/imagepipeline/producers/ProducerContext;",
        "producerName",
        "",
        "<init>",
        "(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V",
        "onSuccess",
        "",
        "result",
        "(Ljava/lang/Object;)V",
        "onFailure",
        "e",
        "Ljava/lang/Exception;",
        "onCancellation",
        "getExtraMapOnSuccess",
        "",
        "(Ljava/lang/Object;)Ljava/util/Map;",
        "getExtraMapOnFailure",
        "exception",
        "extraMapOnCancellation",
        "getExtraMapOnCancellation",
        "()Ljava/util/Map;",
        "disposeResult",
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
.field private final consumer:Lcom/facebook/imagepipeline/producers/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

.field private final producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

.field private final producerName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "TT;>;",
            "Lcom/facebook/imagepipeline/producers/ProducerListener2;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const-string v0, "consumer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerListener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerContext"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "producerName"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    invoke-direct {p0}, Lcom/facebook/common/executors/StatefulRunnable;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    .line 20
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    .line 21
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 22
    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerName:Ljava/lang/String;

    .line 71
    invoke-interface {p2, p3, p4}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerStart(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected abstract disposeResult(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method protected getExtraMapOnCancellation()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getExtraMapOnFailure(Ljava/lang/Exception;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method protected getExtraMapOnSuccess(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method protected onCancellation()V
    .locals 4

    .line 46
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    .line 47
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 48
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerName:Ljava/lang/String;

    .line 49
    invoke-interface {v0, v1, v2}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->requiresExtraMap(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->getExtraMapOnCancellation()Ljava/util/Map;

    move-result-object v3

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 46
    :goto_0
    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithCancellation(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    .line 51
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/producers/Consumer;->onCancellation()V

    return-void
.end method

.method protected onFailure(Ljava/lang/Exception;)V
    .locals 5

    const-string v0, "e"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    .line 36
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 37
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerName:Ljava/lang/String;

    .line 38
    move-object v3, p1

    check-cast v3, Ljava/lang/Throwable;

    .line 39
    invoke-interface {v0, v1, v2}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->requiresExtraMap(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 40
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->getExtraMapOnFailure(Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 35
    :goto_0
    invoke-interface {v0, v1, v2, v3, p1}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithFailure(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 42
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {p1, v3}, Lcom/facebook/imagepipeline/producers/Consumer;->onFailure(Ljava/lang/Throwable;)V

    return-void
.end method

.method protected onSuccess(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 25
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerListener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    .line 26
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 27
    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->producerName:Ljava/lang/String;

    .line 28
    invoke-interface {v0, v1, v2}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->requiresExtraMap(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 29
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->getExtraMapOnSuccess(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 25
    :goto_0
    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    .line 31
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;->consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;I)V

    return-void
.end method
