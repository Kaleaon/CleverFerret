.class final Lio/opencensus/tags/AutoValue_Tag;
.super Lio/opencensus/tags/Tag;
.source "AutoValue_Tag.java"


# instance fields
.field private final key:Lio/opencensus/tags/TagKey;

.field private final tagMetadata:Lio/opencensus/tags/TagMetadata;

.field private final value:Lio/opencensus/tags/TagValue;


# direct methods
.method constructor <init>(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lio/opencensus/tags/Tag;-><init>()V

    if-eqz p1, :cond_2

    .line 20
    iput-object p1, p0, Lio/opencensus/tags/AutoValue_Tag;->key:Lio/opencensus/tags/TagKey;

    if-eqz p2, :cond_1

    .line 24
    iput-object p2, p0, Lio/opencensus/tags/AutoValue_Tag;->value:Lio/opencensus/tags/TagValue;

    if-eqz p3, :cond_0

    .line 28
    iput-object p3, p0, Lio/opencensus/tags/AutoValue_Tag;->tagMetadata:Lio/opencensus/tags/TagMetadata;

    return-void

    .line 26
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null tagMetadata"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 22
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null value"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 18
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Null key"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 60
    :cond_0
    instance-of v1, p1, Lio/opencensus/tags/Tag;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 61
    check-cast p1, Lio/opencensus/tags/Tag;

    .line 62
    iget-object v1, p0, Lio/opencensus/tags/AutoValue_Tag;->key:Lio/opencensus/tags/TagKey;

    invoke-virtual {p1}, Lio/opencensus/tags/Tag;->getKey()Lio/opencensus/tags/TagKey;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/tags/AutoValue_Tag;->value:Lio/opencensus/tags/TagValue;

    .line 63
    invoke-virtual {p1}, Lio/opencensus/tags/Tag;->getValue()Lio/opencensus/tags/TagValue;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/opencensus/tags/AutoValue_Tag;->tagMetadata:Lio/opencensus/tags/TagMetadata;

    .line 64
    invoke-virtual {p1}, Lio/opencensus/tags/Tag;->getTagMetadata()Lio/opencensus/tags/TagMetadata;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getKey()Lio/opencensus/tags/TagKey;
    .locals 1

    .line 33
    iget-object v0, p0, Lio/opencensus/tags/AutoValue_Tag;->key:Lio/opencensus/tags/TagKey;

    return-object v0
.end method

.method public getTagMetadata()Lio/opencensus/tags/TagMetadata;
    .locals 1

    .line 43
    iget-object v0, p0, Lio/opencensus/tags/AutoValue_Tag;->tagMetadata:Lio/opencensus/tags/TagMetadata;

    return-object v0
.end method

.method public getValue()Lio/opencensus/tags/TagValue;
    .locals 1

    .line 38
    iget-object v0, p0, Lio/opencensus/tags/AutoValue_Tag;->value:Lio/opencensus/tags/TagValue;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 73
    iget-object v0, p0, Lio/opencensus/tags/AutoValue_Tag;->key:Lio/opencensus/tags/TagKey;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 75
    iget-object v2, p0, Lio/opencensus/tags/AutoValue_Tag;->value:Lio/opencensus/tags/TagValue;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int v0, v0, v1

    .line 77
    iget-object v1, p0, Lio/opencensus/tags/AutoValue_Tag;->tagMetadata:Lio/opencensus/tags/TagMetadata;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Tag{key="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/tags/AutoValue_Tag;->key:Lio/opencensus/tags/TagKey;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/tags/AutoValue_Tag;->value:Lio/opencensus/tags/TagValue;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", tagMetadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/tags/AutoValue_Tag;->tagMetadata:Lio/opencensus/tags/TagMetadata;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
