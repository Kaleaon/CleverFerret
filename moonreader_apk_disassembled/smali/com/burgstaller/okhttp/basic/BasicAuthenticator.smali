.class public Lcom/burgstaller/okhttp/basic/BasicAuthenticator;
.super Ljava/lang/Object;
.source "BasicAuthenticator.java"

# interfaces
.implements Lcom/burgstaller/okhttp/digest/CachingAuthenticator;


# instance fields
.field private final credentials:Lcom/burgstaller/okhttp/digest/Credentials;

.field private proxy:Z


# direct methods
.method public constructor <init>(Lcom/burgstaller/okhttp/digest/Credentials;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;->credentials:Lcom/burgstaller/okhttp/digest/Credentials;

    return-void
.end method

.method private authFromRequest(Lokhttp3/Request;)Lokhttp3/Request;
    .locals 3

    .line 35
    iget-boolean v0, p0, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;->proxy:Z

    if-eqz v0, :cond_0

    const-string v0, "Proxy-Authorization"

    goto :goto_0

    :cond_0
    const-string v0, "Authorization"

    .line 37
    :goto_0
    invoke-virtual {p1, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 38
    const-string v2, "Basic"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 39
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    move-result-object p1

    const-string v0, "Previous basic authentication failed, returning null"

    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lokhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V

    return-object v2

    .line 42
    :cond_1
    iget-object v1, p0, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;->credentials:Lcom/burgstaller/okhttp/digest/Credentials;

    invoke-virtual {v1}, Lcom/burgstaller/okhttp/digest/Credentials;->getUserName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;->credentials:Lcom/burgstaller/okhttp/digest/Credentials;

    invoke-virtual {v2}, Lcom/burgstaller/okhttp/digest/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lokhttp3/Credentials;->basic(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 43
    invoke-virtual {p1}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object p1

    .line 44
    invoke-virtual {p1, v0, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public authenticate(Lokhttp3/Route;Lokhttp3/Response;)Lokhttp3/Request;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 28
    invoke-virtual {p2}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object p1

    .line 29
    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result p2

    const/16 v0, 0x197

    if-ne p2, v0, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iput-boolean p2, p0, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;->proxy:Z

    .line 30
    invoke-direct {p0, p1}, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;->authFromRequest(Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object p1

    return-object p1
.end method

.method public authenticateWithState(Lokhttp3/Route;Lokhttp3/Request;)Lokhttp3/Request;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    invoke-direct {p0, p2}, Lcom/burgstaller/okhttp/basic/BasicAuthenticator;->authFromRequest(Lokhttp3/Request;)Lokhttp3/Request;

    move-result-object p1

    return-object p1
.end method
