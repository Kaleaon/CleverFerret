.class public Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;
.super Lorg/apache/commons/net/smtp/SMTPSClient;
.source "AuthenticatingSMTPClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Lorg/apache/commons/net/smtp/SMTPSClient;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1}, Lorg/apache/commons/net/smtp/SMTPSClient;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 98
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/net/smtp/SMTPSClient;-><init>(Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 65
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/net/smtp/SMTPSClient;-><init>(Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/net/smtp/SMTPSClient;-><init>(Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(ZLjavax/net/ssl/SSLContext;)V
    .locals 0

    .line 88
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/net/smtp/SMTPSClient;-><init>(ZLjavax/net/ssl/SSLContext;)V

    return-void
.end method

.method private convertToHexString([B)Ljava/lang/String;
    .locals 5

    .line 279
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p1

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 280
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xff

    const/16 v4, 0xf

    if-gt v3, v4, :cond_0

    .line 283
    const-string v4, "0"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    :cond_0
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 287
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public auth(Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    const/16 v0, 0xe

    .line 219
    invoke-static {p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->getAuthName(Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;)Ljava/lang/String;

    move-result-object v1

    .line 218
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->sendCommand(ILjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/smtp/SMTPReply;->isPositiveIntermediate(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 223
    :cond_0
    sget-object v0, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->PLAIN:Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;

    invoke-virtual {p1, v0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 226
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\u0000"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 227
    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64StringUnChunked([B)Ljava/lang/String;

    move-result-object p1

    .line 226
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->sendCommand(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lorg/apache/commons/net/smtp/SMTPReply;->isPositiveCompletion(I)Z

    move-result p1

    return p1

    .line 230
    :cond_1
    sget-object v0, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->CRAM_MD5:Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;

    invoke-virtual {p1, v0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 233
    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getReplyString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->decodeBase64(Ljava/lang/String;)[B

    move-result-object p1

    .line 235
    const-string v0, "HmacMD5"

    invoke-static {v0}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v2

    .line 236
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-virtual {p3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p3

    invoke-direct {v3, p3, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 238
    invoke-virtual {v2, p1}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->convertToHexString([B)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 240
    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 241
    array-length p3, p2

    add-int/lit8 p3, p3, 0x1

    array-length v0, p1

    add-int/2addr p3, v0

    new-array p3, p3, [B

    .line 242
    array-length v0, p2

    invoke-static {p2, v1, p3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 243
    array-length v0, p2

    const/16 v2, 0x20

    aput-byte v2, p3, v0

    .line 244
    array-length p2, p2

    add-int/lit8 p2, p2, 0x1

    array-length v0, p1

    invoke-static {p1, v1, p3, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 247
    invoke-static {p3}, Lorg/apache/commons/net/util/Base64;->encodeBase64StringUnChunked([B)Ljava/lang/String;

    move-result-object p1

    .line 246
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->sendCommand(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lorg/apache/commons/net/smtp/SMTPReply;->isPositiveCompletion(I)Z

    move-result p1

    return p1

    .line 249
    :cond_2
    sget-object v0, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->LOGIN:Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;

    invoke-virtual {p1, v0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 254
    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64StringUnChunked([B)Ljava/lang/String;

    move-result-object p1

    .line 253
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->sendCommand(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lorg/apache/commons/net/smtp/SMTPReply;->isPositiveIntermediate(I)Z

    move-result p1

    if-nez p1, :cond_3

    return v1

    .line 258
    :cond_3
    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64StringUnChunked([B)Ljava/lang/String;

    move-result-object p1

    .line 257
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->sendCommand(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lorg/apache/commons/net/smtp/SMTPReply;->isPositiveCompletion(I)Z

    move-result p1

    return p1

    .line 260
    :cond_4
    sget-object p3, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->XOAUTH:Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;

    invoke-virtual {p1, p3}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_6

    sget-object p3, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->XOAUTH2:Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;

    invoke-virtual {p1, p3}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    .line 263
    :cond_6
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64StringUnChunked([B)Ljava/lang/String;

    move-result-object p1

    .line 262
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->sendCommand(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lorg/apache/commons/net/smtp/SMTPReply;->isPositiveIntermediate(I)Z

    move-result p1

    return p1
.end method

.method public ehlo(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xf

    .line 117
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->sendCommand(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public elogin()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 161
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 167
    :cond_0
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->ehlo(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/smtp/SMTPReply;->isPositiveCompletion(I)Z

    move-result v0

    return v0
.end method

.method public elogin(Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->ehlo(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lorg/apache/commons/net/smtp/SMTPReply;->isPositiveCompletion(I)Z

    move-result p1

    return p1
.end method

.method public getEnhancedReplyCode()[I
    .locals 4

    .line 177
    invoke-virtual {p0}, Lorg/apache/commons/net/smtp/AuthenticatingSMTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x20

    .line 178
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\."

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 179
    array-length v1, v0

    new-array v1, v1, [I

    .line 180
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 182
    aget-object v3, v0, v2

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method
