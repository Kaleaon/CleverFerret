.class public abstract Lio/opencensus/stats/View$AggregationWindow$Cumulative;
.super Lio/opencensus/stats/View$AggregationWindow;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/View$AggregationWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Cumulative"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final CUMULATIVE:Lio/opencensus/stats/View$AggregationWindow$Cumulative;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 232
    new-instance v0, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Cumulative;

    invoke-direct {v0}, Lio/opencensus/stats/AutoValue_View_AggregationWindow_Cumulative;-><init>()V

    sput-object v0, Lio/opencensus/stats/View$AggregationWindow$Cumulative;->CUMULATIVE:Lio/opencensus/stats/View$AggregationWindow$Cumulative;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 235
    invoke-direct {p0, v0}, Lio/opencensus/stats/View$AggregationWindow;-><init>(Lio/opencensus/stats/View$1;)V

    return-void
.end method

.method public static create()Lio/opencensus/stats/View$AggregationWindow$Cumulative;
    .locals 1

    .line 246
    sget-object v0, Lio/opencensus/stats/View$AggregationWindow$Cumulative;->CUMULATIVE:Lio/opencensus/stats/View$AggregationWindow$Cumulative;

    return-object v0
.end method


# virtual methods
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

    .line 254
    invoke-interface {p1, p0}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
