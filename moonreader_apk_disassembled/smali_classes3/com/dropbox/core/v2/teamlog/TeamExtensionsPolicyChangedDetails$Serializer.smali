.class Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "TeamExtensionsPolicyChangedDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 123
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 122
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 144
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 145
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_7

    move-object v1, v0

    .line 150
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_3

    .line 151
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 152
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 153
    const-string v3, "new_value"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 154
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy;

    move-result-object v0

    goto :goto_1

    .line 156
    :cond_1
    const-string v3, "previous_value"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 157
    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy;

    move-result-object v1

    goto :goto_1

    .line 160
    :cond_2
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_6

    if-eqz v1, :cond_5

    .line 169
    new-instance v2, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;

    invoke-direct {v2, v0, v1}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;-><init>(Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy;Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy;)V

    if-nez p2, :cond_4

    .line 175
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 177
    :cond_4
    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v2

    .line 167
    :cond_5
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"previous_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 164
    :cond_6
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"new_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 172
    :cond_7
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

    .line 122
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 128
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 130
    :cond_0
    const-string v0, "new_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 131
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 132
    const-string v0, "previous_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 135
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

    .line 122
    check-cast p1, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TeamExtensionsPolicyChangedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
