.class Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "PaperUpdateError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/PaperUpdateError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/PaperUpdateError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 368
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 367
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PaperUpdateError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 424
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 426
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 427
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 431
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 432
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_b

    .line 437
    const-string v2, "insufficient_permissions"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 438
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/files/PaperUpdateError;

    goto :goto_1

    .line 440
    :cond_1
    const-string v2, "content_malformed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 441
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->CONTENT_MALFORMED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    goto :goto_1

    .line 443
    :cond_2
    const-string v2, "doc_length_exceeded"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 444
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->DOC_LENGTH_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    goto :goto_1

    .line 446
    :cond_3
    const-string v2, "image_size_exceeded"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 447
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->IMAGE_SIZE_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    goto :goto_1

    .line 449
    :cond_4
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 450
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->OTHER:Lcom/dropbox/core/v2/files/PaperUpdateError;

    goto :goto_1

    .line 452
    :cond_5
    const-string v2, "path"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 454
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 455
    sget-object v0, Lcom/dropbox/core/v2/files/LookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LookupError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/LookupError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/LookupError;

    move-result-object v0

    .line 456
    invoke-static {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;->path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    goto :goto_1

    .line 458
    :cond_6
    const-string v2, "revision_mismatch"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 459
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->REVISION_MISMATCH:Lcom/dropbox/core/v2/files/PaperUpdateError;

    goto :goto_1

    .line 461
    :cond_7
    const-string v2, "doc_archived"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 462
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->DOC_ARCHIVED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    goto :goto_1

    .line 464
    :cond_8
    const-string v2, "doc_deleted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 465
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->DOC_DELETED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    :goto_1
    if-nez v1, :cond_9

    .line 471
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 472
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_9
    return-object v0

    .line 468
    :cond_a
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 435
    :cond_b
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
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/PaperUpdateError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 372
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError$1;->$SwitchMap$com$dropbox$core$v2$files$PaperUpdateError$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->tag()Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 414
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->tag()Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 410
    :pswitch_0
    const-string p1, "doc_deleted"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 406
    :pswitch_1
    const-string p1, "doc_archived"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 402
    :pswitch_2
    const-string p1, "revision_mismatch"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 394
    :pswitch_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 395
    const-string v0, "path"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 396
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 397
    sget-object v0, Lcom/dropbox/core/v2/files/LookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LookupError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->access$000(Lcom/dropbox/core/v2/files/PaperUpdateError;)Lcom/dropbox/core/v2/files/LookupError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/files/LookupError$Serializer;->serialize(Lcom/dropbox/core/v2/files/LookupError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 398
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    return-void

    .line 390
    :pswitch_4
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 386
    :pswitch_5
    const-string p1, "image_size_exceeded"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 382
    :pswitch_6
    const-string p1, "doc_length_exceeded"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 378
    :pswitch_7
    const-string p1, "content_malformed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 374
    :pswitch_8
    const-string p1, "insufficient_permissions"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
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

    .line 367
    check-cast p1, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->serialize(Lcom/dropbox/core/v2/files/PaperUpdateError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
