.class final Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;
.super Lio/opencensus/metrics/LongCumulative$LongPoint;
.source "LongCumulative.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/LongCumulative$NoopLongCumulative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopLongPoint"
.end annotation


# static fields
.field private static final INSTANCE:Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 188
    new-instance v0, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;

    invoke-direct {v0}, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;-><init>()V

    sput-object v0, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;->INSTANCE:Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 190
    invoke-direct {p0}, Lio/opencensus/metrics/LongCumulative$LongPoint;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;
    .locals 1

    .line 187
    sget-object v0, Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;->INSTANCE:Lio/opencensus/metrics/LongCumulative$NoopLongCumulative$NoopLongPoint;

    return-object v0
.end method


# virtual methods
.method public add(J)V
    .locals 0

    return-void
.end method
