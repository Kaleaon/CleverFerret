.class public Lorg/apache/http/entity/mime/MultipartEntity;
.super Ljava/lang/Object;
.source "MultipartEntity.java"

# interfaces
.implements Lorg/apache/http/HttpEntity;


# static fields
.field private static final MULTIPART_CHARS:[C


# instance fields
.field private final contentType:Lorg/apache/http/Header;

.field private volatile dirty:Z

.field private length:J

.field private final message:Lorg/apache/james/mime4j/message/Message;

.field private final multipart:Lorg/apache/http/entity/mime/HttpMultipart;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    const-string v0, "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/mime/MultipartEntity;->MULTIPART_CHARS:[C

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 100
    sget-object v0, Lorg/apache/http/entity/mime/HttpMultipartMode;->STRICT:Lorg/apache/http/entity/mime/HttpMultipartMode;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, v1}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>(Lorg/apache/http/entity/mime/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/entity/mime/HttpMultipartMode;)V
    .locals 1

    const/4 v0, 0x0

    .line 96
    invoke-direct {p0, p1, v0, v0}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>(Lorg/apache/http/entity/mime/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/entity/mime/HttpMultipartMode;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 3

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Lorg/apache/http/entity/mime/HttpMultipart;

    const-string v1, "form-data"

    invoke-direct {v0, v1}, Lorg/apache/http/entity/mime/HttpMultipart;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->multipart:Lorg/apache/http/entity/mime/HttpMultipart;

    .line 78
    new-instance v1, Lorg/apache/http/message/BasicHeader;

    const-string v2, "Content-Type"

    invoke-virtual {p0, p2, p3}, Lorg/apache/http/entity/mime/MultipartEntity;->generateContentType(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, v2, p2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/http/entity/mime/MultipartEntity;->contentType:Lorg/apache/http/Header;

    const/4 p2, 0x1

    .line 81
    iput-boolean p2, p0, Lorg/apache/http/entity/mime/MultipartEntity;->dirty:Z

    .line 83
    new-instance p2, Lorg/apache/james/mime4j/message/Message;

    invoke-direct {p2}, Lorg/apache/james/mime4j/message/Message;-><init>()V

    iput-object p2, p0, Lorg/apache/http/entity/mime/MultipartEntity;->message:Lorg/apache/james/mime4j/message/Message;

    .line 84
    new-instance p3, Lorg/apache/james/mime4j/message/Header;

    invoke-direct {p3}, Lorg/apache/james/mime4j/message/Header;-><init>()V

    .line 86
    invoke-virtual {p2, p3}, Lorg/apache/james/mime4j/message/Message;->setHeader(Lorg/apache/james/mime4j/message/Header;)V

    .line 87
    invoke-virtual {v0, p2}, Lorg/apache/http/entity/mime/HttpMultipart;->setParent(Lorg/apache/james/mime4j/message/Entity;)V

    if-nez p1, :cond_0

    .line 89
    sget-object p1, Lorg/apache/http/entity/mime/HttpMultipartMode;->STRICT:Lorg/apache/http/entity/mime/HttpMultipartMode;

    .line 91
    :cond_0
    invoke-virtual {v0, p1}, Lorg/apache/http/entity/mime/HttpMultipart;->setMode(Lorg/apache/http/entity/mime/HttpMultipartMode;)V

    .line 92
    invoke-virtual {p2}, Lorg/apache/james/mime4j/message/Message;->getHeader()Lorg/apache/james/mime4j/message/Header;

    move-result-object p1

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lorg/apache/james/mime4j/field/Fields;->contentType(Ljava/lang/String;)Lorg/apache/james/mime4j/field/ContentTypeField;

    move-result-object p2

    invoke-virtual {p1, p2}, Lorg/apache/james/mime4j/message/Header;->addField(Lorg/apache/james/mime4j/parser/Field;)V

    return-void
.end method


# virtual methods
.method public addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V
    .locals 2

    .line 125
    iget-object v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->multipart:Lorg/apache/http/entity/mime/HttpMultipart;

    new-instance v1, Lorg/apache/http/entity/mime/FormBodyPart;

    invoke-direct {v1, p1, p2}, Lorg/apache/http/entity/mime/FormBodyPart;-><init>(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/entity/mime/HttpMultipart;->addBodyPart(Lorg/apache/james/mime4j/message/BodyPart;)V

    const/4 p1, 0x1

    .line 126
    iput-boolean p1, p0, Lorg/apache/http/entity/mime/MultipartEntity;->dirty:Z

    return-void
.end method

.method public consumeContent()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 167
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/MultipartEntity;->isStreaming()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 168
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Streaming entity does not implement #consumeContent()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected generateContentType(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 5

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "multipart/form-data; boundary="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 109
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 111
    :cond_0
    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    const/16 v1, 0xb

    .line 112
    invoke-virtual {p1, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1e

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 114
    sget-object v3, Lorg/apache/http/entity/mime/MultipartEntity;->MULTIPART_CHARS:[C

    array-length v4, v3

    invoke-virtual {p1, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    aget-char v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-eqz p2, :cond_2

    .line 118
    const-string p1, "; charset="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 174
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Multipart form entity does not implement #getContent()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContentEncoding()Lorg/apache/http/Header;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .line 150
    iget-boolean v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->dirty:Z

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->multipart:Lorg/apache/http/entity/mime/HttpMultipart;

    invoke-virtual {v0}, Lorg/apache/http/entity/mime/HttpMultipart;->getTotalLength()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->length:J

    const/4 v0, 0x0

    .line 152
    iput-boolean v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->dirty:Z

    .line 154
    :cond_0
    iget-wide v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->length:J

    return-wide v0
.end method

.method public getContentType()Lorg/apache/http/Header;
    .locals 1

    .line 158
    iget-object v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->contentType:Lorg/apache/http/Header;

    return-object v0
.end method

.method public isChunked()Z
    .locals 1

    .line 142
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/MultipartEntity;->isRepeatable()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isRepeatable()Z
    .locals 6

    .line 130
    iget-object v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->multipart:Lorg/apache/http/entity/mime/HttpMultipart;

    invoke-virtual {v0}, Lorg/apache/http/entity/mime/HttpMultipart;->getBodyParts()Ljava/util/List;

    move-result-object v0

    .line 131
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 132
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/entity/mime/FormBodyPart;

    .line 133
    invoke-virtual {v1}, Lorg/apache/http/entity/mime/FormBodyPart;->getBody()Lorg/apache/james/mime4j/message/Body;

    move-result-object v1

    check-cast v1, Lorg/apache/http/entity/mime/content/ContentBody;

    .line 134
    invoke-interface {v1}, Lorg/apache/http/entity/mime/content/ContentBody;->getContentLength()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-gez v5, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    .line 146
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/MultipartEntity;->isRepeatable()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lorg/apache/http/entity/mime/MultipartEntity;->multipart:Lorg/apache/http/entity/mime/HttpMultipart;

    invoke-virtual {v0, p1}, Lorg/apache/http/entity/mime/HttpMultipart;->writeTo(Ljava/io/OutputStream;)V

    return-void
.end method
