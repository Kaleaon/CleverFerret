.class Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "SharedFolderChangeMembersInheritancePolicyDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 136
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 135
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 159
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 160
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_6

    move-object v1, v0

    .line 165
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_3

    .line 166
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 167
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 168
    const-string v3, "new_value"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 169
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy;

    move-result-object v0

    goto :goto_1

    .line 171
    :cond_1
    const-string v3, "previous_value"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 172
    sget-object v1, Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;

    invoke-static {v1}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy;

    goto :goto_1

    .line 175
    :cond_2
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_5

    .line 181
    new-instance v2, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;

    invoke-direct {v2, v0, v1}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;-><init>(Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy;Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy;)V

    if-nez p2, :cond_4

    .line 187
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 189
    :cond_4
    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v2

    .line 179
    :cond_5
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"new_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 184
    :cond_6
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

    .line 135
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 141
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 143
    :cond_0
    const-string v0, "new_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 144
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 145
    iget-object v0, p1, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy;

    if-eqz v0, :cond_1

    .line 146
    const-string v0, "previous_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 147
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy$Serializer;

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/SharedFolderMembersInheritancePolicy;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    :cond_1
    if-nez p3, :cond_2

    .line 150
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

    .line 135
    check-cast p1, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/SharedFolderChangeMembersInheritancePolicyDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
