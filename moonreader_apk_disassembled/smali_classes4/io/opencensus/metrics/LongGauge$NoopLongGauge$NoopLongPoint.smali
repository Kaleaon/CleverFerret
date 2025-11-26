.class final Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;
.super Lio/opencensus/metrics/LongGauge$LongPoint;
.source "LongGauge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/LongGauge$NoopLongGauge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopLongPoint"
.end annotation


# static fields
.field private static final INSTANCE:Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 194
    new-instance v0, Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;

    invoke-direct {v0}, Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;-><init>()V

    sput-object v0, Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;->INSTANCE:Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 196
    invoke-direct {p0}, Lio/opencensus/metrics/LongGauge$LongPoint;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;
    .locals 1

    .line 193
    sget-object v0, Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;->INSTANCE:Lio/opencensus/metrics/LongGauge$NoopLongGauge$NoopLongPoint;

    return-object v0
.end method


# virtual methods
.method public add(J)V
    .locals 0

    return-void
.end method

.method public set(J)V
    .locals 0

    return-void
.end method
