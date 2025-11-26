.class Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "ClassificationChangePolicyDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 141
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 165
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 166
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_9

    move-object v1, v0

    move-object v2, v1

    .line 172
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v4, :cond_4

    .line 173
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    .line 174
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 175
    const-string v4, "previous_value"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 176
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    move-result-object v0

    goto :goto_1

    .line 178
    :cond_1
    const-string v4, "new_value"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 179
    sget-object v1, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    move-result-object v1

    goto :goto_1

    .line 181
    :cond_2
    const-string v4, "classification_type"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 182
    sget-object v2, Lcom/dropbox/core/v2/teamlog/ClassificationType$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationType$Serializer;

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/ClassificationType$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/ClassificationType;

    move-result-object v2

    goto :goto_1

    .line 185
    :cond_3
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_4
    if-eqz v0, :cond_8

    if-eqz v1, :cond_7

    if-eqz v2, :cond_6

    .line 197
    new-instance v3, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;

    invoke-direct {v3, v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;-><init>(Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;Lcom/dropbox/core/v2/teamlog/ClassificationType;)V

    if-nez p2, :cond_5

    .line 203
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 205
    :cond_5
    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v3

    .line 195
    :cond_6
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"classification_type\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 192
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"new_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 189
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"previous_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 200
    :cond_9
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "No subtype found that matches tag: \""

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2
.end method

.method public bridge synthetic deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 141
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 147
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 149
    :cond_0
    const-string v0, "previous_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 150
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 151
    const-string v0, "new_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 152
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ClassificationPolicyEnumWrapper;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 153
    const-string v0, "classification_type"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 154
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ClassificationType$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ClassificationType$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;->classificationType:Lcom/dropbox/core/v2/teamlog/ClassificationType;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/teamlog/ClassificationType$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ClassificationType;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 156
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    :cond_1
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 141
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ClassificationChangePolicyDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
