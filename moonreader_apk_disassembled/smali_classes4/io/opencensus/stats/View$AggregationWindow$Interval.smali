.class public abstract Lio/opencensus/stats/View$AggregationWindow$Interval;
.super Lio/opencensus/stats/View$AggregationWindow;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/View$AggregationWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Interval"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final ZERO:Lio/opencensus/common/Duration;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    .line 270
    invoke-static {v0, v1, v2}, Lio/opencensus/common/Duration;->create(JI)Lio/opencensus/common/Duration;

    move-result-object v0

    sput-object v0, Lio/opencensus/stats/View$AggregationWindow$Interval;->ZERO:Lio/opencensus/common/Duration;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 272
    invoke-direct {p0, v0}, Lio/opencensus/stats/View$AggregationWindow;-><init>(Lio/opencensus/stats/View$1;)V

    return-void
.end method

.method public static create(Lio/opencensus/common/Duration;)Lio/opencensus/stats/View$AggregationWindow$Interval;
    .locals 2

    .line 293
    sget-object v0, Lio/opencensus/stats/View$AggregationWindow$Interval;->ZERO:Lio/opencensus/common/Duration;

    invoke-virtual {p0, v0}, Lio/opencensus/common/Duration;->compareTo(Lio/opencensus/common/Duration;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Duration must be positive"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 294
    new-instance v0, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Interval;

    invoke-direct {v0, p0}, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Interval;-><init>(Lio/opencensus/common/Duration;)V

    return-object v0
.end method


# virtual methods
.method public abstract getDuration()Lio/opencensus/common/Duration;
.end method

.method public final match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/View$AggregationWindow$Cumulative;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/View$AggregationWindow$Interval;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/View$AggregationWindow;",
            "TT;>;)TT;"
        }
    .end annotation

    .line 302
    invoke-interface {p2, p0}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
