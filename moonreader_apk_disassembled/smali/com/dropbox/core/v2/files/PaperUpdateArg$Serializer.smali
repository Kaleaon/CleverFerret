.class Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "PaperUpdateArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/PaperUpdateArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/files/PaperUpdateArg;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 189
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 188
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/PaperUpdateArg;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 216
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 217
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_a

    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    .line 224
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_5

    .line 225
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 226
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 227
    const-string v5, "path"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 228
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 230
    :cond_1
    const-string v5, "import_format"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 231
    sget-object v1, Lcom/dropbox/core/v2/files/ImportFormat$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ImportFormat$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/files/ImportFormat$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/ImportFormat;

    move-result-object v1

    goto :goto_1

    .line 233
    :cond_2
    const-string v5, "doc_update_policy"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 234
    sget-object v2, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    move-result-object v2

    goto :goto_1

    .line 236
    :cond_3
    const-string v5, "paper_revision"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 237
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->int64()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v3

    invoke-static {v3}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    goto :goto_1

    .line 240
    :cond_4
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_5
    if-eqz v0, :cond_9

    if-eqz v1, :cond_8

    if-eqz v2, :cond_7

    .line 252
    new-instance v4, Lcom/dropbox/core/v2/files/PaperUpdateArg;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/PaperUpdateArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;Ljava/lang/Long;)V

    if-nez p2, :cond_6

    .line 258
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 260
    :cond_6
    invoke-virtual {v4}, Lcom/dropbox/core/v2/files/PaperUpdateArg;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v4

    .line 250
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"doc_update_policy\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 247
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"import_format\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 244
    :cond_9
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"path\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 255
    :cond_a
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

    .line 188
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/PaperUpdateArg;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/PaperUpdateArg;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 194
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 196
    :cond_0
    const-string v0, "path"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 197
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object v1, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->path:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 198
    const-string v0, "import_format"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 199
    sget-object v0, Lcom/dropbox/core/v2/files/ImportFormat$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ImportFormat$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->importFormat:Lcom/dropbox/core/v2/files/ImportFormat;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/files/ImportFormat$Serializer;->serialize(Lcom/dropbox/core/v2/files/ImportFormat;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 200
    const-string v0, "doc_update_policy"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 201
    sget-object v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->docUpdatePolicy:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->serialize(Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 202
    iget-object v0, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->paperRevision:Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 203
    const-string v0, "paper_revision"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 204
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->int64()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object p1, p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;->paperRevision:Ljava/lang/Long;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    :cond_1
    if-nez p3, :cond_2

    .line 207
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    :cond_2
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

    .line 188
    check-cast p1, Lcom/dropbox/core/v2/files/PaperUpdateArg;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->serialize(Lcom/dropbox/core/v2/files/PaperUpdateArg;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
