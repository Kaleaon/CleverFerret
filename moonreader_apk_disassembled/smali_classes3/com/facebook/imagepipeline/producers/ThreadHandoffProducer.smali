.class public final Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;
.super Ljava/lang/Object;
.source "ThreadHandoffProducer.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/Producer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/imagepipeline/producers/Producer<",
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nThreadHandoffProducer.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ThreadHandoffProducer.kt\ncom/facebook/imagepipeline/producers/ThreadHandoffProducer\n+ 2 FrescoSystrace.kt\ncom/facebook/imagepipeline/systrace/FrescoSystrace\n*L\n1#1,72:1\n40#2,9:73\n*S KotlinDebug\n*F\n+ 1 ThreadHandoffProducer.kt\ncom/facebook/imagepipeline/producers/ThreadHandoffProducer\n*L\n22#1:73,9\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u0012*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u0002:\u0001\u0012B\u001d\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001e\u0010\u000c\u001a\u00020\r2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u000f2\u0006\u0010\u0010\u001a\u00020\u0011H\u0016R\u0017\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0002\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;",
        "T",
        "Lcom/facebook/imagepipeline/producers/Producer;",
        "inputProducer",
        "threadHandoffProducerQueue",
        "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;",
        "<init>",
        "(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)V",
        "getInputProducer",
        "()Lcom/facebook/imagepipeline/producers/Producer;",
        "getThreadHandoffProducerQueue",
        "()Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;",
        "produceResults",
        "",
        "consumer",
        "Lcom/facebook/imagepipeline/producers/Consumer;",
        "context",
        "Lcom/facebook/imagepipeline/producers/ProducerContext;",
        "Companion",
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


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;

.field public static final PRODUCER_NAME:Ljava/lang/String; = "BackgroundThreadHandoffProducer"


# instance fields
.field private final inputProducer:Lcom/facebook/imagepipeline/producers/Producer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->Companion:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/producers/Producer;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "TT;>;",
            "Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;",
            ")V"
        }
    .end annotation

    const-string v0, "inputProducer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "threadHandoffProducerQueue"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->inputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    .line 18
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    return-void
.end method


# virtual methods
.method public final getInputProducer()Lcom/facebook/imagepipeline/producers/Producer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/imagepipeline/producers/Producer<",
            "TT;>;"
        }
    .end annotation

    .line 17
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->inputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    return-object v0
.end method

.method public final getThreadHandoffProducerQueue()Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    return-object v0
.end method

.method public produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/producers/Consumer<",
            "TT;>;",
            "Lcom/facebook/imagepipeline/producers/ProducerContext;",
            ")V"
        }
    .end annotation

    const-string v0, "consumer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    sget-object v0, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->INSTANCE:Lcom/facebook/imagepipeline/systrace/FrescoSystrace;

    .line 73
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->isTracing()Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "BackgroundThreadHandoffProducer"

    if-nez v0, :cond_1

    .line 23
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getProducerListener()Lcom/facebook/imagepipeline/producers/ProducerListener2;

    move-result-object v0

    .line 24
    sget-object v3, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->Companion:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;

    invoke-static {v3, p2}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;->access$shouldRunImmediately(Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;Lcom/facebook/imagepipeline/producers/ProducerContext;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 25
    invoke-interface {v0, p2, v2}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerStart(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V

    .line 26
    invoke-interface {v0, p2, v2, v1}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    .line 27
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->inputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    return-void

    .line 31
    :cond_0
    new-instance v1, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$statefulRunnable$1;

    invoke-direct {v1, p1, v0, p2, p0}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$statefulRunnable$1;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;)V

    check-cast v1, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;

    .line 45
    new-instance p1, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;

    invoke-direct {p1, v1, p0}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;-><init>(Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;

    .line 44
    invoke-interface {p2, p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    .line 51
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 52
    check-cast v1, Ljava/lang/Runnable;

    invoke-static {v3, p2}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;->access$getInstrumentationTag(Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;Lcom/facebook/imagepipeline/producers/ProducerContext;)Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->decorateRunnable(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object p2

    .line 51
    invoke-interface {p1, p2}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;->addToQueueOrExecute(Ljava/lang/Runnable;)V

    return-void

    .line 77
    :cond_1
    const-string v0, "ThreadHandoffProducer#produceResults"

    invoke-static {v0}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->beginSection(Ljava/lang/String;)V

    .line 23
    :try_start_0
    invoke-interface {p2}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getProducerListener()Lcom/facebook/imagepipeline/producers/ProducerListener2;

    move-result-object v0

    .line 24
    sget-object v3, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->Companion:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;

    invoke-static {v3, p2}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;->access$shouldRunImmediately(Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;Lcom/facebook/imagepipeline/producers/ProducerContext;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 25
    invoke-interface {v0, p2, v2}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerStart(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;)V

    .line 26
    invoke-interface {v0, p2, v2, v1}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    .line 27
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->inputProducer:Lcom/facebook/imagepipeline/producers/Producer;

    invoke-interface {v0, p1, p2}, Lcom/facebook/imagepipeline/producers/Producer;->produceResults(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-void

    .line 31
    :cond_2
    :try_start_1
    new-instance v1, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$statefulRunnable$1;

    invoke-direct {v1, p1, v0, p2, p0}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$statefulRunnable$1;-><init>(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;)V

    check-cast v1, Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;

    .line 45
    new-instance p1, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;

    invoke-direct {p1, v1, p0}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$produceResults$1$1;-><init>(Lcom/facebook/imagepipeline/producers/StatefulProducerRunnable;Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;)V

    check-cast p1, Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;

    .line 44
    invoke-interface {p2, p1}, Lcom/facebook/imagepipeline/producers/ProducerContext;->addCallbacks(Lcom/facebook/imagepipeline/producers/ProducerContextCallbacks;)V

    .line 51
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer;->threadHandoffProducerQueue:Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;

    .line 52
    check-cast v1, Ljava/lang/Runnable;

    invoke-static {v3, p2}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;->access$getInstrumentationTag(Lcom/facebook/imagepipeline/producers/ThreadHandoffProducer$Companion;Lcom/facebook/imagepipeline/producers/ProducerContext;)Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/facebook/imagepipeline/instrumentation/FrescoInstrumenter;->decorateRunnable(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object p2

    .line 51
    invoke-interface {p1, p2}, Lcom/facebook/imagepipeline/producers/ThreadHandoffProducerQueue;->addToQueueOrExecute(Ljava/lang/Runnable;)V

    .line 53
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    return-void

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/facebook/imagepipeline/systrace/FrescoSystrace;->endSection()V

    throw p1
.end method
