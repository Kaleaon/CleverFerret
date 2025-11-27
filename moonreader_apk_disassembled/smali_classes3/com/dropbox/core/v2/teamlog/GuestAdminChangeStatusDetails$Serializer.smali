.class Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "GuestAdminChangeStatusDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 290
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 289
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 323
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 324
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_d

    move-object v3, v0

    move-object v4, v3

    move-object v5, v4

    move-object v6, v5

    move-object v7, v6

    .line 333
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_7

    .line 334
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v1

    .line 335
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 336
    const-string v2, "is_guest"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 337
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->boolean_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    goto :goto_1

    .line 339
    :cond_1
    const-string v2, "previous_value"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 340
    sget-object v1, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    move-result-object v1

    move-object v3, v1

    goto :goto_1

    .line 342
    :cond_2
    const-string v2, "new_value"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 343
    sget-object v1, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    move-result-object v1

    move-object v4, v1

    goto :goto_1

    .line 345
    :cond_3
    const-string v2, "action_details"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 346
    sget-object v1, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    move-result-object v1

    move-object v5, v1

    goto :goto_1

    .line 348
    :cond_4
    const-string v2, "guest_team_name"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 349
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v1

    invoke-static {v1}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object v6, v1

    goto :goto_1

    .line 351
    :cond_5
    const-string v2, "host_team_name"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 352
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v1

    invoke-static {v1}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object v7, v1

    goto/16 :goto_1

    .line 355
    :cond_6
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto/16 :goto_1

    :cond_7
    if-eqz v0, :cond_c

    if-eqz v3, :cond_b

    if-eqz v4, :cond_a

    if-eqz v5, :cond_9

    .line 370
    new-instance v1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-direct/range {v1 .. v7}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;-><init>(ZLcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;Ljava/lang/String;Ljava/lang/String;)V

    if-nez p2, :cond_8

    .line 376
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 378
    :cond_8
    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1

    .line 368
    :cond_9
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"action_details\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 365
    :cond_a
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"new_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 362
    :cond_b
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"previous_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 359
    :cond_c
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"is_guest\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 373
    :cond_d
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

    .line 289
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 295
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 297
    :cond_0
    const-string v0, "is_guest"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 298
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->boolean_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-boolean v1, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->isGuest:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 299
    const-string v0, "previous_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 300
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 301
    const-string v0, "new_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 302
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 303
    const-string v0, "action_details"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 304
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 305
    iget-object v0, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->guestTeamName:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 306
    const-string v0, "guest_team_name"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 307
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->guestTeamName:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 309
    :cond_1
    iget-object v0, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->hostTeamName:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 310
    const-string v0, "host_team_name"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 311
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->hostTeamName:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    :cond_2
    if-nez p3, :cond_3

    .line 314
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    :cond_3
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

    .line 289
    check-cast p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
