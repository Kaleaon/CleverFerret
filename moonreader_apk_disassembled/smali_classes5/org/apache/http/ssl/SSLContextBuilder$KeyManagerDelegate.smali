.class Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;
.super Ljavax/net/ssl/X509ExtendedKeyManager;
.source "SSLContextBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/ssl/SSLContextBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "KeyManagerDelegate"
.end annotation


# instance fields
.field private final aliasStrategy:Lorg/apache/http/ssl/PrivateKeyStrategy;

.field private final keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;


# direct methods
.method constructor <init>(Ljavax/net/ssl/X509ExtendedKeyManager;Lorg/apache/http/ssl/PrivateKeyStrategy;)V
    .locals 0

    .line 433
    invoke-direct {p0}, Ljavax/net/ssl/X509ExtendedKeyManager;-><init>()V

    .line 434
    iput-object p1, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    .line 435
    iput-object p2, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->aliasStrategy:Lorg/apache/http/ssl/PrivateKeyStrategy;

    return-void
.end method


# virtual methods
.method public chooseClientAlias([Ljava/lang/String;[Ljava/security/Principal;Ljava/net/Socket;)Ljava/lang/String;
    .locals 0

    .line 475
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->getClientAliasMap([Ljava/lang/String;[Ljava/security/Principal;)Ljava/util/Map;

    move-result-object p1

    .line 476
    iget-object p2, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->aliasStrategy:Lorg/apache/http/ssl/PrivateKeyStrategy;

    invoke-interface {p2, p1, p3}, Lorg/apache/http/ssl/PrivateKeyStrategy;->chooseAlias(Ljava/util/Map;Ljava/net/Socket;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public chooseEngineClientAlias([Ljava/lang/String;[Ljava/security/Principal;Ljavax/net/ssl/SSLEngine;)Ljava/lang/String;
    .locals 0

    .line 505
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->getClientAliasMap([Ljava/lang/String;[Ljava/security/Principal;)Ljava/util/Map;

    move-result-object p1

    .line 506
    iget-object p2, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->aliasStrategy:Lorg/apache/http/ssl/PrivateKeyStrategy;

    const/4 p3, 0x0

    invoke-interface {p2, p1, p3}, Lorg/apache/http/ssl/PrivateKeyStrategy;->chooseAlias(Ljava/util/Map;Ljava/net/Socket;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public chooseEngineServerAlias(Ljava/lang/String;[Ljava/security/Principal;Ljavax/net/ssl/SSLEngine;)Ljava/lang/String;
    .locals 0

    .line 512
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->getServerAliasMap(Ljava/lang/String;[Ljava/security/Principal;)Ljava/util/Map;

    move-result-object p1

    .line 513
    iget-object p2, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->aliasStrategy:Lorg/apache/http/ssl/PrivateKeyStrategy;

    const/4 p3, 0x0

    invoke-interface {p2, p1, p3}, Lorg/apache/http/ssl/PrivateKeyStrategy;->chooseAlias(Ljava/util/Map;Ljava/net/Socket;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public chooseServerAlias(Ljava/lang/String;[Ljava/security/Principal;Ljava/net/Socket;)Ljava/lang/String;
    .locals 0

    .line 488
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->getServerAliasMap(Ljava/lang/String;[Ljava/security/Principal;)Ljava/util/Map;

    move-result-object p1

    .line 489
    iget-object p2, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->aliasStrategy:Lorg/apache/http/ssl/PrivateKeyStrategy;

    invoke-interface {p2, p1, p3}, Lorg/apache/http/ssl/PrivateKeyStrategy;->chooseAlias(Ljava/util/Map;Ljava/net/Socket;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/X509Certificate;
    .locals 1

    .line 494
    iget-object v0, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/X509ExtendedKeyManager;->getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/X509Certificate;

    move-result-object p1

    return-object p1
.end method

.method public getClientAliasMap([Ljava/lang/String;[Ljava/security/Principal;)Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[",
            "Ljava/security/Principal;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/http/ssl/PrivateKeyDetails;",
            ">;"
        }
    .end annotation

    .line 446
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 447
    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, p1, v3

    .line 448
    iget-object v5, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    invoke-virtual {v5, v4, p2}, Ljavax/net/ssl/X509ExtendedKeyManager;->getClientAliases(Ljava/lang/String;[Ljava/security/Principal;)[Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 450
    array-length v6, v5

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v6, :cond_0

    aget-object v8, v5, v7

    .line 451
    new-instance v9, Lorg/apache/http/ssl/PrivateKeyDetails;

    iget-object v10, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    invoke-virtual {v10, v8}, Ljavax/net/ssl/X509ExtendedKeyManager;->getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/X509Certificate;

    move-result-object v10

    invoke-direct {v9, v4, v10}, Lorg/apache/http/ssl/PrivateKeyDetails;-><init>(Ljava/lang/String;[Ljava/security/cert/X509Certificate;)V

    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getClientAliases(Ljava/lang/String;[Ljava/security/Principal;)[Ljava/lang/String;
    .locals 1

    .line 441
    iget-object v0, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/X509ExtendedKeyManager;->getClientAliases(Ljava/lang/String;[Ljava/security/Principal;)[Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPrivateKey(Ljava/lang/String;)Ljava/security/PrivateKey;
    .locals 1

    .line 499
    iget-object v0, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/X509ExtendedKeyManager;->getPrivateKey(Ljava/lang/String;)Ljava/security/PrivateKey;

    move-result-object p1

    return-object p1
.end method

.method public getServerAliasMap(Ljava/lang/String;[Ljava/security/Principal;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/security/Principal;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/http/ssl/PrivateKeyDetails;",
            ">;"
        }
    .end annotation

    .line 461
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 462
    iget-object v1, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    invoke-virtual {v1, p1, p2}, Ljavax/net/ssl/X509ExtendedKeyManager;->getServerAliases(Ljava/lang/String;[Ljava/security/Principal;)[Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 464
    array-length v1, p2

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p2, v2

    .line 465
    new-instance v4, Lorg/apache/http/ssl/PrivateKeyDetails;

    iget-object v5, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    invoke-virtual {v5, v3}, Ljavax/net/ssl/X509ExtendedKeyManager;->getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/X509Certificate;

    move-result-object v5

    invoke-direct {v4, p1, v5}, Lorg/apache/http/ssl/PrivateKeyDetails;-><init>(Ljava/lang/String;[Ljava/security/cert/X509Certificate;)V

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getServerAliases(Ljava/lang/String;[Ljava/security/Principal;)[Ljava/lang/String;
    .locals 1

    .line 482
    iget-object v0, p0, Lorg/apache/http/ssl/SSLContextBuilder$KeyManagerDelegate;->keyManager:Ljavax/net/ssl/X509ExtendedKeyManager;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/X509ExtendedKeyManager;->getServerAliases(Ljava/lang/String;[Ljava/security/Principal;)[Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
