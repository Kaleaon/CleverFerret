.class public abstract Lio/opencensus/trace/export/RunningSpanStore;
.super Ljava/lang/Object;
.source "RunningSpanStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/export/RunningSpanStore$NoopRunningSpanStore;,
        Lio/opencensus/trace/export/RunningSpanStore$Filter;,
        Lio/opencensus/trace/export/RunningSpanStore$PerSpanNameSummary;,
        Lio/opencensus/trace/export/RunningSpanStore$Summary;
    }
.end annotation


# static fields
.field private static final NOOP_RUNNING_SPAN_STORE:Lio/opencensus/trace/export/RunningSpanStore;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 40
    new-instance v0, Lio/opencensus/trace/export/RunningSpanStore$NoopRunningSpanStore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/trace/export/RunningSpanStore$NoopRunningSpanStore;-><init>(Lio/opencensus/trace/export/RunningSpanStore$1;)V

    sput-object v0, Lio/opencensus/trace/export/RunningSpanStore;->NOOP_RUNNING_SPAN_STORE:Lio/opencensus/trace/export/RunningSpanStore;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getNoopRunningSpanStore()Lio/opencensus/trace/export/RunningSpanStore;
    .locals 1

    .line 50
    sget-object v0, Lio/opencensus/trace/export/RunningSpanStore;->NOOP_RUNNING_SPAN_STORE:Lio/opencensus/trace/export/RunningSpanStore;

    return-object v0
.end method


# virtual methods
.method public abstract getRunningSpans(Lio/opencensus/trace/export/RunningSpanStore$Filter;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/export/RunningSpanStore$Filter;",
            ")",
            "Ljava/util/Collection<",
            "Lio/opencensus/trace/export/SpanData;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSummary()Lio/opencensus/trace/export/RunningSpanStore$Summary;
.end method
