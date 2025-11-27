.class public Lorg/apache/http/conn/ssl/TrustAllStrategy;
.super Ljava/lang/Object;
.source "TrustAllStrategy.java"

# interfaces
.implements Lorg/apache/http/conn/ssl/TrustStrategy;


# static fields
.field public static final INSTANCE:Lorg/apache/http/conn/ssl/TrustAllStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    new-instance v0, Lorg/apache/http/conn/ssl/TrustAllStrategy;

    invoke-direct {v0}, Lorg/apache/http/conn/ssl/TrustAllStrategy;-><init>()V

    sput-object v0, Lorg/apache/http/conn/ssl/TrustAllStrategy;->INSTANCE:Lorg/apache/http/conn/ssl/TrustAllStrategy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    const/4 p1, 0x1

    return p1
.end method
