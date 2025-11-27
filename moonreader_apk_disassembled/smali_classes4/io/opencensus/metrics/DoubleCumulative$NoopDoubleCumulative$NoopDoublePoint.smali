.class final Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;
.super Lio/opencensus/metrics/DoubleCumulative$DoublePoint;
.source "DoubleCumulative.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopDoublePoint"
.end annotation


# static fields
.field private static final INSTANCE:Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 193
    new-instance v0, Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;

    invoke-direct {v0}, Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;-><init>()V

    sput-object v0, Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;->INSTANCE:Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 195
    invoke-direct {p0}, Lio/opencensus/metrics/DoubleCumulative$DoublePoint;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;
    .locals 1

    .line 192
    sget-object v0, Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;->INSTANCE:Lio/opencensus/metrics/DoubleCumulative$NoopDoubleCumulative$NoopDoublePoint;

    return-object v0
.end method


# virtual methods
.method public add(D)V
    .locals 0

    return-void
.end method
