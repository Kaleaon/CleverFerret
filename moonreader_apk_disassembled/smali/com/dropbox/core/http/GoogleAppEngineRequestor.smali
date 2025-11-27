.class public Lcom/dropbox/core/http/GoogleAppEngineRequestor;
.super Lcom/dropbox/core/http/HttpRequestor;
.source "GoogleAppEngineRequestor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/http/GoogleAppEngineRequestor$FetchServiceUploader;
    }
.end annotation


# instance fields
.field private final options:Lcom/google/appengine/api/urlfetch/FetchOptions;

.field private final service:Lcom/google/appengine/api/urlfetch/URLFetchService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-static {}, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->newDefaultOptions()Lcom/google/appengine/api/urlfetch/FetchOptions;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/dropbox/core/http/GoogleAppEngineRequestor;-><init>(Lcom/google/appengine/api/urlfetch/FetchOptions;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/appengine/api/urlfetch/FetchOptions;)V
    .locals 1

    .line 51
    invoke-static {}, Lcom/google/appengine/api/urlfetch/URLFetchServiceFactory;->getURLFetchService()Lcom/google/appengine/api/urlfetch/URLFetchService;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/http/GoogleAppEngineRequestor;-><init>(Lcom/google/appengine/api/urlfetch/FetchOptions;Lcom/google/appengine/api/urlfetch/URLFetchService;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/appengine/api/urlfetch/FetchOptions;Lcom/google/appengine/api/urlfetch/URLFetchService;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lcom/dropbox/core/http/HttpRequestor;-><init>()V

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 57
    iput-object p1, p0, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->options:Lcom/google/appengine/api/urlfetch/FetchOptions;

    .line 58
    iput-object p2, p0, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->service:Lcom/google/appengine/api/urlfetch/URLFetchService;

    return-void

    .line 56
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "service"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 55
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "options"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/google/appengine/api/urlfetch/HTTPResponse;)Lcom/dropbox/core/http/HttpRequestor$Response;
    .locals 0

    .line 42
    invoke-static {p0}, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->toRequestorResponse(Lcom/google/appengine/api/urlfetch/HTTPResponse;)Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object p0

    return-object p0
.end method

.method public static newDefaultOptions()Lcom/google/appengine/api/urlfetch/FetchOptions;
    .locals 5

    .line 103
    invoke-static {}, Lcom/google/appengine/api/urlfetch/FetchOptions$Builder;->withDefaults()Lcom/google/appengine/api/urlfetch/FetchOptions;

    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/google/appengine/api/urlfetch/FetchOptions;->validateCertificate()Lcom/google/appengine/api/urlfetch/FetchOptions;

    move-result-object v0

    .line 105
    invoke-virtual {v0}, Lcom/google/appengine/api/urlfetch/FetchOptions;->doNotFollowRedirects()Lcom/google/appengine/api/urlfetch/FetchOptions;

    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lcom/google/appengine/api/urlfetch/FetchOptions;->disallowTruncate()Lcom/google/appengine/api/urlfetch/FetchOptions;

    move-result-object v0

    sget-wide v1, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->DEFAULT_CONNECT_TIMEOUT_MILLIS:J

    sget-wide v3, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->DEFAULT_READ_TIMEOUT_MILLIS:J

    add-long/2addr v1, v3

    long-to-double v1, v1

    const-wide v3, 0x408f400000000000L    # 1000.0

    div-double/2addr v1, v3

    .line 108
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/appengine/api/urlfetch/FetchOptions;->setDeadline(Ljava/lang/Double;)Lcom/google/appengine/api/urlfetch/FetchOptions;

    move-result-object v0

    return-object v0
.end method

