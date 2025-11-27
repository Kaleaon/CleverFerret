.class Lorg/apache/commons/net/util/TrustManagerUtils$TrustManager;
.super Ljava/lang/Object;
.source "TrustManagerUtils.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/util/TrustManagerUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TrustManager"
.end annotation


# instance fields
.field private final checkServerValidity:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-boolean p1, p0, Lorg/apache/commons/net/util/TrustManagerUtils$TrustManager;->checkServerValidity:Z

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .line 55
    iget-boolean p2, p0, Lorg/apache/commons/net/util/TrustManagerUtils$TrustManager;->checkServerValidity:Z

    if-eqz p2, :cond_0

    .line 56
    array-length p2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_0

    aget-object v1, p1, v0

    .line 58
    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->checkValidity()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .line 69
    sget-object v0, Lorg/apache/commons/net/util/NetConstants;->EMPTY_X509_CERTIFICATE_ARRAY:[Ljava/security/cert/X509Certificate;

    return-object v0
.end method
