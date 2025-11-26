.class Lcom/dropbox/core/v2/team/FeatureValue$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "FeatureValue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/FeatureValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/FeatureValue;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/FeatureValue$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 439
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/FeatureValue$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 438
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 487
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 489
    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 490
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 494
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 495
    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_6

    .line 500
    const-string v2, "upload_api_rate_limit"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 502
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 503
    sget-object v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    move-result-object v0

    .line 504
    invoke-static {v0}, Lcom/dropbox/core/v2/team/FeatureValue;->uploadApiRateLimit(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object v0

    goto :goto_1

    .line 506
    :cond_1
    const-string v2, "has_team_shared_dropbox"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 508
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 509
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

    move-result-object v0

    .line 510
    invoke-static {v0}, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSharedDropbox(Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object v0

    goto :goto_1

    .line 512
    :cond_2
    const-string v2, "has_team_file_events"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 514
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 515
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    move-result-object v0

    .line 516
    invoke-static {v0}, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamFileEvents(Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object v0

    goto :goto_1

    .line 518
    :cond_3
    const-string v2, "has_team_selective_sync"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 520
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 521
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    move-result-object v0

    .line 522
    invoke-static {v0}, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSelectiveSync(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object v0

    goto :goto_1

    .line 525
    :cond_4
    sget-object v0, Lcom/dropbox/core/v2/team/FeatureValue;->OTHER:Lcom/dropbox/core/v2/team/FeatureValue;

    :goto_1
    if-nez v1, :cond_5

    .line 528
    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 529
    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 498
    :cond_6
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

    .line 438
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/FeatureValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 443
    sget-object v0, Lcom/dropbox/core/v2/team/FeatureValue$1;->$SwitchMap$com$dropbox$core$v2$team$FeatureValue$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/FeatureValue;->tag()Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 477
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 469
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 470
    const-string v0, "has_team_selective_sync"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 471
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 472
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue;->access$300(Lcom/dropbox/core/v2/team/FeatureValue;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->serialize(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 473
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 461
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 462
    const-string v0, "has_team_file_events"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 463
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 464
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue;->access$200(Lcom/dropbox/core/v2/team/FeatureValue;)Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;->serialize(Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 465
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 453
    :cond_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 454
    const-string v0, "has_team_shared_dropbox"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 455
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 456
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue;->access$100(Lcom/dropbox/core/v2/team/FeatureValue;)Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Serializer;->serialize(Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 457
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 445
    :cond_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 446
    const-string v0, "upload_api_rate_limit"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 447
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 448
    sget-object v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/FeatureValue;->access$000(Lcom/dropbox/core/v2/team/FeatureValue;)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;->serialize(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 449
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

    .line 438
    check-cast p1, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->serialize(Lcom/dropbox/core/v2/team/FeatureValue;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
