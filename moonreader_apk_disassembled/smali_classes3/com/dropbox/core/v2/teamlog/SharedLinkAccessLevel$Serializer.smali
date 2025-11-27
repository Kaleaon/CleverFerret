.class Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "SharedLinkAccessLevel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 68
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 70
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 71
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 75
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 76
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 81
    const-string v2, "none"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 82
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;->NONE:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    goto :goto_1

    .line 84
    :cond_1
    const-string v2, "reader"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 85
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;->READER:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    goto :goto_1

    .line 87
    :cond_2
    const-string v2, "writer"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 88
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;->WRITER:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    goto :goto_1

    .line 91
    :cond_3
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;->OTHER:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    :goto_1
    if-nez v1, :cond_4

    .line 94
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 95
    invoke-static {p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_4
    return-object v0

    .line 79
    :cond_5
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

    .line 39
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 44
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$1;->$SwitchMap$com$dropbox$core$v2$teamlog$SharedLinkAccessLevel:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 58
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 54
    :cond_0
    const-string p1, "writer"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 50
    :cond_1
    const-string p1, "reader"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 46
    :cond_2
    const-string p1, "none"

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

    .line 39
    check-cast p1, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel$Serializer;->serialize(Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
