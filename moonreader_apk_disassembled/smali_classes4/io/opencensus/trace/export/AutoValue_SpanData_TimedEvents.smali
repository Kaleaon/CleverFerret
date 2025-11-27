.class final Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;
.super Lio/opencensus/trace/export/SpanData$TimedEvents;
.source "AutoValue_SpanData_TimedEvents.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/opencensus/trace/export/SpanData$TimedEvents<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final droppedEventsCount:I

.field private final events:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/trace/export/SpanData$TimedEvent<",
            "TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/trace/export/SpanData$TimedEvent<",
            "TT;>;>;I)V"
        }
    .end annotation

    .line 15
    invoke-direct {p0}, Lio/opencensus/trace/export/SpanData$TimedEvents;-><init>()V

    if-eqz p1, :cond_0

    .line 19
    iput-object p1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->events:Ljava/util/List;

    .line 20
    iput p2, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->droppedEventsCount:I

    return-void

    .line 17
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null events"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 46
    :cond_0
    instance-of v1, p1, Lio/opencensus/trace/export/SpanData$TimedEvents;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 47
    check-cast p1, Lio/opencensus/trace/export/SpanData$TimedEvents;

    .line 48
    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->events:Ljava/util/List;

    invoke-virtual {p1}, Lio/opencensus/trace/export/SpanData$TimedEvents;->getEvents()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->droppedEventsCount:I

    .line 49
    invoke-virtual {p1}, Lio/opencensus/trace/export/SpanData$TimedEvents;->getDroppedEventsCount()I

    move-result p1

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getDroppedEventsCount()I
    .locals 1

    .line 30
    iget v0, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->droppedEventsCount:I

    return v0
.end method

.method public getEvents()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/trace/export/SpanData$TimedEvent<",
            "TT;>;>;"
        }
    .end annotation

    .line 25
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->events:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 58
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->events:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 60
    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->droppedEventsCount:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TimedEvents{events="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->events:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", droppedEventsCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvents;->droppedEventsCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
