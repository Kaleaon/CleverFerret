.class public Lorg/apache/commons/vfs2/util/DefaultCryptor;
.super Ljava/lang/Object;
.source "DefaultCryptor.java"

# interfaces
.implements Lorg/apache/commons/vfs2/util/Cryptor;


# static fields
.field private static final BITS_IN_HALF_BYTE:I = 0x4

.field private static final HEX_CHARS:[C

.field private static final INDEX_NOT_FOUND:I = -0x1

.field private static final KEY_BYTES:[B

.field private static final MASK:C = '\u000f'


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x10

    .line 31
    new-array v1, v0, [C

    fill-array-data v1, :array_0

    sput-object v1, Lorg/apache/commons/vfs2/util/DefaultCryptor;->HEX_CHARS:[C

    .line 34
    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lorg/apache/commons/vfs2/util/DefaultCryptor;->KEY_BYTES:[B

    return-void

    nop

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data

    :array_1
    .array-data 1
        0x41t
        0x70t
        0x61t
        0x63t
        0x68t
        0x65t
        0x43t
        0x6ft
        0x6dt
        0x6dt
        0x6ft
        0x6et
        0x73t
        0x56t
        0x46t
        0x53t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private decode(Ljava/lang/String;)[B
    .locals 11

    .line 101
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 102
    new-array v0, v0, [B

    .line 103
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 105
    :goto_0
    array-length v3, p1

    if-ge v1, v3, :cond_2

    .line 106
    sget-object v3, Lorg/apache/commons/vfs2/util/DefaultCryptor;->HEX_CHARS:[C

    aget-char v4, p1, v1

    invoke-direct {p0, v3, v4}, Lorg/apache/commons/vfs2/util/DefaultCryptor;->indexOf([CC)I

    move-result v4

    .line 107
    const-string v5, " is not a valid hexidecimal character"

    const-string v6, " at position "

    const-string v7, "Character "

    const/4 v8, -0x1

    if-eq v4, v8, :cond_1

    add-int/lit8 v9, v1, 0x1

    .line 111
    aget-char v10, p1, v9

    invoke-direct {p0, v3, v10}, Lorg/apache/commons/vfs2/util/DefaultCryptor;->indexOf([CC)I

    move-result v3

    if-eq v3, v8, :cond_0

    add-int/lit8 v5, v2, 0x1

    shl-int/lit8 v4, v4, 0x4

    or-int/2addr v3, v4

    int-to-byte v3, v3

    .line 116
    aput-byte v3, v0, v2

    add-int/lit8 v1, v1, 0x2

    move v2, v5

    goto :goto_0

    .line 113
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-char p1, p1, v9

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-char p1, p1, v1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    return-object v0
.end method

.method private encode([B)Ljava/lang/String;
    .locals 6

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p1, v2

    .line 93
    sget-object v4, Lorg/apache/commons/vfs2/util/DefaultCryptor;->HEX_CHARS:[C

    shr-int/lit8 v5, v3, 0x4

    and-int/lit8 v5, v5, 0xf

    aget-char v5, v4, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    and-int/lit8 v3, v3, 0xf

    .line 94
    aget-char v3, v4, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 96
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private indexOf([CC)I
    .locals 3

    const/4 v0, -0x1

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    .line 125
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_2

    .line 126
    aget-char v2, p1, v1

    if-ne p2, v2, :cond_1

    return v1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method


# virtual methods
.method public decrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 78
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    sget-object v1, Lorg/apache/commons/vfs2/util/DefaultCryptor;->KEY_BYTES:[B

    const-string v2, "AES"

    invoke-direct {v0, v1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 79
    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    const/4 v1, 0x2

    .line 80
    invoke-virtual {v3, v1, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 81
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/util/DefaultCryptor;->decode(Ljava/lang/String;)[B

    move-result-object v4

    .line 82
    array-length p1, v4

    invoke-virtual {v3, p1}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result p1

    new-array v7, p1, [B

    .line 83
    array-length v6, v4

    const/4 v8, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v3 .. v8}, Ljavax/crypto/Cipher;->update([BII[BI)I

    move-result p1

    .line 84
    invoke-virtual {v3, v7, p1}, Ljavax/crypto/Cipher;->doFinal([BI)I

    move-result v0

    add-int/2addr p1, v0

    .line 85
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v7}, Ljava/lang/String;-><init>([B)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public encrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 56
    new-instance p1, Ljavax/crypto/spec/SecretKeySpec;

    sget-object v0, Lorg/apache/commons/vfs2/util/DefaultCryptor;->KEY_BYTES:[B

    const-string v2, "AES"

    invoke-direct {p1, v0, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 58
    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    const/4 v2, 0x1

    .line 61
    invoke-virtual {v0, v2, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 63
    array-length p1, v1

    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result p1

    new-array v4, p1, [B

    .line 64
    array-length v3, v1

    const/4 v5, 0x0

    const/4 v2, 0x0

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    move-result p1

    .line 65
    invoke-virtual {v0, v4, p1}, Ljavax/crypto/Cipher;->doFinal([BI)I

    .line 66
    invoke-direct {p0, v4}, Lorg/apache/commons/vfs2/util/DefaultCryptor;->encode([B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
