.class Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LegalHoldsPolicyCreateError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 135
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 137
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 138
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 142
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 143
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_d

    .line 148
    const-string v2, "unknown_legal_hold_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 149
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->UNKNOWN_LEGAL_HOLD_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto/16 :goto_1

    .line 151
    :cond_1
    const-string v2, "insufficient_permissions"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 152
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 154
    :cond_2
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 155
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->OTHER:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 157
    :cond_3
    const-string v2, "start_date_is_later_than_end_date"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 158
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->START_DATE_IS_LATER_THAN_END_DATE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 160
    :cond_4
    const-string v2, "empty_members_list"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 161
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->EMPTY_MEMBERS_LIST:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 163
    :cond_5
    const-string v2, "invalid_members"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 164
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->INVALID_MEMBERS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 166
    :cond_6
    const-string v2, "number_of_users_on_hold_is_greater_than_hold_limitation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 167
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->NUMBER_OF_USERS_ON_HOLD_IS_GREATER_THAN_HOLD_LIMITATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 169
    :cond_7
    const-string v2, "transient_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 170
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 172
    :cond_8
    const-string v2, "name_must_be_unique"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 173
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->NAME_MUST_BE_UNIQUE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 175
    :cond_9
    const-string v2, "team_exceeded_legal_hold_quota"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 176
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->TEAM_EXCEEDED_LEGAL_HOLD_QUOTA:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    goto :goto_1

    .line 178
    :cond_a
    const-string v2, "invalid_date"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 179
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->INVALID_DATE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    :goto_1
    if-nez v1, :cond_b

    .line 185
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 186
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_b
    return-object v0

    .line 182
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

    .line 146
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

    .line 74
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 79
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyCreateError:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 125
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 121
    :pswitch_0
    const-string p1, "invalid_date"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 117
    :pswitch_1
    const-string p1, "team_exceeded_legal_hold_quota"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 113
    :pswitch_2
    const-string p1, "name_must_be_unique"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 109
    :pswitch_3
    const-string p1, "transient_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 105
    :pswitch_4
    const-string p1, "number_of_users_on_hold_is_greater_than_hold_limitation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 101
    :pswitch_5
    const-string p1, "invalid_members"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 97
    :pswitch_6
    const-string p1, "empty_members_list"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 93
    :pswitch_7
    const-string p1, "start_date_is_later_than_end_date"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 89
    :pswitch_8
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 85
    :pswitch_9
    const-string p1, "insufficient_permissions"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 81
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

    .line 74
    check-cast p1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError$Serializer;->serialize(Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
