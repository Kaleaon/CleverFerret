.class Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "SharingAllowlistRemoveError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 368
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 367
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 412
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 414
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 415
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 419
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 420
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_7

    .line 425
    const-string v2, "malformed_entry"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 427
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 428
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 429
    invoke-static {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->malformedEntry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object v0

    goto :goto_1

    .line 431
    :cond_1
    const-string v2, "entries_do_not_exist"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 433
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 434
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 435
    invoke-static {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->entriesDoNotExist(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object v0

    goto :goto_1

    .line 437
    :cond_2
    const-string v2, "no_entries_provided"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 438
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    goto :goto_1

    .line 440
    :cond_3
    const-string v2, "too_many_entries_provided"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 441
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    goto :goto_1

    .line 443
    :cond_4
    const-string v2, "unknown_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 444
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    goto :goto_1

    .line 447
    :cond_5
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    :goto_1
    if-nez v1, :cond_6

    .line 450
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 451
    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_6
    return-object v0

    .line 423
    :cond_7
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

    .line 367
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 372
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$1;->$SwitchMap$com$dropbox$core$v2$team$SharingAllowlistRemoveError$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->tag()Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 p1, 0x3

    if-eq v0, p1, :cond_2

    const/4 p1, 0x4

    if-eq v0, p1, :cond_1

    const/4 p1, 0x5

    if-eq v0, p1, :cond_0

    .line 402
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 398
    :cond_0
    const-string p1, "unknown_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 394
    :cond_1
    const-string p1, "too_many_entries_provided"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 390
    :cond_2
    const-string p1, "no_entries_provided"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 382
    :cond_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 383
    const-string v0, "entries_do_not_exist"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 384
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 385
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->access$100(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 386
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 374
    :cond_4
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 375
    const-string v0, "malformed_entry"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 376
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 377
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->string()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v0

    invoke-static {p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->access$000(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/stone/StoneSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 378
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

    .line 367
    check-cast p1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->serialize(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
