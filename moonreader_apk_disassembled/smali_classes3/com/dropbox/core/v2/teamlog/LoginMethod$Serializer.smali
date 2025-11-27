.class Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LoginMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/LoginMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/LoginMethod;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/LoginMethod;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 95
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 97
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 98
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 102
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 103
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_b

    .line 108
    const-string v2, "apple_oauth"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 109
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->APPLE_OAUTH:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 111
    :cond_1
    const-string v2, "first_party_token_exchange"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 112
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->FIRST_PARTY_TOKEN_EXCHANGE:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 114
    :cond_2
    const-string v2, "google_oauth"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 115
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->GOOGLE_OAUTH:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 117
    :cond_3
    const-string v2, "lenovo_oauth"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 118
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->LENOVO_OAUTH:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 120
    :cond_4
    const-string v2, "password"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 121
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->PASSWORD:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 123
    :cond_5
    const-string v2, "qr_code"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 124
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->QR_CODE:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 126
    :cond_6
    const-string v2, "saml"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 127
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->SAML:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 129
    :cond_7
    const-string v2, "two_factor_authentication"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 130
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->TWO_FACTOR_AUTHENTICATION:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 132
    :cond_8
    const-string v2, "web_session"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->WEB_SESSION:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    goto :goto_1

    .line 136
    :cond_9
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod;->OTHER:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    :goto_1
    if-nez v1, :cond_a

    .line 139
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 140
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_a
    return-object v0

    .line 106
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

    .line 42
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/LoginMethod;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/LoginMethod;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 47
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginMethod$1;->$SwitchMap$com$dropbox$core$v2$teamlog$LoginMethod:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/LoginMethod;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 85
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 81
    :pswitch_0
    const-string p1, "web_session"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 77
    :pswitch_1
    const-string p1, "two_factor_authentication"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 73
    :pswitch_2
    const-string p1, "saml"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 69
    :pswitch_3
    const-string p1, "qr_code"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 65
    :pswitch_4
    const-string p1, "password"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 61
    :pswitch_5
    const-string p1, "lenovo_oauth"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 57
    :pswitch_6
    const-string p1, "google_oauth"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 53
    :pswitch_7
    const-string p1, "first_party_token_exchange"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 49
    :pswitch_8
    const-string p1, "apple_oauth"

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

    .line 42
    check-cast p1, Lcom/dropbox/core/v2/teamlog/LoginMethod;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/LoginMethod$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/LoginMethod;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
