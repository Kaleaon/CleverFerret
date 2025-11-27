.class public final Lcom/dropbox/core/http/StandardHttpRequestor$Config;
.super Ljava/lang/Object;
.source "StandardHttpRequestor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/http/StandardHttpRequestor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Config"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    }
.end annotation


# static fields
.field public static final DEFAULT_INSTANCE:Lcom/dropbox/core/http/StandardHttpRequestor$Config;


# instance fields
.field private final connectTimeoutMillis:J

.field private final proxy:Ljava/net/Proxy;

.field private final readTimeoutMillis:J

.field private final sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 265
    invoke-static {}, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->builder()Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;->build()Lcom/dropbox/core/http/StandardHttpRequestor$Config;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->DEFAULT_INSTANCE:Lcom/dropbox/core/http/StandardHttpRequestor$Config;

    return-void
.end method

.method private constructor <init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;)V
    .locals 0

    .line 275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 276
    iput-object p1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->proxy:Ljava/net/Proxy;

    .line 277
    iput-wide p2, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->connectTimeoutMillis:J

    .line 278
    iput-wide p4, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->readTimeoutMillis:J

    .line 279
    iput-object p6, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-void
.end method

.method synthetic constructor <init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;Lcom/dropbox/core/http/StandardHttpRequestor$1;)V
    .locals 0

    .line 260
    invoke-direct/range {p0 .. p6}, Lcom/dropbox/core/http/StandardHttpRequestor$Config;-><init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;)V

    return-void
.end method

.method public static builder()Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    .locals 2

    .line 345
    new-instance v0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;-><init>(Lcom/dropbox/core/http/StandardHttpRequestor$1;)V

    return-object v0
.end method


# virtual methods
.method public copy()Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;
    .locals 8

    .line 336
    new-instance v0, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;

    iget-object v1, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->proxy:Ljava/net/Proxy;

    iget-wide v2, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->connectTimeoutMillis:J

    iget-wide v4, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->readTimeoutMillis:J

    iget-object v6, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/http/StandardHttpRequestor$Config$Builder;-><init>(Ljava/net/Proxy;JJLjavax/net/ssl/SSLSocketFactory;Lcom/dropbox/core/http/StandardHttpRequestor$1;)V

    return-object v0
.end method

.method public getConnectTimeoutMillis()J
    .locals 2

    .line 301
    iget-wide v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->connectTimeoutMillis:J

    return-wide v0
.end method

.method public getProxy()Ljava/net/Proxy;
    .locals 1

    .line 288
    iget-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public getReadTimeoutMillis()J
    .locals 2

    .line 314
    iget-wide v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->readTimeoutMillis:J

    return-wide v0
.end method

.method public getSslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 325
    iget-object v0, p0, Lcom/dropbox/core/http/StandardHttpRequestor$Config;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method
