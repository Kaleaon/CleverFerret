.class public abstract Lio/opencensus/stats/Aggregation$LastValue;
.super Lio/opencensus/stats/Aggregation;
.source "Aggregation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/Aggregation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "LastValue"
.end annotation


# static fields
.field private static final INSTANCE:Lio/opencensus/stats/Aggregation$LastValue;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 217
    new-instance v0, Lio/opencensus/stats/AutoValue_Aggregation_LastValue;

    invoke-direct {v0}, Lio/opencensus/stats/AutoValue_Aggregation_LastValue;-><init>()V

    sput-object v0, Lio/opencensus/stats/Aggregation$LastValue;->INSTANCE:Lio/opencensus/stats/Aggregation$LastValue;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 215
    invoke-direct {p0, v0}, Lio/opencensus/stats/Aggregation;-><init>(Lio/opencensus/stats/Aggregation$1;)V

    return-void
.end method

.method public static create()Lio/opencensus/stats/Aggregation$LastValue;
    .locals 1

    .line 226
    sget-object v0, Lio/opencensus/stats/Aggregation$LastValue;->INSTANCE:Lio/opencensus/stats/Aggregation$LastValue;

    return-object v0
.end method


# virtual methods
.method public final match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Aggregation$Sum;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Aggregation$Count;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Aggregation$Distribution;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Aggregation$LastValue;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/stats/Aggregation;",
            "TT;>;)TT;"
        }
    .end annotation

    .line 236
    invoke-interface {p4, p0}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
