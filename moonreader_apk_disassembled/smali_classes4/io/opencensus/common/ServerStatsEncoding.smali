.class public final Lio/opencensus/common/ServerStatsEncoding;
.super Ljava/lang/Object;
.source "ServerStatsEncoding.java"


# static fields
.field public static final CURRENT_VERSION:B


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseBytes([B)Lio/opencensus/common/ServerStats;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/opencensus/common/ServerStatsDeserializationException;
        }
    .end annotation

    .line 83
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 84
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 90
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 93
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-gtz v0, :cond_5

    if-ltz v0, :cond_5

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    move-wide v2, v0

    const/4 v4, 0x0

    .line 99
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 100
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->valueOf(I)Lio/opencensus/common/ServerStatsFieldEnums$Id;

    move-result-object v5

    if-nez v5, :cond_0

    .line 103
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0

    .line 105
    :cond_0
    sget-object v6, Lio/opencensus/common/ServerStatsEncoding$1;->$SwitchMap$io$opencensus$common$ServerStatsFieldEnums$Id:[I

    invoke-virtual {v5}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->ordinal()I

    move-result v5

    aget v5, v6, v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_3

    const/4 v6, 0x2

    if-eq v5, v6, :cond_2

    const/4 v6, 0x3

    if-eq v5, v6, :cond_1

    goto :goto_0

    .line 113
    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    goto :goto_0

    .line 110
    :cond_2
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    goto :goto_0

    .line 107
    :cond_3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    goto :goto_0

    .line 119
    :cond_4
    :try_start_0
    invoke-static {v0, v1, v2, v3, v4}, Lio/opencensus/common/ServerStats;->create(JJB)Lio/opencensus/common/ServerStats;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 121
    new-instance v0, Lio/opencensus/common/ServerStatsDeserializationException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Serialized ServiceStats contains invalid values: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lio/opencensus/common/ServerStatsDeserializationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_5
    new-instance p0, Lio/opencensus/common/ServerStatsDeserializationException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid ServerStats version: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lio/opencensus/common/ServerStatsDeserializationException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 91
    :cond_6
    new-instance p0, Lio/opencensus/common/ServerStatsDeserializationException;

    const-string v0, "Serialized ServerStats buffer is empty"

    invoke-direct {p0, v0}, Lio/opencensus/common/ServerStatsDeserializationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static toBytes(Lio/opencensus/common/ServerStats;)[B
    .locals 3

    .line 56
    invoke-static {}, Lio/opencensus/common/ServerStatsFieldEnums;->getTotalSize()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 57
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 62
    sget-object v1, Lio/opencensus/common/ServerStatsFieldEnums$Id;->SERVER_STATS_LB_LATENCY_ID:Lio/opencensus/common/ServerStatsFieldEnums$Id;

    invoke-virtual {v1}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->value()I

    move-result v1

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 63
    invoke-virtual {p0}, Lio/opencensus/common/ServerStats;->getLbLatencyNs()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 65
    sget-object v1, Lio/opencensus/common/ServerStatsFieldEnums$Id;->SERVER_STATS_SERVICE_LATENCY_ID:Lio/opencensus/common/ServerStatsFieldEnums$Id;

    invoke-virtual {v1}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->value()I

    move-result v1

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 66
    invoke-virtual {p0}, Lio/opencensus/common/ServerStats;->getServiceLatencyNs()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 68
    sget-object v1, Lio/opencensus/common/ServerStatsFieldEnums$Id;->SERVER_STATS_TRACE_OPTION_ID:Lio/opencensus/common/ServerStatsFieldEnums$Id;

    invoke-virtual {v1}, Lio/opencensus/common/ServerStatsFieldEnums$Id;->value()I

    move-result v1

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 69
    invoke-virtual {p0}, Lio/opencensus/common/ServerStats;->getTraceOption()B

    move-result p0

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 70
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    return-object p0
.end method
