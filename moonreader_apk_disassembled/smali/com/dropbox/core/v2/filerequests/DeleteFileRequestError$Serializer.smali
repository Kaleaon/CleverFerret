.class Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "DeleteFileRequestError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 73
    new-instance v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 125
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 127
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 128
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 132
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 133
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_b

    .line 138
    const-string v2, "disabled_for_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 139
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->DISABLED_FOR_TEAM:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    goto :goto_1

    .line 141
    :cond_1
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 142
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->OTHER:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    goto :goto_1

    .line 144
    :cond_2
    const-string v2, "not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 145
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->NOT_FOUND:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    goto :goto_1

    .line 147
    :cond_3
    const-string v2, "not_a_folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 148
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->NOT_A_FOLDER:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    goto :goto_1

    .line 150
    :cond_4
    const-string v2, "app_lacks_access"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 151
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->APP_LACKS_ACCESS:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    goto :goto_1

    .line 153
    :cond_5
    const-string v2, "no_permission"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 154
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->NO_PERMISSION:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    goto :goto_1

    .line 156
    :cond_6
    const-string v2, "email_unverified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 157
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    goto :goto_1

    .line 159
    :cond_7
    const-string v2, "validation_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 160
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->VALIDATION_ERROR:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    goto :goto_1

    .line 162
    :cond_8
    const-string v2, "file_request_open"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 163
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->FILE_REQUEST_OPEN:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    :goto_1
    if-nez v1, :cond_9

    .line 169
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 170
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_9
    return-object v0

    .line 166
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

    .line 136
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

    .line 72
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 77
    sget-object v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$1;->$SwitchMap$com$dropbox$core$v2$filerequests$DeleteFileRequestError:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 115
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 111
    :pswitch_0
    const-string p1, "file_request_open"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 107
    :pswitch_1
    const-string p1, "validation_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 103
    :pswitch_2
    const-string p1, "email_unverified"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 99
    :pswitch_3
    const-string p1, "no_permission"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 95
    :pswitch_4
    const-string p1, "app_lacks_access"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 91
    :pswitch_5
    const-string p1, "not_a_folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 87
    :pswitch_6
    const-string p1, "not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 83
    :pswitch_7
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 79
    :pswitch_8
    const-string p1, "disabled_for_team"

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

    .line 72
    check-cast p1, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->serialize(Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
