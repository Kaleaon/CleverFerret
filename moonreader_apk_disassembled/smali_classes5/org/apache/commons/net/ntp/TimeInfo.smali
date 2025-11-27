.class public Lorg/apache/commons/net/ntp/TimeInfo;
.super Ljava/lang/Object;
.source "TimeInfo.java"


# instance fields
.field private comments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private delayMillis:Ljava/lang/Long;

.field private detailsComputed:Z

.field private final message:Lorg/apache/commons/net/ntp/NtpV3Packet;

.field private offsetMillis:Ljava/lang/Long;

.field private final returnTimeMillis:J


# direct methods
.method public constructor <init>(Lorg/apache/commons/net/ntp/NtpV3Packet;J)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    .line 54
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/ntp/TimeInfo;-><init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/net/ntp/NtpV3Packet;",
            "J",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    .line 67
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/ntp/TimeInfo;-><init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/net/ntp/NtpV3Packet;",
            "J",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 104
    iput-wide p2, p0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    .line 105
    iput-object p1, p0, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    .line 106
    iput-object p4, p0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    if-eqz p5, :cond_0

    .line 108
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/TimeInfo;->computeDetails()V

    :cond_0
    return-void

    .line 102
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "message cannot be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JZ)V
    .locals 6

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v5, p4

    .line 83
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/ntp/TimeInfo;-><init>(Lorg/apache/commons/net/ntp/NtpV3Packet;JLjava/util/List;Z)V

    return-void
.end method


# virtual methods
.method public addComment(Ljava/lang/String;)V
    .locals 1

    .line 121
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    .line 124
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public computeDetails()V
    .locals 18

    move-object/from16 v0, p0

    .line 133
    iget-boolean v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->detailsComputed:Z

    if-eqz v1, :cond_0

    goto/16 :goto_4

    :cond_0
    const/4 v1, 0x1

    .line 136
    iput-boolean v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->detailsComputed:Z

    .line 137
    iget-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    if-nez v1, :cond_1

    .line 138
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    .line 141
    :cond_1
    iget-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-interface {v1}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getOriginateTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v1

    .line 142
    invoke-virtual {v1}, Lorg/apache/commons/net/ntp/TimeStamp;->getTime()J

    move-result-wide v2

    .line 145
    iget-object v4, v0, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-interface {v4}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getReceiveTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v4

    .line 146
    invoke-virtual {v4}, Lorg/apache/commons/net/ntp/TimeStamp;->getTime()J

    move-result-wide v5

    .line 149
    iget-object v7, v0, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-interface {v7}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getTransmitTimeStamp()Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v7

    .line 150
    invoke-virtual {v7}, Lorg/apache/commons/net/ntp/TimeStamp;->getTime()J

    move-result-wide v8

    .line 168
    invoke-virtual {v1}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v1, v10, v12

    if-nez v1, :cond_3

    .line 172
    invoke-virtual {v7}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v1

    cmp-long v3, v1, v12

    if-eqz v3, :cond_2

    .line 174
    iget-wide v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    sub-long/2addr v8, v1

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->offsetMillis:Ljava/lang/Long;

    .line 175
    iget-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    const-string v2, "Error: zero orig time -- cannot compute delay"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 177
    :cond_2
    iget-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    const-string v2, "Error: zero orig time -- cannot compute delay/offset"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 179
    :cond_3
    invoke-virtual {v4}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v10

    const-string v1, "Error: OrigTime > DestRcvTime"

    cmp-long v14, v10, v12

    if-eqz v14, :cond_a

    invoke-virtual {v7}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v10

    cmp-long v14, v10, v12

    if-nez v14, :cond_4

    goto :goto_2

    .line 204
    :cond_4
    iget-wide v10, v0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    sub-long/2addr v10, v2

    cmp-long v4, v8, v5

    if-gez v4, :cond_5

    .line 209
    iget-object v4, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    const-string v7, "Error: xmitTime < rcvTime"

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    sub-long v14, v8, v5

    cmp-long v4, v14, v10

    if-gtz v4, :cond_6

    sub-long v12, v10, v14

    goto :goto_1

    :cond_6
    sub-long/2addr v14, v10

    const-wide/16 v16, 0x1

    cmp-long v4, v14, v16

    if-nez v4, :cond_7

    cmp-long v4, v10, v12

    if-eqz v4, :cond_8

    .line 228
    iget-object v4, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    const-string v7, "Info: processing time > total network time by 1 ms -> assume zero delay"

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 232
    :cond_7
    iget-object v4, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    const-string v7, "Warning: processing time > total network time"

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_8
    :goto_0
    move-wide v12, v10

    .line 236
    :goto_1
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, v0, Lorg/apache/commons/net/ntp/TimeInfo;->delayMillis:Ljava/lang/Long;

    .line 237
    iget-wide v10, v0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    cmp-long v4, v2, v10

    if-lez v4, :cond_9

    .line 238
    iget-object v4, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_9
    sub-long/2addr v5, v2

    .line 241
    iget-wide v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    sub-long/2addr v8, v1

    add-long/2addr v5, v8

    const-wide/16 v1, 0x2

    div-long/2addr v5, v1

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->offsetMillis:Ljava/lang/Long;

    return-void

    .line 180
    :cond_a
    :goto_2
    iget-object v10, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    const-string v11, "Warning: zero rcvNtpTime or xmitNtpTime"

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    iget-wide v10, v0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    cmp-long v14, v2, v10

    if-lez v14, :cond_b

    .line 183
    iget-object v10, v0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    invoke-interface {v10, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_b
    sub-long/2addr v10, v2

    .line 187
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->delayMillis:Ljava/lang/Long;

    .line 193
    :goto_3
    invoke-virtual {v4}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v10

    cmp-long v1, v10, v12

    if-eqz v1, :cond_c

    sub-long/2addr v5, v2

    .line 196
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->offsetMillis:Ljava/lang/Long;

    return-void

    .line 197
    :cond_c
    invoke-virtual {v7}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v1

    cmp-long v3, v1, v12

    if-eqz v3, :cond_d

    .line 200
    iget-wide v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    sub-long/2addr v8, v1

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lorg/apache/commons/net/ntp/TimeInfo;->offsetMillis:Ljava/lang/Long;

    :cond_d
    :goto_4
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_2

    .line 323
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 326
    :cond_1
    check-cast p1, Lorg/apache/commons/net/ntp/TimeInfo;

    .line 327
    iget-wide v2, p0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    iget-wide v4, p1, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-object v2, p0, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    iget-object p1, p1, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v0

    :cond_2
    :goto_0
    return v1
.end method

.method public getAddress()Ljava/net/InetAddress;
    .locals 1

    .line 292
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-interface {v0}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getDatagramPacket()Ljava/net/DatagramPacket;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 293
    :cond_0
    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getComments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 252
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->comments:Ljava/util/List;

    return-object v0
.end method

.method public getDelay()Ljava/lang/Long;
    .locals 1

    .line 262
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->delayMillis:Ljava/lang/Long;

    return-object v0
.end method

.method public getMessage()Lorg/apache/commons/net/ntp/NtpV3Packet;
    .locals 1

    .line 283
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    return-object v0
.end method

.method public getOffset()Ljava/lang/Long;
    .locals 1

    .line 273
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->offsetMillis:Ljava/lang/Long;

    return-object v0
.end method

.method public getReturnTime()J
    .locals 2

    .line 303
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 2

    .line 341
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->returnTimeMillis:J

    long-to-int v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 342
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeInfo;->message:Lorg/apache/commons/net/ntp/NtpV3Packet;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method
