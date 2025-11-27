.class Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LinkAudienceDisallowedReason.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 62
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 107
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 109
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 110
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 114
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 115
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_9

    .line 120
    const-string v2, "delete_and_recreate"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 121
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->DELETE_AND_RECREATE:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    goto :goto_1

    .line 123
    :cond_1
    const-string v2, "restricted_by_shared_folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 124
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->RESTRICTED_BY_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    goto :goto_1

    .line 126
    :cond_2
    const-string v2, "restricted_by_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 127
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    goto :goto_1

    .line 129
    :cond_3
    const-string v2, "user_not_on_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 130
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    goto :goto_1

    .line 132
    :cond_4
    const-string v2, "user_account_type"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    goto :goto_1

    .line 135
    :cond_5
    const-string v2, "permission_denied"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 136
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    goto :goto_1

    .line 138
    :cond_6
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 139
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->OTHER:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    :goto_1
    if-nez v1, :cond_7

    .line 145
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 146
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_7
    return-object v0

    .line 142
    :cond_8
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 118
    :cond_9
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

    .line 62
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 67
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$1;->$SwitchMap$com$dropbox$core$v2$sharing$LinkAudienceDisallowedReason:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 97
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 93
    :pswitch_0
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 89
    :pswitch_1
    const-string p1, "permission_denied"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 85
    :pswitch_2
    const-string p1, "user_account_type"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 81
    :pswitch_3
    const-string p1, "user_not_on_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 77
    :pswitch_4
    const-string p1, "restricted_by_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 73
    :pswitch_5
    const-string p1, "restricted_by_shared_folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 69
    :pswitch_6
    const-string p1, "delete_and_recreate"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
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

    .line 62
    check-cast p1, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;->serialize(Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
