.class Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LegalHoldsPolicyReleaseError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;
    .locals 4
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
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 98
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 102
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 103
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_8

    .line 108
    const-string v2, "unknown_legal_hold_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 109
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->UNKNOWN_LEGAL_HOLD_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    goto :goto_1

    .line 111
    :cond_1
    const-string v2, "insufficient_permissions"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 112
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    goto :goto_1

    .line 114
    :cond_2
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 115
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->OTHER:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    goto :goto_1

    .line 117
    :cond_3
    const-string v2, "legal_hold_performing_another_operation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 118
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->LEGAL_HOLD_PERFORMING_ANOTHER_OPERATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    goto :goto_1

    .line 120
    :cond_4
    const-string v2, "legal_hold_already_releasing"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 121
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->LEGAL_HOLD_ALREADY_RELEASING:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    goto :goto_1

    .line 123
    :cond_5
    const-string v2, "legal_hold_policy_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 124
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->LEGAL_HOLD_POLICY_NOT_FOUND:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    :goto_1
    if-nez v1, :cond_6

    .line 130
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 131
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_6
    return-object v0

    .line 127
    :cond_7
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 106
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

    .line 54
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 59
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyReleaseError:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 85
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 81
    :pswitch_0
    const-string p1, "legal_hold_policy_not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 77
    :pswitch_1
    const-string p1, "legal_hold_already_releasing"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 73
    :pswitch_2
    const-string p1, "legal_hold_performing_another_operation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 69
    :pswitch_3
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 65
    :pswitch_4
    const-string p1, "insufficient_permissions"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 61
    :pswitch_5
    const-string p1, "unknown_legal_hold_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

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

    .line 54
    check-cast p1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$Serializer;->serialize(Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
