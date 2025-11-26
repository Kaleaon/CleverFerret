.class Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "AdminAlertCategoryEnum.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 88
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 90
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 91
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 95
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 96
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_9

    .line 101
    const-string v2, "account_takeover"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 102
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->ACCOUNT_TAKEOVER:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    goto :goto_1

    .line 104
    :cond_1
    const-string v2, "data_loss_protection"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 105
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->DATA_LOSS_PROTECTION:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    goto :goto_1

    .line 107
    :cond_2
    const-string v2, "information_governance"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 108
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->INFORMATION_GOVERNANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    goto :goto_1

    .line 110
    :cond_3
    const-string v2, "malware_sharing"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 111
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->MALWARE_SHARING:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    goto :goto_1

    .line 113
    :cond_4
    const-string v2, "massive_file_operation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 114
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->MASSIVE_FILE_OPERATION:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    goto :goto_1

    .line 116
    :cond_5
    const-string v2, "na"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 117
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->NA:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    goto :goto_1

    .line 119
    :cond_6
    const-string v2, "threat_management"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 120
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->THREAT_MANAGEMENT:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    goto :goto_1

    .line 123
    :cond_7
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->OTHER:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    :goto_1
    if-nez v1, :cond_8

    .line 126
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 127
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_8
    return-object v0

    .line 99
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

    .line 43
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 48
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$1;->$SwitchMap$com$dropbox$core$v2$teamlog$AdminAlertCategoryEnum:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 78
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 74
    :pswitch_0
    const-string p1, "threat_management"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 70
    :pswitch_1
    const-string p1, "na"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 66
    :pswitch_2
    const-string p1, "massive_file_operation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 62
    :pswitch_3
    const-string p1, "malware_sharing"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 58
    :pswitch_4
    const-string p1, "information_governance"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 54
    :pswitch_5
    const-string p1, "data_loss_protection"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 50
    :pswitch_6
    const-string p1, "account_takeover"

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

    .line 43
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
