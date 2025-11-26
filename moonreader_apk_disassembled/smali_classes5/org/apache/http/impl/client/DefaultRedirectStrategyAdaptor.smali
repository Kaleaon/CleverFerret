.class Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;
.super Ljava/lang/Object;
.source "DefaultRedirectStrategyAdaptor.java"

# interfaces
.implements Lorg/apache/http/client/RedirectStrategy;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final handler:Lorg/apache/http/client/RedirectHandler;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/RedirectHandler;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->handler:Lorg/apache/http/client/RedirectHandler;

    return-void
.end method


# virtual methods
.method public getHandler()Lorg/apache/http/client/RedirectHandler;
    .locals 1

    .line 81
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->handler:Lorg/apache/http/client/RedirectHandler;

    return-object v0
.end method

.method public getRedirect(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/HttpUriRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->handler:Lorg/apache/http/client/RedirectHandler;

    invoke-interface {v0, p2, p3}, Lorg/apache/http/client/RedirectHandler;->getLocationURI(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/net/URI;

    move-result-object p2

    .line 72
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object p1

    .line 73
    const-string p3, "HEAD"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 74
    new-instance p1, Lorg/apache/http/client/methods/HttpHead;

    invoke-direct {p1, p2}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/net/URI;)V

    return-object p1

    .line 76
    :cond_0
    new-instance p1, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {p1, p2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    return-object p1
.end method

.method public isRedirected(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .line 63
    iget-object p1, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->handler:Lorg/apache/http/client/RedirectHandler;

    invoke-interface {p1, p2, p3}, Lorg/apache/http/client/RedirectHandler;->isRedirectRequested(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result p1

    return p1
.end method
