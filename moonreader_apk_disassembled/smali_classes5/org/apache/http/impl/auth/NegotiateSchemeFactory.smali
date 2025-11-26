.class public Lorg/apache/http/impl/auth/NegotiateSchemeFactory;
.super Ljava/lang/Object;
.source "NegotiateSchemeFactory.java"

# interfaces
.implements Lorg/apache/http/auth/AuthSchemeFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

.field private final stripPort:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 58
    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;-><init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;)V
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;-><init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    .line 50
    iput-boolean p2, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->stripPort:Z

    return-void
.end method


# virtual methods
.method public getSpengoGenerator()Lorg/apache/http/impl/auth/SpnegoTokenGenerator;
    .locals 1

    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    return-object v0
.end method

.method public isStripPort()Z
    .locals 1

    .line 67
    iget-boolean v0, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->stripPort:Z

    return v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/auth/AuthScheme;
    .locals 2

    .line 63
    new-instance p1, Lorg/apache/http/impl/auth/NegotiateScheme;

    iget-object v0, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    iget-boolean v1, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->stripPort:Z

    invoke-direct {p1, v0, v1}, Lorg/apache/http/impl/auth/NegotiateScheme;-><init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V

    return-object p1
.end method
