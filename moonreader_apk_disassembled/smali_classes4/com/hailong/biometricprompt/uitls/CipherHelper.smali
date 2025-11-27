.class public Lcom/hailong/biometricprompt/uitls/CipherHelper;
.super Ljava/lang/Object;
.source "CipherHelper.java"


# static fields
.field private static final BLOCK_MODE:Ljava/lang/String; = "CBC"

.field private static final ENCRYPTION_PADDING:Ljava/lang/String; = "PKCS7Padding"

.field private static final KEYSTORE_NAME:Ljava/lang/String; = "AndroidKeyStore"

.field private static final KEY_ALGORITHM:Ljava/lang/String; = "AES"

.field private static final KEY_NAME:Ljava/lang/String; = "com.hailong.fingerprint.CipherHelper"

.field private static final TRANSFORMATION:Ljava/lang/String; = "AES/CBC/PKCS7Padding"


# instance fields
.field private final _keystore:Ljava/security/KeyStore;


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const-string v0, "AndroidKeyStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    iput-object v0, p0, Lcom/hailong/biometricprompt/uitls/CipherHelper;->_keystore:Ljava/security/KeyStore;

    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    return-void
.end method

.method private CreateKey()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 88
    const-string v0, "AES"

    const-string v1, "AndroidKeyStore"

    invoke-static {v0, v1}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    .line 89
    const-string v1, "com.hailong.fingerprint.CipherHelper"

    const/4 v2, 0x3

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Ljava/lang/String;I)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v1

    const-string v2, "CBC"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    .line 91
    invoke-static {v1, v2}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/security/keystore/KeyGenParameterSpec$Builder;[Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v1

    const-string v2, "PKCS7Padding"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    .line 92
    invoke-static {v1, v2}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m$1(Landroid/security/keystore/KeyGenParameterSpec$Builder;[Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 93
    invoke-static {v1, v2}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/security/keystore/KeyGenParameterSpec$Builder;Z)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v1

    .line 94
    invoke-static {v1}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/security/keystore/KeyGenParameterSpec$Builder;)Landroid/security/keystore/KeyGenParameterSpec;

    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Ljavax/crypto/KeyGenerator;->init(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 96
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    return-void
.end method

.method private GetKey()Ljava/security/Key;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lcom/hailong/biometricprompt/uitls/CipherHelper;->_keystore:Ljava/security/KeyStore;

    const-string v1, "com.hailong.fingerprint.CipherHelper"

    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->isKeyEntry(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 80
    invoke-direct {p0}, Lcom/hailong/biometricprompt/uitls/CipherHelper;->CreateKey()V

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/hailong/biometricprompt/uitls/CipherHelper;->_keystore:Ljava/security/KeyStore;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object v0

    return-object v0
.end method

.method private createCipher(Z)Ljavax/crypto/Cipher;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 63
    invoke-direct {p0}, Lcom/hailong/biometricprompt/uitls/CipherHelper;->GetKey()Ljava/security/Key;

    move-result-object v0

    .line 64
    const-string v1, "AES/CBC/PKCS7Padding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    const/4 v2, 0x3

    .line 66
    :try_start_0
    invoke-virtual {v1, v2, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V
    :try_end_0
    .catch Landroid/security/keystore/KeyPermanentlyInvalidatedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    .line 68
    iget-object v1, p0, Lcom/hailong/biometricprompt/uitls/CipherHelper;->_keystore:Ljava/security/KeyStore;

    const-string v2, "com.hailong.fingerprint.CipherHelper"

    invoke-virtual {v1, v2}, Ljava/security/KeyStore;->deleteEntry(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 70
    invoke-direct {p0, p1}, Lcom/hailong/biometricprompt/uitls/CipherHelper;->createCipher(Z)Ljavax/crypto/Cipher;

    .line 72
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v1, "Could not create the cipher for fingerprint authentication."

    invoke-direct {p1, v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method


# virtual methods
.method public createCipher()Ljavax/crypto/Cipher;
    .locals 1

    const/4 v0, 0x1

    .line 47
    :try_start_0
    invoke-direct {p0, v0}, Lcom/hailong/biometricprompt/uitls/CipherHelper;->createCipher(Z)Ljavax/crypto/Cipher;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 49
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method
