.class Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "MembersTransferFormerMembersFilesError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 96
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 177
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 179
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 180
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 184
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 185
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_12

    .line 190
    const-string v2, "user_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 191
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto/16 :goto_1

    .line 193
    :cond_1
    const-string v2, "user_not_in_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 194
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto/16 :goto_1

    .line 196
    :cond_2
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 197
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->OTHER:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto/16 :goto_1

    .line 199
    :cond_3
    const-string v2, "removed_and_transfer_dest_should_differ"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 200
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->REMOVED_AND_TRANSFER_DEST_SHOULD_DIFFER:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto/16 :goto_1

    .line 202
    :cond_4
    const-string v2, "removed_and_transfer_admin_should_differ"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 203
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->REMOVED_AND_TRANSFER_ADMIN_SHOULD_DIFFER:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto/16 :goto_1

    .line 205
    :cond_5
    const-string v2, "transfer_dest_user_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 206
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->TRANSFER_DEST_USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto/16 :goto_1

    .line 208
    :cond_6
    const-string v2, "transfer_dest_user_not_in_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 209
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->TRANSFER_DEST_USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 211
    :cond_7
    const-string v2, "transfer_admin_user_not_in_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 212
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->TRANSFER_ADMIN_USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 214
    :cond_8
    const-string v2, "transfer_admin_user_not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 215
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->TRANSFER_ADMIN_USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 217
    :cond_9
    const-string v2, "unspecified_transfer_admin_id"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 218
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->UNSPECIFIED_TRANSFER_ADMIN_ID:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 220
    :cond_a
    const-string v2, "transfer_admin_is_not_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 221
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->TRANSFER_ADMIN_IS_NOT_ADMIN:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 223
    :cond_b
    const-string v2, "recipient_not_verified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 224
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->RECIPIENT_NOT_VERIFIED:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 226
    :cond_c
    const-string v2, "user_data_is_being_transferred"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 227
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->USER_DATA_IS_BEING_TRANSFERRED:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 229
    :cond_d
    const-string v2, "user_not_removed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 230
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->USER_NOT_REMOVED:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 232
    :cond_e
    const-string v2, "user_data_cannot_be_transferred"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 233
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->USER_DATA_CANNOT_BE_TRANSFERRED:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    goto :goto_1

    .line 235
    :cond_f
    const-string v2, "user_data_already_transferred"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 236
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->USER_DATA_ALREADY_TRANSFERRED:Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    :goto_1
    if-nez v1, :cond_10

    .line 242
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 243
    invoke-static {p1}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_10
    return-object v0

    .line 239
    :cond_11
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 188
    :cond_12
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

    .line 96
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 101
    sget-object v0, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$1;->$SwitchMap$com$dropbox$core$v2$team$MembersTransferFormerMembersFilesError:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 167
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 163
    :pswitch_0
    const-string p1, "user_data_already_transferred"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 159
    :pswitch_1
    const-string p1, "user_data_cannot_be_transferred"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 155
    :pswitch_2
    const-string p1, "user_not_removed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 151
    :pswitch_3
    const-string p1, "user_data_is_being_transferred"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 147
    :pswitch_4
    const-string p1, "recipient_not_verified"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 143
    :pswitch_5
    const-string p1, "transfer_admin_is_not_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 139
    :pswitch_6
    const-string p1, "unspecified_transfer_admin_id"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 135
    :pswitch_7
    const-string p1, "transfer_admin_user_not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 131
    :pswitch_8
    const-string p1, "transfer_admin_user_not_in_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 127
    :pswitch_9
    const-string p1, "transfer_dest_user_not_in_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 123
    :pswitch_a
    const-string p1, "transfer_dest_user_not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 119
    :pswitch_b
    const-string p1, "removed_and_transfer_admin_should_differ"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 115
    :pswitch_c
    const-string p1, "removed_and_transfer_dest_should_differ"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 111
    :pswitch_d
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 107
    :pswitch_e
    const-string p1, "user_not_in_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 103
    :pswitch_f
    const-string p1, "user_not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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

    .line 96
    check-cast p1, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError$Serializer;->serialize(Lcom/dropbox/core/v2/team/MembersTransferFormerMembersFilesError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
