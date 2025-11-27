.class final Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;
.super Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;
.source "AutoValue_SampledSpanStore_ErrorFilter.java"


# instance fields
.field private final canonicalCode:Lio/opencensus/trace/Status$CanonicalCode;

.field private final maxSpansToReturn:I

.field private final spanName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lio/opencensus/trace/Status$CanonicalCode;I)V
    .locals 0
    .param p2    # Lio/opencensus/trace/Status$CanonicalCode;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0}, Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;-><init>()V

    if-eqz p1, :cond_0

    .line 22
    iput-object p1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->spanName:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->canonicalCode:Lio/opencensus/trace/Status$CanonicalCode;

    .line 24
    iput p3, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->maxSpansToReturn:I

    return-void

    .line 20
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null spanName"

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
    instance-of v1, p1, Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 58
    check-cast p1, Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;

    .line 59
    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->spanName:Ljava/lang/String;

    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;->getSpanName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->canonicalCode:Lio/opencensus/trace/Status$CanonicalCode;

    if-nez v1, :cond_1

    .line 60
    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;->getCanonicalCode()Lio/opencensus/trace/Status$CanonicalCode;

    move-result-object v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;->getCanonicalCode()Lio/opencensus/trace/Status$CanonicalCode;

    move-result-object v3

    invoke-virtual {v1, v3}, Lio/opencensus/trace/Status$CanonicalCode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :goto_0
    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->maxSpansToReturn:I

    .line 61
    invoke-virtual {p1}, Lio/opencensus/trace/export/SampledSpanStore$ErrorFilter;->getMaxSpansToReturn()I

    move-result p1

    if-ne v1, p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public getCanonicalCode()Lio/opencensus/trace/Status$CanonicalCode;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 35
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->canonicalCode:Lio/opencensus/trace/Status$CanonicalCode;

    return-object v0
.end method

.method public getMaxSpansToReturn()I
    .locals 1

    .line 40
    iget v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->maxSpansToReturn:I

    return v0
.end method

.method public getSpanName()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->spanName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 70
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->spanName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 72
    iget-object v2, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->canonicalCode:Lio/opencensus/trace/Status$CanonicalCode;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Lio/opencensus/trace/Status$CanonicalCode;->hashCode()I

    move-result v2

    :goto_0
    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 74
    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->maxSpansToReturn:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ErrorFilter{spanName="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->spanName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", canonicalCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->canonicalCode:Lio/opencensus/trace/Status$CanonicalCode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", maxSpansToReturn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_ErrorFilter;->maxSpansToReturn:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
