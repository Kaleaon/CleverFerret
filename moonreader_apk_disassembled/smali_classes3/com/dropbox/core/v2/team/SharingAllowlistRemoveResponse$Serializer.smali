.class Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "SharingAllowlistRemoveResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    if-nez p2, :cond_0

    .line 95
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 96
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_2

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;-><init>()V

    if-nez p2, :cond_1

    .line 105
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 107
    :cond_1
    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    .line 102
    :cond_2
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "No subtype found that matches tag: \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\""

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

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

    .line 77
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 83
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    :cond_0
    if-nez p3, :cond_1

    .line 86
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

    .line 77
    check-cast p1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse$Serializer;->serialize(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
