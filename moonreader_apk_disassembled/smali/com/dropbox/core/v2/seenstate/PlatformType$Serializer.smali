.class public Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "PlatformType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/seenstate/PlatformType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/seenstate/PlatformType;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 66
    new-instance v0, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;->INSTANCE:Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/seenstate/PlatformType;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 110
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 112
    invoke-static {p1}, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 113
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 117
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 118
    invoke-static {p1}, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_9

    .line 123
    const-string v2, "web"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 124
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType;->WEB:Lcom/dropbox/core/v2/seenstate/PlatformType;

    goto :goto_1

    .line 126
    :cond_1
    const-string v2, "desktop"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 127
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType;->DESKTOP:Lcom/dropbox/core/v2/seenstate/PlatformType;

    goto :goto_1

    .line 129
    :cond_2
    const-string v2, "mobile_ios"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 130
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType;->MOBILE_IOS:Lcom/dropbox/core/v2/seenstate/PlatformType;

    goto :goto_1

    .line 132
    :cond_3
    const-string v2, "mobile_android"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType;->MOBILE_ANDROID:Lcom/dropbox/core/v2/seenstate/PlatformType;

    goto :goto_1

    .line 135
    :cond_4
    const-string v2, "api"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 136
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType;->API:Lcom/dropbox/core/v2/seenstate/PlatformType;

    goto :goto_1

    .line 138
    :cond_5
    const-string v2, "unknown"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 139
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType;->UNKNOWN:Lcom/dropbox/core/v2/seenstate/PlatformType;

    goto :goto_1

    .line 141
    :cond_6
    const-string v2, "mobile"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 142
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType;->MOBILE:Lcom/dropbox/core/v2/seenstate/PlatformType;

    goto :goto_1

    .line 145
    :cond_7
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType;->OTHER:Lcom/dropbox/core/v2/seenstate/PlatformType;

    :goto_1
    if-nez v1, :cond_8

    .line 148
    invoke-static {p1}, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 149
    invoke-static {p1}, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_8
    return-object v0

    .line 121
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

    .line 65
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/seenstate/PlatformType;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/seenstate/PlatformType;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 70
    sget-object v0, Lcom/dropbox/core/v2/seenstate/PlatformType$1;->$SwitchMap$com$dropbox$core$v2$seenstate$PlatformType:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/seenstate/PlatformType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 100
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 96
    :pswitch_0
    const-string p1, "mobile"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 92
    :pswitch_1
    const-string p1, "unknown"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 88
    :pswitch_2
    const-string p1, "api"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 84
    :pswitch_3
    const-string p1, "mobile_android"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 80
    :pswitch_4
    const-string p1, "mobile_ios"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 76
    :pswitch_5
    const-string p1, "desktop"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 72
    :pswitch_6
    const-string p1, "web"

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

    .line 65
    check-cast p1, Lcom/dropbox/core/v2/seenstate/PlatformType;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/seenstate/PlatformType$Serializer;->serialize(Lcom/dropbox/core/v2/seenstate/PlatformType;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
