.class Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "ImportFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/paper/ImportFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/paper/ImportFormat;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    new-instance v0, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/paper/ImportFormat;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 79
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 81
    invoke-static {p1}, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 82
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 86
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 87
    invoke-static {p1}, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 92
    const-string v2, "html"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 93
    sget-object v0, Lcom/dropbox/core/v2/paper/ImportFormat;->HTML:Lcom/dropbox/core/v2/paper/ImportFormat;

    goto :goto_1

    .line 95
    :cond_1
    const-string v2, "markdown"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 96
    sget-object v0, Lcom/dropbox/core/v2/paper/ImportFormat;->MARKDOWN:Lcom/dropbox/core/v2/paper/ImportFormat;

    goto :goto_1

    .line 98
    :cond_2
    const-string v2, "plain_text"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 99
    sget-object v0, Lcom/dropbox/core/v2/paper/ImportFormat;->PLAIN_TEXT:Lcom/dropbox/core/v2/paper/ImportFormat;

    goto :goto_1

    .line 102
    :cond_3
    sget-object v0, Lcom/dropbox/core/v2/paper/ImportFormat;->OTHER:Lcom/dropbox/core/v2/paper/ImportFormat;

    :goto_1
    if-nez v1, :cond_4

    .line 105
    invoke-static {p1}, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 106
    invoke-static {p1}, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_4
    return-object v0

    .line 90
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

    .line 50
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/paper/ImportFormat;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/paper/ImportFormat;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 55
    sget-object v0, Lcom/dropbox/core/v2/paper/ImportFormat$1;->$SwitchMap$com$dropbox$core$v2$paper$ImportFormat:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/paper/ImportFormat;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 69
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 65
    :cond_0
    const-string p1, "plain_text"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 61
    :cond_1
    const-string p1, "markdown"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 57
    :cond_2
    const-string p1, "html"

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

    .line 50
    check-cast p1, Lcom/dropbox/core/v2/paper/ImportFormat;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;->serialize(Lcom/dropbox/core/v2/paper/ImportFormat;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
