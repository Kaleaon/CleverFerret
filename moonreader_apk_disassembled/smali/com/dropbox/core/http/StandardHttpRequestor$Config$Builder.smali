.class public final Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
.super Ljava/lang/Object;
.source "StandardHttpRequestor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/http/StandardHttpRequestor$Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private connectTimeoutMillis:J

.field private proxy:Ljava/net/Proxy;

.field private readTimeoutMillis:J

.field private sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method private constructor <init>()V
    .locals 7

    .line 358
    sget-object v1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    sget-wide v2, Lcom/dropbox/core/http/HttpRequestor;->DEFAULT_CONNECT_TIMEOUT_MILLIS:J

    sget-wide v4, Lcom/dropbox/core/http/HttpRequestor;->DEFAULT_READ_TIMEOUT_MILLIS:J

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;-><init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dropbox/core/http/StandardHttpRequestor$1;)V
    .locals 0

    .line 351
    invoke-direct {p0}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;-><init>()V

    return-void
.end method

.method private constructor <init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;)V
    .locals 0

    .line 361
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 362
    iput-object p1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->proxy:Ljava/net/Proxy;

    .line 363
    iput-wide p2, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->connectTimeoutMillis:J

    .line 364
    iput-wide p4, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->readTimeoutMillis:J

    .line 365
    iput-object p6, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-void
.end method

.method synthetic constructor <init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;Lcom/dropbox/core/http/StandardHttpRequestor$1;)V
    .locals 0

    .line 351
    invoke-direct/range {p0 .. p6}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;-><init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;)V

    return-void
.end method

.method private static checkTimeoutMillis(JLjava/util/concurrent/TimeUnit;)J
    .locals 3

    if-eqz p2, :cond_2

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_1

    .line 481
    invoke-virtual {p2, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p0

    const-wide/32 v0, 0x7fffffff

    cmp-long p2, v0, p0

    if-ltz p2, :cond_0

    return-wide p0

    .line 483
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "timeout too large, must be less than: 2147483647"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 479
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "timeout must be non-negative"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 476
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "unit"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public build()Lcom/dropbox/core/http/StandardHttpRequestor$Config;
    .locals 8

    .line 466
    new-instance v0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;

    iget-object v1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->proxy:Ljava/net/Proxy;

    iget-wide v2, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->connectTimeoutMillis:J

    iget-wide v4, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->readTimeoutMillis:J

    iget-object v6, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/http/StandardHttpRequestor$Config;-><init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;Lcom/dropbox/core/http/StandardHttpRequestor$1;)V

    return-object v0
.end method

.method public withConnectTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    .locals 0

    .line 409
    invoke-static {p1, p2, p3}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->checkTimeoutMillis(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->connectTimeoutMillis:J

    return-object p0
.end method

.method public withNoConnectTimeout()Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    .locals 3

    const-wide/16 v0, 0x0

    .line 392
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->withConnectTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;

    move-result-object v0

    return-object v0
.end method

.method public withNoReadTimeout()Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    .locals 3

    const-wide/16 v0, 0x0

    .line 419
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->withReadTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;

    move-result-object v0

    return-object v0
.end method

.method public withProxy(Ljava/net/Proxy;)Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    .locals 1

    if-eqz p1, :cond_0

    .line 381
    iput-object p1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->proxy:Ljava/net/Proxy;

    return-object p0

    .line 379
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "proxy"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public withReadTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    .locals 0

    .line 441
    invoke-static {p1, p2, p3}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->checkTimeoutMillis(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->readTimeoutMillis:J

    return-object p0
.end method

.method public withSslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    .locals 0

    .line 456
    iput-object p1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-object p0
.end method
