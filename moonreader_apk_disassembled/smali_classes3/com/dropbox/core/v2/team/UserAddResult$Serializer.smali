.class Lcom/dropbox/core/v2/team/UserAddResult$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "UserAddResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/UserAddResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/UserAddResult;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/UserAddResult$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 477
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserAddResult$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 476
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 524
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 526
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 527
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 531
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 532
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_6

    .line 537
    const-string v3, "success"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 539
    sget-object v0, Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult$Serializer;

    invoke-virtual {v0, p1, v2}, Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Z)Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

    move-result-object v0

    .line 540
    invoke-static {v0}, Lcom/dropbox/core/v2/team/UserAddResult;->success(Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object v0

    goto :goto_1

    .line 542
    :cond_1
    const-string v2, "invalid_user"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 544
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 545
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object v0

    .line 546
    invoke-static {v0}, Lcom/dropbox/core/v2/team/UserAddResult;->invalidUser(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object v0

    goto :goto_1

    .line 548
    :cond_2
    const-string v2, "unverified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 550
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 551
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object v0

    .line 552
    invoke-static {v0}, Lcom/dropbox/core/v2/team/UserAddResult;->unverified(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object v0

    goto :goto_1

    .line 554
    :cond_3
    const-string v2, "placeholder_user"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 556
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 557
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object v0

    .line 558
    invoke-static {v0}, Lcom/dropbox/core/v2/team/UserAddResult;->placeholderUser(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object v0

    goto :goto_1

    .line 561
    :cond_4
    sget-object v0, Lcom/dropbox/core/v2/team/UserAddResult;->OTHER:Lcom/dropbox/core/v2/team/UserAddResult;

    :goto_1
    if-nez v1, :cond_5

    .line 564
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 565
    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 535
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

    .line 476
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/UserAddResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 481
    sget-object v0, Lcom/dropbox/core/v2/team/UserAddResult$1;->$SwitchMap$com$dropbox$core$v2$team$UserAddResult$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/UserAddResult;->tag()Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->ordinal()I

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

    .line 514
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 506
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 507
    const-string v0, "placeholder_user"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 508
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 509
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult;->access$300(Lcom/dropbox/core/v2/team/UserAddResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserSelectorArg;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 510
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 498
    :cond_1
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 499
    const-string v0, "unverified"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 500
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 501
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult;->access$200(Lcom/dropbox/core/v2/team/UserAddResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserSelectorArg;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 502
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 490
    :cond_2
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 491
    const-string v0, "invalid_user"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 492
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 493
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult;->access$100(Lcom/dropbox/core/v2/team/UserAddResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserSelectorArg;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 494
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 483
    :cond_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 484
    const-string v0, "success"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 485
    sget-object v0, Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/team/UserAddResult;->access$000(Lcom/dropbox/core/v2/team/UserAddResult;)Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

    move-result-object p1

    invoke-virtual {v0, p1, p2, v1}, Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 486
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

    .line 476
    check-cast p1, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->serialize(Lcom/dropbox/core/v2/team/UserAddResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
