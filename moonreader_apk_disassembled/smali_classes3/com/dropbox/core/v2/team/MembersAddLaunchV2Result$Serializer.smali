.class Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "MembersAddLaunchV2Result.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 316
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 315
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 348
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 350
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 351
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 355
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 356
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 361
    const-string v2, "async_job_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 363
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 364
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 365
    invoke-static {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->asyncJobId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    move-result-object v0

    goto :goto_1

    .line 367
    :cond_1
    const-string v2, "complete"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 369
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 370
    sget-object v0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->list(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 371
    invoke-static {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->complete(Ljava/util/List;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    move-result-object v0

    goto :goto_1

    .line 374
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->OTHER:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    :goto_1
    if-nez v1, :cond_3

    .line 377
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 378
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 359
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

    .line 315
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 320
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$1;->$SwitchMap$com$dropbox$core$v2$team$MembersAddLaunchV2Result$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->tag()Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 338
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 330
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 331
    const-string v0, "complete"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 332
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 333
    sget-object v0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MemberAddV2Result$Serializer;

    invoke-static {v0}, Lcom/dropbox/core/stone/StoneSerializers;->list(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->access$100(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 334
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 322
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 323
    const-string v0, "async_job_id"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 324
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 325
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->access$000(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 326
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

    .line 315
    check-cast p1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->serialize(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
