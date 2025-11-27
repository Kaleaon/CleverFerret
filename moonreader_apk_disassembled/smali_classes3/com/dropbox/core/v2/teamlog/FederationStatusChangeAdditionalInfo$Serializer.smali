.class Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "FederationStatusChangeAdditionalInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 384
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 383
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 421
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 423
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 424
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 428
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 429
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 434
    const-string v3, "connected_team_name"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 436
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ConnectedTeamName$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/ConnectedTeamName$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

    move-result-object v0

    .line 437
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->connectedTeamName(Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object v0

    goto :goto_1

    .line 439
    :cond_1
    const-string v3, "non_trusted_team_details"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 441
    sget-object v0, Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

    move-result-object v0

    .line 442
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->nonTrustedTeamDetails(Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object v0

    goto :goto_1

    .line 444
    :cond_2
    const-string v3, "organization_name"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 446
    sget-object v0, Lcom/dropbox/core/v2/teamlog/OrganizationName$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/OrganizationName$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/OrganizationName$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/OrganizationName;

    move-result-object v0

    .line 447
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->organizationName(Lcom/dropbox/core/v2/teamlog/OrganizationName;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object v0

    goto :goto_1

    .line 450
    :cond_3
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    :goto_1
    if-nez v1, :cond_4

    .line 453
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 454
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_4
    return-object v0

    .line 432
    :cond_5
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

    .line 383
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 388
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$FederationStatusChangeAdditionalInfo$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->tag()Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    .line 411
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 404
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 405
    const-string v0, "organization_name"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 406
    sget-object v0, Lcom/dropbox/core/v2/teamlog/OrganizationName$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/OrganizationName$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->access$200(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;)Lcom/dropbox/core/v2/teamlog/OrganizationName;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/OrganizationName$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/OrganizationName;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 407
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 397
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 398
    const-string v0, "non_trusted_team_details"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 399
    sget-object v0, Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->access$100(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;)Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 400
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 390
    :cond_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 391
    const-string v0, "connected_team_name"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 392
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ConnectedTeamName$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->access$000(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;)Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/ConnectedTeamName$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 393
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

    .line 383
    check-cast p1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
