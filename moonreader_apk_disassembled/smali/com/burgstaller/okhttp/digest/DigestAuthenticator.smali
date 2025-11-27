.class public Lcom/burgstaller/okhttp/digest/DigestAuthenticator;
.super Ljava/lang/Object;
.source "DigestAuthenticator.java"

# interfaces
.implements Lcom/burgstaller/okhttp/digest/CachingAuthenticator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;
    }
.end annotation


# static fields
.field private static final CREDENTIAL_CHARSET:Ljava/lang/String; = "http.auth.credential-charset"

.field private static final HEXADECIMAL:[C

.field public static final PROXY_AUTH:Ljava/lang/String; = "Proxy-Authenticate"

.field public static final PROXY_AUTH_RESP:Ljava/lang/String; = "Proxy-Authorization"

.field private static final QOP_AUTH:I = 0x2

.field private static final QOP_AUTH_INT:I = 0x1

.field private static final QOP_MISSING:I = 0x0

.field private static final QOP_UNKNOWN:I = -0x1

.field private static final TAG:Ljava/lang/String; = "OkDigest"

.field public static final WWW_AUTH:Ljava/lang/String; = "WWW-Authenticate"

.field public static final WWW_AUTH_RESP:Ljava/lang/String; = "Authorization"


# instance fields
.field private a1:Ljava/lang/String;

.field private a2:Ljava/lang/String;

.field private cnonce:Ljava/lang/String;

.field private final credentials:Lcom/burgstaller/okhttp/digest/Credentials;

.field private credentialsCharset:Ljava/nio/charset/Charset;

.field private lastNonce:Ljava/lang/String;

.field private nounceCount:J

.field private parametersRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private proxy:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x10

    .line 83
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->HEXADECIMAL:[C

    return-void

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
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>(Lcom/burgstaller/okhttp/digest/Credentials;)V
    .locals 1

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->parametersRef:Ljava/util/concurrent/atomic/AtomicReference;

    .line 87
    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->credentialsCharset:Ljava/nio/charset/Charset;

    .line 97
    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->credentials:Lcom/burgstaller/okhttp/digest/Credentials;

    return-void
.end method

.method private authenticateWithState(Lokhttp3/Route;Lokhttp3/Request;Ljava/util/Map;)Lokhttp3/Request;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Route;",
            "Lokhttp3/Request;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lokhttp3/Request;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 219
    const-string v0, "realm"

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 225
    :cond_0
    const-string v0, "nonce"

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 229
    const-string v2, "stale"

    invoke-interface {p3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 230
    const-string v3, "true"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    .line 232
    invoke-direct {p0, p2, v0, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->havePreviousDigestAuthorizationAndShouldAbort(Lokhttp3/Request;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 234
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    move-result-object p1

    const-string p2, "Previous digest authentication with same nonce failed, returning null"

    const/4 p3, 0x5

    invoke-virtual {p1, p2, p3, v1}, Lokhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V

    return-object v1

    .line 240
    :cond_1
    const-string v0, "uri"

    const-string v1, "methodname"

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lokhttp3/Route;->requiresTunnel()Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 247
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->port()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 248
    const-string v2, "CONNECT"

    invoke-interface {p3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    invoke-interface {p3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 241
    :cond_3
    :goto_0
    invoke-virtual {p2}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object p1

    .line 242
    sget-object v2, Lokhttp3/internal/http/RequestLine;->INSTANCE:Lokhttp3/internal/http/RequestLine;

    invoke-virtual {p2}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v3

    invoke-virtual {v2, v3}, Lokhttp3/internal/http/RequestLine;->requestPath(Lokhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v2

    .line 243
    invoke-interface {p3, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    invoke-interface {p3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    :goto_1
    const-string p1, "charset"

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_4

    .line 254
    invoke-virtual {p0, p2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->getCredentialsCharset(Lokhttp3/Request;)Ljava/lang/String;

    move-result-object v0

    .line 255
    invoke-interface {p3, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    :cond_4
    iget-object p1, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->credentials:Lcom/burgstaller/okhttp/digest/Credentials;

    invoke-direct {p0, p1, p2, p3}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->createDigestHeader(Lcom/burgstaller/okhttp/digest/Credentials;Lokhttp3/Request;Ljava/util/Map;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object p1

    .line 258
    invoke-virtual {p2}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object p2

    invoke-interface {p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p3, p1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    return-object p1

    .line 227
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "missing nonce in challenge"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private copyHeaderMap(Lokhttp3/Headers;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Headers;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 291
    :goto_0
    invoke-virtual {p1}, Lokhttp3/Headers;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 292
    invoke-virtual {p1, v0}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static createCnonce()Ljava/lang/String;
    .locals 2

    .line 114
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    const/16 v1, 0x8

    .line 115
    new-array v1, v1, [B

    .line 116
    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 117
    invoke-static {v1}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->encode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized createDigestHeader(Lcom/burgstaller/okhttp/digest/Credentials;Lokhttp3/Request;Ljava/util/Map;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/burgstaller/okhttp/digest/Credentials;",
            "Lokhttp3/Request;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p3

    monitor-enter p0

    .line 305
    :try_start_0
    const-string v2, "uri"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 306
    const-string v3, "realm"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 307
    const-string v4, "nonce"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 308
    const-string v5, "opaque"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 309
    const-string v6, "methodname"

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 310
    const-string v7, "algorithm"

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-nez v7, :cond_0

    .line 313
    const-string v7, "MD5"

    .line 316
    :cond_0
    new-instance v8, Ljava/util/HashSet;

    const/16 v9, 0x8

    invoke-direct {v8, v9}, Ljava/util/HashSet;-><init>(I)V

    .line 318
    const-string v9, "qop"

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const/4 v10, -0x1

    if-eqz v9, :cond_4

    .line 320
    new-instance v14, Ljava/util/StringTokenizer;

    const-string v15, ","

    invoke-direct {v14, v9, v15}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    :goto_0
    invoke-virtual {v14}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v15

    if-eqz v15, :cond_1

    .line 322
    invoke-virtual {v14}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    .line 323
    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v15, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 325
    :cond_1
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v11

    if-eqz v11, :cond_2

    const-string v11, "auth-int"

    invoke-interface {v8, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    const/4 v11, 0x1

    goto :goto_1

    .line 327
    :cond_2
    const-string v11, "auth"

    invoke-interface {v8, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    const/4 v11, 0x2

    goto :goto_1

    :cond_3
    const/4 v11, -0x1

    goto :goto_1

    :cond_4
    const/4 v11, 0x0

    :goto_1
    if-eq v11, v10, :cond_18

    .line 338
    const-string v9, "charset"

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_5

    .line 340
    const-string v0, "ISO-8859-1"

    .line 344
    :cond_5
    const-string v9, "MD5-sess"

    invoke-virtual {v9, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 345
    const-string v9, "MD5"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :cond_6
    move-object v9, v7

    .line 350
    :goto_2
    :try_start_1
    invoke-static {v9}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->createMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v9
    :try_end_1
    .catch Lcom/burgstaller/okhttp/digest/fromhttpclient/UnsupportedDigestAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 355
    :try_start_2
    invoke-virtual/range {p1 .. p1}, Lcom/burgstaller/okhttp/digest/Credentials;->getUserName()Ljava/lang/String;

    move-result-object v10

    .line 356
    invoke-virtual/range {p1 .. p1}, Lcom/burgstaller/okhttp/digest/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v14

    .line 358
    iget-object v15, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->lastNonce:Ljava/lang/String;

    invoke-virtual {v4, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    move-object/from16 p1, v14

    const/16 v16, 0x0

    if-eqz v15, :cond_7

    const-wide/16 v18, 0x1

    .line 359
    iget-wide v12, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->nounceCount:J

    add-long v12, v12, v18

    iput-wide v12, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->nounceCount:J

    goto :goto_3

    :cond_7
    const-wide/16 v12, 0x1

    .line 361
    iput-wide v12, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->nounceCount:J

    const/4 v12, 0x0

    .line 362
    iput-object v12, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->cnonce:Ljava/lang/String;

    .line 363
    iput-object v4, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->lastNonce:Ljava/lang/String;

    .line 365
    :goto_3
    new-instance v12, Ljava/lang/StringBuilder;

    const/16 v13, 0x100

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 366
    new-instance v13, Ljava/util/Formatter;

    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v13, v12, v14}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    .line 367
    const-string v14, "%08x"

    move-object v15, v5

    move-object/from16 v18, v6

    iget-wide v5, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->nounceCount:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v19, v5

    const/4 v6, 0x1

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v19, v5, v16

    invoke-virtual {v13, v14, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 368
    invoke-virtual {v13}, Ljava/util/Formatter;->close()V

    .line 369
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 371
    iget-object v6, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->cnonce:Ljava/lang/String;

    if-nez v6, :cond_8

    .line 372
    invoke-static {}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->createCnonce()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->cnonce:Ljava/lang/String;

    :cond_8
    const/4 v6, 0x0

    .line 375
    iput-object v6, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a1:Ljava/lang/String;

    .line 376
    iput-object v6, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a2:Ljava/lang/String;

    .line 378
    const-string v6, "MD5-sess"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    const/16 v13, 0x3a

    if-eqz v6, :cond_9

    const/4 v6, 0x0

    .line 384
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 385
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-object/from16 v6, p1

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6, v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v6

    invoke-static {v6}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->encode([B)Ljava/lang/String;

    move-result-object v6

    const/4 v14, 0x0

    .line 387
    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 388
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v6, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->cnonce:Ljava/lang/String;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a1:Ljava/lang/String;

    goto :goto_4

    :cond_9
    move-object/from16 v6, p1

    const/4 v14, 0x0

    .line 392
    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 393
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a1:Ljava/lang/String;

    .line 397
    :goto_4
    iget-object v6, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a1:Ljava/lang/String;

    invoke-direct {v1, v6, v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v6

    invoke-static {v6}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->encode([B)Ljava/lang/String;

    move-result-object v6

    const/4 v14, 0x2

    if-ne v11, v14, :cond_a

    .line 401
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v14, v18

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a2:Ljava/lang/String;

    goto/16 :goto_5

    :cond_a
    move-object/from16 v14, v18

    const/4 v13, 0x1

    if-ne v11, v13, :cond_d

    .line 404
    invoke-virtual/range {p2 .. p2}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v13

    if-eqz v13, :cond_c

    .line 407
    const-string v11, "auth"

    invoke-interface {v8, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 409
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v11, 0x3a

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a2:Ljava/lang/String;

    const/4 v11, 0x2

    goto :goto_5

    .line 411
    :cond_b
    new-instance v0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;

    const-string v2, "Qop auth-int cannot be used with a non-repeatable entity"

    invoke-direct {v0, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 417
    :cond_c
    new-instance v8, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;

    invoke-direct {v8, v9}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;-><init>(Ljava/security/MessageDigest;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 419
    :try_start_3
    invoke-virtual {v8}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 423
    :try_start_4
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v14, 0x3a

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HttpEntityDigester;->getDigest()[B

    move-result-object v8

    invoke-static {v8}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->encode([B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a2:Ljava/lang/String;

    goto :goto_5

    :catch_0
    move-exception v0

    .line 421
    new-instance v2, Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;

    const-string v3, "I/O error reading entity content"

    invoke-direct {v2, v3, v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2

    .line 426
    :cond_d
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v14, 0x3a

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a2:Ljava/lang/String;

    .line 429
    :goto_5
    iget-object v8, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->a2:Ljava/lang/String;

    invoke-direct {v1, v8, v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->encode([B)Ljava/lang/String;

    move-result-object v0

    if-nez v11, :cond_e

    const/4 v14, 0x0

    .line 435
    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 436
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v14, 0x3a

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 437
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v14, 0x0

    goto :goto_7

    :cond_e
    const/4 v14, 0x0

    .line 439
    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 440
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0x3a

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v8, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->cnonce:Ljava/lang/String;

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v13, 0x1

    if-ne v11, v13, :cond_f

    const-string v6, "auth-int"

    goto :goto_6

    :cond_f
    const-string v6, "auth"

    .line 441
    :goto_6
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v6, 0x3a

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 445
    :goto_7
    invoke-static {v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->encode([B)Ljava/lang/String;

    move-result-object v0

    .line 447
    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v8, 0x80

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 449
    invoke-virtual {v1}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->isProxy()Z

    move-result v8

    if-eqz v8, :cond_10

    .line 450
    const-string v8, "Proxy-Authorization"

    goto :goto_8

    .line 452
    :cond_10
    const-string v8, "Authorization"

    .line 454
    :goto_8
    const-string v9, "Digest "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    new-instance v9, Ljava/util/ArrayList;

    const/16 v12, 0x14

    invoke-direct {v9, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 457
    new-instance v12, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v13, "username"

    invoke-direct {v12, v13, v10}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 458
    new-instance v10, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v12, "realm"

    invoke-direct {v10, v12, v3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 459
    new-instance v3, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v10, "nonce"

    invoke-direct {v3, v10, v4}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 460
    new-instance v3, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v4, "uri"

    invoke-direct {v3, v4, v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 461
    new-instance v2, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v3, "response"

    invoke-direct {v2, v3, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz v11, :cond_12

    .line 464
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v2, "qop"

    const/4 v13, 0x1

    if-ne v11, v13, :cond_11

    const-string v3, "auth-int"

    goto :goto_9

    :cond_11
    const-string v3, "auth"

    :goto_9
    invoke-direct {v0, v2, v3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 465
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v2, "nc"

    invoke-direct {v0, v2, v5}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 466
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v2, "cnonce"

    iget-object v3, v1, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->cnonce:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 469
    :cond_12
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v2, "algorithm"

    invoke-direct {v0, v2, v7}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz v15, :cond_13

    .line 471
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    const-string v2, "opaque"

    invoke-direct {v0, v2, v15}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_13
    const/4 v0, 0x0

    .line 474
    :goto_a
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_17

    .line 475
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    if-lez v0, :cond_14

    .line 477
    const-string v3, ", "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 479
    :cond_14
    invoke-interface {v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    .line 480
    const-string v4, "nc"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_16

    const-string v4, "qop"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_16

    const-string v4, "algorithm"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    goto :goto_b

    :cond_15
    const/4 v3, 0x0

    goto :goto_c

    :cond_16
    :goto_b
    const/4 v3, 0x1

    .line 481
    :goto_c
    sget-object v4, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;->DEFAULT:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;

    const/16 v17, 0x1

    xor-int/lit8 v3, v3, 0x1

    invoke-virtual {v4, v6, v2, v3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;->formatNameValuePair(Ljava/lang/StringBuilder;Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;Z)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 483
    :cond_17
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v8, v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-object v0

    :catch_1
    move-exception v0

    .line 352
    :try_start_5
    new-instance v2, Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsuppported digest algorithm: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2

    .line 335
    :cond_18
    new-instance v0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "None of the qop methods is supported: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator$AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0
.end method

.method private static createMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    .locals 4

    .line 102
    :try_start_0
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    .line 104
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unsupported algorithm in HTTP Digest authentication: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static encode([B)Ljava/lang/String;
    .locals 7

    .line 128
    array-length v0, p0

    mul-int/lit8 v1, v0, 0x2

    .line 129
    new-array v1, v1, [C

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 131
    aget-byte v3, p0, v2

    and-int/lit8 v4, v3, 0xf

    and-int/lit16 v3, v3, 0xf0

    shr-int/lit8 v3, v3, 0x4

    mul-int/lit8 v5, v2, 0x2

    .line 133
    sget-object v6, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->HEXADECIMAL:[C

    aget-char v3, v6, v3

    aput-char v3, v1, v5

    add-int/lit8 v5, v5, 0x1

    .line 134
    aget-char v3, v6, v4

    aput-char v3, v1, v5

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 137
    :cond_0
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1}, Ljava/lang/String;-><init>([C)V

    return-object p0
.end method

.method private findDigestHeader(Lokhttp3/Headers;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 196
    invoke-virtual {p1, p2}, Lokhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 197
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 198
    const-string v1, "Digest"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    .line 203
    :cond_1
    const-string p2, "OkHttp-Preemptive"

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    const/4 p1, 0x0

    return-object p1

    .line 206
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unsupported auth scheme: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public static getAsciiBytes(Ljava/lang/String;)[B
    .locals 1

    if-eqz p0, :cond_0

    .line 516
    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    return-object p0

    .line 514
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Parameter may not be null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private getBytes(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 0

    .line 505
    :try_start_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 508
    :catch_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    return-object p1
.end method

.method private getHeaderName(I)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x191

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    .line 185
    invoke-virtual {p0, p1}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->setProxy(Z)V

    .line 186
    const-string p1, "WWW-Authenticate"

    return-object p1

    :cond_0
    const/16 v0, 0x197

    if-ne p1, v0, :cond_1

    const/4 p1, 0x1

    .line 189
    invoke-virtual {p0, p1}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->setProxy(Z)V

    .line 190
    const-string p1, "Proxy-Authenticate"

    return-object p1

    .line 192
    :cond_1
    const-string p1, ""

    return-object p1
.end method

.method private havePreviousDigestAuthorizationAndShouldAbort(Lokhttp3/Request;Ljava/lang/String;Z)Z
    .locals 0

    .line 276
    invoke-virtual {p0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->isProxy()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 277
    const-string p2, "Proxy-Authorization"

    goto :goto_0

    .line 279
    :cond_0
    const-string p2, "Authorization"

    .line 281
    :goto_0
    invoke-virtual {p1, p2}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 283
    const-string p2, "Digest"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    xor-int/lit8 p1, p3, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public declared-synchronized authenticate(Lokhttp3/Route;Lokhttp3/Response;)Lokhttp3/Request;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "missing nonce in challenge header: "

    monitor-enter p0

    .line 159
    :try_start_0
    invoke-virtual {p2}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v1

    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->getHeaderName(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->findDigestHeader(Lokhttp3/Headers;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 161
    monitor-exit p0

    const/4 p1, 0x0

    return-object p1

    .line 167
    :cond_0
    :try_start_1
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 168
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x7

    sub-int/2addr v3, v4

    invoke-virtual {p0, v1, v4, v3, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->parseChallenge(Ljava/lang/String;IILjava/util/Map;)V

    .line 170
    invoke-virtual {p2}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v3

    invoke-direct {p0, v3, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->copyHeaderMap(Lokhttp3/Headers;Ljava/util/Map;)V

    .line 173
    iget-object v3, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->parametersRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 176
    const-string v3, "nonce"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 180
    invoke-virtual {p2}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object p2

    invoke-direct {p0, p1, p2, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->authenticateWithState(Lokhttp3/Route;Lokhttp3/Request;Ljava/util/Map;)Lokhttp3/Request;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    .line 177
    :cond_1
    :try_start_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public authenticateWithState(Lokhttp3/Route;Lokhttp3/Request;)Lokhttp3/Request;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 212
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->parametersRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_0

    .line 213
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(Ljava/util/Map;)V

    move-object v0, v1

    .line 214
    :goto_0
    invoke-direct {p0, p1, p2, v0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->authenticateWithState(Lokhttp3/Route;Lokhttp3/Request;Ljava/util/Map;)Lokhttp3/Request;

    move-result-object p1

    return-object p1
.end method

.method getCredentialsCharset(Lokhttp3/Request;)Ljava/lang/String;
    .locals 1

    .line 496
    const-string v0, "http.auth.credential-charset"

    invoke-virtual {p1, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    .line 498
    invoke-virtual {p0}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->getCredentialsCharset()Ljava/nio/charset/Charset;

    move-result-object p1

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public getCredentialsCharset()Ljava/nio/charset/Charset;
    .locals 1

    .line 492
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->credentialsCharset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public isProxy()Z
    .locals 1

    .line 521
    iget-boolean v0, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->proxy:Z

    return v0
.end method

.method protected parseChallenge(Ljava/lang/String;IILjava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 142
    sget-object v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->INSTANCE:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    .line 143
    new-instance v1, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v1, p2, v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;-><init>(II)V

    .line 144
    new-instance p2, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;

    invoke-direct {p2, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;-><init>(I)V

    .line 145
    invoke-virtual {p2, p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 147
    invoke-virtual {v0, p2, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->parseElements(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    move-result-object p1

    .line 148
    array-length p2, p1

    if-eqz p2, :cond_1

    .line 152
    array-length p2, p1

    const/4 p3, 0x0

    :goto_0
    if-ge p3, p2, :cond_0

    aget-object v0, p1, p3

    .line 153
    invoke-interface {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 149
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Authentication challenge is empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setProxy(Z)V
    .locals 0

    .line 525
    iput-boolean p1, p0, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;->proxy:Z

    return-void
.end method
