.class Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "AdminAlertSeverityEnum.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 42
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 78
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 80
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 81
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 85
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 86
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_7

    .line 91
    const-string v2, "high"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 92
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->HIGH:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    goto :goto_1

    .line 94
    :cond_1
    const-string v2, "info"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 95
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->INFO:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    goto :goto_1

    .line 97
    :cond_2
    const-string v2, "low"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 98
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->LOW:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    goto :goto_1

    .line 100
    :cond_3
    const-string v2, "medium"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 101
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->MEDIUM:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    goto :goto_1

    .line 103
    :cond_4
    const-string v2, "na"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 104
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->NA:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    goto :goto_1

    .line 107
    :cond_5
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->OTHER:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    :goto_1
    if-nez v1, :cond_6

    .line 110
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 111
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_6
    return-object v0

    .line 89
    :cond_7
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

    .line 41
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 46
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$1;->$SwitchMap$com$dropbox$core$v2$teamlog$AdminAlertSeverityEnum:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 68
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 64
    :cond_0
    const-string p1, "na"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 60
    :cond_1
    const-string p1, "medium"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 56
    :cond_2
    const-string p1, "low"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 52
    :cond_3
    const-string p1, "info"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 48
    :cond_4
    const-string p1, "high"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 41
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
