.class Lorg/apache/commons/net/util/KeyManagerUtils$X509KeyManager;
.super Ljavax/net/ssl/X509ExtendedKeyManager;
.source "KeyManagerUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/util/KeyManagerUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "X509KeyManager"
.end annotation


# instance fields
.field private final keyStore:Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;


# direct methods
.method constructor <init>(Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;)V
    .locals 0

    .line 206
    invoke-direct {p0}, Ljavax/net/ssl/X509ExtendedKeyManager;-><init>()V

    .line 207
    iput-object p1, p0, Lorg/apache/commons/net/util/KeyManagerUtils$X509KeyManager;->keyStore:Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;

    return-void
.end method


# virtual methods
.method public chooseClientAlias([Ljava/lang/String;[Ljava/security/Principal;Ljava/net/Socket;)Ljava/lang/String;
    .locals 0

    .line 214
    iget-object p1, p0, Lorg/apache/commons/net/util/KeyManagerUtils$X509KeyManager;->keyStore:Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;

    invoke-virtual {p1}, Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;->getAlias()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public chooseServerAlias(Ljava/lang/String;[Ljava/security/Principal;Ljava/net/Socket;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getCertificateChain(Ljava/lang/String;)[Ljava/security/cert/X509Certificate;
    .locals 0

    .line 220
    iget-object p1, p0, Lorg/apache/commons/net/util/KeyManagerUtils$X509KeyManager;->keyStore:Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;

    invoke-virtual {p1}, Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;->getCertificateChain()[Ljava/security/cert/X509Certificate;

    move-result-object p1

    return-object p1
.end method

.method public getClientAliases(Ljava/lang/String;[Ljava/security/Principal;)[Ljava/lang/String;
    .locals 0

    .line 225
    iget-object p1, p0, Lorg/apache/commons/net/util/KeyManagerUtils$X509KeyManager;->keyStore:Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;

    invoke-virtual {p1}, Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;->getAlias()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPrivateKey(Ljava/lang/String;)Ljava/security/PrivateKey;
    .locals 0

    .line 231
    iget-object p1, p0, Lorg/apache/commons/net/util/KeyManagerUtils$X509KeyManager;->keyStore:Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;

    invoke-virtual {p1}, Lorg/apache/commons/net/util/KeyManagerUtils$ClientKeyStore;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object p1

    return-object p1
.end method

.method public getServerAliases(Ljava/lang/String;[Ljava/security/Principal;)[Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method
