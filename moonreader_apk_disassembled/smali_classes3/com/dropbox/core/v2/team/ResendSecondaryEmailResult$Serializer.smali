.class Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "ResendSecondaryEmailResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 438
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 437
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 478
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 480
    invoke-static {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 481
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 485
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 486
    invoke-static {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 491
    const-string v2, "success"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 493
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 494
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 495
    invoke-static {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->success(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 497
    :cond_1
    const-string v2, "not_pending"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 499
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 500
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 501
    invoke-static {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->notPending(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 503
    :cond_2
    const-string v2, "rate_limited"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 505
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 506
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 507
    invoke-static {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->rateLimited(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 510
    :cond_3
    sget-object v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->OTHER:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    :goto_1
    if-nez v1, :cond_4

    .line 513
    invoke-static {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 514
    invoke-static {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_4
    return-object v0

    .line 489
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

    .line 437
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 442
    sget-object v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$ResendSecondaryEmailResult$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->tag()Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 468
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 460
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 461
    const-string v0, "rate_limited"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 462
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 463
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->access$200(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 464
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 452
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 453
    const-string v0, "not_pending"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 454
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 455
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->access$100(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 456
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 444
    :cond_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 445
    const-string v0, "success"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 446
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 447
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->access$000(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 448
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

    .line 437
    check-cast p1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
