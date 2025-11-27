.class final Lio/opencensus/tags/AutoValue_TagMetadata;
.super Lio/opencensus/tags/TagMetadata;
.source "AutoValue_TagMetadata.java"


# instance fields
.field private final tagTtl:Lio/opencensus/tags/TagMetadata$TagTtl;


# direct methods
.method constructor <init>(Lio/opencensus/tags/TagMetadata$TagTtl;)V
    .locals 1

    .line 12
    invoke-direct {p0}, Lio/opencensus/tags/TagMetadata;-><init>()V

    if-eqz p1, :cond_0

    .line 16
    iput-object p1, p0, Lio/opencensus/tags/AutoValue_TagMetadata;->tagTtl:Lio/opencensus/tags/TagMetadata$TagTtl;

    return-void

    .line 14
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null tagTtl"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 36
    :cond_0
    instance-of v0, p1, Lio/opencensus/tags/TagMetadata;

    if-eqz v0, :cond_1

    .line 37
    check-cast p1, Lio/opencensus/tags/TagMetadata;

    .line 38
    iget-object v0, p0, Lio/opencensus/tags/AutoValue_TagMetadata;->tagTtl:Lio/opencensus/tags/TagMetadata$TagTtl;

    invoke-virtual {p1}, Lio/opencensus/tags/TagMetadata;->getTagTtl()Lio/opencensus/tags/TagMetadata$TagTtl;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/opencensus/tags/TagMetadata$TagTtl;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getTagTtl()Lio/opencensus/tags/TagMetadata$TagTtl;
    .locals 1

    .line 21
    iget-object v0, p0, Lio/opencensus/tags/AutoValue_TagMetadata;->tagTtl:Lio/opencensus/tags/TagMetadata$TagTtl;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 47
    iget-object v0, p0, Lio/opencensus/tags/AutoValue_TagMetadata;->tagTtl:Lio/opencensus/tags/TagMetadata$TagTtl;

    invoke-virtual {v0}, Lio/opencensus/tags/TagMetadata$TagTtl;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TagMetadata{tagTtl="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/tags/AutoValue_TagMetadata;->tagTtl:Lio/opencensus/tags/TagMetadata$TagTtl;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
