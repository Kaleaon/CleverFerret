.class public Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;
.super Lorg/apache/http/impl/conn/DefaultRoutePlanner;
.source "DefaultProxyRoutePlanner.java"


# instance fields
.field private final proxy:Lorg/apache/http/HttpHost;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpHost;)V
    .locals 1

    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;-><init>(Lorg/apache/http/HttpHost;Lorg/apache/http/conn/SchemePortResolver;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Lorg/apache/http/conn/SchemePortResolver;)V
    .locals 0

    .line 51
    invoke-direct {p0, p2}, Lorg/apache/http/impl/conn/DefaultRoutePlanner;-><init>(Lorg/apache/http/conn/SchemePortResolver;)V

    .line 52
    const-string p2, "Proxy host"

    invoke-static {p1, p2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/http/HttpHost;

    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;->proxy:Lorg/apache/http/HttpHost;

    return-void
.end method


# virtual methods
.method protected determineProxy(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpHost;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .line 64
    iget-object p1, p0, Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;->proxy:Lorg/apache/http/HttpHost;

    return-object p1
.end method
