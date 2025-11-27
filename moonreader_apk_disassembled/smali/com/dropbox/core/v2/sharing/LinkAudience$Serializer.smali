.class public Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "LinkAudience.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/LinkAudience;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/sharing/LinkAudience;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/sharing/LinkAudience;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 94
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 96
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 97
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 101
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 102
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_7

    .line 107
    const-string v2, "public"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 108
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudience;->PUBLIC:Lcom/dropbox/core/v2/sharing/LinkAudience;

    goto :goto_1

    .line 110
    :cond_1
    const-string v2, "team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 111
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudience;->TEAM:Lcom/dropbox/core/v2/sharing/LinkAudience;

    goto :goto_1

    .line 113
    :cond_2
    const-string v2, "no_one"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 114
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudience;->NO_ONE:Lcom/dropbox/core/v2/sharing/LinkAudience;

    goto :goto_1

    .line 116
    :cond_3
    const-string v2, "password"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 117
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudience;->PASSWORD:Lcom/dropbox/core/v2/sharing/LinkAudience;

    goto :goto_1

    .line 119
    :cond_4
    const-string v2, "members"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 120
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudience;->MEMBERS:Lcom/dropbox/core/v2/sharing/LinkAudience;

    goto :goto_1

    .line 123
    :cond_5
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudience;->OTHER:Lcom/dropbox/core/v2/sharing/LinkAudience;

    :goto_1
    if-nez v1, :cond_6

    .line 126
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 127
    invoke-static {p1}, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_6
    return-object v0

    .line 105
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

    .line 57
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/sharing/LinkAudience;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/sharing/LinkAudience;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 62
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudience$1;->$SwitchMap$com$dropbox$core$v2$sharing$LinkAudience:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/sharing/LinkAudience;->ordinal()I

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

    .line 84
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 80
    :cond_0
    const-string p1, "members"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 76
    :cond_1
    const-string p1, "password"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 72
    :cond_2
    const-string p1, "no_one"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 68
    :cond_3
    const-string p1, "team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 64
    :cond_4
    const-string p1, "public"

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

    .line 57
    check-cast p1, Lcom/dropbox/core/v2/sharing/LinkAudience;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/sharing/LinkAudience$Serializer;->serialize(Lcom/dropbox/core/v2/sharing/LinkAudience;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
