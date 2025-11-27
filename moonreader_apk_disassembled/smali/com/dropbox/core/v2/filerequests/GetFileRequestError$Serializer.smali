.class Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "GetFileRequestError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/filerequests/GetFileRequestError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/filerequests/GetFileRequestError;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 68
    new-instance v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/filerequests/GetFileRequestError;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 116
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 118
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 119
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 123
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 124
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_a

    .line 129
    const-string v2, "disabled_for_team"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 130
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->DISABLED_FOR_TEAM:Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    goto :goto_1

    .line 132
    :cond_1
    const-string v2, "other"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->OTHER:Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    goto :goto_1

    .line 135
    :cond_2
    const-string v2, "not_found"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 136
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->NOT_FOUND:Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    goto :goto_1

    .line 138
    :cond_3
    const-string v2, "not_a_folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 139
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->NOT_A_FOLDER:Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    goto :goto_1

    .line 141
    :cond_4
    const-string v2, "app_lacks_access"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 142
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->APP_LACKS_ACCESS:Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    goto :goto_1

    .line 144
    :cond_5
    const-string v2, "no_permission"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 145
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->NO_PERMISSION:Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    goto :goto_1

    .line 147
    :cond_6
    const-string v2, "email_unverified"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 148
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    goto :goto_1

    .line 150
    :cond_7
    const-string v2, "validation_error"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 151
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->VALIDATION_ERROR:Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    :goto_1
    if-nez v1, :cond_8

    .line 157
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 158
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_8
    return-object v0

    .line 154
    :cond_9
    new-instance v1, Lcom/fasterxml/jackson/core/JsonParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown tag: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/fasterxml/jackson/core/JsonParseException;-><init>(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)V

    throw v1

    .line 127
    :cond_a
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

    .line 67
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/filerequests/GetFileRequestError;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 72
    sget-object v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$1;->$SwitchMap$com$dropbox$core$v2$filerequests$GetFileRequestError:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 106
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecognized tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 102
    :pswitch_0
    const-string p1, "validation_error"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 98
    :pswitch_1
    const-string p1, "email_unverified"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 94
    :pswitch_2
    const-string p1, "no_permission"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 90
    :pswitch_3
    const-string p1, "app_lacks_access"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 86
    :pswitch_4
    const-string p1, "not_a_folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 82
    :pswitch_5
    const-string p1, "not_found"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 78
    :pswitch_6
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 74
    :pswitch_7
    const-string p1, "disabled_for_team"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
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

    .line 67
    check-cast p1, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->serialize(Lcom/dropbox/core/v2/filerequests/GetFileRequestError;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
