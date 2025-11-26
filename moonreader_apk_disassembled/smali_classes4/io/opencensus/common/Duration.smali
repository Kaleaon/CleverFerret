.class public abstract Lio/opencensus/common/Duration;
.super Ljava/lang/Object;
.source "Duration.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lio/opencensus/common/Duration;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(JI)Lio/opencensus/common/Duration;
    .locals 3

    const-wide v0, -0x4979cb9e00L

    cmp-long v2, p0, v0

    if-ltz v2, :cond_6

    const-wide v0, 0x4979cb9e00L

    cmp-long v2, p0, v0

    if-gtz v2, :cond_5

    const v0, -0x3b9ac9ff

    if-lt p2, v0, :cond_4

    const v0, 0x3b9ac9ff

    if-gt p2, v0, :cond_3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gez v2, :cond_0

    if-gtz p2, :cond_1

    :cond_0
    if-lez v2, :cond_2

    if-ltz p2, :cond_1

    goto :goto_0

    .line 71
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\'seconds\' and \'nanos\' have inconsistent sign: seconds="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, ", nanos="

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_2
    :goto_0
    new-instance v0, Lio/opencensus/common/AutoValue_Duration;

    invoke-direct {v0, p0, p1, p2}, Lio/opencensus/common/AutoValue_Duration;-><init>(JI)V

    return-object v0

    .line 67
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\'nanos\' is greater than maximum (999999999): "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 63
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\'nanos\' is less than minimum (-999999999): "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 59
    :cond_5
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\'seconds\' is greater than maximum (315576000000): "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 55
    :cond_6
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

.method public static fromMillis(J)Lio/opencensus/common/Duration;
    .locals 4

    const-wide/16 v0, 0x3e8

    .line 87
    div-long v2, p0, v0

    .line 88
    rem-long/2addr p0, v0

    const-wide/32 v0, 0xf4240

    mul-long p0, p0, v0

    long-to-int p1, p0

    .line 89
    invoke-static {v2, v3, p1}, Lio/opencensus/common/Duration;->create(JI)Lio/opencensus/common/Duration;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public compareTo(Lio/opencensus/common/Duration;)I
    .locals 4

    .line 128
    invoke-virtual {p0}, Lio/opencensus/common/Duration;->getSeconds()J

    move-result-wide v0

    invoke-virtual {p1}, Lio/opencensus/common/Duration;->getSeconds()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lio/opencensus/common/TimeUtils;->compareLongs(JJ)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 132
    :cond_0
    invoke-virtual {p0}, Lio/opencensus/common/Duration;->getNanos()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1}, Lio/opencensus/common/Duration;->getNanos()I

    move-result p1

    int-to-long v2, p1

    invoke-static {v0, v1, v2, v3}, Lio/opencensus/common/TimeUtils;->compareLongs(JJ)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 35
    check-cast p1, Lio/opencensus/common/Duration;

    invoke-virtual {p0, p1}, Lio/opencensus/common/Duration;->compareTo(Lio/opencensus/common/Duration;)I

    move-result p1

    return p1
.end method

.method public abstract getNanos()I
.end method

.method public abstract getSeconds()J
.end method

.method public toMillis()J
    .locals 5

    .line 99
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0}, Lio/opencensus/common/Duration;->getSeconds()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0}, Lio/opencensus/common/Duration;->getNanos()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method
