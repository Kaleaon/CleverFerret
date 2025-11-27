.class Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "TeamMergeRequestCanceledExtraDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 311
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 310
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 341
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 343
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 344
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 348
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 349
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 354
    const-string v3, "primary_team"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 356
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

    move-result-object v0

    .line 357
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->primaryTeam(Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    move-result-object v0

    goto :goto_1

    .line 359
    :cond_1
    const-string v3, "secondary_team"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 361
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;

    move-result-object v0

    .line 362
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->secondaryTeam(Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    move-result-object v0

    goto :goto_1

    .line 365
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    :goto_1
    if-nez v1, :cond_3

    .line 368
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 369
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 352
    :cond_4
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

    .line 310
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 315
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$1;->$SwitchMap$com$dropbox$core$v2$teamlog$TeamMergeRequestCanceledExtraDetails$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->tag()Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    .line 331
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 324
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 325
    const-string v0, "secondary_team"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 326
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->access$100(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;)Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 327
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 317
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 318
    const-string v0, "primary_team"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 319
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->access$000(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;)Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 320
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

    .line 310
    check-cast p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
