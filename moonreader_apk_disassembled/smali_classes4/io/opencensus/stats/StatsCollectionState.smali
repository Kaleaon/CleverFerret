.class public final enum Lio/opencensus/stats/StatsCollectionState;
.super Ljava/lang/Enum;
.source "StatsCollectionState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/opencensus/stats/StatsCollectionState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/opencensus/stats/StatsCollectionState;

.field public static final enum DISABLED:Lio/opencensus/stats/StatsCollectionState;

.field public static final enum ENABLED:Lio/opencensus/stats/StatsCollectionState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 33
    new-instance v0, Lio/opencensus/stats/StatsCollectionState;

    const-string v1, "ENABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/opencensus/stats/StatsCollectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/opencensus/stats/StatsCollectionState;->ENABLED:Lio/opencensus/stats/StatsCollectionState;

    .line 43
    new-instance v1, Lio/opencensus/stats/StatsCollectionState;

    const-string v3, "DISABLED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lio/opencensus/stats/StatsCollectionState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lio/opencensus/stats/StatsCollectionState;->DISABLED:Lio/opencensus/stats/StatsCollectionState;

    const/4 v3, 0x2

    .line 24
    new-array v3, v3, [Lio/opencensus/stats/StatsCollectionState;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lio/opencensus/stats/StatsCollectionState;->$VALUES:[Lio/opencensus/stats/StatsCollectionState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/opencensus/stats/StatsCollectionState;
    .locals 1

    .line 24
    const-class v0, Lio/opencensus/stats/StatsCollectionState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/opencensus/stats/StatsCollectionState;

    return-object p0
.end method

.method public static values()[Lio/opencensus/stats/StatsCollectionState;
    .locals 1

    .line 24
    sget-object v0, Lio/opencensus/stats/StatsCollectionState;->$VALUES:[Lio/opencensus/stats/StatsCollectionState;

    invoke-virtual {v0}, [Lio/opencensus/stats/StatsCollectionState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/opencensus/stats/StatsCollectionState;

    return-object v0
.end method
