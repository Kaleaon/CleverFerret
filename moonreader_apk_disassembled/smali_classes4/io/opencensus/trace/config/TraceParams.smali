.class public abstract Lio/opencensus/trace/config/TraceParams;
.super Ljava/lang/Object;
.source "TraceParams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/config/TraceParams$Builder;
    }
.end annotation


# static fields
.field public static final DEFAULT:Lio/opencensus/trace/config/TraceParams;

.field private static final DEFAULT_PROBABILITY:D = 1.0E-4

.field private static final DEFAULT_SAMPLER:Lio/opencensus/trace/Sampler;

.field private static final DEFAULT_SPAN_MAX_NUM_ANNOTATIONS:I = 0x20

.field private static final DEFAULT_SPAN_MAX_NUM_ATTRIBUTES:I = 0x20

.field private static final DEFAULT_SPAN_MAX_NUM_LINKS:I = 0x20

.field private static final DEFAULT_SPAN_MAX_NUM_MESSAGE_EVENTS:I = 0x80


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-wide v0, 0x3f1a36e2eb1c432dL    # 1.0E-4

    .line 39
    invoke-static {v0, v1}, Lio/opencensus/trace/samplers/Samplers;->probabilitySampler(D)Lio/opencensus/trace/Sampler;

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/config/TraceParams;->DEFAULT_SAMPLER:Lio/opencensus/trace/Sampler;

    .line 51
    invoke-static {}, Lio/opencensus/trace/config/TraceParams;->builder()Lio/opencensus/trace/config/TraceParams$Builder;

    move-result-object v1

    .line 52
    invoke-virtual {v1, v0}, Lio/opencensus/trace/config/TraceParams$Builder;->setSampler(Lio/opencensus/trace/Sampler;)Lio/opencensus/trace/config/TraceParams$Builder;

    move-result-object v0

    const/16 v1, 0x20

    .line 53
    invoke-virtual {v0, v1}, Lio/opencensus/trace/config/TraceParams$Builder;->setMaxNumberOfAttributes(I)Lio/opencensus/trace/config/TraceParams$Builder;

    move-result-object v0

    .line 54
    invoke-virtual {v0, v1}, Lio/opencensus/trace/config/TraceParams$Builder;->setMaxNumberOfAnnotations(I)Lio/opencensus/trace/config/TraceParams$Builder;

    move-result-object v0

    const/16 v2, 0x80

    .line 55
    invoke-virtual {v0, v2}, Lio/opencensus/trace/config/TraceParams$Builder;->setMaxNumberOfMessageEvents(I)Lio/opencensus/trace/config/TraceParams$Builder;

    move-result-object v0

    .line 56
    invoke-virtual {v0, v1}, Lio/opencensus/trace/config/TraceParams$Builder;->setMaxNumberOfLinks(I)Lio/opencensus/trace/config/TraceParams$Builder;

    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lio/opencensus/trace/config/TraceParams$Builder;->build()Lio/opencensus/trace/config/TraceParams;

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/config/TraceParams;->DEFAULT:Lio/opencensus/trace/config/TraceParams;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static builder()Lio/opencensus/trace/config/TraceParams$Builder;
    .locals 1

    .line 114
    new-instance v0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;

    invoke-direct {v0}, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public abstract getMaxNumberOfAnnotations()I
.end method

.method public abstract getMaxNumberOfAttributes()I
.end method

.method public abstract getMaxNumberOfLinks()I
.end method

.method public abstract getMaxNumberOfMessageEvents()I
.end method

.method public getMaxNumberOfNetworkEvents()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 102
    invoke-virtual {p0}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfMessageEvents()I

    move-result v0

    return v0
.end method

.method public abstract getSampler()Lio/opencensus/trace/Sampler;
.end method

.method public abstract toBuilder()Lio/opencensus/trace/config/TraceParams$Builder;
.end method
