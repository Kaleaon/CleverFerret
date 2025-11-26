.class final Lio/opencensus/trace/export/AutoValue_SampledSpanStore_Summary;
.super Lio/opencensus/trace/export/SampledSpanStore$Summary;
.source "AutoValue_SampledSpanStore_Summary.java"


# instance fields
.field private final perSpanNameSummary:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;",
            ">;)V"
        }
    .end annotation

    .line 13
    invoke-direct {p0}, Lio/opencensus/trace/export/SampledSpanStore$Summary;-><init>()V

    if-eqz p1, :cond_0

    .line 17
    iput-object p1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_Summary;->perSpanNameSummary:Ljava/util/Map;

    return-void

    .line 15
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null perSpanNameSummary"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 37
    :cond_0
    instance-of v0, p1, Lio/opencensus/trace/export/SampledSpanStore$Summary;

    if-eqz v0, :cond_1

    .line 38
    check-cast p1, Lio/opencensus/trace/export/SampledSpanStore$Summary;

    .line 39
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_Summary;->perSpanNameSummary:Ljava/util/Map;

    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$Summary;->getPerSpanNameSummary()Ljava/util/Map;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getPerSpanNameSummary()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;",
            ">;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_Summary;->perSpanNameSummary:Ljava/util/Map;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 48
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_Summary;->perSpanNameSummary:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Summary{perSpanNameSummary="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_Summary;->perSpanNameSummary:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
