.class Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "TeamFolderUpdateSyncSettingsError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 428
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 427
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 480
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 482
    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 483
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 487
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 488
    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_7

    .line 493
    const-string v2, "access_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 495
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 496
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderAccessError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderAccessError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/TeamFolderAccessError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    move-result-object v0

    .line 497
    invoke-static {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->accessError(Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object v0

    goto :goto_1

    .line 499
    :cond_1
    const-string v2, "status_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 501
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 502
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    move-result-object v0

    .line 503
    invoke-static {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->statusError(Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object v0

    goto :goto_1

    .line 505
    :cond_2
    const-string v2, "team_shared_dropbox_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 507
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 508
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    move-result-object v0

    .line 509
    invoke-static {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->teamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object v0

    goto :goto_1

    .line 511
    :cond_3
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 512
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    goto :goto_1

    .line 514
    :cond_4
    const-string v2, "sync_settings_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 516
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 517
    sget-object v0, Lcom/dropbox/core/v2/files/SyncSettingsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SyncSettingsError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/SyncSettingsError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/SyncSettingsError;

    move-result-object v0

    .line 518
    invoke-static {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->syncSettingsError(Lcom/dropbox/core/v2/files/SyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object v0

    :goto_1
    if-nez v1, :cond_5

    .line 524
    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 525
    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 521
    :cond_6
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 491
    :cond_7
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

    .line 427
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 432
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$1;->$SwitchMap$com$dropbox$core$v2$team$TeamFolderUpdateSyncSettingsError$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->tag()Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    .line 462
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 463
    const-string v0, "sync_settings_error"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 464
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 465
    sget-object v0, Lcom/dropbox/core/v2/files/SyncSettingsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SyncSettingsError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->access$300(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;)Lcom/dropbox/core/v2/files/SyncSettingsError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/files/SyncSettingsError$Serializer;->serialize(Lcom/dropbox/core/v2/files/SyncSettingsError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 466
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 470
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->tag()Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 458
    :cond_1
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 450
    :cond_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 451
    const-string v0, "team_shared_dropbox_error"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 452
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 453
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->access$200(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError$Serializer;->serialize(Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 454
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 442
    :cond_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 443
    const-string v0, "status_error"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 444
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 445
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->access$100(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError$Serializer;->serialize(Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 446
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 434
    :cond_4
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 435
    const-string v0, "access_error"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 436
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 437
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderAccessError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderAccessError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->access$000(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/TeamFolderAccessError$Serializer;->serialize(Lcom/dropbox/core/v2/team/TeamFolderAccessError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 438
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

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

    .line 427
    check-cast p1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->serialize(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
