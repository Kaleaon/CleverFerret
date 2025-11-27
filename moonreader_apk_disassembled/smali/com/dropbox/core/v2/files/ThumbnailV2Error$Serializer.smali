.class Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "ThumbnailV2Error.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/ThumbnailV2Error;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/ThumbnailV2Error;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 335
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 334
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 379
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 381
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 382
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 386
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 387
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_8

    .line 392
    const-string v2, "path"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 394
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 395
    sget-object v0, Lcom/dropbox/core/v2/files/LookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LookupError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/LookupError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/LookupError;

    move-result-object v0

    .line 396
    invoke-static {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object v0

    goto :goto_1

    .line 398
    :cond_1
    const-string v2, "unsupported_extension"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 399
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    goto :goto_1

    .line 401
    :cond_2
    const-string v2, "unsupported_image"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 402
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    goto :goto_1

    .line 404
    :cond_3
    const-string v2, "conversion_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 405
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    goto :goto_1

    .line 407
    :cond_4
    const-string v2, "access_denied"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 408
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->ACCESS_DENIED:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    goto :goto_1

    .line 410
    :cond_5
    const-string v2, "not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 411
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->NOT_FOUND:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    goto :goto_1

    .line 414
    :cond_6
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->OTHER:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    :goto_1
    if-nez v1, :cond_7

    .line 417
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 418
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_7
    return-object v0

    .line 390
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

    .line 334
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/ThumbnailV2Error;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 339
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error$1;->$SwitchMap$com$dropbox$core$v2$files$ThumbnailV2Error$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->tag()Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 369
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 365
    :pswitch_0
    const-string p1, "not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 361
    :pswitch_1
    const-string p1, "access_denied"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 357
    :pswitch_2
    const-string p1, "conversion_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 353
    :pswitch_3
    const-string p1, "unsupported_image"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 349
    :pswitch_4
    const-string p1, "unsupported_extension"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 341
    :pswitch_5
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 342
    const-string v0, "path"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 343
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 344
    sget-object v0, Lcom/dropbox/core/v2/files/LookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LookupError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->access$000(Lcom/dropbox/core/v2/files/ThumbnailV2Error;)Lcom/dropbox/core/v2/files/LookupError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/files/LookupError$Serializer;->serialize(Lcom/dropbox/core/v2/files/LookupError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 345
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

    .line 334
    check-cast p1, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->serialize(Lcom/dropbox/core/v2/files/ThumbnailV2Error;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
