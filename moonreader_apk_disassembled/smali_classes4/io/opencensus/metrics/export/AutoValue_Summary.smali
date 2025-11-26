.class final Lio/opencensus/metrics/export/AutoValue_Summary;
.super Lio/opencensus/metrics/export/Summary;
.source "AutoValue_Summary.java"


# instance fields
.field private final count:Ljava/lang/Long;

.field private final snapshot:Lio/opencensus/metrics/export/Summary$Snapshot;

.field private final sum:Ljava/lang/Double;


# direct methods
.method constructor <init>(Ljava/lang/Long;Ljava/lang/Double;Lio/opencensus/metrics/export/Summary$Snapshot;)V
    .locals 0
    .param p1    # Ljava/lang/Long;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Double;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0}, Lio/opencensus/metrics/export/Summary;-><init>()V

    .line 18
    iput-object p1, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->count:Ljava/lang/Long;

    .line 19
    iput-object p2, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->sum:Ljava/lang/Double;

    if-eqz p3, :cond_0

    .line 23
    iput-object p3, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->snapshot:Lio/opencensus/metrics/export/Summary$Snapshot;

    return-void

    .line 21
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null snapshot"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 57
    :cond_0
    instance-of v1, p1, Lio/opencensus/metrics/export/Summary;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 58
    check-cast p1, Lio/opencensus/metrics/export/Summary;

    .line 59
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->count:Ljava/lang/Long;

    if-nez v1, :cond_1

    invoke-virtual {p1}, Lio/opencensus/metrics/export/Summary;->getCount()Ljava/lang/Long;

    move-result-object v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lio/opencensus/metrics/export/Summary;->getCount()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_0
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->sum:Ljava/lang/Double;

    if-nez v1, :cond_2

    .line 60
    invoke-virtual {p1}, Lio/opencensus/metrics/export/Summary;->getSum()Ljava/lang/Double;

    move-result-object v1

    if-nez v1, :cond_3

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lio/opencensus/metrics/export/Summary;->getSum()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :goto_1
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->snapshot:Lio/opencensus/metrics/export/Summary$Snapshot;

    .line 61
    invoke-virtual {p1}, Lio/opencensus/metrics/export/Summary;->getSnapshot()Lio/opencensus/metrics/export/Summary$Snapshot;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    return v0

    :cond_3
    return v2
.end method

.method public getCount()Ljava/lang/Long;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 29
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->count:Ljava/lang/Long;

    return-object v0
.end method

.method public getSnapshot()Lio/opencensus/metrics/export/Summary$Snapshot;
    .locals 1

    .line 40
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->snapshot:Lio/opencensus/metrics/export/Summary$Snapshot;

    return-object v0
.end method

.method public getSum()Ljava/lang/Double;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 35
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->sum:Ljava/lang/Double;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 70
    iget-object v0, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->count:Ljava/lang/Long;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    :goto_0
    const v2, 0xf4243

    xor-int/2addr v0, v2

    mul-int v0, v0, v2

    .line 72
    iget-object v3, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->sum:Ljava/lang/Double;

    if-nez v3, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/Double;->hashCode()I

    move-result v1

    :goto_1
    xor-int/2addr v0, v1

    mul-int v0, v0, v2

    .line 74
    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->snapshot:Lio/opencensus/metrics/export/Summary$Snapshot;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Summary{count="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->count:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", sum="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->sum:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", snapshot="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/metrics/export/AutoValue_Summary;->snapshot:Lio/opencensus/metrics/export/Summary$Snapshot;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
