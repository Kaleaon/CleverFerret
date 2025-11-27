.class Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "MembersGetInfoItemV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 331
    new-instance v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 330
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 362
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 364
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 365
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 369
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 370
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 375
    const-string v3, "id_not_found"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 377
    invoke-static {v3, p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 378
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 379
    invoke-static {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->idNotFound(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    move-result-object v0

    goto :goto_1

    .line 381
    :cond_1
    const-string v3, "member_info"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 383
    sget-object v0, Lcom/dropbox/core/v2/team/TeamMemberInfoV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamMemberInfoV2$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/team/TeamMemberInfoV2$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    move-result-object v0

    .line 384
    invoke-static {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->memberInfo(Lcom/dropbox/core/v2/team/TeamMemberInfoV2;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    move-result-object v0

    goto :goto_1

    .line 387
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->OTHER:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    :goto_1
    if-nez v1, :cond_3

    .line 390
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 391
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 373
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

    .line 330
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 335
    sget-object v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$1;->$SwitchMap$com$dropbox$core$v2$team$MembersGetInfoItemV2$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->tag()Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    .line 352
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 345
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 346
    const-string v0, "member_info"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 347
    sget-object v0, Lcom/dropbox/core/v2/team/TeamMemberInfoV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamMemberInfoV2$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->access$100(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;)Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/team/TeamMemberInfoV2$Serializer;->serialize(Lcom/dropbox/core/v2/team/TeamMemberInfoV2;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 348
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 337
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 338
    const-string v0, "id_not_found"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 339
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 340
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->access$000(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 341
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

    .line 330
    check-cast p1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->serialize(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
