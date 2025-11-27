.class final Lorg/apache/http/impl/auth/NTLMEngineImpl;
.super Ljava/lang/Object;
.source "NTLMEngineImpl.java"

# interfaces
.implements Lorg/apache/http/impl/auth/NTLMEngine;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;,
        Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;,
        Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;,
        Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;,
        Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;,
        Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;,
        Lorg/apache/http/impl/auth/NTLMEngineImpl$Handle;,
        Lorg/apache/http/impl/auth/NTLMEngineImpl$Mode;,
        Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;
    }
.end annotation


# static fields
.field private static final DEFAULT_CHARSET:Ljava/nio/charset/Charset;

.field static final FLAG_DOMAIN_PRESENT:I = 0x1000

.field static final FLAG_REQUEST_128BIT_KEY_EXCH:I = 0x20000000

.field static final FLAG_REQUEST_56BIT_ENCRYPTION:I = -0x80000000

.field static final FLAG_REQUEST_ALWAYS_SIGN:I = 0x8000

.field static final FLAG_REQUEST_EXPLICIT_KEY_EXCH:I = 0x40000000

.field static final FLAG_REQUEST_LAN_MANAGER_KEY:I = 0x80

.field static final FLAG_REQUEST_NTLM2_SESSION:I = 0x80000

.field static final FLAG_REQUEST_NTLMv1:I = 0x200

.field static final FLAG_REQUEST_OEM_ENCODING:I = 0x2

.field static final FLAG_REQUEST_SEAL:I = 0x20

.field static final FLAG_REQUEST_SIGN:I = 0x10

.field static final FLAG_REQUEST_TARGET:I = 0x4

.field static final FLAG_REQUEST_UNICODE_ENCODING:I = 0x1

.field static final FLAG_REQUEST_VERSION:I = 0x2000000

.field static final FLAG_TARGETINFO_PRESENT:I = 0x800000

.field static final FLAG_WORKSTATION_PRESENT:I = 0x2000

