.class Lcom/dropbox/core/v2/files/FileLockContent$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "FileLockContent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/FileLockContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/FileLockContent;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/FileLockContent$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 251
    new-instance v0, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileLockContent$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 250
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/FileLockContent;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 278
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 280
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 281
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 285
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 286
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 291
    const-string v3, "unlocked"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 292
    sget-object v0, Lcom/dropbox/core/v2/files/FileLockContent;->UNLOCKED:Lcom/dropbox/core/v2/files/FileLockContent;

    goto :goto_1

    .line 294
    :cond_1
    const-string v3, "single_user"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 296
    sget-object v0, Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/SingleUserLock;

    move-result-object v0

    .line 297
    invoke-static {v0}, Lcom/dropbox/core/v2/files/FileLockContent;->singleUser(Lcom/dropbox/core/v2/files/SingleUserLock;)Lcom/dropbox/core/v2/files/FileLockContent;

    move-result-object v0

    goto :goto_1

    .line 300
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/files/FileLockContent;->OTHER:Lcom/dropbox/core/v2/files/FileLockContent;

    :goto_1
    if-nez v1, :cond_3

    .line 303
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 304
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 289
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

    .line 250
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/FileLockContent;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/FileLockContent;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 255
    sget-object v0, Lcom/dropbox/core/v2/files/FileLockContent$1;->$SwitchMap$com$dropbox$core$v2$files$FileLockContent$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/FileLockContent;->tag()Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    .line 268
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 261
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 262
    const-string v0, "single_user"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 263
    sget-object v0, Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLockContent;->access$000(Lcom/dropbox/core/v2/files/FileLockContent;)Lcom/dropbox/core/v2/files/SingleUserLock;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;->serialize(Lcom/dropbox/core/v2/files/SingleUserLock;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 264
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 257
    :cond_1
    const-string p1, "unlocked"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

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

    .line 250
    check-cast p1, Lcom/dropbox/core/v2/files/FileLockContent;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->serialize(Lcom/dropbox/core/v2/files/FileLockContent;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
