.class Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "VisibilityPolicyDisallowedReason.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    new-instance v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 101
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 103
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 104
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 108
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 109
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_8

    .line 114
    const-string v2, "delete_and_recreate"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 115
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->DELETE_AND_RECREATE:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    goto :goto_1

    .line 117
    :cond_1
    const-string v2, "restricted_by_shared_folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 118
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->RESTRICTED_BY_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    goto :goto_1

    .line 120
    :cond_2
    const-string v2, "restricted_by_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 121
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    goto :goto_1

    .line 123
    :cond_3
    const-string v2, "user_not_on_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 124
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    goto :goto_1

    .line 126
    :cond_4
    const-string v2, "user_account_type"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 127
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    goto :goto_1

    .line 129
    :cond_5
    const-string v2, "permission_denied"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 130
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    goto :goto_1

    .line 133
    :cond_6
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->OTHER:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    :goto_1
    if-nez v1, :cond_7

    .line 136
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 137
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_7
    return-object v0

    .line 112
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

    .line 60
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 65
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$1;->$SwitchMap$com$dropbox$core$v2$sharing$VisibilityPolicyDisallowedReason:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 91
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 87
    :pswitch_0
    const-string p1, "permission_denied"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 83
    :pswitch_1
    const-string p1, "user_account_type"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 79
    :pswitch_2
    const-string p1, "user_not_on_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 75
    :pswitch_3
    const-string p1, "restricted_by_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 71
    :pswitch_4
    const-string p1, "restricted_by_shared_folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 67
    :pswitch_5
    const-string p1, "delete_and_recreate"

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

    .line 60
    check-cast p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason$Serializer;->serialize(Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
