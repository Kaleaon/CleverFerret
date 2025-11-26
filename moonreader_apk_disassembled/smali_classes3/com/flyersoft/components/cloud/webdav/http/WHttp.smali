.class public Lcom/flyersoft/components/cloud/webdav/http/WHttp;
.super Ljava/lang/Object;
.source "WHttp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/cloud/webdav/http/WHttp$SingletonHelper;
    }
.end annotation


# static fields
.field public static dir400Append:Z


# instance fields
.field private okHttpClient:Lokhttp3/OkHttpClient;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/components/cloud/webdav/http/WHttp-IA;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/cloud/webdav/http/WHttp;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/flyersoft/components/cloud/webdav/http/WHttp;
    .locals 1

    .line 26
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/http/WHttp$SingletonHelper;->-$$Nest$sfgetINSTANCE()Lcom/flyersoft/components/cloud/webdav/http/WHttp;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public client()Lokhttp3/OkHttpClient;
    .locals 6

    .line 30
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->okHttpClient:Lokhttp3/OkHttpClient;

    if-nez v0, :cond_1

    .line 31
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/http/WAuth;->getAuth()Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 33
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 34
    new-instance v2, Lcom/burgstaller/okhttp/digest/Credentials;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;->getPass()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Lcom/burgstaller/okhttp/digest/Credentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    new-instance v0, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;

    invoke-direct {v0, v2}, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;-><init>(Lcom/burgstaller/okhttp/digest/Credentials;)V

    .line 36
    new-instance v3, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;

    invoke-direct {v3, v2}, Lcom/burgstaller/okhttp/digest/DigestAuthenticator;-><init>(Lcom/burgstaller/okhttp/digest/Credentials;)V

    .line 37
    new-instance v2, Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;

    invoke-direct {v2}, Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;-><init>()V

    const-string v4, "digest"

    .line 38
    invoke-virtual {v2, v4, v3}, Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;->with(Ljava/lang/String;Lokhttp3/Authenticator;)Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;

    move-result-object v2

    const-string v3, "basic"

    .line 39
    invoke-virtual {v2, v3, v0}, Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;->with(Ljava/lang/String;Lokhttp3/Authenticator;)Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;

    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/burgstaller/okhttp/DispatchingAuthenticator$Builder;->build()Lcom/burgstaller/okhttp/DispatchingAuthenticator;

    move-result-object v0

    .line 41
    new-instance v2, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v2}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    new-instance v3, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;

    invoke-direct {v3, v0, v1}, Lcom/burgstaller/okhttp/CachingAuthenticatorDecorator;-><init>(Lokhttp3/Authenticator;Ljava/util/Map;)V

    .line 42
    invoke-virtual {v2, v3}, Lokhttp3/OkHttpClient$Builder;->authenticator(Lokhttp3/Authenticator;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v2, Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;

    invoke-direct {v2, v1}, Lcom/burgstaller/okhttp/AuthenticationCacheInterceptor;-><init>(Ljava/util/Map;)V

    .line 43
    invoke-virtual {v0, v2}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide/16 v1, 0x3

    .line 44
    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v3, v4, v5}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 45
    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->okHttpClient:Lokhttp3/OkHttpClient;

    goto :goto_0

    .line 48
    :cond_0
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->okHttpClient:Lokhttp3/OkHttpClient;

    .line 50
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->okHttpClient:Lokhttp3/OkHttpClient;

    return-object v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x0

    .line 55
    iput-object v0, p0, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->okHttpClient:Lokhttp3/OkHttpClient;

    const/4 v0, 0x0

    .line 56
    sput-boolean v0, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->dir400Append:Z

    return-void
.end method
