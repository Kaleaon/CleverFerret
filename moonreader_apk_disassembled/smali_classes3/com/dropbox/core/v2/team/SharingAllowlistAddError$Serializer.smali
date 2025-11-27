.class Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "SharingAllowlistAddError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/SharingAllowlistAddError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 389
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 388
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 437
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 439
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 440
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 444
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 445
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_8

    .line 450
    const-string v2, "malformed_entry"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 452
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 453
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 454
    invoke-static {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->malformedEntry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object v0

    goto :goto_1

    .line 456
    :cond_1
    const-string v2, "no_entries_provided"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 457
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    goto :goto_1

    .line 459
    :cond_2
    const-string v2, "too_many_entries_provided"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 460
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    goto :goto_1

    .line 462
    :cond_3
    const-string v2, "team_limit_reached"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 463
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->TEAM_LIMIT_REACHED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    goto :goto_1

    .line 465
    :cond_4
    const-string v2, "unknown_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 466
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    goto :goto_1

    .line 468
    :cond_5
    const-string v2, "entries_already_exist"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 470
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 471
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 472
    invoke-static {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->entriesAlreadyExist(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object v0

    goto :goto_1

    .line 475
    :cond_6
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    :goto_1
    if-nez v1, :cond_7

    .line 478
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 479
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_7
    return-object v0

    .line 448
    :cond_8
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

    .line 388
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/SharingAllowlistAddError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 393
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$1;->$SwitchMap$com$dropbox$core$v2$team$SharingAllowlistAddError$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->tag()Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 427
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 419
    :pswitch_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 420
    const-string v0, "entries_already_exist"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 421
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 422
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->access$100(Lcom/dropbox/core/v2/team/SharingAllowlistAddError;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 423
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 415
    :pswitch_1
    const-string p1, "unknown_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 411
    :pswitch_2
    const-string p1, "team_limit_reached"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 407
    :pswitch_3
    const-string p1, "too_many_entries_provided"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 403
    :pswitch_4
    const-string p1, "no_entries_provided"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 395
    :pswitch_5
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 396
    const-string v0, "malformed_entry"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 397
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 398
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->access$000(Lcom/dropbox/core/v2/team/SharingAllowlistAddError;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 399
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 388
    check-cast p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->serialize(Lcom/dropbox/core/v2/team/SharingAllowlistAddError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
