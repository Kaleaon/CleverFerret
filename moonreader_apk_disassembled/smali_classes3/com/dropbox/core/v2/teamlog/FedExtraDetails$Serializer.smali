.class Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "FedExtraDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FedExtraDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/FedExtraDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 307
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 306
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 337
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 339
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 340
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 344
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 345
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 350
    const-string v3, "organization"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 352
    sget-object v0, Lcom/dropbox/core/v2/teamlog/OrganizationDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/OrganizationDetails$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/OrganizationDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

    move-result-object v0

    .line 353
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->organization(Lcom/dropbox/core/v2/teamlog/OrganizationDetails;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    move-result-object v0

    goto :goto_1

    .line 355
    :cond_1
    const-string v3, "team"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 357
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamDetails$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/teamlog/TeamDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/teamlog/TeamDetails;

    move-result-object v0

    .line 358
    invoke-static {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->team(Lcom/dropbox/core/v2/teamlog/TeamDetails;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    move-result-object v0

    goto :goto_1

    .line 361
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->OTHER:Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    :goto_1
    if-nez v1, :cond_3

    .line 364
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 365
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 348
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

    .line 306
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/FedExtraDetails;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 311
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$1;->$SwitchMap$com$dropbox$core$v2$teamlog$FedExtraDetails$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->tag()Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    .line 327
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 320
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 321
    const-string v0, "team"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 322
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamDetails$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->access$100(Lcom/dropbox/core/v2/teamlog/FedExtraDetails;)Lcom/dropbox/core/v2/teamlog/TeamDetails;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/TeamDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/TeamDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 323
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 313
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 314
    const-string v0, "organization"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 315
    sget-object v0, Lcom/dropbox/core/v2/teamlog/OrganizationDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/OrganizationDetails$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->access$000(Lcom/dropbox/core/v2/teamlog/FedExtraDetails;)Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/teamlog/OrganizationDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/OrganizationDetails;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 316
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

    .line 306
    check-cast p1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/FedExtraDetails;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
