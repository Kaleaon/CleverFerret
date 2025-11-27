.class Lcom/dropbox/core/v2/files/FileCategory$Serializer;
.super Lcom/dropbox/core/stone/UnionSerializer;
.source "FileCategory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/FileCategory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Serializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/stone/UnionSerializer<",
        "Lcom/dropbox/core/v2/files/FileCategory;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/dropbox/core/v2/files/FileCategory$Serializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/files/FileCategory$Serializer;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/FileCategory$Serializer;-><init>()V

    sput-object v0, Lcom/dropbox/core/v2/files/FileCategory$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileCategory$Serializer;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Lcom/dropbox/core/stone/UnionSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/FileCategory;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 130
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 132
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileCategory$Serializer;->getStringValue(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    .line 133
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    const/4 v1, 0x1

    goto :goto_0

    .line 137
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileCategory$Serializer;->expectStartObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 138
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileCategory$Serializer;->readTag(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_c

    .line 143
    const-string v2, "image"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 144
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->IMAGE:Lcom/dropbox/core/v2/files/FileCategory;

    goto/16 :goto_1

    .line 146
    :cond_1
    const-string v2, "document"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 147
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->DOCUMENT:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 149
    :cond_2
    const-string v2, "pdf"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 150
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->PDF:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 152
    :cond_3
    const-string v2, "spreadsheet"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 153
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->SPREADSHEET:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 155
    :cond_4
    const-string v2, "presentation"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 156
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->PRESENTATION:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 158
    :cond_5
    const-string v2, "audio"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 159
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->AUDIO:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 161
    :cond_6
    const-string v2, "video"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 162
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->VIDEO:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 164
    :cond_7
    const-string v2, "folder"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 165
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->FOLDER:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 167
    :cond_8
    const-string v2, "paper"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 168
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->PAPER:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 170
    :cond_9
    const-string v2, "others"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 171
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->OTHERS:Lcom/dropbox/core/v2/files/FileCategory;

    goto :goto_1

    .line 174
    :cond_a
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory;->OTHER:Lcom/dropbox/core/v2/files/FileCategory;

    :goto_1
    if-nez v1, :cond_b

    .line 177
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileCategory$Serializer;->skipFields(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 178
    invoke-static {p1}, Lcom/dropbox/core/v2/files/FileCategory$Serializer;->expectEndObject(Lcom/fasterxml/jackson/core/JsonParser;)V

    :cond_b
    return-object v0

    .line 141
    :cond_c
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

    .line 73
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/FileCategory$Serializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v2/files/FileCategory;

    move-result-object p1

    return-object p1
.end method

.method public serialize(Lcom/dropbox/core/v2/files/FileCategory;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .line 78
    sget-object v0, Lcom/dropbox/core/v2/files/FileCategory$1;->$SwitchMap$com$dropbox$core$v2$files$FileCategory:[I

    invoke-virtual {p1}, Lcom/dropbox/core/v2/files/FileCategory;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 120
    const-string p1, "other"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 116
    :pswitch_0
    const-string p1, "others"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 112
    :pswitch_1
    const-string p1, "paper"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 108
    :pswitch_2
    const-string p1, "folder"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 104
    :pswitch_3
    const-string p1, "video"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 100
    :pswitch_4
    const-string p1, "audio"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 96
    :pswitch_5
    const-string p1, "presentation"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 92
    :pswitch_6
    const-string p1, "spreadsheet"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 88
    :pswitch_7
    const-string p1, "pdf"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 84
    :pswitch_8
    const-string p1, "document"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    .line 80
    :pswitch_9
    const-string p1, "image"

    invoke-virtual {p2, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
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

    .line 73
    check-cast p1, Lcom/dropbox/core/v2/files/FileCategory;

    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v2/files/FileCategory$Serializer;->serialize(Lcom/dropbox/core/v2/files/FileCategory;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
