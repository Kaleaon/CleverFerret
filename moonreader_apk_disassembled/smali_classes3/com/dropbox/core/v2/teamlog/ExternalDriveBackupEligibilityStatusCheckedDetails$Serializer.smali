.class Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "ExternalDriveBackupEligibilityStatusCheckedDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 139
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 138
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 162
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 163
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_9

    move-object v1, v0

    move-object v2, v1

    .line 169
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v4, :cond_4

    .line 170
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    .line 171
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 172
    const-string v4, "desktop_device_session_info"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 173
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    goto :goto_1

    .line 175
    :cond_1
    const-string v4, "status"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 176
    sget-object v1, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus;

    move-result-object v1

    goto :goto_1

    .line 178
    :cond_2
    const-string v4, "number_of_external_drive_backup"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 179
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->uInt64()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    goto :goto_1

    .line 182
    :cond_3
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_4
    if-eqz v0, :cond_8

    if-eqz v1, :cond_7

    if-eqz v2, :cond_6

    .line 194
    new-instance v3, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v3, v0, v1, v4, v5}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;-><init>(Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus;J)V

    if-nez p2, :cond_5

    .line 200
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 202
    :cond_5
    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v3

    .line 192
    :cond_6
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"number_of_external_drive_backup\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 189
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"status\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 186
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"desktop_device_session_info\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 197
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

    .line 138
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 144
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 146
    :cond_0
    const-string v0, "desktop_device_session_info"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 147
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;->desktopDeviceSessionInfo:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 148
    const-string v0, "status"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 149
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;->status:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatus;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 150
    const-string v0, "number_of_external_drive_backup"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 151
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->uInt64()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    iget-wide v1, p1, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;->numberOfExternalDriveBackup:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 153
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

    .line 138
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupEligibilityStatusCheckedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
