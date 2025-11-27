.class final Lio/opencensus/trace/export/AutoValue_RunningSpanStore_PerSpanNameSummary;
.super Lio/opencensus/trace/export/RunningSpanStore$PerSpanNameSummary;
.source "AutoValue_RunningSpanStore_PerSpanNameSummary.java"


# instance fields
.field private final numRunningSpans:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lio/opencensus/trace/export/RunningSpanStore$PerSpanNameSummary;-><init>()V

    .line 13
    iput p1, p0, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_PerSpanNameSummary;->numRunningSpans:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 33
    :cond_0
    instance-of v1, p1, Lio/opencensus/trace/export/RunningSpanStore$PerSpanNameSummary;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 34
    check-cast p1, Lio/opencensus/trace/export/RunningSpanStore$PerSpanNameSummary;

    .line 35
    iget v1, p0, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_PerSpanNameSummary;->numRunningSpans:I

    invoke-virtual {p1}, Lio/opencensus/trace/export/RunningSpanStore$PerSpanNameSummary;->getNumRunningSpans()I

    move-result p1

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getNumRunningSpans()I
    .locals 1

    .line 18
    iget v0, p0, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_PerSpanNameSummary;->numRunningSpans:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    const v0, 0xf4243

    .line 44
    iget v1, p0, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_PerSpanNameSummary;->numRunningSpans:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PerSpanNameSummary{numRunningSpans="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_PerSpanNameSummary;->numRunningSpans:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
