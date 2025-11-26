.class Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "DefaultLinkExpirationDaysPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 93
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 95
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 96
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 100
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 101
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_a

    .line 106
    const-string v2, "day_1"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 107
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->DAY_1:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    goto :goto_1

    .line 109
    :cond_1
    const-string v2, "day_180"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 110
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->DAY_180:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    goto :goto_1

    .line 112
    :cond_2
    const-string v2, "day_3"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 113
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->DAY_3:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    goto :goto_1

    .line 115
    :cond_3
    const-string v2, "day_30"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 116
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->DAY_30:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    goto :goto_1

    .line 118
    :cond_4
    const-string v2, "day_7"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 119
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->DAY_7:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    goto :goto_1

    .line 121
    :cond_5
    const-string v2, "day_90"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 122
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->DAY_90:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    goto :goto_1

    .line 124
    :cond_6
    const-string v2, "none"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 125
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->NONE:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    goto :goto_1

    .line 127
    :cond_7
    const-string v2, "year_1"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 128
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->YEAR_1:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    goto :goto_1

    .line 131
    :cond_8
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->OTHER:Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    :goto_1
    if-nez v1, :cond_9

    .line 134
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 135
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_9
    return-object v0

    .line 104
    :cond_a
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

    .line 44
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 49
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$1;->$SwitchMap$com$dropbox$core$v2$teamlog$DefaultLinkExpirationDaysPolicy:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 83
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 79
    :pswitch_0
    const-string p1, "year_1"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 75
    :pswitch_1
    const-string p1, "none"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 71
    :pswitch_2
    const-string p1, "day_90"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 67
    :pswitch_3
    const-string p1, "day_7"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 63
    :pswitch_4
    const-string p1, "day_30"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 59
    :pswitch_5
    const-string p1, "day_3"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 55
    :pswitch_6
    const-string p1, "day_180"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 51
    :pswitch_7
    const-string p1, "day_1"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
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

    .line 44
    check-cast p1, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/DefaultLinkExpirationDaysPolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
