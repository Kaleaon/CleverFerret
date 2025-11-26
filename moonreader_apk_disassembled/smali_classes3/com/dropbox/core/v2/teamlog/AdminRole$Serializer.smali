.class Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "AdminRole.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AdminRole;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/AdminRole;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AdminRole;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 100
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 102
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 103
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 107
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 108
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_c

    .line 113
    const-string v2, "billing_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 114
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->BILLING_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto/16 :goto_1

    .line 116
    :cond_1
    const-string v2, "compliance_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 117
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->COMPLIANCE_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 119
    :cond_2
    const-string v2, "content_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 120
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->CONTENT_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 122
    :cond_3
    const-string v2, "limited_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 123
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->LIMITED_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 125
    :cond_4
    const-string v2, "member_only"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 126
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->MEMBER_ONLY:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 128
    :cond_5
    const-string v2, "reporting_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 129
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->REPORTING_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 131
    :cond_6
    const-string v2, "security_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 132
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->SECURITY_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 134
    :cond_7
    const-string v2, "support_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 135
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->SUPPORT_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 137
    :cond_8
    const-string v2, "team_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 138
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->TEAM_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 140
    :cond_9
    const-string v2, "user_management_admin"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 141
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->USER_MANAGEMENT_ADMIN:Lcom/dropbox/core/v2/teamlog/AdminRole;

    goto :goto_1

    .line 144
    :cond_a
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole;->OTHER:Lcom/dropbox/core/v2/teamlog/AdminRole;

    :goto_1
    if-nez v1, :cond_b

    .line 147
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 148
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_b
    return-object v0

    .line 111
    :cond_c
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

    .line 43
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AdminRole;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/AdminRole;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 48
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminRole$1;->$SwitchMap$com$dropbox$core$v2$teamlog$AdminRole:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/AdminRole;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 90
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 86
    :pswitch_0
    const-string p1, "user_management_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 82
    :pswitch_1
    const-string p1, "team_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 78
    :pswitch_2
    const-string p1, "support_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 74
    :pswitch_3
    const-string p1, "security_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 70
    :pswitch_4
    const-string p1, "reporting_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 66
    :pswitch_5
    const-string p1, "member_only"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 62
    :pswitch_6
    const-string p1, "limited_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 58
    :pswitch_7
    const-string p1, "content_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 54
    :pswitch_8
    const-string p1, "compliance_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 50
    :pswitch_9
    const-string p1, "billing_admin"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
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

    .line 43
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AdminRole;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/AdminRole$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/AdminRole;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