.field private static final MAGIC_TLS_SERVER_ENDPOINT:[B

.field static final MSV_AV_CHANNEL_BINDINGS:I = 0xa

.field static final MSV_AV_DNS_COMPUTER_NAME:I = 0x3

.field static final MSV_AV_DNS_DOMAIN_NAME:I = 0x4

.field static final MSV_AV_DNS_TREE_NAME:I = 0x5

.field static final MSV_AV_EOL:I = 0x0

.field static final MSV_AV_FLAGS:I = 0x6

.field static final MSV_AV_FLAGS_ACCOUNT_AUTH_CONSTAINED:I = 0x1

.field static final MSV_AV_FLAGS_MIC:I = 0x2

.field static final MSV_AV_FLAGS_UNTRUSTED_TARGET_SPN:I = 0x4

.field static final MSV_AV_NB_COMPUTER_NAME:I = 0x1

.field static final MSV_AV_NB_DOMAIN_NAME:I = 0x2

.field static final MSV_AV_SINGLE_HOST:I = 0x8

.field static final MSV_AV_TARGET_NAME:I = 0x9

.field static final MSV_AV_TIMESTAMP:I = 0x7

.field private static final RND_GEN:Ljava/security/SecureRandom;

.field private static final SEAL_MAGIC_CLIENT:[B

.field private static final SEAL_MAGIC_SERVER:[B

.field private static final SIGNATURE:[B

.field private static final SIGN_MAGIC_CLIENT:[B

.field private static final SIGN_MAGIC_SERVER:[B

.field private static final TYPE_1_MESSAGE:Ljava/lang/String;

.field private static final UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 54
    const-string v0, "UnicodeLittleUnmarked"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    .line 56
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    .line 103
    :try_start_0
    const-string v0, "SHA1PRNG"

    invoke-static {v0}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    .line 106
    :goto_0
    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->RND_GEN:Ljava/security/SecureRandom;

    .line 110
    const-string v0, "NTLMSSP"

    invoke-static {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getNullTerminatedAsciiString(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGNATURE:[B

    .line 114
    const-string v0, "session key to server-to-client signing key magic constant"

    invoke-static {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getNullTerminatedAsciiString(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGN_MAGIC_SERVER:[B

    .line 116
    const-string v0, "session key to client-to-server signing key magic constant"

    invoke-static {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getNullTerminatedAsciiString(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGN_MAGIC_CLIENT:[B

    .line 118
    const-string v0, "session key to server-to-client sealing key magic constant"

    invoke-static {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getNullTerminatedAsciiString(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SEAL_MAGIC_SERVER:[B

    .line 120
    const-string v0, "session key to client-to-server sealing key magic constant"

    invoke-static {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getNullTerminatedAsciiString(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SEAL_MAGIC_CLIENT:[B

    .line 124
    const-string v0, "tls-server-end-point:"

    sget-object v1, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->MAGIC_TLS_SERVER_ENDPOINT:[B

    .line 135
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;-><init>()V

    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type1Message;->getResponse()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->TYPE_1_MESSAGE:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static F(III)I
    .locals 0

    and-int/2addr p1, p0

    not-int p0, p0

    and-int/2addr p0, p2

    or-int/2addr p0, p1

    return p0
.end method

.method static G(III)I
    .locals 1

    or-int v0, p1, p2

    and-int/2addr p0, v0

    and-int/2addr p1, p2

    or-int/2addr p0, p1

    return p0
.end method

.method static H(III)I
    .locals 0

    xor-int/2addr p0, p1

    xor-int/2addr p0, p2

    return p0
.end method

.method static RC4([B[B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 582
    const-string v0, "RC4"

    :try_start_0
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 583
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v2, p1, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    const/4 p1, 0x1

    invoke-virtual {v1, p1, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 584
    invoke-virtual {v1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 586
    new-instance p1, Lorg/apache/http/impl/auth/NTLMEngineException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0, p0}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method static synthetic access$000()Ljava/security/SecureRandom;
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->RND_GEN:Ljava/security/SecureRandom;

    return-object v0
.end method

.method static synthetic access$100(Ljava/util/Random;)[B
    .locals 0

    .line 51
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->makeRandomChallenge(Ljava/util/Random;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1000([BI)Ljava/security/Key;
    .locals 0

    .line 51
    invoke-static {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->createDESKey([BI)Ljava/security/Key;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100()[B
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGN_MAGIC_CLIENT:[B

    return-object v0
.end method

.method static synthetic access$1200()[B
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SEAL_MAGIC_CLIENT:[B

    return-object v0
.end method

.method static synthetic access$1300()[B
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGN_MAGIC_SERVER:[B

    return-object v0
.end method

.method static synthetic access$1400()[B
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SEAL_MAGIC_SERVER:[B

    return-object v0
.end method

.method static synthetic access$1500(I)[B
    .locals 0

    .line 51
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->encodeLong(I)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600([BII)V
    .locals 0

    .line 51
    invoke-static {p0, p1, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->encodeLong([BII)V

    return-void
.end method

.method static synthetic access$1700()Ljava/nio/charset/Charset;
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method static synthetic access$1800()[B
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGNATURE:[B

    return-object v0
.end method

.method static synthetic access$1900([BI)I
    .locals 0

    .line 51
    invoke-static {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->readUShort([BI)I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Ljava/util/Random;)[B
    .locals 0

    .line 51
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->makeSecondaryKey(Ljava/util/Random;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2000([BI)I
    .locals 0

    .line 51
    invoke-static {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->readULong([BI)I

    move-result p0

    return p0
.end method

.method static synthetic access$2100([BI)[B
    .locals 0

    .line 51
    invoke-static {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->readSecurityBuffer([BI)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2200(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 51
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->convertHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2300(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 51
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->convertDomain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2400()Ljava/nio/charset/Charset;
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method static synthetic access$2500(I)Ljava/nio/charset/Charset;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 51
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getCharset(I)Ljava/nio/charset/Charset;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2600()[B
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->MAGIC_TLS_SERVER_ENDPOINT:[B

    return-object v0
.end method

.method static synthetic access$300(Ljava/lang/String;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 51
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->lmHash(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400([B[B)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 51
    invoke-static {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->lmResponse([B[B)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Ljava/lang/String;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 51
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->ntlmHash(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Ljava/lang/String;Ljava/lang/String;[B)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 51
    invoke-static {p0, p1, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->lmv2Hash(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Ljava/lang/String;Ljava/lang/String;[B)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 51
    invoke-static {p0, p1, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->ntlmv2Hash(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800([B[B[B)[B
    .locals 0

    .line 51
    invoke-static {p0, p1, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->createBlob([B[B[B)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900([B[B[B)[B
    .locals 0

    .line 51
    invoke-static {p0, p1, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->lmv2Response([B[B[B)[B

    move-result-object p0

    return-object p0
.end method

.method private static convertDomain(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1070
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->stripDotSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static convertHost(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1065
    invoke-static {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->stripDotSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static createBlob([B[B[B)[B
    .locals 7

    const/4 v0, 0x4

    .line 964
    new-array v1, v0, [B

    fill-array-data v1, :array_0

    .line 965
    new-array v2, v0, [B

    fill-array-data v2, :array_1

    .line 966
    new-array v3, v0, [B

    fill-array-data v3, :array_2

    .line 967
    new-array v4, v0, [B

    fill-array-data v4, :array_3

    .line 968
    array-length v5, p2

    add-int/lit8 v5, v5, 0x14

    array-length v6, p1

    add-int/2addr v5, v6

    add-int/2addr v5, v0

    new-array v5, v5, [B

    const/4 v6, 0x0

    .line 971
    invoke-static {v1, v6, v5, v6, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 973
    invoke-static {v2, v6, v5, v0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 975
    array-length v1, p2

    const/16 v2, 0x8

    invoke-static {p2, v6, v5, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 976
    array-length p2, p2

    add-int v1, v2, p2

    .line 977
    invoke-static {p0, v6, v5, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 p0, p2, 0x10

    .line 979
    invoke-static {v3, v6, v5, p0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 p2, p2, 0x14

    .line 981
    array-length p0, p1

    invoke-static {p1, v6, v5, p2, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 982
    array-length p0, p1

    add-int/2addr p2, p0

    .line 983
    invoke-static {v4, v6, v5, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v5

    nop

    :array_0
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x0t
    .end array-data

    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    :array_2
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    :array_3
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method private static createDESKey([BI)Ljava/security/Key;
    .locals 17

    const/4 v0, 0x7

    .line 1001
    new-array v1, v0, [B

    const/4 v2, 0x0

    move-object/from16 v3, p0

    move/from16 v4, p1

    .line 1002
    invoke-static {v3, v4, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1004
    aget-byte v3, v1, v2

    shl-int/lit8 v4, v3, 0x7

    const/4 v5, 0x1

    .line 1005
    aget-byte v6, v1, v5

    and-int/lit16 v7, v6, 0xff

    ushr-int/2addr v7, v5

    or-int/2addr v4, v7

    int-to-byte v4, v4

    const/4 v7, 0x6

    shl-int/2addr v6, v7

    const/4 v8, 0x2

    .line 1006
    aget-byte v9, v1, v8

    and-int/lit16 v10, v9, 0xff

    ushr-int/2addr v10, v8

    or-int/2addr v6, v10

    int-to-byte v6, v6

    const/4 v10, 0x5

    shl-int/2addr v9, v10

    const/4 v11, 0x3

    .line 1007
    aget-byte v12, v1, v11

    and-int/lit16 v13, v12, 0xff

    ushr-int/2addr v13, v11

    or-int/2addr v9, v13

    int-to-byte v9, v9

    const/4 v13, 0x4

    shl-int/2addr v12, v13

    .line 1008
    aget-byte v14, v1, v13

    and-int/lit16 v15, v14, 0xff

    ushr-int/2addr v15, v13

    or-int/2addr v12, v15

    int-to-byte v12, v12

    shl-int/2addr v14, v11

    .line 1009
    aget-byte v15, v1, v10

    const/16 v16, 0x7

    and-int/lit16 v0, v15, 0xff

    ushr-int/2addr v0, v10

    or-int/2addr v0, v14

    int-to-byte v0, v0

    shl-int/lit8 v14, v15, 0x2

    .line 1010
    aget-byte v1, v1, v7

    and-int/lit16 v15, v1, 0xff

    ushr-int/2addr v15, v7

    or-int/2addr v14, v15

    int-to-byte v14, v14

    shl-int/2addr v1, v5

    int-to-byte v1, v1

    const/16 v15, 0x8

    .line 1011
    new-array v15, v15, [B

    aput-byte v3, v15, v2

    aput-byte v4, v15, v5

    aput-byte v6, v15, v8

    aput-byte v9, v15, v11

    aput-byte v12, v15, v13

    aput-byte v0, v15, v10

    aput-byte v14, v15, v7

    aput-byte v1, v15, v16

    .line 1012
    invoke-static {v15}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->oddParity([B)V

    .line 1013
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    const-string v1, "DES"

    invoke-direct {v0, v15, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    return-object v0
.end method

.method private static encodeLong([BII)V
    .locals 2

    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    .line 946
    aput-byte v0, p0, p1

    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    .line 947
    aput-byte v1, p0, v0

    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    .line 948
    aput-byte v1, p0, v0

    add-int/lit8 p1, p1, 0x3

    shr-int/lit8 p2, p2, 0x18

    and-int/lit16 p2, p2, 0xff

    int-to-byte p2, p2

    .line 949
    aput-byte p2, p0, p1

    return-void
.end method

.method private static encodeLong(I)[B
    .locals 2

    const/4 v0, 0x4

    .line 939
    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 940
    invoke-static {v0, v1, p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->encodeLong([BII)V

    return-object v0
.end method

.method private static getCharset(I)Ljava/nio/charset/Charset;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    and-int/lit8 p0, p0, 0x1

    if-nez p0, :cond_0

    .line 1043
    sget-object p0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    return-object p0

    .line 1045
    :cond_0
    sget-object p0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    if-eqz p0, :cond_1

    return-object p0

    .line 1046
    :cond_1
    new-instance p0, Lorg/apache/http/impl/auth/NTLMEngineException;

    const-string v0, "Unicode not supported"

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static getMD5()Ljava/security/MessageDigest;
    .locals 4

    .line 1846
    :try_start_0
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 1848
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "MD5 message digest doesn\'t seem to exist - fatal error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getNullTerminatedAsciiString(Ljava/lang/String;)[B
    .locals 3

    .line 128
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    .line 129
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [B

    .line 130
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 131
    array-length p0, p0

    aput-byte v2, v0, p0

    return-object v0
.end method

.method static getType1Message(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 154
    sget-object p0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->TYPE_1_MESSAGE:Ljava/lang/String;

    return-object p0
.end method

.method static getType3Message(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 180
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;

    move-object v3, p0

    move-object v4, p1

    move-object v2, p2

    move-object v1, p3

    move-object v5, p4

    move v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)V

    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->getResponse()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static getType3Message(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[BLjava/security/cert/Certificate;[B[B)Ljava/lang/String;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 208
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;

    move-object v3, p0

    move-object v4, p1

    move-object v2, p2

    move-object v1, p3

    move-object/from16 v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    invoke-direct/range {v0 .. v11}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[BLjava/security/cert/Certificate;[B[B)V

    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->getResponse()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static hmacMD5([B[B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 573
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;-><init>([B)V

    .line 574
    invoke-virtual {v0, p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->update([B)V

    .line 575
    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->getOutput()[B

    move-result-object p0

    return-object p0
.end method

.method private static lmHash(Ljava/lang/String;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 628
    :try_start_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    .line 629
    array-length v0, p0

    const/16 v1, 0xe

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 630
    new-array v1, v1, [B

    const/4 v2, 0x0

    .line 631
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 632
    invoke-static {v1, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->createDESKey([BI)Ljava/security/Key;

    move-result-object p0

    const/4 v0, 0x7

    .line 633
    invoke-static {v1, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->createDESKey([BI)Ljava/security/Key;

    move-result-object v0

    .line 634
    const-string v1, "KGS!@#$%"

    sget-object v3, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    .line 635
    const-string v3, "DES/ECB/NoPadding"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    const/4 v4, 0x1

    .line 636
    invoke-virtual {v3, v4, p0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 637
    invoke-virtual {v3, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0

    .line 638
    invoke-virtual {v3, v4, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 639
    invoke-virtual {v3, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    const/16 v1, 0x10

    .line 640
    new-array v1, v1, [B

    const/16 v3, 0x8

    .line 641
    invoke-static {p0, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 642
    invoke-static {v0, v2, v1, v3, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p0

    .line 645
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static lmResponse([B[B)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    const/16 v0, 0x15

    .line 720
    :try_start_0
    new-array v0, v0, [B

    const/16 v1, 0x10

    const/4 v2, 0x0

    .line 721
    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 722
    invoke-static {v0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->createDESKey([BI)Ljava/security/Key;

    move-result-object p0

    const/4 v3, 0x7

    .line 723
    invoke-static {v0, v3}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->createDESKey([BI)Ljava/security/Key;

    move-result-object v3

    const/16 v4, 0xe

    .line 724
    invoke-static {v0, v4}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->createDESKey([BI)Ljava/security/Key;

    move-result-object v0

    .line 725
    const-string v4, "DES/ECB/NoPadding"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    const/4 v5, 0x1

    .line 726
    invoke-virtual {v4, v5, p0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 727
    invoke-virtual {v4, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0

    .line 728
    invoke-virtual {v4, v5, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 729
    invoke-virtual {v4, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v3

    .line 730
    invoke-virtual {v4, v5, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 731
    invoke-virtual {v4, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    const/16 v0, 0x18

    .line 732
    new-array v0, v0, [B

    const/16 v4, 0x8

    .line 733
    invoke-static {p0, v2, v0, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 734
    invoke-static {v3, v2, v0, v4, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 735
    invoke-static {p1, v2, v0, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    .line 738
    new-instance p1, Lorg/apache/http/impl/auth/NTLMEngineException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0, p0}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method private static lmv2Hash(Ljava/lang/String;Ljava/lang/String;[B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 676
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    if-eqz v0, :cond_1

    .line 679
    new-instance v1, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;

    invoke-direct {v1, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;-><init>([B)V

    .line 681
    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v1, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->update([B)V

    if-eqz p0, :cond_0

    .line 683
    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, p1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v1, p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->update([B)V

    .line 685
    :cond_0
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->getOutput()[B

    move-result-object p0

    return-object p0

    .line 677
    :cond_1
    new-instance p0, Lorg/apache/http/impl/auth/NTLMEngineException;

    const-string p1, "Unicode not supported"

    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static lmv2Response([B[B[B)[B
    .locals 2

    .line 757
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;

    invoke-direct {v0, p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;-><init>([B)V

    .line 758
    invoke-virtual {v0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->update([B)V

    .line 759
    invoke-virtual {v0, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->update([B)V

    .line 760
    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->getOutput()[B

    move-result-object p0

    .line 761
    array-length p1, p0

    array-length v0, p2

    add-int/2addr p1, v0

    new-array p1, p1, [B

    .line 762
    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, p1, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 763
    array-length p0, p0

    array-length v0, p2

    invoke-static {p2, v1, p1, p0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method

.method private static makeRandomChallenge(Ljava/util/Random;)[B
    .locals 1

    const/16 v0, 0x8

    .line 240
    new-array v0, v0, [B

    .line 241
    monitor-enter p0

    .line 242
    :try_start_0
    invoke-virtual {p0, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 243
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static makeSecondaryKey(Ljava/util/Random;)[B
    .locals 1

    const/16 v0, 0x10

    .line 249
    new-array v0, v0, [B

    .line 250
    monitor-enter p0

    .line 251
    :try_start_0
    invoke-virtual {p0, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 252
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static ntlm2SessionResponse([B[B[B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 601
    :try_start_0
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getMD5()Ljava/security/MessageDigest;

    move-result-object v0

    .line 602
    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 603
    invoke-virtual {v0, p2}, Ljava/security/MessageDigest;->update([B)V

    .line 604
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    const/16 p2, 0x8

    .line 606
    new-array v0, p2, [B

    const/4 v1, 0x0

    .line 607
    invoke-static {p1, v1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 608
    invoke-static {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->lmResponse([B[B)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 610
    instance-of p1, p0, Lorg/apache/http/impl/auth/NTLMEngineException;

    if-eqz p1, :cond_0

    .line 611
    check-cast p0, Lorg/apache/http/impl/auth/NTLMEngineException;

    throw p0

    .line 613
    :cond_0
    new-instance p1, Lorg/apache/http/impl/auth/NTLMEngineException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method private static ntlmHash(Ljava/lang/String;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 659
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    if-eqz v0, :cond_0

    .line 662
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    .line 663
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;-><init>()V

    .line 664
    invoke-virtual {v0, p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;->update([B)V

    .line 665
    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$MD4;->getOutput()[B

    move-result-object p0

    return-object p0

    .line 660
    :cond_0
    new-instance p0, Lorg/apache/http/impl/auth/NTLMEngineException;

    const-string v0, "Unicode not supported"

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static ntlmv2Hash(Ljava/lang/String;Ljava/lang/String;[B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 696
    sget-object v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    if-eqz v0, :cond_1

    .line 699
    new-instance v1, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;

    invoke-direct {v1, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;-><init>([B)V

    .line 701
    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v1, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->update([B)V

    if-eqz p0, :cond_0

    .line 703
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v1, p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->update([B)V

    .line 705
    :cond_0
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->getOutput()[B

    move-result-object p0

    return-object p0

    .line 697
    :cond_1
    new-instance p0, Lorg/apache/http/impl/auth/NTLMEngineException;

    const-string p1, "Unicode not supported"

    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static oddParity([B)V
    .locals 4

    const/4 v0, 0x0

    .line 1023
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 1024
    aget-byte v1, p0, v0

    ushr-int/lit8 v2, v1, 0x7

    ushr-int/lit8 v3, v1, 0x6

    xor-int/2addr v2, v3

    ushr-int/lit8 v3, v1, 0x5

    xor-int/2addr v2, v3

    ushr-int/lit8 v3, v1, 0x4

    xor-int/2addr v2, v3

    ushr-int/lit8 v3, v1, 0x3

    xor-int/2addr v2, v3

    ushr-int/lit8 v3, v1, 0x2

    xor-int/2addr v2, v3

    ushr-int/lit8 v3, v1, 0x1

    xor-int/2addr v2, v3

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_0

    or-int/lit8 v1, v1, 0x1

    int-to-byte v1, v1

    .line 1028
    aput-byte v1, p0, v0

    goto :goto_1

    :cond_0
    and-int/lit8 v1, v1, -0x2

    int-to-byte v1, v1

    .line 1030
    aput-byte v1, p0, v0

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static readSecurityBuffer([BI)[B
    .locals 3

    .line 228
    invoke-static {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->readUShort([BI)I

    move-result v0

    add-int/lit8 p1, p1, 0x4

    .line 229
    invoke-static {p0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->readULong([BI)I

    move-result p1

    .line 230
    array-length v1, p0

    add-int v2, p1, v0

    if-ge v1, v2, :cond_0

    .line 231
    new-array p0, v0, [B

    return-object p0

    .line 233
    :cond_0
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 234
    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method private static readULong([BI)I
    .locals 2

    .line 213
    array-length v0, p0

    add-int/lit8 v1, p1, 0x4

    if-ge v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 216
    :cond_0
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v0

    return p0
.end method

.method private static readUShort([BI)I
    .locals 2

    .line 221
    array-length v0, p0

    add-int/lit8 v1, p1, 0x2

    if-ge v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 224
    :cond_0
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 p1, p1, 0x1

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x8

    or-int/2addr p0, v0

    return p0
.end method

.method static rotintlft(II)I
    .locals 1

    shl-int v0, p0, p1

    rsub-int/lit8 p1, p1, 0x20

    ushr-int/2addr p0, p1

    or-int/2addr p0, v0

    return p0
.end method

.method private static stripDotSuffix(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/16 v0, 0x2e

    .line 1056
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x0

    .line 1058
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_1
    return-object p0
.end method

.method static writeULong([BII)V
    .locals 2

    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    .line 1822
    aput-byte v0, p0, p2

    add-int/lit8 v0, p2, 0x1

    shr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    .line 1823
    aput-byte v1, p0, v0

    add-int/lit8 v0, p2, 0x2

    shr-int/lit8 v1, p1, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    .line 1824
    aput-byte v1, p0, v0

    add-int/lit8 p2, p2, 0x3

    shr-int/lit8 p1, p1, 0x18

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    .line 1825
    aput-byte p1, p0, p2

    return-void
.end method

.method static writeUShort([BII)V
    .locals 1

    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    .line 1817
    aput-byte v0, p0, p2

    add-int/lit8 p2, p2, 0x1

    shr-int/lit8 p1, p1, 0x8

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    .line 1818
    aput-byte p1, p0, p2

    return-void
.end method


# virtual methods
.method public generateType1Msg(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 2084
    invoke-static {p2, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getType1Message(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public generateType3Msg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .line 2094
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;

    invoke-direct {v0, p5}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;-><init>(Ljava/lang/String;)V

    .line 2095
    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->getChallenge()[B

    move-result-object v5

    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->getFlags()I

    move-result v6

    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->getTarget()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->getTargetInfo()[B

    move-result-object v8

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v3, p4

    invoke-static/range {v1 .. v8}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->getType3Message(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
