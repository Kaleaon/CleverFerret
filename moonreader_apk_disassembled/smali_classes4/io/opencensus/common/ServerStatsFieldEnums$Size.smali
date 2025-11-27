.class public final enum Lio/opencensus/common/ServerStatsFieldEnums$Size;
.super Ljava/lang/Enum;
.source "ServerStatsFieldEnums.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/common/ServerStatsFieldEnums;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Size"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/opencensus/common/ServerStatsFieldEnums$Size;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/opencensus/common/ServerStatsFieldEnums$Size;

.field public static final enum SERVER_STATS_LB_LATENCY_SIZE:Lio/opencensus/common/ServerStatsFieldEnums$Size;

.field public static final enum SERVER_STATS_SERVICE_LATENCY_SIZE:Lio/opencensus/common/ServerStatsFieldEnums$Size;

.field public static final enum SERVER_STATS_TRACE_OPTION_SIZE:Lio/opencensus/common/ServerStatsFieldEnums$Size;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 106
    new-instance v0, Lio/opencensus/common/ServerStatsFieldEnums$Size;

    const-string v1, "SERVER_STATS_LB_LATENCY_SIZE"

    const/4 v2, 0x0

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v3}, Lio/opencensus/common/ServerStatsFieldEnums$Size;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/opencensus/common/ServerStatsFieldEnums$Size;->SERVER_STATS_LB_LATENCY_SIZE:Lio/opencensus/common/ServerStatsFieldEnums$Size;

    .line 112
    new-instance v1, Lio/opencensus/common/ServerStatsFieldEnums$Size;

    const-string v4, "SERVER_STATS_SERVICE_LATENCY_SIZE"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v3}, Lio/opencensus/common/ServerStatsFieldEnums$Size;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/opencensus/common/ServerStatsFieldEnums$Size;->SERVER_STATS_SERVICE_LATENCY_SIZE:Lio/opencensus/common/ServerStatsFieldEnums$Size;

    .line 118
    new-instance v3, Lio/opencensus/common/ServerStatsFieldEnums$Size;

    const-string v4, "SERVER_STATS_TRACE_OPTION_SIZE"

    const/4 v6, 0x2

    invoke-direct {v3, v4, v6, v5}, Lio/opencensus/common/ServerStatsFieldEnums$Size;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/opencensus/common/ServerStatsFieldEnums$Size;->SERVER_STATS_TRACE_OPTION_SIZE:Lio/opencensus/common/ServerStatsFieldEnums$Size;

    const/4 v4, 0x3

    .line 100
    new-array v4, v4, [Lio/opencensus/common/ServerStatsFieldEnums$Size;

    aput-object v0, v4, v2

    aput-object v1, v4, v5

    aput-object v3, v4, v6

    sput-object v4, Lio/opencensus/common/ServerStatsFieldEnums$Size;->$VALUES:[Lio/opencensus/common/ServerStatsFieldEnums$Size;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 122
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 123
    iput p3, p0, Lio/opencensus/common/ServerStatsFieldEnums$Size;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/opencensus/common/ServerStatsFieldEnums$Size;
    .locals 1

    .line 100
    const-class v0, Lio/opencensus/common/ServerStatsFieldEnums$Size;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/opencensus/common/ServerStatsFieldEnums$Size;

    return-object p0
.end method

.method public static values()[Lio/opencensus/common/ServerStatsFieldEnums$Size;
    .locals 1

    .line 100
    sget-object v0, Lio/opencensus/common/ServerStatsFieldEnums$Size;->$VALUES:[Lio/opencensus/common/ServerStatsFieldEnums$Size;

    invoke-virtual {v0}, [Lio/opencensus/common/ServerStatsFieldEnums$Size;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/opencensus/common/ServerStatsFieldEnums$Size;

    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 1

    .line 133
    iget v0, p0, Lio/opencensus/common/ServerStatsFieldEnums$Size;->value:I

    return v0
.end method
