.class final Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;
.super Lio/opencensus/trace/config/TraceParams$Builder;
.source "AutoValue_TraceParams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/config/AutoValue_TraceParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private maxNumberOfAnnotations:Ljava/lang/Integer;

.field private maxNumberOfAttributes:Ljava/lang/Integer;

.field private maxNumberOfLinks:Ljava/lang/Integer;

.field private maxNumberOfMessageEvents:Ljava/lang/Integer;

.field private sampler:Lio/opencensus/trace/Sampler;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 108
    invoke-direct {p0}, Lio/opencensus/trace/config/TraceParams$Builder;-><init>()V

    return-void
.end method

.method private constructor <init>(Lio/opencensus/trace/config/TraceParams;)V
    .locals 1

    .line 110
    invoke-direct {p0}, Lio/opencensus/trace/config/TraceParams$Builder;-><init>()V

    .line 111
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getSampler()Lio/opencensus/trace/Sampler;

    move-result-object v0

    iput-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->sampler:Lio/opencensus/trace/Sampler;

    .line 112
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfAttributes()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfAttributes:Ljava/lang/Integer;

    .line 113
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfAnnotations()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfAnnotations:Ljava/lang/Integer;

    .line 114
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfMessageEvents()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfMessageEvents:Ljava/lang/Integer;

    .line 115
    invoke-virtual {p1}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfLinks()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfLinks:Ljava/lang/Integer;

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/trace/config/TraceParams;Lio/opencensus/trace/config/AutoValue_TraceParams$1;)V
    .locals 0

    .line 102
    invoke-direct {p0, p1}, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;-><init>(Lio/opencensus/trace/config/TraceParams;)V

    return-void
.end method


# virtual methods
.method autoBuild()Lio/opencensus/trace/config/TraceParams;
    .locals 9

    .line 148
    iget-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->sampler:Lio/opencensus/trace/Sampler;

    if-nez v0, :cond_0

    .line 149
    const-string v0, " sampler"

    goto :goto_0

    .line 148
    :cond_0
    const-string v0, ""

    .line 151
    :goto_0
    iget-object v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfAttributes:Ljava/lang/Integer;

    if-nez v1, :cond_1

    .line 152
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " maxNumberOfAttributes"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 154
    :cond_1
    iget-object v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfAnnotations:Ljava/lang/Integer;

    if-nez v1, :cond_2

    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " maxNumberOfAnnotations"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 157
    :cond_2
    iget-object v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfMessageEvents:Ljava/lang/Integer;

    if-nez v1, :cond_3

    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " maxNumberOfMessageEvents"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 160
    :cond_3
    iget-object v1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfLinks:Ljava/lang/Integer;

    if-nez v1, :cond_4

    .line 161
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " maxNumberOfLinks"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 163
    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 166
    new-instance v2, Lio/opencensus/trace/config/AutoValue_TraceParams;

    iget-object v3, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->sampler:Lio/opencensus/trace/Sampler;

    iget-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfAttributes:Ljava/lang/Integer;

    .line 168
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfAnnotations:Ljava/lang/Integer;

    .line 169
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfMessageEvents:Ljava/lang/Integer;

    .line 170
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v0, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfLinks:Ljava/lang/Integer;

    .line 171
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v8}, Lio/opencensus/trace/config/AutoValue_TraceParams;-><init>(Lio/opencensus/trace/Sampler;IIIILio/opencensus/trace/config/AutoValue_TraceParams$1;)V

    return-object v2

    .line 164
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Missing required properties:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setMaxNumberOfAnnotations(I)Lio/opencensus/trace/config/TraceParams$Builder;
    .locals 0

    .line 132
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfAnnotations:Ljava/lang/Integer;

    return-object p0
.end method

.method public setMaxNumberOfAttributes(I)Lio/opencensus/trace/config/TraceParams$Builder;
    .locals 0

    .line 127
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfAttributes:Ljava/lang/Integer;

    return-object p0
.end method

.method public setMaxNumberOfLinks(I)Lio/opencensus/trace/config/TraceParams$Builder;
    .locals 0

    .line 142
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfLinks:Ljava/lang/Integer;

    return-object p0
.end method

.method public setMaxNumberOfMessageEvents(I)Lio/opencensus/trace/config/TraceParams$Builder;
    .locals 0

    .line 137
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->maxNumberOfMessageEvents:Ljava/lang/Integer;

    return-object p0
.end method

.method public setSampler(Lio/opencensus/trace/Sampler;)Lio/opencensus/trace/config/TraceParams$Builder;
    .locals 1

    if-eqz p1, :cond_0

    .line 122
    iput-object p1, p0, Lio/opencensus/trace/config/AutoValue_TraceParams$Builder;->sampler:Lio/opencensus/trace/Sampler;

    return-object p0

    .line 120
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null sampler"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
