.class public Lcom/dropbox/core/v2/common/RootInfo$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "RootInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/common/RootInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/common/RootInfo;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/common/RootInfo$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 137
    new-instance v0, Lcom/dropbox/core/v2/common/RootInfo$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/RootInfo$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/RootInfo$Serializer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 136
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/common/RootInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 165
    const-string v0, ""

    const/4 v1, 0x0

    if-nez p2, :cond_0

    .line 166
    invoke-static {p1}, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 167
    invoke-static {p1}, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v2

    .line 168
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    move-object v2, v1

    :cond_1
    if-nez v2, :cond_7

    move-object v0, v1

    .line 175
    :goto_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_4

    .line 176
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 177
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 178
    const-string v3, "root_namespace_id"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 179
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    .line 181
    :cond_2
    const-string v3, "home_namespace_id"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 182
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 185
    :cond_3
    invoke-static {p1}, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_0

    :cond_4
    if-eqz v1, :cond_6

    if-eqz v0, :cond_5

    .line 194
    new-instance v2, Lcom/dropbox/core/v2/common/RootInfo;

    invoke-direct {v2, v1, v0}, Lcom/dropbox/core/v2/common/RootInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 192
    :cond_5
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"home_namespace_id\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 189
    :cond_6
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"root_namespace_id\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 196
    :cond_7
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    .line 197
    sget-object v0, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/RootInfo$Serializer;

    invoke-virtual {v0, p1, v1}, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/common/RootInfo;

    move-result-object v2

    goto :goto_1

    .line 199
    :cond_8
    const-string v0, "team"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 200
    sget-object v0, Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;

    invoke-virtual {v0, p1, v1}, Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/common/TeamRootInfo;

    move-result-object v2

    goto :goto_1

    .line 202
    :cond_9
    const-string v0, "user"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 203
    sget-object v0, Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;

    invoke-virtual {v0, p1, v1}, Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/common/UserRootInfo;

    move-result-object v2

    :goto_1
    if-nez p2, :cond_a

    .line 209
    invoke-static {p1}, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 211
    :cond_a
    invoke-virtual {v2}, Lcom/dropbox/core/v2/common/RootInfo;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v2

    .line 206
    :cond_b
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No subtype found that matches tag: \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

    .line 136
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/common/RootInfo;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/common/RootInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 141
    instance-of v0, p1, Lcom/dropbox/core/v2/common/TeamRootInfo;

    if-eqz v0, :cond_0

    .line 142
    sget-object v0, Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;

    check-cast p1, Lcom/dropbox/core/v2/common/TeamRootInfo;

    invoke-virtual {v0, p1, p2, p3}, Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;->serialize(Lcom/dropbox/core/v2/common/TeamRootInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void

    .line 145
    :cond_0
    instance-of v0, p1, Lcom/dropbox/core/v2/common/UserRootInfo;

    if-eqz v0, :cond_1

    .line 146
    sget-object v0, Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;

    check-cast p1, Lcom/dropbox/core/v2/common/UserRootInfo;

    invoke-virtual {v0, p1, p2, p3}, Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;->serialize(Lcom/dropbox/core/v2/common/UserRootInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void

    :cond_1
    if-nez p3, :cond_2

    .line 150
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 152
    :cond_2
    const-string v0, "root_namespace_id"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 153
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object v1, p1, Lcom/dropbox/core/v2/common/RootInfo;->rootNamespaceId:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 154
    const-string v0, "home_namespace_id"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 155
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object p1, p1, Lcom/dropbox/core/v2/common/RootInfo;->homeNamespaceId:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_3

    .line 157
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    :cond_3
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

    .line 136
    check-cast p1, Lcom/dropbox/core/v2/common/RootInfo;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/common/RootInfo$Serializer;->serialize(Lcom/dropbox/core/v2/common/RootInfo;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
