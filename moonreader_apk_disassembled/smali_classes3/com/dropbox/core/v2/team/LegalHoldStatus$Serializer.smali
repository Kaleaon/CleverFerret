.class Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LegalHoldStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/team/LegalHoldStatus;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/LegalHoldStatus;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 98
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 100
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 101
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 105
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 106
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_8

    .line 111
    const-string v2, "active"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 112
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus;->ACTIVE:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    goto :goto_1

    .line 114
    :cond_1
    const-string v2, "released"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 115
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus;->RELEASED:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    goto :goto_1

    .line 117
    :cond_2
    const-string v2, "activating"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 118
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus;->ACTIVATING:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    goto :goto_1

    .line 120
    :cond_3
    const-string v2, "updating"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 121
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus;->UPDATING:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    goto :goto_1

    .line 123
    :cond_4
    const-string v2, "exporting"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 124
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus;->EXPORTING:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    goto :goto_1

    .line 126
    :cond_5
    const-string v2, "releasing"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 127
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus;->RELEASING:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    goto :goto_1

    .line 130
    :cond_6
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus;->OTHER:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    :goto_1
    if-nez v1, :cond_7

    .line 133
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 134
    invoke-static {p1}, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_7
    return-object v0

    .line 109
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

    .line 57
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/team/LegalHoldStatus;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/team/LegalHoldStatus;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 62
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldStatus$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldStatus:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/team/LegalHoldStatus;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 88
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 84
    :pswitch_0
    const-string p1, "releasing"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 80
    :pswitch_1
    const-string p1, "exporting"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 76
    :pswitch_2
    const-string p1, "updating"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 72
    :pswitch_3
    const-string p1, "activating"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 68
    :pswitch_4
    const-string p1, "released"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 64
    :pswitch_5
    const-string p1, "active"

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

    .line 57
    check-cast p1, Lcom/dropbox/core/v2/team/LegalHoldStatus;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/team/LegalHoldStatus$Serializer;->serialize(Lcom/dropbox/core/v2/team/LegalHoldStatus;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
