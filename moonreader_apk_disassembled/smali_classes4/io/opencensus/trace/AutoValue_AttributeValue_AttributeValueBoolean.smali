.class final Lio/opencensus/trace/AutoValue_AttributeValue_AttributeValueBoolean;
.super Lio/opencensus/trace/AttributeValue$AttributeValueBoolean;
.source "AutoValue_AttributeValue_AttributeValueBoolean.java"


# instance fields
.field private final booleanValue:Ljava/lang/Boolean;


# direct methods
.method constructor <init>(Ljava/lang/Boolean;)V
    .locals 1

    .line 12
    invoke-direct {p0}, Lio/opencensus/trace/AttributeValue$AttributeValueBoolean;-><init>()V

    if-eqz p1, :cond_0

    .line 16
    iput-object p1, p0, Lio/opencensus/trace/AutoValue_AttributeValue_AttributeValueBoolean;->booleanValue:Ljava/lang/Boolean;

    return-void

    .line 14
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null booleanValue"

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
    instance-of v0, p1, Lio/opencensus/trace/AttributeValue$AttributeValueBoolean;

    if-eqz v0, :cond_1

    .line 37
    check-cast p1, Lio/opencensus/trace/AttributeValue$AttributeValueBoolean;

    .line 38
    iget-object v0, p0, Lio/opencensus/trace/AutoValue_AttributeValue_AttributeValueBoolean;->booleanValue:Ljava/lang/Boolean;

    invoke-virtual {p1}, Lio/opencensus/trace/AttributeValue$AttributeValueBoolean;->getBooleanValue()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method getBooleanValue()Ljava/lang/Boolean;
    .locals 1

    .line 21
    iget-object v0, p0, Lio/opencensus/trace/AutoValue_AttributeValue_AttributeValueBoolean;->booleanValue:Ljava/lang/Boolean;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 47
    iget-object v0, p0, Lio/opencensus/trace/AutoValue_AttributeValue_AttributeValueBoolean;->booleanValue:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AttributeValueBoolean{booleanValue="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/AutoValue_AttributeValue_AttributeValueBoolean;->booleanValue:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
