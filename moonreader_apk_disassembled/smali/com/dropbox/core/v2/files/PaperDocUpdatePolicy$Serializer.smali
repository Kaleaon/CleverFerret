.class Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "PaperDocUpdatePolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    new-instance v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 87
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 89
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 90
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 94
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 95
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_6

    .line 100
    const-string v2, "update"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 101
    sget-object v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;->UPDATE:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    goto :goto_1

    .line 103
    :cond_1
    const-string v2, "overwrite"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 104
    sget-object v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;->OVERWRITE:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    goto :goto_1

    .line 106
    :cond_2
    const-string v2, "prepend"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 107
    sget-object v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;->PREPEND:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    goto :goto_1

    .line 109
    :cond_3
    const-string v2, "append"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 110
    sget-object v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;->APPEND:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    goto :goto_1

    .line 113
    :cond_4
    sget-object v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;->OTHER:Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    :goto_1
    if-nez v1, :cond_5

    .line 116
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 117
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_5
    return-object v0

    .line 98
    :cond_6
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

    .line 54
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 59
    sget-object v0, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$1;->$SwitchMap$com$dropbox$core$v2$files$PaperDocUpdatePolicy:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 77
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 73
    :cond_0
    const-string p1, "append"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 69
    :cond_1
    const-string p1, "prepend"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 65
    :cond_2
    const-string p1, "overwrite"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 61
    :cond_3
    const-string p1, "update"

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

    .line 54
    check-cast p1, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy$Serializer;->serialize(Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
