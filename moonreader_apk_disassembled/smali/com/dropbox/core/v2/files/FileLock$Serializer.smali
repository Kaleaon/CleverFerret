.class Lcom/dropbox/core/v2/files/FileLock$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "FileLock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/FileLock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/files/FileLock;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/FileLock$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/files/FileLock$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/FileLock$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/FileLock$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileLock$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 97
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/FileLock;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 117
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLock$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 118
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLock$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_5

    .line 122
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_2

    .line 123
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v1

    .line 124
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 125
    const-string v2, "content"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 126
    sget-object v0, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileLockContent$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/FileLockContent;

    move-result-object v0

    goto :goto_1

    .line 129
    :cond_1
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLock$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_2
    if-eqz v0, :cond_4

    .line 135
    new-instance v1, Lcom/dropbox/core/v2/files/FileLock;

    invoke-direct {v1, v0}, Lcom/dropbox/core/v2/files/FileLock;-><init>(Lcom/dropbox/core/v2/files/FileLockContent;)V

    if-nez p2, :cond_3

    .line 141
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileLock$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 143
    :cond_3
    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/FileLock;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1

    .line 133
    :cond_4
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"content\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 138
    :cond_5
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

    .line 97
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/FileLock$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/files/FileLock;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/FileLock;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 103
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 105
    :cond_0
    const-string v0, "content"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 106
    sget-object v0, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileLockContent$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/FileLock;->content:Lcom/dropbox/core/v2/files/FileLockContent;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->serialize(Lcom/dropbox/core/v2/files/FileLockContent;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 108
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

    .line 97
    check-cast p1, Lcom/dropbox/core/v2/files/FileLock;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/files/FileLock$Serializer;->serialize(Lcom/dropbox/core/v2/files/FileLock;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
