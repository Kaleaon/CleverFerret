.class public Lorg/apache/commons/net/ntp/TimeStamp;
.super Ljava/lang/Object;
.source "TimeStamp.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable<",
        "Lorg/apache/commons/net/ntp/TimeStamp;",
        ">;"
    }
.end annotation


# static fields
.field public static final NTP_DATE_FORMAT:Ljava/lang/String; = "EEE, MMM dd yyyy HH:mm:ss.SSS"

.field protected static final msb0baseTime:J = 0x1e5ae01dc00L

.field protected static final msb1baseTime:J = -0x20251fe2400L

.field private static final serialVersionUID:J = 0x70f667418312e431L


# instance fields
.field private final ntpTime:J

.field private simpleFormatter:Ljava/text/DateFormat;

.field private utcFormatter:Ljava/text/DateFormat;


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-wide p1, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    invoke-static {p1}, Lorg/apache/commons/net/ntp/TimeStamp;->decodeNtpHexString(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 2

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    .line 118
    :cond_0
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/commons/net/ntp/TimeStamp;->toNtpTime(J)J

    move-result-wide v0

    :goto_0
    iput-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    return-void
.end method

.method private static appendHexString(Ljava/lang/StringBuilder;J)V
    .locals 1

    .line 364
    invoke-static {p1, p2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object p1

    .line 365
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    :goto_0
    const/16 v0, 0x8

    if-ge p2, v0, :cond_0

    const/16 v0, 0x30

    .line 366
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 368
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method protected static decodeNtpHexString(Ljava/lang/String;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    if-eqz p0, :cond_2

    const/16 v0, 0x2e

    .line 252
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    const/16 v2, 0x20

    const/16 v3, 0x10

    if-ne v0, v1, :cond_1

    .line 254
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 257
    :cond_0
    invoke-static {p0, v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    shl-long/2addr v0, v2

    return-wide v0

    :cond_1
    const/4 v1, 0x0

    .line 260
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v4

    shl-long v1, v4, v2

    add-int/lit8 v0, v0, 0x1

    .line 261
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v3

    or-long/2addr v1, v3

    return-wide v1

    .line 250
    :cond_2
    new-instance p0, Ljava/lang/NumberFormatException;

    const-string v0, "null"

    invoke-direct {p0, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getCurrentTime()Lorg/apache/commons/net/ntp/TimeStamp;
    .locals 2

    .line 235
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/apache/commons/net/ntp/TimeStamp;->getNtpTime(J)Lorg/apache/commons/net/ntp/TimeStamp;

    move-result-object v0

    return-object v0
.end method

.method public static getNtpTime(J)Lorg/apache/commons/net/ntp/TimeStamp;
    .locals 1

    .line 223
    new-instance v0, Lorg/apache/commons/net/ntp/TimeStamp;

    invoke-static {p0, p1}, Lorg/apache/commons/net/ntp/TimeStamp;->toNtpTime(J)J

    move-result-wide p0

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/net/ntp/TimeStamp;-><init>(J)V

    return-object v0
.end method

.method public static getTime(J)J
    .locals 9

    const/16 v0, 0x20

    ushr-long v0, p0, v0

    const-wide v2, 0xffffffffL

    and-long v4, v0, v2

    and-long/2addr p0, v2

    const-wide v2, 0x408f400000000000L    # 1000.0

    long-to-double p0, p0

    mul-double p0, p0, v2

    const-wide/high16 v2, 0x41f0000000000000L    # 4.294967296E9

    div-double/2addr p0, v2

    .line 191
    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    const-wide v2, 0x80000000L

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    const-wide/16 v6, 0x3e8

    cmp-long v8, v0, v2

    if-nez v8, :cond_0

    const-wide v0, 0x1e5ae01dc00L

    :goto_0
    mul-long v4, v4, v6

    add-long/2addr v4, v0

    add-long/2addr v4, p0

    return-wide v4

    :cond_0
    const-wide v0, -0x20251fe2400L

    goto :goto_0
.end method

.method public static parseNtpString(Ljava/lang/String;)Lorg/apache/commons/net/ntp/TimeStamp;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 275
    new-instance v0, Lorg/apache/commons/net/ntp/TimeStamp;

    invoke-static {p0}, Lorg/apache/commons/net/ntp/TimeStamp;->decodeNtpHexString(Ljava/lang/String;)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/ntp/TimeStamp;-><init>(J)V

    return-object v0
.end method

.method protected static toNtpTime(J)J
    .locals 7

    const-wide v0, 0x1e5ae01dc00L

    cmp-long v2, p0, v0

    if-gez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    const-wide v0, -0x20251fe2400L

    :cond_1
    sub-long/2addr p0, v0

    const-wide/16 v0, 0x3e8

    .line 295
    div-long v3, p0, v0

    .line 296
    rem-long/2addr p0, v0

    const-wide v5, 0x100000000L

    mul-long p0, p0, v5

    div-long/2addr p0, v0

    if-eqz v2, :cond_2

    const-wide v0, 0x80000000L

    or-long/2addr v3, v0

    :cond_2
    const/16 v0, 0x20

    shl-long v0, v3, v0

    or-long/2addr p0, v0

    return-wide p0
.end method

.method public static toString(J)Ljava/lang/String;
    .locals 5

    .line 383
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x20

    ushr-long v1, p0, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    .line 385
    invoke-static {v0, v1, v2}, Lorg/apache/commons/net/ntp/TimeStamp;->appendHexString(Ljava/lang/StringBuilder;J)V

    const/16 v1, 0x2e

    .line 388
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    and-long/2addr p0, v3

    .line 389
    invoke-static {v0, p0, p1}, Lorg/apache/commons/net/ntp/TimeStamp;->appendHexString(Ljava/lang/StringBuilder;J)V

    .line 391
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 43
    check-cast p1, Lorg/apache/commons/net/ntp/TimeStamp;

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/ntp/TimeStamp;->compareTo(Lorg/apache/commons/net/ntp/TimeStamp;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/net/ntp/TimeStamp;)I
    .locals 4

    .line 447
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    .line 448
    iget-wide v2, p1, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    if-nez p1, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 335
    instance-of v0, p1, Lorg/apache/commons/net/ntp/TimeStamp;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 336
    iget-wide v2, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    check-cast p1, Lorg/apache/commons/net/ntp/TimeStamp;

    invoke-virtual {p1}, Lorg/apache/commons/net/ntp/TimeStamp;->ntpValue()J

    move-result-wide v4

    cmp-long p1, v2, v4

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v1
.end method

.method public getDate()Ljava/util/Date;
    .locals 3

    .line 169
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    invoke-static {v1, v2}, Lorg/apache/commons/net/ntp/TimeStamp;->getTime(J)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getFraction()J
    .locals 4

    .line 148
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public getSeconds()J
    .locals 4

    .line 138
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    const/16 v2, 0x20

    ushr-long/2addr v0, v2

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public getTime()J
    .locals 2

    .line 159
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    invoke-static {v0, v1}, Lorg/apache/commons/net/ntp/TimeStamp;->getTime(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    .line 319
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v1, v0

    return v1
.end method

.method public ntpValue()J
    .locals 2

    .line 128
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    return-wide v0
.end method

.method public toDateString()Ljava/lang/String;
    .locals 3

    .line 405
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->simpleFormatter:Ljava/text/DateFormat;

    if-nez v0, :cond_0

    .line 406
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "EEE, MMM dd yyyy HH:mm:ss.SSS"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->simpleFormatter:Ljava/text/DateFormat;

    .line 407
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 409
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/TimeStamp;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 410
    iget-object v1, p0, Lorg/apache/commons/net/ntp/TimeStamp;->simpleFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 353
    iget-wide v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->ntpTime:J

    invoke-static {v0, v1}, Lorg/apache/commons/net/ntp/TimeStamp;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toUTCString()Ljava/lang/String;
    .locals 3

    .line 424
    iget-object v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->utcFormatter:Ljava/text/DateFormat;

    if-nez v0, :cond_0

    .line 425
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "EEE, MMM dd yyyy HH:mm:ss.SSS \'UTC\'"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lorg/apache/commons/net/ntp/TimeStamp;->utcFormatter:Ljava/text/DateFormat;

    .line 427
    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 429
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/net/ntp/TimeStamp;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 430
    iget-object v1, p0, Lorg/apache/commons/net/ntp/TimeStamp;->utcFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
