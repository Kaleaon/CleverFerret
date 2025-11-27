.class Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "TokenFromOAuth1Error.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    new-instance v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;->INSTANCE:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 67
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 69
    invoke-static {p1}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 70
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 74
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 75
    invoke-static {p1}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 80
    const-string v2, "invalid_oauth1_token_info"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 81
    sget-object v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->INVALID_OAUTH1_TOKEN_INFO:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    goto :goto_1

    .line 83
    :cond_1
    const-string v2, "app_id_mismatch"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 84
    sget-object v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->APP_ID_MISMATCH:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    goto :goto_1

    .line 87
    :cond_2
    sget-object v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->OTHER:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    :goto_1
    if-nez v1, :cond_3

    .line 90
    invoke-static {p1}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 91
    invoke-static {p1}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_3
    return-object v0

    .line 78
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

    .line 42
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 47
    sget-object v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$1;->$SwitchMap$com$dropbox$core$v2$auth$TokenFromOAuth1Error:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    .line 57
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 53
    :cond_0
    const-string p1, "app_id_mismatch"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 49
    :cond_1
    const-string p1, "invalid_oauth1_token_info"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

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

    .line 42
    check-cast p1, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;->serialize(Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
