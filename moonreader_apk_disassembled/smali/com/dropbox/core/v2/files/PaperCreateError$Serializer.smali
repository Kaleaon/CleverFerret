.class Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "PaperCreateError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/PaperCreateError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/PaperCreateError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PaperCreateError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 119
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 121
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 122
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 126
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 127
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_b

    .line 132
    const-string v2, "insufficient_permissions"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/files/PaperCreateError;

    goto :goto_1

    .line 135
    :cond_1
    const-string v2, "content_malformed"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 136
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->CONTENT_MALFORMED:Lcom/dropbox/core/v2/files/PaperCreateError;

    goto :goto_1

    .line 138
    :cond_2
    const-string v2, "doc_length_exceeded"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 139
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->DOC_LENGTH_EXCEEDED:Lcom/dropbox/core/v2/files/PaperCreateError;

    goto :goto_1

    .line 141
    :cond_3
    const-string v2, "image_size_exceeded"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 142
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->IMAGE_SIZE_EXCEEDED:Lcom/dropbox/core/v2/files/PaperCreateError;

    goto :goto_1

    .line 144
    :cond_4
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 145
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->OTHER:Lcom/dropbox/core/v2/files/PaperCreateError;

    goto :goto_1

    .line 147
    :cond_5
    const-string v2, "invalid_path"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 148
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->INVALID_PATH:Lcom/dropbox/core/v2/files/PaperCreateError;

    goto :goto_1

    .line 150
    :cond_6
    const-string v2, "email_unverified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 151
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/files/PaperCreateError;

    goto :goto_1

    .line 153
    :cond_7
    const-string v2, "invalid_file_extension"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 154
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->INVALID_FILE_EXTENSION:Lcom/dropbox/core/v2/files/PaperCreateError;

    goto :goto_1

    .line 156
    :cond_8
    const-string v2, "paper_disabled"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 157
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError;->PAPER_DISABLED:Lcom/dropbox/core/v2/files/PaperCreateError;

    :goto_1
    if-nez v1, :cond_9

    .line 163
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 164
    invoke-static {p1}, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_9
    return-object v0

    .line 160
    :cond_a
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 130
    :cond_b
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

    .line 66
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/PaperCreateError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/PaperCreateError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 71
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateError$1;->$SwitchMap$com$dropbox$core$v2$files$PaperCreateError:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/PaperCreateError;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 109
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 105
    :pswitch_0
    const-string p1, "paper_disabled"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 101
    :pswitch_1
    const-string p1, "invalid_file_extension"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 97
    :pswitch_2
    const-string p1, "email_unverified"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 93
    :pswitch_3
    const-string p1, "invalid_path"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 89
    :pswitch_4
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 85
    :pswitch_5
    const-string p1, "image_size_exceeded"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 81
    :pswitch_6
    const-string p1, "doc_length_exceeded"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 77
    :pswitch_7
    const-string p1, "content_malformed"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 73
    :pswitch_8
    const-string p1, "insufficient_permissions"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
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

    .line 66
    check-cast p1, Lcom/dropbox/core/v2/files/PaperCreateError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/PaperCreateError$Serializer;->serialize(Lcom/dropbox/core/v2/files/PaperCreateError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
