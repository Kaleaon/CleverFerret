.class public Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;
.super Ljava/lang/Object;
.source "PublicSuffixDomainFilter.java"

# interfaces
.implements Lorg/apache/http/cookie/CommonCookieAttributeHandler;


# instance fields
.field private final handler:Lorg/apache/http/cookie/CommonCookieAttributeHandler;

.field private final localDomainMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;


# direct methods
.method public constructor <init>(Lorg/apache/http/cookie/CommonCookieAttributeHandler;Lorg/apache/http/conn/util/PublicSuffixList;)V
    .locals 1

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const-string v0, "Cookie handler"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    const-string v0, "Public suffix list"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->handler:Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    .line 83
    new-instance p1, Lorg/apache/http/conn/util/PublicSuffixMatcher;

    invoke-virtual {p2}, Lorg/apache/http/conn/util/PublicSuffixList;->getRules()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p2}, Lorg/apache/http/conn/util/PublicSuffixList;->getExceptions()Ljava/util/List;

    move-result-object p2

    invoke-direct {p1, v0, p2}, Lorg/apache/http/conn/util/PublicSuffixMatcher;-><init>(Ljava/util/Collection;Ljava/util/Collection;)V

    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;

    .line 84
    invoke-static {}, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->createLocalDomainMap()Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->localDomainMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/cookie/CommonCookieAttributeHandler;Lorg/apache/http/conn/util/PublicSuffixMatcher;)V
    .locals 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const-string v0, "Cookie handler"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->handler:Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    .line 74
    const-string p1, "Public suffix matcher"

    invoke-static {p2, p1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/http/conn/util/PublicSuffixMatcher;

    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;

    .line 75
    invoke-static {}, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->createLocalDomainMap()Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->localDomainMap:Ljava/util/Map;

    return-void
.end method

.method private static createLocalDomainMap()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 62
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 63
    const-string v1, ".localhost."

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const-string v1, ".test."

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v1, ".local."

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const-string v1, ".local"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v1, ".localdomain"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public static decorate(Lorg/apache/http/cookie/CommonCookieAttributeHandler;Lorg/apache/http/conn/util/PublicSuffixMatcher;)Lorg/apache/http/cookie/CommonCookieAttributeHandler;
    .locals 1

    .line 131
    const-string v0, "Cookie attribute handler"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    if-eqz p1, :cond_0

    .line 132
    new-instance v0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;

    invoke-direct {v0, p0, p1}, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;-><init>(Lorg/apache/http/cookie/CommonCookieAttributeHandler;Lorg/apache/http/conn/util/PublicSuffixMatcher;)V

    return-object v0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public getAttributeName()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->handler:Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    invoke-interface {v0}, Lorg/apache/http/cookie/CommonCookieAttributeHandler;->getAttributeName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z
    .locals 4

    .line 92
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/16 v2, 0x2e

    .line 96
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_1

    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 99
    iget-object v3, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->localDomainMap:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 100
    iget-object v2, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;

    invoke-virtual {v2, v0}, Lorg/apache/http/conn/util/PublicSuffixMatcher;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 105
    :cond_1
    invoke-virtual {p2}, Lorg/apache/http/cookie/CookieOrigin;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 106
    iget-object v2, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->publicSuffixMatcher:Lorg/apache/http/conn/util/PublicSuffixMatcher;

    invoke-virtual {v2, v0}, Lorg/apache/http/conn/util/PublicSuffixMatcher;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 111
    :cond_2
    iget-object v0, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->handler:Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    invoke-interface {v0, p1, p2}, Lorg/apache/http/cookie/CommonCookieAttributeHandler;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result p1

    return p1
.end method

.method public parse(Lorg/apache/http/cookie/SetCookie;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->handler:Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    invoke-interface {v0, p1, p2}, Lorg/apache/http/cookie/CommonCookieAttributeHandler;->parse(Lorg/apache/http/cookie/SetCookie;Ljava/lang/String;)V

    return-void
.end method

.method public validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lorg/apache/http/impl/cookie/PublicSuffixDomainFilter;->handler:Lorg/apache/http/cookie/CommonCookieAttributeHandler;

    invoke-interface {v0, p1, p2}, Lorg/apache/http/cookie/CommonCookieAttributeHandler;->validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V

    return-void
.end method
