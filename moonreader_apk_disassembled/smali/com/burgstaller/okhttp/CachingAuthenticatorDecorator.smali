.class public Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;
.super Ljava/lang/Object;
.source "CachingAuthenticatorDecorator.java"

# interfaces
.implements Lokhttp3/Authenticator;


# instance fields
.field private final authCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/burgstaller/okhttp/digest/CachingAuthenticator;",
            ">;"
        }
    .end annotation
.end field

.field private final cacheKeyProvider:Lcom/burgstaller/okhttp/CacheKeyProvider;

.field private final innerAuthenticator:Lokhttp3/Authenticator;


# direct methods
.method public constructor <init>(Lokhttp3/Authenticator;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Authenticator;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/burgstaller/okhttp/digest/CachingAuthenticator;",
            ">;)V"
        }
    .end annotation

    .line 30
    new-instance v0, Lcom/burgstaller/okhttp/DefaultCacheKeyProvider;

    invoke-direct {v0}, Lcom/burgstaller/okhttp/DefaultCacheKeyProvider;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;-><init>(Lokhttp3/Authenticator;Ljava/util/Map;Lcom/burgstaller/okhttp/CacheKeyProvider;)V

    return-void
.end method

.method public constructor <init>(Lokhttp3/Authenticator;Ljava/util/Map;Lcom/burgstaller/okhttp/CacheKeyProvider;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokhttp3/Authenticator;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/burgstaller/okhttp/digest/CachingAuthenticator;",
            ">;",
            "Lcom/burgstaller/okhttp/CacheKeyProvider;",
            ")V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;->innerAuthenticator:Lokhttp3/Authenticator;

    .line 25
    iput-object p2, p0, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;->authCache:Ljava/util/Map;

    .line 26
    iput-object p3, p0, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;->cacheKeyProvider:Lcom/burgstaller/okhttp/CacheKeyProvider;

    return-void
.end method


# virtual methods
.method public authenticate(Lokhttp3/Route;Lokhttp3/Response;)Lokhttp3/Request;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;->innerAuthenticator:Lokhttp3/Authenticator;

    invoke-interface {v0, p1, p2}, Lokhttp3/Authenticator;->authenticate(Lokhttp3/Route;Lokhttp3/Response;)Lokhttp3/Request;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 37
    const-string p2, "Authorization"

    invoke-virtual {p1, p2}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 38
    iget-object p2, p0, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;->innerAuthenticator:Lokhttp3/Authenticator;

    instance-of p2, p2, Lcom/burgstaller/okhttp/digest/CachingAuthenticator;

    if-eqz p2, :cond_0

    .line 39
    iget-object p2, p0, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;->cacheKeyProvider:Lcom/burgstaller/okhttp/CacheKeyProvider;

    invoke-interface {p2, p1}, Lcom/burgstaller/okhttp/CacheKeyProvider;->getCachingKey(Lokhttp3/Request;)Ljava/lang/String;

    move-result-object p2

    .line 40
    iget-object v0, p0, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;->authCache:Ljava/util/Map;

    iget-object v1, p0, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;->innerAuthenticator:Lokhttp3/Authenticator;

    check-cast v1, Lcom/burgstaller/okhttp/digest/CachingAuthenticator;

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object p1
.end method
