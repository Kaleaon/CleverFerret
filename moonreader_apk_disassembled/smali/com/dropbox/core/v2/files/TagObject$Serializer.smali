.class Lcom/dropbox/core/v2/files/TagObject$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "TagObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/TagObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/TagObject;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/TagObject$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 235
    new-instance v0, Lcom/dropbox/core/v2/files/TagObject$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/TagObject$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/TagObject$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/TagObject$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 234
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/TagObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 258
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 260
    invoke-static {p1}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 261
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 265
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 266
    invoke-static {p1}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_3

    .line 271
    const-string v3, "user_generated_tag"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 273
    sget-object v0, Lcom/dropbox/core/v2/files/UserGeneratedTag$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UserGeneratedTag$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/files/UserGeneratedTag$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/UserGeneratedTag;

    move-result-object v0

    .line 274
    invoke-static {v0}, Lcom/dropbox/core/v2/files/TagObject;->userGeneratedTag(Lcom/dropbox/core/v2/files/UserGeneratedTag;)Lcom/dropbox/core/v2/files/TagObject;

    move-result-object v0

    goto :goto_1

    .line 277
    :cond_1
    sget-object v0, Lcom/dropbox/core/v2/files/TagObject;->OTHER:Lcom/dropbox/core/v2/files/TagObject;

    :goto_1
    if-nez v1, :cond_2

    .line 280
    invoke-static {p1}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 281
    invoke-static {p1}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_2
    return-object v0

    .line 269
    :cond_3
    new-instance v0, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v1, "Required field missing: .tag"

    invoke-direct {v0, p1, v1}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 234
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/TagObject;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/TagObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 239
    sget-object v0, Lcom/dropbox/core/v2/files/TagObject$1;->$SwitchMap$com$dropbox$core$v2$files$TagObject$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/TagObject;->tag()Lcom/dropbox/core/v2/files/TagObject$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/TagObject$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 248
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 241
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 242
    const-string v0, "user_generated_tag"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 243
    sget-object v0, Lcom/dropbox/core/v2/files/UserGeneratedTag$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UserGeneratedTag$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/TagObject;->access$000(Lcom/dropbox/core/v2/files/TagObject;)Lcom/dropbox/core/v2/files/UserGeneratedTag;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/files/UserGeneratedTag$Serializer;->serialize(Lcom/dropbox/core/v2/files/UserGeneratedTag;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 244
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 234
    check-cast p1, Lcom/dropbox/core/v2/files/TagObject;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->serialize(Lcom/dropbox/core/v2/files/TagObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
