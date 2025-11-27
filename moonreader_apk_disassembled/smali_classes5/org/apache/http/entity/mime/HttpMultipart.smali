.class public Lorg/apache/http/entity/mime/HttpMultipart;
.super Lorg/apache/james/mime4j/message/Multipart;
.source "HttpMultipart.java"


# static fields
.field private static final CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

.field private static final TWO_DASHES:Lorg/apache/james/mime4j/util/ByteArrayBuffer;


# instance fields
.field private mode:Lorg/apache/http/entity/mime/HttpMultipartMode;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 85
    sget-object v0, Lorg/apache/http/entity/mime/MIME;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    const-string v1, "\r\n"

    invoke-static {v0, v1}, Lorg/apache/http/entity/mime/HttpMultipart;->encode(Ljava/nio/charset/Charset;Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/mime/HttpMultipart;->CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .line 86
    sget-object v0, Lorg/apache/http/entity/mime/MIME;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    const-string v1, "--"

    invoke-static {v0, v1}, Lorg/apache/http/entity/mime/HttpMultipart;->encode(Ljava/nio/charset/Charset;Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/mime/HttpMultipart;->TWO_DASHES:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 91
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/message/Multipart;-><init>(Ljava/lang/String;)V

    .line 92
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipartMode;->STRICT:Lorg/apache/http/entity/mime/HttpMultipartMode;

    iput-object p1, p0, Lorg/apache/http/entity/mime/HttpMultipart;->mode:Lorg/apache/http/entity/mime/HttpMultipartMode;

    return-void
.end method

.method private doWriteTo(Lorg/apache/http/entity/mime/HttpMultipartMode;Ljava/io/OutputStream;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/HttpMultipart;->getBodyParts()Ljava/util/List;

    move-result-object v0

    .line 137
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/HttpMultipart;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    .line 139
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/HttpMultipart;->getBoundary()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/http/entity/mime/HttpMultipart;->encode(Ljava/nio/charset/Charset;Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    move-result-object v2

    .line 141
    sget-object v3, Lorg/apache/http/entity/mime/HttpMultipart$1;->$SwitchMap$org$apache$http$entity$mime$HttpMultipartMode:[I

    invoke-virtual {p1}, Lorg/apache/http/entity/mime/HttpMultipartMode;->ordinal()I

    move-result p1

    aget p1, v3, p1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq p1, v4, :cond_3

    const/4 v4, 0x2

    if-eq p1, v4, :cond_0

    goto/16 :goto_3

    .line 186
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-ge v3, p1, :cond_2

    .line 187
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->TWO_DASHES:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 188
    invoke-static {v2, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 189
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 190
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/james/mime4j/message/BodyPart;

    .line 192
    invoke-virtual {v4}, Lorg/apache/james/mime4j/message/BodyPart;->getHeader()Lorg/apache/james/mime4j/message/Header;

    move-result-object v5

    const-string v6, "Content-Disposition"

    invoke-virtual {v5, v6}, Lorg/apache/james/mime4j/message/Header;->getField(Ljava/lang/String;)Lorg/apache/james/mime4j/parser/Field;

    move-result-object v5

    .line 194
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/Field;->getBody()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lorg/apache/http/entity/mime/HttpMultipart;->encode(Ljava/nio/charset/Charset;Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    move-result-object v5

    invoke-static {v5, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 199
    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 200
    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    if-eqz p3, :cond_1

    .line 202
    sget-object v5, Lorg/apache/james/mime4j/message/MessageWriter;->DEFAULT:Lorg/apache/james/mime4j/message/MessageWriter;

    invoke-virtual {v4}, Lorg/apache/james/mime4j/message/BodyPart;->getBody()Lorg/apache/james/mime4j/message/Body;

    move-result-object v4

    invoke-virtual {v5, v4, p2}, Lorg/apache/james/mime4j/message/MessageWriter;->writeBody(Lorg/apache/james/mime4j/message/Body;Ljava/io/OutputStream;)V

    .line 204
    :cond_1
    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 207
    :cond_2
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->TWO_DASHES:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 208
    invoke-static {v2, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 209
    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 210
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    return-void

    .line 143
    :cond_3
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/HttpMultipart;->getPreamble()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 144
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_4

    .line 145
    invoke-static {v1, p1}, Lorg/apache/http/entity/mime/HttpMultipart;->encode(Ljava/nio/charset/Charset;Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    move-result-object p1

    .line 146
    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 147
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 150
    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-ge v3, p1, :cond_7

    .line 151
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->TWO_DASHES:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 152
    invoke-static {v2, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 153
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 155
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/james/mime4j/message/BodyPart;

    .line 156
    invoke-virtual {p1}, Lorg/apache/james/mime4j/message/BodyPart;->getHeader()Lorg/apache/james/mime4j/message/Header;

    move-result-object v4

    .line 158
    invoke-virtual {v4}, Lorg/apache/james/mime4j/message/Header;->getFields()Ljava/util/List;

    move-result-object v4

    .line 159
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/james/mime4j/parser/Field;

    .line 160
    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/Field;->getRaw()Lorg/apache/james/mime4j/util/ByteSequence;

    move-result-object v5

    invoke-static {v5, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteSequence;Ljava/io/OutputStream;)V

    .line 161
    sget-object v5, Lorg/apache/http/entity/mime/HttpMultipart;->CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {v5, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    goto :goto_2

    .line 163
    :cond_5
    sget-object v4, Lorg/apache/http/entity/mime/HttpMultipart;->CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {v4, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    if-eqz p3, :cond_6

    .line 165
    sget-object v5, Lorg/apache/james/mime4j/message/MessageWriter;->DEFAULT:Lorg/apache/james/mime4j/message/MessageWriter;

    invoke-virtual {p1}, Lorg/apache/james/mime4j/message/BodyPart;->getBody()Lorg/apache/james/mime4j/message/Body;

    move-result-object p1

    invoke-virtual {v5, p1, p2}, Lorg/apache/james/mime4j/message/MessageWriter;->writeBody(Lorg/apache/james/mime4j/message/Body;Ljava/io/OutputStream;)V

    .line 167
    :cond_6
    invoke-static {v4, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 169
    :cond_7
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->TWO_DASHES:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 170
    invoke-static {v2, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 171
    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 172
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipart;->CR_LF:Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 173
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/HttpMultipart;->getEpilogue()Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_8

    .line 174
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_8

    .line 175
    invoke-static {v1, p3}, Lorg/apache/http/entity/mime/HttpMultipart;->encode(Ljava/nio/charset/Charset;Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    move-result-object p3

    .line 176
    invoke-static {p3, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    .line 177
    invoke-static {p1, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    :cond_8
    :goto_3
    return-void
.end method

.method private static encode(Ljava/nio/charset/Charset;Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    .locals 2

    .line 67
    invoke-static {p1}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/nio/charset/Charset;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 68
    new-instance p1, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-direct {p1, v0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>(I)V

    .line 69
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p0

    invoke-virtual {p1, v0, v1, p0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append([BII)V

    return-object p1
.end method

.method private static writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    invoke-virtual {p0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result p0

    invoke-virtual {p1, v0, v1, p0}, Ljava/io/OutputStream;->write([BII)V

    return-void
.end method

.method private static writeBytes(Lorg/apache/james/mime4j/util/ByteSequence;Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    instance-of v0, p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    if-eqz v0, :cond_0

    .line 79
    check-cast p0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-static {p0, p1}, Lorg/apache/http/entity/mime/HttpMultipart;->writeBytes(Lorg/apache/james/mime4j/util/ByteArrayBuffer;Ljava/io/OutputStream;)V

    return-void

    .line 81
    :cond_0
    invoke-interface {p0}, Lorg/apache/james/mime4j/util/ByteSequence;->toByteArray()[B

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method


# virtual methods
.method protected getBoundary()Ljava/lang/String;
    .locals 2

    .line 125
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/HttpMultipart;->getParent()Lorg/apache/james/mime4j/message/Entity;

    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lorg/apache/james/mime4j/message/Entity;->getHeader()Lorg/apache/james/mime4j/message/Header;

    move-result-object v0

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Lorg/apache/james/mime4j/message/Header;->getField(Ljava/lang/String;)Lorg/apache/james/mime4j/parser/Field;

    move-result-object v0

    check-cast v0, Lorg/apache/james/mime4j/field/ContentTypeField;

    .line 128
    invoke-virtual {v0}, Lorg/apache/james/mime4j/field/ContentTypeField;->getBoundary()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCharset()Ljava/nio/charset/Charset;
    .locals 3

    .line 104
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/HttpMultipart;->getParent()Lorg/apache/james/mime4j/message/Entity;

    move-result-object v0

    .line 105
    invoke-virtual {v0}, Lorg/apache/james/mime4j/message/Entity;->getHeader()Lorg/apache/james/mime4j/message/Header;

    move-result-object v0

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Lorg/apache/james/mime4j/message/Header;->getField(Ljava/lang/String;)Lorg/apache/james/mime4j/parser/Field;

    move-result-object v0

    check-cast v0, Lorg/apache/james/mime4j/field/ContentTypeField;

    .line 109
    sget-object v1, Lorg/apache/http/entity/mime/HttpMultipart$1;->$SwitchMap$org$apache$http$entity$mime$HttpMultipartMode:[I

    iget-object v2, p0, Lorg/apache/http/entity/mime/HttpMultipart;->mode:Lorg/apache/http/entity/mime/HttpMultipartMode;

    invoke-virtual {v2}, Lorg/apache/http/entity/mime/HttpMultipartMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 114
    :cond_0
    invoke-virtual {v0}, Lorg/apache/james/mime4j/field/ContentTypeField;->getCharset()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 115
    invoke-virtual {v0}, Lorg/apache/james/mime4j/field/ContentTypeField;->getCharset()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/james/mime4j/util/CharsetUtil;->getCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0

    .line 117
    :cond_1
    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Lorg/apache/james/mime4j/util/CharsetUtil;->getCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0

    .line 111
    :cond_2
    sget-object v0, Lorg/apache/http/entity/mime/MIME;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getMode()Lorg/apache/http/entity/mime/HttpMultipartMode;
    .locals 1

    .line 96
    iget-object v0, p0, Lorg/apache/http/entity/mime/HttpMultipart;->mode:Lorg/apache/http/entity/mime/HttpMultipartMode;

    return-object v0
.end method

.method public getTotalLength()J
    .locals 12

    .line 240
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/HttpMultipart;->getBodyParts()Ljava/util/List;

    move-result-object v0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    move-wide v5, v1

    const/4 v4, 0x0

    .line 243
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    const-wide/16 v8, -0x1

    if-ge v4, v7, :cond_1

    .line 244
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/james/mime4j/message/BodyPart;

    .line 245
    invoke-virtual {v7}, Lorg/apache/james/mime4j/message/BodyPart;->getBody()Lorg/apache/james/mime4j/message/Body;

    move-result-object v7

    .line 246
    instance-of v10, v7, Lorg/apache/http/entity/mime/content/ContentBody;

    if-eqz v10, :cond_0

    .line 247
    check-cast v7, Lorg/apache/http/entity/mime/content/ContentBody;

    invoke-interface {v7}, Lorg/apache/http/entity/mime/content/ContentBody;->getContentLength()J

    move-result-wide v10

    cmp-long v7, v10, v1

    if-ltz v7, :cond_0

    add-long/2addr v5, v10

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    return-wide v8

    .line 258
    :cond_1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 260
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/entity/mime/HttpMultipart;->mode:Lorg/apache/http/entity/mime/HttpMultipartMode;

    invoke-direct {p0, v1, v0, v3}, Lorg/apache/http/entity/mime/HttpMultipart;->doWriteTo(Lorg/apache/http/entity/mime/HttpMultipartMode;Ljava/io/OutputStream;Z)V

    .line 261
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 262
    array-length v0, v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    int-to-long v0, v0

    add-long/2addr v5, v0

    return-wide v5

    :catch_0
    return-wide v8
.end method

.method public setMode(Lorg/apache/http/entity/mime/HttpMultipartMode;)V
    .locals 0

    .line 100
    iput-object p1, p0, Lorg/apache/http/entity/mime/HttpMultipart;->mode:Lorg/apache/http/entity/mime/HttpMultipartMode;

    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 223
    iget-object v0, p0, Lorg/apache/http/entity/mime/HttpMultipart;->mode:Lorg/apache/http/entity/mime/HttpMultipartMode;

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, v1}, Lorg/apache/http/entity/mime/HttpMultipart;->doWriteTo(Lorg/apache/http/entity/mime/HttpMultipartMode;Ljava/io/OutputStream;Z)V

    return-void
.end method
