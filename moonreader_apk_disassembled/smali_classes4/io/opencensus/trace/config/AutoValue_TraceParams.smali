.class final Lio/opencensus/trace/config/AutoValue_TraceParams;
.super Lio/opencensus/trace/config/TraceParams;
.source "AutoValue_TraceParams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;
    }
.end annotation


# instance fields
.field private final maxNumberOfAnnotations:I

.field private final maxNumberOfAttributes:I

.field private final maxNumberOfLinks:I

.field private final maxNumberOfMessageEvents:I

.field private final sampler:Lio/opencensus/trace/Sampler;


# direct methods
.method private constructor <init>(Lio/opencensus/trace/Sampler;IIII)V
    .locals 0

    .line 21
    invoke-direct {p0}, Lio/opencensus/trace/config/TraceParams;-><init>()V

    .line 22
    iput-object p1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->sampler:Lio/opencensus/trace/Sampler;

    .line 23
    iput p2, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAttributes:I

    .line 24
    iput p3, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAnnotations:I

    .line 25
    iput p4, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfMessageEvents:I

    .line 26
    iput p5, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfLinks:I

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/trace/Sampler;IIIILio/opencensus/trace/config/AutoValue_TraceParams$1;)V
    .locals 0

    .line 8
    invoke-direct/range {p0 .. p5}, Lio/opencensus/trace/config/AutoValue_TraceParams;-><init>(Lio/opencensus/trace/Sampler;IIII)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 70
    :cond_0
    instance-of v1, p1, Lio/opencensus/trace/config/TraceParams;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 71
    check-cast p1, Lio/opencensus/trace/config/TraceParams;

    .line 72
    iget-object v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->sampler:Lio/opencensus/trace/Sampler;

    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getSampler()Lio/opencensus/trace/Sampler;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAttributes:I

    .line 73
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfAttributes()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAnnotations:I

    .line 74
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfAnnotations()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfMessageEvents:I

    .line 75
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfMessageEvents()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfLinks:I

    .line 76
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfLinks()I

    move-result p1

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getMaxNumberOfAnnotations()I
    .locals 1

    .line 41
    iget v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAnnotations:I

    return v0
.end method

.method public getMaxNumberOfAttributes()I
    .locals 1

    .line 36
    iget v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAttributes:I

    return v0
.end method

.method public getMaxNumberOfLinks()I
    .locals 1

    .line 51
    iget v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfLinks:I

    return v0
.end method

.method public getMaxNumberOfMessageEvents()I
    .locals 1

    .line 46
    iget v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfMessageEvents:I

    return v0
.end method

.method public getSampler()Lio/opencensus/trace/Sampler;
    .locals 1

    .line 31
    iget-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->sampler:Lio/opencensus/trace/Sampler;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 85
    iget-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->sampler:Lio/opencensus/trace/Sampler;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 87
    iget v2, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAttributes:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 89
    iget v2, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAnnotations:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 91
    iget v2, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfMessageEvents:I

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 93
    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfLinks:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toBuilder()Lio/opencensus/trace/config/TraceParams$Builder;
    .locals 2

    .line 99
    new-instance v0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;-><init>(Lio/opencensus/trace/config/TraceParams;Lio/opencensus/trace/config/AutoValue_TraceParams$1;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TraceParams{sampler="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->sampler:Lio/opencensus/trace/Sampler;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", maxNumberOfAttributes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAttributes:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", maxNumberOfAnnotations="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfAnnotations:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", maxNumberOfMessageEvents="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfMessageEvents:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", maxNumberOfLinks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams;->maxNumberOfLinks:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
