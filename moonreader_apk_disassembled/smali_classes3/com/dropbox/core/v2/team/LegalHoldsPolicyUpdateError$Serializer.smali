.class Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LegalHoldsPolicyUpdateError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 136
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 138
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 139
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 143
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 144
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_d

    .line 149
    const-string v2, "unknown_legal_hold_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 150
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->UNKNOWN_LEGAL_HOLD_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto/16 :goto_1

    .line 152
    :cond_1
    const-string v2, "insufficient_permissions"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 153
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 155
    :cond_2
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 156
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->OTHER:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 158
    :cond_3
    const-string v2, "transient_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 159
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 161
    :cond_4
    const-string v2, "inactive_legal_hold"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 162
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INACTIVE_LEGAL_HOLD:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 164
    :cond_5
    const-string v2, "legal_hold_performing_another_operation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 165
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->LEGAL_HOLD_PERFORMING_ANOTHER_OPERATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 167
    :cond_6
    const-string v2, "invalid_members"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 168
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INVALID_MEMBERS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 170
    :cond_7
    const-string v2, "number_of_users_on_hold_is_greater_than_hold_limitation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 171
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->NUMBER_OF_USERS_ON_HOLD_IS_GREATER_THAN_HOLD_LIMITATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 173
    :cond_8
    const-string v2, "empty_members_list"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 174
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->EMPTY_MEMBERS_LIST:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 176
    :cond_9
    const-string v2, "name_must_be_unique"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 177
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->NAME_MUST_BE_UNIQUE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    goto :goto_1

    .line 179
    :cond_a
    const-string v2, "legal_hold_policy_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 180
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->LEGAL_HOLD_POLICY_NOT_FOUND:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    :goto_1
    if-nez v1, :cond_b

    .line 186
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 187
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_b
    return-object v0

    .line 183
    :cond_c
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 147
    :cond_d
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

    .line 75
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 80
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 126
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 122
    :pswitch_0
    const-string p1, "legal_hold_policy_not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 118
    :pswitch_1
    const-string p1, "name_must_be_unique"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 114
    :pswitch_2
    const-string p1, "empty_members_list"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 110
    :pswitch_3
    const-string p1, "number_of_users_on_hold_is_greater_than_hold_limitation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 106
    :pswitch_4
    const-string p1, "invalid_members"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 102
    :pswitch_5
    const-string p1, "legal_hold_performing_another_operation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 98
    :pswitch_6
    const-string p1, "inactive_legal_hold"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 94
    :pswitch_7
    const-string p1, "transient_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 90
    :pswitch_8
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 86
    :pswitch_9
    const-string p1, "insufficient_permissions"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 82
    :pswitch_a
    const-string p1, "unknown_legal_hold_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
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

    .line 75
    check-cast p1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;->serialize(Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
