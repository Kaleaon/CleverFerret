.class Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "TeamMergeRequestExpiredExtraDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 309
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 308
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 339
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 341
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 342
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 346
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 347
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 352
    const-string v3, "primary_team"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 354
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails;

    move-result-object v0

    .line 355
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;->primaryTeam(Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;

    move-result-object v0

    goto :goto_1

    .line 357
    :cond_1
    const-string v3, "secondary_team"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 359
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails;

    move-result-object v0

    .line 360
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;->secondaryTeam(Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;

    move-result-object v0

    goto :goto_1

    .line 363
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;->OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;

    :goto_1
    if-nez v1, :cond_3

    .line 366
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 367
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 350
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

    .line 308
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 313
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$1;->$SwitchMap$com$dropbox$core$v2$teamlog$TeamMergeRequestExpiredExtraDetails$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;->tag()Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    .line 329
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 322
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 323
    const-string v0, "secondary_team"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 324
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;->access$100(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;)Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestExpiredDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 325
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 315
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 316
    const-string v0, "primary_team"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 317
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;->access$000(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;)Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestExpiredDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 318
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

    .line 308
    check-cast p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestExpiredExtraDetails;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
