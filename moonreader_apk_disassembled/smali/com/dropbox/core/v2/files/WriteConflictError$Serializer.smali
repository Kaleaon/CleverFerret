.class Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "WriteConflictError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/WriteConflictError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/WriteConflictError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    new-instance v0, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/WriteConflictError;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 75
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 77
    invoke-static {p1}, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 78
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 82
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 83
    invoke-static {p1}, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 88
    const-string v2, "file"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 89
    sget-object v0, Lcom/dropbox/core/v2/files/WriteConflictError;->FILE:Lcom/dropbox/core/v2/files/WriteConflictError;

    goto :goto_1

    .line 91
    :cond_1
    const-string v2, "folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 92
    sget-object v0, Lcom/dropbox/core/v2/files/WriteConflictError;->FOLDER:Lcom/dropbox/core/v2/files/WriteConflictError;

    goto :goto_1

    .line 94
    :cond_2
    const-string v2, "file_ancestor"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 95
    sget-object v0, Lcom/dropbox/core/v2/files/WriteConflictError;->FILE_ANCESTOR:Lcom/dropbox/core/v2/files/WriteConflictError;

    goto :goto_1

    .line 98
    :cond_3
    sget-object v0, Lcom/dropbox/core/v2/files/WriteConflictError;->OTHER:Lcom/dropbox/core/v2/files/WriteConflictError;

    :goto_1
    if-nez v1, :cond_4

    .line 101
    invoke-static {p1}, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 102
    invoke-static {p1}, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_4
    return-object v0

    .line 86
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

    .line 46
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/WriteConflictError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/WriteConflictError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 51
    sget-object v0, Lcom/dropbox/core/v2/files/WriteConflictError$1;->$SwitchMap$com$dropbox$core$v2$files$WriteConflictError:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/WriteConflictError;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 65
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 61
    :cond_0
    const-string p1, "file_ancestor"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 57
    :cond_1
    const-string p1, "folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 53
    :cond_2
    const-string p1, "file"

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

    .line 46
    check-cast p1, Lcom/dropbox/core/v2/files/WriteConflictError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;->serialize(Lcom/dropbox/core/v2/files/WriteConflictError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
