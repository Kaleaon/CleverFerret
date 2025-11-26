.class Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "PropertiesSearchQuery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 158
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 157
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 181
    invoke-static {p1}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 182
    invoke-static {p1}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_8

    .line 187
    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LogicalOperator;->OR_OPERATOR:Lcom/dropbox/core/v2/fileproperties/LogicalOperator;

    move-object v2, v1

    move-object v1, v0

    .line 188
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v4, :cond_4

    .line 189
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    .line 190
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 191
    const-string v4, "query"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 192
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 194
    :cond_1
    const-string v4, "mode"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 195
    sget-object v1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode;

    move-result-object v1

    goto :goto_1

    .line 197
    :cond_2
    const-string v4, "logical_operator"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 198
    sget-object v2, Lcom/dropbox/core/v2/fileproperties/LogicalOperator$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/LogicalOperator$Serializer;

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/LogicalOperator$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/fileproperties/LogicalOperator;

    move-result-object v2

    goto :goto_1

    .line 201
    :cond_3
    invoke-static {p1}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_4
    if-eqz v0, :cond_7

    if-eqz v1, :cond_6

    .line 210
    new-instance v3, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;

    invoke-direct {v3, v0, v1, v2}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode;Lcom/dropbox/core/v2/fileproperties/LogicalOperator;)V

    if-nez p2, :cond_5

    .line 216
    invoke-static {p1}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 218
    :cond_5
    invoke-virtual {v3}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v3

    .line 208
    :cond_6
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"mode\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 205
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"query\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 213
    :cond_8
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

    .line 157
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 163
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 165
    :cond_0
    const-string v0, "query"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 166
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object v1, p1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;->query:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 167
    const-string v0, "mode"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 168
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;->mode:Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode$Serializer;->serialize(Lcom/dropbox/core/v2/fileproperties/PropertiesSearchMode;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 169
    const-string v0, "logical_operator"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 170
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/LogicalOperator$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/LogicalOperator$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;->logicalOperator:Lcom/dropbox/core/v2/fileproperties/LogicalOperator;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/fileproperties/LogicalOperator$Serializer;->serialize(Lcom/dropbox/core/v2/fileproperties/LogicalOperator;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 172
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

    .line 157
    check-cast p1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery$Serializer;->serialize(Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
