.class public Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;
.super Ljava/lang/Object;
.source "DefaultCookieSpecProvider.java"

# interfaces
.implements Lorg/apache/http/cookie/CookieSpecProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;
    }
.end annotation


# instance fields
.field private final compatibilityLevel:Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;

.field private volatile cookieSpec:Lorg/apache/http/cookie/CookieSpec;

.field private final datepatterns:[Ljava/lang/String;

.field private final oneHeader:Z

.field private final publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 85
    sget-object v0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;->DEFAULT:Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v1, v2}, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;-><init>(Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;Lorg/apache/http/conn/util/PublicSuffixMatcher;[Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/util/PublicSuffixMatcher;)V
    .locals 3

    .line 81
    sget-object v0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;->DEFAULT:Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, p1, v1, v2}, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;-><init>(Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;Lorg/apache/http/conn/util/PublicSuffixMatcher;[Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;Lorg/apache/http/conn/util/PublicSuffixMatcher;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 77
    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;-><init>(Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;Lorg/apache/http/conn/util/PublicSuffixMatcher;[Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;Lorg/apache/http/conn/util/PublicSuffixMatcher;[Ljava/lang/String;Z)V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 68
    :cond_0
    sget-object p1, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;->DEFAULT:Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;

    :goto_0
    iput-object p1, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->compatibilityLevel:Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;

    .line 69
    iput-object p2, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;

    .line 70
    iput-object p3, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->datepatterns:[Ljava/lang/String;

    .line 71
    iput-boolean p4, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->oneHeader:Z

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/cookie/CookieSpec;
    .locals 11

    .line 90
    iget-object p1, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->cookieSpec:Lorg/apache/http/cookie/CookieSpec;

    if-nez p1, :cond_3

    .line 91
    monitor-enter p0

    .line 92
    :try_start_0
    iget-object p1, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->cookieSpec:Lorg/apache/http/cookie/CookieSpec;

    if-nez p1, :cond_2

    .line 93
    new-instance p1, Lorg/apache/http/impl/cookie/RFC2965Spec;

    iget-boolean v0, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->oneHeader:Z

    const/16 v1, 0x9

    new-array v1, v1, [Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    new-instance v2, Lorg/apache/http/impl/cookie/RFC2965VersionAttributeHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/RFC2965VersionAttributeHandler;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lorg/apache/http/impl/cookie/BasicPathHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/BasicPathHandler;-><init>()V

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-instance v2, Lorg/apache/http/impl/cookie/RFC2965DomainAttributeHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/RFC2965DomainAttributeHandler;-><init>()V

    iget-object v5, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;

    invoke-static {v2, v5}, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->decorate(Lorg/apache/http/cookie/CommonCookieAttributeHandler;Lorg/apache/http/conn/util/PublicSuffixMatcher;)Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v1, v5

    new-instance v2, Lorg/apache/http/impl/cookie/RFC2965PortAttributeHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/RFC2965PortAttributeHandler;-><init>()V

    const/4 v6, 0x3

    aput-object v2, v1, v6

    new-instance v2, Lorg/apache/http/impl/cookie/BasicMaxAgeHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/BasicMaxAgeHandler;-><init>()V

    const/4 v7, 0x4

    aput-object v2, v1, v7

    new-instance v2, Lorg/apache/http/impl/cookie/BasicSecureHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/BasicSecureHandler;-><init>()V

    const/4 v8, 0x5

    aput-object v2, v1, v8

    new-instance v2, Lorg/apache/http/impl/cookie/BasicCommentHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/BasicCommentHandler;-><init>()V

    const/4 v9, 0x6

    aput-object v2, v1, v9

    new-instance v2, Lorg/apache/http/impl/cookie/RFC2965CommentUrlAttributeHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/RFC2965CommentUrlAttributeHandler;-><init>()V

    const/4 v10, 0x7

    aput-object v2, v1, v10

    new-instance v2, Lorg/apache/http/impl/cookie/RFC2965DiscardAttributeHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/RFC2965DiscardAttributeHandler;-><init>()V

    const/16 v10, 0x8

    aput-object v2, v1, v10

    invoke-direct {p1, v0, v1}, Lorg/apache/http/impl/cookie/RFC2965Spec;-><init>(Z[Lorg/apache/http/cookie/CommonCookieAttributeHandler;)V

    .line 104
    new-instance v0, Lorg/apache/http/impl/cookie/RFC2109Spec;

    iget-boolean v1, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->oneHeader:Z

    new-array v2, v9, [Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    new-instance v9, Lorg/apache/http/impl/cookie/RFC2109VersionHandler;

    invoke-direct {v9}, Lorg/apache/http/impl/cookie/RFC2109VersionHandler;-><init>()V

    aput-object v9, v2, v3

    new-instance v9, Lorg/apache/http/impl/cookie/BasicPathHandler;

    invoke-direct {v9}, Lorg/apache/http/impl/cookie/BasicPathHandler;-><init>()V

    aput-object v9, v2, v4

    new-instance v9, Lorg/apache/http/impl/cookie/RFC2109DomainHandler;

    invoke-direct {v9}, Lorg/apache/http/impl/cookie/RFC2109DomainHandler;-><init>()V

    iget-object v10, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;

    invoke-static {v9, v10}, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->decorate(Lorg/apache/http/cookie/CommonCookieAttributeHandler;Lorg/apache/http/conn/util/PublicSuffixMatcher;)Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    move-result-object v9

    aput-object v9, v2, v5

    new-instance v9, Lorg/apache/http/impl/cookie/BasicMaxAgeHandler;

    invoke-direct {v9}, Lorg/apache/http/impl/cookie/BasicMaxAgeHandler;-><init>()V

    aput-object v9, v2, v6

    new-instance v9, Lorg/apache/http/impl/cookie/BasicSecureHandler;

    invoke-direct {v9}, Lorg/apache/http/impl/cookie/BasicSecureHandler;-><init>()V

    aput-object v9, v2, v7

    new-instance v9, Lorg/apache/http/impl/cookie/BasicCommentHandler;

    invoke-direct {v9}, Lorg/apache/http/impl/cookie/BasicCommentHandler;-><init>()V

    aput-object v9, v2, v8

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/cookie/RFC2109Spec;-><init>(Z[Lorg/apache/http/cookie/CommonCookieAttributeHandler;)V

    .line 112
    new-instance v1, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;

    new-array v2, v8, [Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    new-instance v8, Lorg/apache/http/impl/cookie/BasicDomainHandler;

    invoke-direct {v8}, Lorg/apache/http/impl/cookie/BasicDomainHandler;-><init>()V

    iget-object v9, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;

    invoke-static {v8, v9}, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->decorate(Lorg/apache/http/cookie/CommonCookieAttributeHandler;Lorg/apache/http/conn/util/PublicSuffixMatcher;)Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    move-result-object v8

    aput-object v8, v2, v3

    iget-object v3, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->compatibilityLevel:Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;

    sget-object v8, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;->IE_MEDIUM_SECURITY:Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$CompatibilityLevel;

    if-ne v3, v8, :cond_0

    new-instance v3, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$1;

    invoke-direct {v3, p0}, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider$1;-><init>(Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;)V

    goto :goto_0

    :cond_0
    new-instance v3, Lorg/apache/http/impl/cookie/BasicPathHandler;

    invoke-direct {v3}, Lorg/apache/http/impl/cookie/BasicPathHandler;-><init>()V

    :goto_0
    aput-object v3, v2, v4

    new-instance v3, Lorg/apache/http/impl/cookie/BasicSecureHandler;

    invoke-direct {v3}, Lorg/apache/http/impl/cookie/BasicSecureHandler;-><init>()V

    aput-object v3, v2, v5

    new-instance v3, Lorg/apache/http/impl/cookie/BasicCommentHandler;

    invoke-direct {v3}, Lorg/apache/http/impl/cookie/BasicCommentHandler;-><init>()V

    aput-object v3, v2, v6

    new-instance v3, Lorg/apache/http/impl/cookie/BasicExpiresHandler;

    iget-object v4, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->datepatterns:[Ljava/lang/String;

    if-eqz v4, :cond_1

    invoke-virtual {v4}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    goto :goto_1

    :cond_1
    const-string v4, "EEE, dd-MMM-yy HH:mm:ss z"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-direct {v3, v4}, Lorg/apache/http/impl/cookie/BasicExpiresHandler;-><init>([Ljava/lang/String;)V

    aput-object v3, v2, v7

    invoke-direct {v1, v2}, Lorg/apache/http/impl/cookie/NetscapeDraftSpec;-><init>([Lorg/apache/http/cookie/CommonCookieAttributeHandler;)V

    .line 128
    new-instance v2, Lorg/apache/http/impl/cookie/DefaultCookieSpec;

    invoke-direct {v2, p1, v0, v1}, Lorg/apache/http/impl/cookie/DefaultCookieSpec;-><init>(Lorg/apache/http/impl/cookie/RFC2965Spec;Lorg/apache/http/impl/cookie/RFC2109Spec;Lorg/apache/http/impl/cookie/NetscapeDraftSpec;)V

    iput-object v2, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->cookieSpec:Lorg/apache/http/cookie/CookieSpec;

    .line 130
    :cond_2
    monitor-exit p0

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 132
    :cond_3
    :goto_2
    iget-object p1, p0, Lorg/apache/http/impl/cookie/DefaultCookieSpecProvider;->cookieSpec:Lorg/apache/http/cookie/CookieSpec;

    return-object p1
.end method
