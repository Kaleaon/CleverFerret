.class Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "AppPermissionsChangedDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 246
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 245
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 275
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 276
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_9

    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    .line 283
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_5

    .line 284
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 285
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 286
    const-string v5, "previous_value"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 287
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    move-result-object v0

    goto :goto_1

    .line 289
    :cond_1
    const-string v5, "new_value"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 290
    sget-object v1, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    move-result-object v1

    goto :goto_1

    .line 292
    :cond_2
    const-string v5, "app_name"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 293
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v2

    invoke-static {v2}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_1

    .line 295
    :cond_3
    const-string v5, "permission"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 296
    sget-object v3, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission$Serializer;

    invoke-static {v3}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    goto :goto_1

    .line 299
    :cond_4
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_5
    if-eqz v0, :cond_8

    if-eqz v1, :cond_7

    .line 308
    new-instance v4, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;-><init>(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;)V

    if-nez p2, :cond_6

    .line 314
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 316
    :cond_6
    invoke-virtual {v4}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v4

    .line 306
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"new_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 303
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"previous_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 311
    :cond_9
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

    .line 245
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 251
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 253
    :cond_0
    const-string v0, "previous_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 254
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 255
    const-string v0, "new_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 256
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 257
    iget-object v0, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->appName:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 258
    const-string v0, "app_name"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 259
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->appName:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 261
    :cond_1
    iget-object v0, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    if-eqz v0, :cond_2

    .line 262
    const-string v0, "permission"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 263
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission$Serializer;

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->nullable(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    :cond_2
    if-nez p3, :cond_3

    .line 266
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

    .line 245
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