.method private newRequest(Ljava/lang/String;Lcom/google/appengine/api/urlfetch/HTTPMethod;Ljava/lang/Iterable;)Lcom/google/appengine/api/urlfetch/HTTPRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/appengine/api/urlfetch/HTTPMethod;",
            "Ljava/lang/Iterable<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/google/appengine/api/urlfetch/HTTPRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    new-instance v0, Lcom/google/appengine/api/urlfetch/HTTPRequest;

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->options:Lcom/google/appengine/api/urlfetch/FetchOptions;

    invoke-direct {v0, v1, p2, p1}, Lcom/google/appengine/api/urlfetch/HTTPRequest;-><init>(Ljava/net/URL;Lcom/google/appengine/api/urlfetch/HTTPMethod;Lcom/google/appengine/api/urlfetch/FetchOptions;)V

    .line 90
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/dropbox/core/http/HttpRequestor$Header;

    .line 91
    new-instance p3, Lcom/google/appengine/api/urlfetch/HTTPHeader;

    invoke-virtual {p2}, Lcom/dropbox/core/http/HttpRequestor$Header;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/dropbox/core/http/HttpRequestor$Header;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p3, v1, p2}, Lcom/google/appengine/api/urlfetch/HTTPHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Lcom/google/appengine/api/urlfetch/HTTPRequest;->addHeader(Lcom/google/appengine/api/urlfetch/HTTPHeader;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static toRequestorResponse(Lcom/google/appengine/api/urlfetch/HTTPResponse;)Lcom/dropbox/core/http/HttpRequestor$Response;
    .locals 5

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 113
    invoke-virtual {p0}, Lcom/google/appengine/api/urlfetch/HTTPResponse;->getHeadersUncombined()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/appengine/api/urlfetch/HTTPHeader;

    .line 114
    invoke-virtual {v2}, Lcom/google/appengine/api/urlfetch/HTTPHeader;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-nez v3, :cond_0

    .line 116
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 117
    invoke-virtual {v2}, Lcom/google/appengine/api/urlfetch/HTTPHeader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    :cond_0
    invoke-virtual {v2}, Lcom/google/appengine/api/urlfetch/HTTPHeader;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 122
    :cond_1
    new-instance v1, Lcom/dropbox/core/http/HttpRequestor$Response;

    invoke-virtual {p0}, Lcom/google/appengine/api/urlfetch/HTTPResponse;->getResponseCode()I

    move-result v2

    new-instance v3, Ljava/io/ByteArrayInputStream;

    .line 123
    invoke-virtual {p0}, Lcom/google/appengine/api/urlfetch/HTTPResponse;->getContent()[B

    move-result-object p0

    invoke-direct {v3, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, v2, v3, v0}, Lcom/dropbox/core/http/HttpRequestor$Response;-><init>(ILjava/io/InputStream;Ljava/util/Map;)V

    return-object v1
.end method


# virtual methods
.method public doGet(Ljava/lang/String;Ljava/lang/Iterable;)Lcom/dropbox/core/http/HttpRequestor$Response;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/http/HttpRequestor$Response;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    sget-object v0, Lcom/google/appengine/api/urlfetch/HTTPMethod;->GET:Lcom/google/appengine/api/urlfetch/HTTPMethod;

    invoke-direct {p0, p1, v0, p2}, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->newRequest(Ljava/lang/String;Lcom/google/appengine/api/urlfetch/HTTPMethod;Ljava/lang/Iterable;)Lcom/google/appengine/api/urlfetch/HTTPRequest;

    move-result-object p1

    .line 72
    iget-object p2, p0, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->service:Lcom/google/appengine/api/urlfetch/URLFetchService;

    invoke-interface {p2, p1}, Lcom/google/appengine/api/urlfetch/URLFetchService;->fetch(Lcom/google/appengine/api/urlfetch/HTTPRequest;)Lcom/google/appengine/api/urlfetch/HTTPResponse;

    move-result-object p1

    .line 73
    invoke-static {p1}, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->toRequestorResponse(Lcom/google/appengine/api/urlfetch/HTTPResponse;)Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object p1

    return-object p1
.end method

.method public getOptions()Lcom/google/appengine/api/urlfetch/FetchOptions;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->options:Lcom/google/appengine/api/urlfetch/FetchOptions;

    return-object v0
.end method

.method public getService()Lcom/google/appengine/api/urlfetch/URLFetchService;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->service:Lcom/google/appengine/api/urlfetch/URLFetchService;

    return-object v0
.end method

.method public startPost(Ljava/lang/String;Ljava/lang/Iterable;)Lcom/dropbox/core/http/HttpRequestor$Uploader;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/http/HttpRequestor$Uploader;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    sget-object v0, Lcom/google/appengine/api/urlfetch/HTTPMethod;->POST:Lcom/google/appengine/api/urlfetch/HTTPMethod;

    invoke-direct {p0, p1, v0, p2}, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->newRequest(Ljava/lang/String;Lcom/google/appengine/api/urlfetch/HTTPMethod;Ljava/lang/Iterable;)Lcom/google/appengine/api/urlfetch/HTTPRequest;

    move-result-object p1

    .line 79
    new-instance p2, Lcom/dropbox/core/http/GoogleAppEngineRequestor$FetchServiceUploader;

    iget-object v0, p0, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->service:Lcom/google/appengine/api/urlfetch/URLFetchService;

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-direct {p2, v0, p1, v1}, Lcom/dropbox/core/http/GoogleAppEngineRequestor$FetchServiceUploader;-><init>(Lcom/google/appengine/api/urlfetch/URLFetchService;Lcom/google/appengine/api/urlfetch/HTTPRequest;Ljava/io/ByteArrayOutputStream;)V

    return-object p2
.end method

.method public startPut(Ljava/lang/String;Ljava/lang/Iterable;)Lcom/dropbox/core/http/HttpRequestor$Uploader;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/http/HttpRequestor$Uploader;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    sget-object v0, Lcom/google/appengine/api/urlfetch/HTTPMethod;->POST:Lcom/google/appengine/api/urlfetch/HTTPMethod;

    invoke-direct {p0, p1, v0, p2}, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->newRequest(Ljava/lang/String;Lcom/google/appengine/api/urlfetch/HTTPMethod;Ljava/lang/Iterable;)Lcom/google/appengine/api/urlfetch/HTTPRequest;

    move-result-object p1

    .line 85
    new-instance p2, Lcom/dropbox/core/http/GoogleAppEngineRequestor$FetchServiceUploader;

    iget-object v0, p0, Lcom/dropbox/core/http/GoogleAppEngineRequestor;->service:Lcom/google/appengine/api/urlfetch/URLFetchService;

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-direct {p2, v0, p1, v1}, Lcom/dropbox/core/http/GoogleAppEngineRequestor$FetchServiceUploader;-><init>(Lcom/google/appengine/api/urlfetch/URLFetchService;Lcom/google/appengine/api/urlfetch/HTTPRequest;Ljava/io/ByteArrayOutputStream;)V

    return-object p2
.end method
