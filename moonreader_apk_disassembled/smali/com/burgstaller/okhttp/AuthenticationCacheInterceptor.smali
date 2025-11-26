.class public Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;
.super Ljava/lang/Object;
.source "AuthenticationCacheInterceptor.java"

# interfaces
.implements Lokhttp3/Interceptor;


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


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/burgstaller/okhttp/digest/CachingAuthenticator;",
            ">;)V"
        }
    .end annotation

    .line 32
    new-instance v0, Lcom/burgstaller/okhttp/DefaultCacheKeyProvider;

    invoke-direct {v0}, Lcom/burgstaller/okhttp/DefaultCacheKeyProvider;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;-><init>(Ljava/util/Map;Lcom/burgstaller/okhttp/CacheKeyProvider;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Lcom/burgstaller/okhttp/CacheKeyProvider;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/burgstaller/okhttp/digest/CachingAuthenticator;",
            ">;",
            "Lcom/burgstaller/okhttp/CacheKeyProvider;",
            ")V"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;->authCache:Ljava/util/Map;

    .line 28
    iput-object p2, p0, Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;->cacheKeyProvider:Lcom/burgstaller/okhttp/CacheKeyProvider;

    return-void
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;->cacheKeyProvider:Lcom/burgstaller/okhttp/CacheKeyProvider;

    invoke-interface {v1, v0}, Lcom/burgstaller/okhttp/CacheKeyProvider;->getCachingKey(Lokhttp3/Request;)Ljava/lang/String;

    move-result-object v1

    .line 39
    iget-object v2, p0, Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;->authCache:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/burgstaller/okhttp/digest/CachingAuthenticator;

    .line 41
    invoke-interface {p1}, Lokhttp3/Interceptor$Chain;->connection()Lokhttp3/Connection;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    .line 42
    invoke-interface {v3}, Lokhttp3/Connection;->route()Lokhttp3/Route;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v4

    :goto_0
    if-eqz v2, :cond_1

    .line 44
    invoke-interface {v2, v3, v0}, Lcom/burgstaller/okhttp/digest/CachingAuthenticator;->authenticateWithState(Lokhttp3/Route;Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object v3

    goto :goto_1

    :cond_1
    move-object v3, v4

    :goto_1
    if-nez v3, :cond_2

    move-object v3, v0

    .line 49
    :cond_2
    invoke-interface {p1, v3}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 52
    invoke-virtual {v3}, Lokhttp3/Response;->code()I

    move-result v5

    goto :goto_2

    :cond_3
    const/4 v5, 0x0

    :goto_2
    if-eqz v2, :cond_5

    const/16 v2, 0x191

    if-eq v5, v2, :cond_4

    const/16 v2, 0x197

    if-ne v5, v2, :cond_5

    .line 55
    :cond_4
    iget-object v2, p0, Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;->authCache:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 56
    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/ResponseBody;->close()V

    .line 57
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    move-result-object v1

    const-string v2, "Cached authentication expired. Sending a new request."

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3, v4}, Lokhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V

    .line 59
    invoke-interface {p1, v0}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object p1

    return-object p1

    :cond_5
    return-object v3
.end method
