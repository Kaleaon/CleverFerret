.class Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "DeleteSecondaryEmailResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 435
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 434
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 475
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 477
    invoke-static {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 478
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 482
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 483
    invoke-static {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 488
    const-string v2, "success"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 490
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 491
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 492
    invoke-static {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->success(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 494
    :cond_1
    const-string v2, "not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 496
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 497
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 498
    invoke-static {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->notFound(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 500
    :cond_2
    const-string v2, "cannot_remove_primary"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 502
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 503
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 504
    invoke-static {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->cannotRemovePrimary(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    move-result-object v0

    goto :goto_1

    .line 507
    :cond_3
    sget-object v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->OTHER:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    :goto_1
    if-nez v1, :cond_4

    .line 510
    invoke-static {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 511
    invoke-static {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_4
    return-object v0

    .line 486
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

    .line 434
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 439
    sget-object v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$DeleteSecondaryEmailResult$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->tag()Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 465
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 457
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 458
    const-string v0, "cannot_remove_primary"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 459
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 460
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->access$200(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 461
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 449
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 450
    const-string v0, "not_found"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 451
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 452
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->access$100(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 453
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 441
    :cond_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 442
    const-string v0, "success"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 443
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 444
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->access$000(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 445
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

    .line 434
    check-cast p1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
