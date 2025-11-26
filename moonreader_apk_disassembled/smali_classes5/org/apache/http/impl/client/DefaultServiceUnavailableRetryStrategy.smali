.class public Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;
.super Ljava/lang/Object;
.source "DefaultServiceUnavailableRetryStrategy.java"

# interfaces
.implements Lorg/apache/http/client/ServiceUnavailableRetryStrategy;


# instance fields
.field private final maxRetries:I

.field private final retryInterval:J


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x1

    const/16 v1, 0x3e8

    .line 69
    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const-string v0, "Max retries"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 63
    const-string v0, "Retry interval"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 64
    iput p1, p0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;->maxRetries:I

    int-to-long p1, p2

    .line 65
    iput-wide p1, p0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;->retryInterval:J

    return-void
.end method


# virtual methods
.method public getRetryInterval()J
    .locals 2

    .line 80
    iget-wide v0, p0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;->retryInterval:J

    return-wide v0
.end method

.method public retryRequest(Lorg/apache/http/HttpResponse;ILorg/apache/http/protocol/HttpContext;)Z
    .locals 0

    .line 74
    iget p3, p0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;->maxRetries:I

    if-gt p2, p3, :cond_0

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result p1

    const/16 p2, 0x1f7

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
