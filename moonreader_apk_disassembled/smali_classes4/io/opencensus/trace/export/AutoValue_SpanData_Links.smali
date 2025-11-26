.class final Lio/opencensus/trace/export/AutoValue_SpanData_Links;
.super Lio/opencensus/trace/export/SpanData$Links;
.source "AutoValue_SpanData_Links.java"


# instance fields
.field private final droppedLinksCount:I

.field private final links:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/opencensus/trace/Link;",
            ">;"
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
            "Lio/opencensus/trace/Link;",
            ">;I)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0}, Lio/opencensus/trace/export/SpanData$Links;-><init>()V

    if-eqz p1, :cond_0

    .line 20
    iput-object p1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->links:Ljava/util/List;

    .line 21
    iput p2, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->droppedLinksCount:I

    return-void

    .line 18
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null links"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 47
    :cond_0
    instance-of v1, p1, Lio/opencensus/trace/export/SpanData$Links;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 48
    check-cast p1, Lio/opencensus/trace/export/SpanData$Links;

    .line 49
    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->links:Ljava/util/List;

    invoke-virtual {p1}, Lio/opencensus/trace/export/SpanData$Links;->getLinks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->droppedLinksCount:I

    .line 50
    invoke-virtual {p1}, Lio/opencensus/trace/export/SpanData$Links;->getDroppedLinksCount()I

    move-result p1

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getDroppedLinksCount()I
    .locals 1

    .line 31
    iget v0, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->droppedLinksCount:I

    return v0
.end method

.method public getLinks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Link;",
            ">;"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->links:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 59
    iget-object v0, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->links:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 61
    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->droppedLinksCount:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Links{links="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->links:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", droppedLinksCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;->droppedLinksCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
