.class Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "GetTemporaryLinkError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/GetTemporaryLinkError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/GetTemporaryLinkError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 300
    new-instance v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 299
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/GetTemporaryLinkError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 336
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 338
    invoke-static {p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 339
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 343
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 344
    invoke-static {p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_6

    .line 349
    const-string v2, "path"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 351
    invoke-static {v2, p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->expectField(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 352
    sget-object v0, Lcom/dropbox/core/v2/files/LookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LookupError$Serializer;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/LookupError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/LookupError;

    move-result-object v0

    .line 353
    invoke-static {v0}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;->path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/GetTemporaryLinkError;

    move-result-object v0

    goto :goto_1

    .line 355
    :cond_1
    const-string v2, "email_not_verified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 356
    sget-object v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;->EMAIL_NOT_VERIFIED:Lcom/dropbox/core/v2/files/GetTemporaryLinkError;

    goto :goto_1

    .line 358
    :cond_2
    const-string v2, "unsupported_file"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 359
    sget-object v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;->UNSUPPORTED_FILE:Lcom/dropbox/core/v2/files/GetTemporaryLinkError;

    goto :goto_1

    .line 361
    :cond_3
    const-string v2, "not_allowed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 362
    sget-object v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;->NOT_ALLOWED:Lcom/dropbox/core/v2/files/GetTemporaryLinkError;

    goto :goto_1

    .line 365
    :cond_4
    sget-object v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;->OTHER:Lcom/dropbox/core/v2/files/GetTemporaryLinkError;

    :goto_1
    if-nez v1, :cond_5

    .line 368
    invoke-static {p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 369
    invoke-static {p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 347
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

    .line 299
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/GetTemporaryLinkError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/GetTemporaryLinkError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 304
    sget-object v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$1;->$SwitchMap$com$dropbox$core$v2$files$GetTemporaryLinkError$Tag:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;->tag()Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Tag;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Tag;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 p1, 0x2

    if-eq v0, p1, :cond_2

    const/4 p1, 0x3

    if-eq v0, p1, :cond_1

    const/4 p1, 0x4

    if-eq v0, p1, :cond_0

    .line 326
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 322
    :cond_0
    const-string p1, "not_allowed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 318
    :cond_1
    const-string p1, "unsupported_file"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 314
    :cond_2
    const-string p1, "email_not_verified"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 306
    :cond_3
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 307
    const-string v0, "path"

    invoke-virtual {p0, v0, p2}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->writeTag(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 308
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 309
    sget-object v0, Lcom/dropbox/core/v2/files/LookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LookupError$Serializer;

    invoke-static {p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;->access$000(Lcom/dropbox/core/v2/files/GetTemporaryLinkError;)Lcom/dropbox/core/v2/files/LookupError;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/v2/files/LookupError$Serializer;->serialize(Lcom/dropbox/core/v2/files/LookupError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 310
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

    .line 299
    check-cast p1, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->serialize(Lcom/dropbox/core/v2/files/GetTemporaryLinkError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
