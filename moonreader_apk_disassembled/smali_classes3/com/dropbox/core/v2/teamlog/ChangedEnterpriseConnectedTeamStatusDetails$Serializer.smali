.class Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "ChangedEnterpriseConnectedTeamStatusDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 162
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 161
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 187
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 188
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_b

    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    .line 195
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_5

    .line 196
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 197
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 198
    const-string v5, "action"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 199
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    move-result-object v0

    goto :goto_1

    .line 201
    :cond_1
    const-string v5, "additional_info"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 202
    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object v1

    goto :goto_1

    .line 204
    :cond_2
    const-string v5, "previous_value"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 205
    sget-object v2, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    move-result-object v2

    goto :goto_1

    .line 207
    :cond_3
    const-string v5, "new_value"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 208
    sget-object v3, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;

    invoke-virtual {v3, p1}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    move-result-object v3

    goto :goto_1

    .line 211
    :cond_4
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_5
    if-eqz v0, :cond_a

    if-eqz v1, :cond_9

    if-eqz v2, :cond_8

    if-eqz v3, :cond_7

    .line 226
    new-instance v4, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;-><init>(Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;)V

    if-nez p2, :cond_6

    .line 232
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 234
    :cond_6
    invoke-virtual {v4}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v4

    .line 224
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"new_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 221
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"previous_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 218
    :cond_9
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"additional_info\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 215
    :cond_a
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"action\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 229
    :cond_b
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

    .line 161
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 167
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 169
    :cond_0
    const-string v0, "action"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 170
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 171
    const-string v0, "additional_info"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 172
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->additionalInfo:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 173
    const-string v0, "previous_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 174
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 175
    const-string v0, "new_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 176
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 178
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

    .line 161
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
