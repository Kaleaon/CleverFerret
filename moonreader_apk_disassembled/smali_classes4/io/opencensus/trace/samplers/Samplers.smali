.class public final Lio/opencensus/trace/samplers/Samplers;
.super Ljava/lang/Object;
.source "Samplers.java"


# static fields
.field private static final ALWAYS_SAMPLE:Lio/opencensus/trace/Sampler;

.field private static final NEVER_SAMPLE:Lio/opencensus/trace/Sampler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    new-instance v0, Lio/opencensus/trace/samplers/AlwaysSampleSampler;

    invoke-direct {v0}, Lio/opencensus/trace/samplers/AlwaysSampleSampler;-><init>()V

    sput-object v0, Lio/opencensus/trace/samplers/Samplers;->ALWAYS_SAMPLE:Lio/opencensus/trace/Sampler;

    .line 29
    new-instance v0, Lio/opencensus/trace/samplers/NeverSampleSampler;

    invoke-direct {v0}, Lio/opencensus/trace/samplers/NeverSampleSampler;-><init>()V

    sput-object v0, Lio/opencensus/trace/samplers/Samplers;->NEVER_SAMPLE:Lio/opencensus/trace/Sampler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static alwaysSample()Lio/opencensus/trace/Sampler;
    .locals 1

    .line 41
    sget-object v0, Lio/opencensus/trace/samplers/Samplers;->ALWAYS_SAMPLE:Lio/opencensus/trace/Sampler;

    return-object v0
.end method

.method public static neverSample()Lio/opencensus/trace/Sampler;
    .locals 1

    .line 51
    sget-object v0, Lio/opencensus/trace/samplers/Samplers;->NEVER_SAMPLE:Lio/opencensus/trace/Sampler;

    return-object v0
.end method

.method public static probabilitySampler(D)Lio/opencensus/trace/Sampler;
    .locals 0

    .line 63
    invoke-static {p0, p1}, Lio/opencensus/trace/samplers/ProbabilitySampler;->create(D)Lio/opencensus/trace/samplers/ProbabilitySampler;

    move-result-object p0

    return-object p0
.end method
