.class Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;
.super Lcom/dropbox/core/stone/StructSerializer;
.source "DeviceSyncBackupStatusChangedDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/StructSerializer<",
        "Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 144
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 143
    invoke-direct {p0}, Lcom/dropbox/core/stone/StructSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 167
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 168
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-nez v1, :cond_9

    move-object v1, v0

    move-object v2, v1

    .line 174
    :goto_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v4, :cond_4

    .line 175
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    .line 176
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 177
    const-string v4, "desktop_device_session_info"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 178
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    goto :goto_1

    .line 180
    :cond_1
    const-string v4, "previous_value"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 181
    sget-object v1, Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;

    invoke-virtual {v1, p1}, Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/BackupStatus;

    move-result-object v1

    goto :goto_1

    .line 183
    :cond_2
    const-string v4, "new_value"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 184
    sget-object v2, Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/BackupStatus;

    move-result-object v2

    goto :goto_1

    .line 187
    :cond_3
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_1

    :cond_4
    if-eqz v0, :cond_8

    if-eqz v1, :cond_7

    if-eqz v2, :cond_6

    .line 199
    new-instance v3, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;

    invoke-direct {v3, v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;-><init>(Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;Lcom/dropbox/core/v2/teamlog/BackupStatus;Lcom/dropbox/core/v2/teamlog/BackupStatus;)V

    if-nez p2, :cond_5

    .line 205
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 207
    :cond_5
    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;->toStringMultiline()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/dropbox/core/stone/StoneDeserializerLogger;->log(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v3

    .line 197
    :cond_6
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"new_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 194
    :cond_7
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"previous_value\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 191
    :cond_8
    new-instance p2, Lcom/fasterxml/jackson/core/JsonParseException;

    const-string v0, "Required field \"desktop_device_session_info\" missing."

    invoke-direct {p2, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw p2

    .line 202
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

    .line 143
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 149
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 151
    :cond_0
    const-string v0, "desktop_device_session_info"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 152
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;->desktopDeviceSessionInfo:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 153
    const-string v0, "previous_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 154
    sget-object v0, Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;

    iget-object v1, p1, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/BackupStatus;

    invoke-virtual {v0, v1, p2}, Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/BackupStatus;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 155
    const-string v0, "new_value"

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 156
    sget-object v0, Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/BackupStatus;

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/teamlog/BackupStatus$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/BackupStatus;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    if-nez p3, :cond_1

    .line 158
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

    .line 143
    check-cast p1, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;

    invoke-virtual {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/DeviceSyncBackupStatusChangedDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    return-void
.end method
