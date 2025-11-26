.class synthetic Lio/opencensus/common/ServerStatsEncoding$1;
.super Ljava/lang/Object;
.source "ServerStatsEncoding.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/common/ServerStatsEncoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$io$opencensus$common$ServerStatsFieldEnums$Id:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 105
    invoke-static {}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->values()[Lio/opencensus/common/ServerStatsFieldEnums$Id;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lio/opencensus/common/ServerStatsEncoding$1;->$SwitchMap$io$opencensus$common$ServerStatsFieldEnums$Id:[I

    :try_start_0
    sget-object v1, Lio/opencensus/common/ServerStatsFieldEnums$Id;->SERVER_STATS_LB_LATENCY_ID:Lio/opencensus/common/ServerStatsFieldEnums$Id;

    invoke-virtual {v1}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lio/opencensus/common/ServerStatsEncoding$1;->$SwitchMap$io$opencensus$common$ServerStatsFieldEnums$Id:[I

    sget-object v1, Lio/opencensus/common/ServerStatsFieldEnums$Id;->SERVER_STATS_SERVICE_LATENCY_ID:Lio/opencensus/common/ServerStatsFieldEnums$Id;

    invoke-virtual {v1}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lio/opencensus/common/ServerStatsEncoding$1;->$SwitchMap$io$opencensus$common$ServerStatsFieldEnums$Id:[I

    sget-object v1, Lio/opencensus/common/ServerStatsFieldEnums$Id;->SERVER_STATS_TRACE_OPTION_ID:Lio/opencensus/common/ServerStatsFieldEnums$Id;

    invoke-virtual {v1}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
