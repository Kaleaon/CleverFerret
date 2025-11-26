.class final Lio/opencensus/trace/AutoValue_Tracestate;
.super Lio/opencensus/trace/Tracestate;
.source "AutoValue_Tracestate.java"


# instance fields
.field private final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/trace/Tracestate$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Tracestate$Entry;",
            ">;)V"
        }
    .end annotation

    .line 13
    invoke-direct {p0}, Lio/opencensus/trace/Tracestate;-><init>()V

    if-eqz p1, :cond_0

    .line 17
    iput-object p1, p0, Lio/opencensus/trace/AutoValue_Tracestate;->entries:Ljava/util/List;

    return-void

    .line 15
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null entries"

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
    instance-of v0, p1, Lio/opencensus/trace/Tracestate;

    if-eqz v0, :cond_1

    .line 38
    check-cast p1, Lio/opencensus/trace/Tracestate;

    .line 39
    iget-object v0, p0, Lio/opencensus/trace/AutoValue_Tracestate;->entries:Ljava/util/List;

    invoke-virtual {p1}, Lio/opencensus/trace/Tracestate;->getEntries()Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Tracestate$Entry;",
            ">;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lio/opencensus/trace/AutoValue_Tracestate;->entries:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 48
    iget-object v0, p0, Lio/opencensus/trace/AutoValue_Tracestate;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Tracestate{entries="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/AutoValue_Tracestate;->entries:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
