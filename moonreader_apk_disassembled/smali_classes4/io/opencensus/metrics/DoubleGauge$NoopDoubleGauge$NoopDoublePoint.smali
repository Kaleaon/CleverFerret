.class final Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;
.super Lio/opencensus/metrics/DoubleGauge$DoublePoint;
.source "DoubleGauge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopDoublePoint"
.end annotation


# static fields
.field private static final INSTANCE:Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 201
    new-instance v0, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;

    invoke-direct {v0}, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;-><init>()V

    sput-object v0, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;->INSTANCE:Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 203
    invoke-direct {p0}, Lio/opencensus/metrics/DoubleGauge$DoublePoint;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;
    .locals 1

    .line 200
    sget-object v0, Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;->INSTANCE:Lio/opencensus/metrics/DoubleGauge$NoopDoubleGauge$NoopDoublePoint;

    return-object v0
.end method


# virtual methods
.method public add(D)V
    .locals 0

    return-void
.end method

.method public set(D)V
    .locals 0

    return-void
.end method
