.class Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LockFileResultEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/LockFileResultEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/LockFileResultEntry;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 252
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 251
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/LockFileResultEntry;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 283
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 285
    invoke-static {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 286
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 290
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 291
    invoke-static {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 296
    const-string v3, "success"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 298
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileResult$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/files/LockFileResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/LockFileResult;

    move-result-object v0

    .line 299
    invoke-static {v0}, Lcom/dropbox/core/v2/files/LockFileResultEntry;->success(Lcom/dropbox/core/v2/files/LockFileResult;)Lcom/dropbox/core/v2/files/LockFileResultEntry;

    move-result-object v0

    goto :goto_1

    .line 301
    :cond_1
    const-string v2, "failure"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 303
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 304
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object v0

    .line 305
    invoke-static {v0}, Lcom/dropbox/core/v2/files/LockFileResultEntry;->failure(Lcom/dropbox/core/v2/files/LockFileError;)Lcom/dropbox/core/v2/files/LockFileResultEntry;

    move-result-object v0

    :goto_1
    if-nez v1, :cond_2

    .line 311
    invoke-static {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 312
    invoke-static {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_2
    return-object v0

    .line 308
    :cond_3
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 294
    :cond_4
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

    .line 251
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/LockFileResultEntry;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/LockFileResultEntry;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 256
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileResultEntry$1;->$SwitchMap$com$dropbox$core$v2$files$LockFileResultEntry$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry;->tag()Lcom/dropbox/core/v2/files/LockFileResultEntry$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 265
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 266
    const-string v0, "failure"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 267
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 268
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry;->access$100(Lcom/dropbox/core/v2/files/LockFileResultEntry;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->serialize(Lcom/dropbox/core/v2/files/LockFileError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 269
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 273
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry;->tag()Lcom/dropbox/core/v2/files/LockFileResultEntry$Tag;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 258
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 259
    const-string v0, "success"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 260
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileResult$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/LockFileResultEntry;->access$000(Lcom/dropbox/core/v2/files/LockFileResultEntry;)Lcom/dropbox/core/v2/files/LockFileResult;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/files/LockFileResult$Serializer;->serialize(Lcom/dropbox/core/v2/files/LockFileResult;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 261
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

    .line 251
    check-cast p1, Lcom/dropbox/core/v2/files/LockFileResultEntry;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/LockFileResultEntry$Serializer;->serialize(Lcom/dropbox/core/v2/files/LockFileResultEntry;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
