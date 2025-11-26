.class public final Lio/opencensus/common/ServerStatsFieldEnums;
.super Ljava/lang/Object;
.source "ServerStatsFieldEnums.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/common/ServerStatsFieldEnums$Size;,
        Lio/opencensus/common/ServerStatsFieldEnums$Id;
    }
.end annotation


# static fields
.field private static final TOTALSIZE:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 137
    invoke-static {}, Lio/opencensus/common/ServerStatsFieldEnums;->computeTotalSize()I

    move-result v0

    sput v0, Lio/opencensus/common/ServerStatsFieldEnums;->TOTALSIZE:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static computeTotalSize()I
    .locals 5

    .line 143
    invoke-static {}, Lio/opencensus/common/ServerStatsFieldEnums$Size;->values()[Lio/opencensus/common/ServerStatsFieldEnums$Size;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v4, v0, v2

    .line 144
    invoke-virtual {v4}, Lio/opencensus/common/ServerStatsFieldEnums$Size;->value()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return v3
.end method

.method public static getTotalSize()I
    .locals 1

    .line 157
    sget v0, Lio/opencensus/common/ServerStatsFieldEnums;->TOTALSIZE:I

    return v0
.end method
