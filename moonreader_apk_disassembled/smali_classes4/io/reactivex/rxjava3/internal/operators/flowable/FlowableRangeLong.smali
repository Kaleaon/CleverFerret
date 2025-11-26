.class public final Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong;
.super Lio/reactivex/rxjava3/core/Flowable;
.source "FlowableRangeLong.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;,
        Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong$RangeSubscription;,
        Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong$BaseRangeSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/rxjava3/core/Flowable<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final end:J

.field final start:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "start",
            "count"
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Lio/reactivex/rxjava3/core/Flowable;-><init>()V

    .line 32
    iput-wide p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong;->start:J

    add-long/2addr p1, p3

    .line 33
    iput-wide p1, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong;->end:J

    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber<",
            "-",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 38
    instance-of v0, p1, Lio/reactivex/rxjava3/operators/ConditionalSubscriber;

    if-eqz v0, :cond_0

    .line 39
    new-instance v1, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;

    move-object v2, p1

    check-cast v2, Lio/reactivex/rxjava3/operators/ConditionalSubscriber;

    iget-wide v3, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong;->start:J

    iget-wide v5, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong;->end:J

    invoke-direct/range {v1 .. v6}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong$RangeConditionalSubscription;-><init>(Lio/reactivex/rxjava3/operators/ConditionalSubscriber;JJ)V

    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    return-void

    .line 42
    :cond_0
    new-instance v2, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong$RangeSubscription;

    iget-wide v4, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong;->start:J

    iget-wide v6, p0, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong;->end:J

    move-object v3, p1

    invoke-direct/range {v2 .. v7}, Lio/reactivex/rxjava3/internal/operators/flowable/FlowableRangeLong$RangeSubscription;-><init>(Lorg/reactivestreams/Subscriber;JJ)V

    invoke-interface {v3, v2}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    return-void
.end method
