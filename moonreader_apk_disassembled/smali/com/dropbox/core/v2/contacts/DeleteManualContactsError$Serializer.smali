.class Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "DeleteManualContactsError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 249
    new-instance v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 248
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 273
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 275
    invoke-static {p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 276
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 280
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 281
    invoke-static {p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_3

    .line 286
    const-string v2, "contacts_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 288
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 289
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->list(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 290
    invoke-static {v0}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->contactsNotFound(Ljava/util/List;)Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    move-result-object v0

    goto :goto_1

    .line 293
    :cond_1
    sget-object v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->OTHER:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    :goto_1
    if-nez v1, :cond_2

    .line 296
    invoke-static {p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 297
    invoke-static {p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_2
    return-object v0

    .line 284
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

    .line 248
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 253
    sget-object v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$1;->$SwitchMap$com$dropbox$core$v2$contacts$DeleteManualContactsError$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->tag()Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 263
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 255
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 256
    const-string v0, "contacts_not_found"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 257
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 258
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->list(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->access$000(Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 259
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

    .line 248
    check-cast p1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->serialize(Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
