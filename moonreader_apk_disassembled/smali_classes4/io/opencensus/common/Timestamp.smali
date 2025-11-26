.class public abstract Lio/opencensus/common/Timestamp;
.super Ljava/lang/Object;
.source "Timestamp.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lio/opencensus/common/Timestamp;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(JI)Lio/opencensus/common/Timestamp;
    .locals 3

    const-wide v0, -0x4979cb9e00L

    cmp-long v2, p0, v0

    if-ltz v2, :cond_3

    const-wide v0, 0x4979cb9e00L

    cmp-long v2, p0, v0

    if-gtz v2, :cond_2

    if-ltz p2, :cond_1

    const v0, 0x3b9ac9ff

    if-gt p2, v0, :cond_0

    .line 73
    new-instance v0, Lio/opencensus/common/AutoValue_Timestamp;

    invoke-direct {v0, p0, p1, p2}, Lio/opencensus/common/AutoValue_Timestamp;-><init>(JI)V

    return-object v0

    .line 70
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\'nanos\' is greater than maximum (999999999): "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 67
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\'nanos\' is less than zero: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 63
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\'seconds\' is greater than maximum (315576000000): "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 59
    :cond_3
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\'seconds\' is less than minimum (-315576000000): "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private static floorDiv(JJ)J
    .locals 0

    .line 193
    invoke-static {p0, p1}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-static {p2, p3}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object p1

    const/4 p2, 0x0

    sget-object p3, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    invoke-virtual {p0, p1, p2, p3}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method private static floorMod(JJ)J
    .locals 2

    .line 198
    invoke-static {p0, p1, p2, p3}, Lio/opencensus/common/Timestamp;->floorDiv(JJ)J

    move-result-wide v0

    mul-long v0, v0, p2

    sub-long/2addr p0, v0

    return-wide p0
.end method

.method public static fromMillis(J)Lio/opencensus/common/Timestamp;
    .locals 4

    const-wide/16 v0, 0x3e8

    .line 86
    invoke-static {p0, p1, v0, v1}, Lio/opencensus/common/Timestamp;->floorDiv(JJ)J

    move-result-wide v2

    .line 87
    invoke-static {p0, p1, v0, v1}, Lio/opencensus/common/Timestamp;->floorMod(JJ)J

    move-result-wide p0

    long-to-int p1, p0

    int-to-long p0, p1

    const-wide/32 v0, 0xf4240

    mul-long p0, p0, v0

    long-to-int p1, p0

    .line 88
    invoke-static {v2, v3, p1}, Lio/opencensus/common/Timestamp;->create(JI)Lio/opencensus/common/Timestamp;

    move-result-object p0

    return-object p0
.end method

.method private static ofEpochSecond(JJ)Lio/opencensus/common/Timestamp;
    .locals 4

    const-wide/32 v0, 0x3b9aca00

    .line 186
    invoke-static {p2, p3, v0, v1}, Lio/opencensus/common/Timestamp;->floorDiv(JJ)J

    move-result-wide v2

    invoke-static {p0, p1, v2, v3}, Lio/opencensus/common/TimeUtils;->checkedAdd(JJ)J

    move-result-wide p0

    .line 187
    invoke-static {p2, p3, v0, v1}, Lio/opencensus/common/Timestamp;->floorMod(JJ)J

    move-result-wide p2

    long-to-int p3, p2

    .line 188
    invoke-static {p0, p1, p3}, Lio/opencensus/common/Timestamp;->create(JI)Lio/opencensus/common/Timestamp;

    move-result-object p0

    return-object p0
.end method

