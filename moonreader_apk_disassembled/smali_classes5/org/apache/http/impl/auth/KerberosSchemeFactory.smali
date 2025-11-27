.class public Lorg/apache/http/impl/auth/KerberosSchemeFactory;
.super Ljava/lang/Object;
.source "KerberosSchemeFactory.java"

# interfaces
.implements Lorg/apache/http/auth/AuthSchemeFactory;
.implements Lorg/apache/http/auth/AuthSchemeProvider;


# instance fields
.field private final stripPort:Z

.field private final useCanonicalHostname:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    .line 66
    invoke-direct {p0, v0, v0}, Lorg/apache/http/impl/auth/KerberosSchemeFactory;-><init>(ZZ)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-boolean p1, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->stripPort:Z

    const/4 p1, 0x1

    .line 62
    iput-boolean p1, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->useCanonicalHostname:Z

    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-boolean p1, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->stripPort:Z

    .line 56
    iput-boolean p2, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->useCanonicalHostname:Z

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/auth/AuthScheme;
    .locals 2

    .line 84
    new-instance p1, Lorg/apache/http/impl/auth/KerberosScheme;

    iget-boolean v0, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->stripPort:Z

    iget-boolean v1, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->useCanonicalHostname:Z

    invoke-direct {p1, v0, v1}, Lorg/apache/http/impl/auth/KerberosScheme;-><init>(ZZ)V

    return-object p1
.end method

.method public isStripPort()Z
    .locals 1

    .line 70
    iget-boolean v0, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->stripPort:Z

    return v0
.end method

.method public isUseCanonicalHostname()Z
    .locals 1

    .line 74
    iget-boolean v0, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->useCanonicalHostname:Z

    return v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/auth/AuthScheme;
    .locals 2

    .line 79
    new-instance p1, Lorg/apache/http/impl/auth/KerberosScheme;

    iget-boolean v0, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->stripPort:Z

    iget-boolean v1, p0, Lorg/apache/http/impl/auth/KerberosSchemeFactory;->useCanonicalHostname:Z

    invoke-direct {p1, v0, v1}, Lorg/apache/http/impl/auth/KerberosScheme;-><init>(ZZ)V

    return-object p1
.end method
