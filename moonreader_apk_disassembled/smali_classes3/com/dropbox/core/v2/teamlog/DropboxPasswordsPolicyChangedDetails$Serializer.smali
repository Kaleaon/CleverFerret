.class Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "DropboxPasswordsPolicyChangedDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 122
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 121
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 143
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 144
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_7

    move-object v1, v0

    .line 149
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_3

    .line 150
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 151
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 152
    const-string v3, "new_value"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 153
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy;

    move-result-object v0

    goto :goto_1

    .line 155
    :cond_1
    const-string v3, "previous_value"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 156
    sget-object v1, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy;

    move-result-object v1

    goto :goto_1

    .line 159
    :cond_2
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_6

    if-eqz v1, :cond_5

    .line 168
    new-instance v2, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;

    invoke-direct {v2, v0, v1}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;-><init>(Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy;Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy;)V

    if-nez p2, :cond_4

    .line 174
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 176
    :cond_4
    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v2

    .line 166
    :cond_5
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"previous_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 163
    :cond_6
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"new_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 171
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

    .line 121
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 127
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 129
    :cond_0
    const-string v0, "new_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 130
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 131
    const-string v0, "previous_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 132
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 134
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

    .line 121
    check-cast p1, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/DropboxPasswordsPolicyChangedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