.method private plus(JJ)Lio/opencensus/common/Timestamp;
    .locals 5

    or-long v0, p1, p3

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return-object p0

    .line 176
    :cond_0
    invoke-virtual {p0}, Lio/opencensus/common/Timestamp;->getSeconds()J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lio/opencensus/common/TimeUtils;->checkedAdd(JJ)J

    move-result-wide p1

    const-wide/32 v0, 0x3b9aca00

    .line 177
    div-long v2, p3, v0

    invoke-static {p1, p2, v2, v3}, Lio/opencensus/common/TimeUtils;->checkedAdd(JJ)J

    move-result-wide p1

    .line 178
    rem-long/2addr p3, v0

    .line 179
    invoke-virtual {p0}, Lio/opencensus/common/Timestamp;->getNanos()I

    move-result v0

    int-to-long v0, v0

    add-long/2addr v0, p3

    .line 180
    invoke-static {p1, p2, v0, v1}, Lio/opencensus/common/Timestamp;->ofEpochSecond(JJ)Lio/opencensus/common/Timestamp;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public addDuration(Lio/opencensus/common/Duration;)Lio/opencensus/common/Timestamp;
    .locals 4

    .line 130
    invoke-virtual {p1}, Lio/opencensus/common/Duration;->getSeconds()J

    move-result-wide v0

    invoke-virtual {p1}, Lio/opencensus/common/Duration;->getNanos()I

    move-result p1

    int-to-long v2, p1

    invoke-direct {p0, v0, v1, v2, v3}, Lio/opencensus/common/Timestamp;->plus(JJ)Lio/opencensus/common/Timestamp;

    move-result-object p1

    return-object p1
.end method

.method public addNanos(J)Lio/opencensus/common/Timestamp;
    .locals 2

    const-wide/16 v0, 0x0

    .line 119
    invoke-direct {p0, v0, v1, p1, p2}, Lio/opencensus/common/Timestamp;->plus(JJ)Lio/opencensus/common/Timestamp;

    move-result-object p1

    return-object p1
.end method

.method public compareTo(Lio/opencensus/common/Timestamp;)I
    .locals 4

    .line 164
    invoke-virtual {p0}, Lio/opencensus/common/Timestamp;->getSeconds()J

    move-result-wide v0

    invoke-virtual {p1}, Lio/opencensus/common/Timestamp;->getSeconds()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lio/opencensus/common/TimeUtils;->compareLongs(JJ)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 168
    :cond_0
    invoke-virtual {p0}, Lio/opencensus/common/Timestamp;->getNanos()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1}, Lio/opencensus/common/Timestamp;->getNanos()I

    move-result p1

    int-to-long v2, p1

    invoke-static {v0, v1, v2, v3}, Lio/opencensus/common/TimeUtils;->compareLongs(JJ)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 39
    check-cast p1, Lio/opencensus/common/Timestamp;

    invoke-virtual {p0, p1}, Lio/opencensus/common/Timestamp;->compareTo(Lio/opencensus/common/Timestamp;)I

    move-result p1

    return p1
.end method

.method public abstract getNanos()I
.end method

.method public abstract getSeconds()J
.end method

.method public subtractTimestamp(Lio/opencensus/common/Timestamp;)Lio/opencensus/common/Duration;
    .locals 9

    .line 142
    invoke-virtual {p0}, Lio/opencensus/common/Timestamp;->getSeconds()J

    move-result-wide v0

    invoke-virtual {p1}, Lio/opencensus/common/Timestamp;->getSeconds()J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 143
    invoke-virtual {p0}, Lio/opencensus/common/Timestamp;->getNanos()I

    move-result v2

    invoke-virtual {p1}, Lio/opencensus/common/Timestamp;->getNanos()I

    move-result p1

    sub-int/2addr v2, p1

    const-wide/16 v3, 0x0

    const-wide/32 v5, 0x3b9aca00

    const-wide/16 v7, 0x1

    cmp-long p1, v0, v3

    if-gez p1, :cond_0

    if-lez v2, :cond_0

    add-long/2addr v0, v7

    int-to-long v2, v2

    sub-long/2addr v2, v5

    :goto_0
    long-to-int v2, v2

    goto :goto_1

    :cond_0
    if-lez p1, :cond_1

    if-gez v2, :cond_1

    sub-long/2addr v0, v7

    int-to-long v2, v2

    add-long/2addr v2, v5

    goto :goto_0

    .line 151
    :cond_1
    :goto_1
    invoke-static {v0, v1, v2}, Lio/opencensus/common/Duration;->create(JI)Lio/opencensus/common/Duration;

    move-result-object p1

    return-object p1
.end method
