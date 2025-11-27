.class Lorg/apache/commons/vfs2/impl/URLStreamHandlerProxy;
.super Ljava/net/URLStreamHandler;
.source "URLStreamHandlerProxy.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/net/URLStreamHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 32
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    return-object p1
.end method

.method protected parseURL(Ljava/net/URL;Ljava/lang/String;II)V
    .locals 11

    .line 38
    :try_start_0
    new-instance p3, Ljava/net/URL;

    invoke-direct {p3, p1, p2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 39
    invoke-virtual {p3}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3}, Ljava/net/URL;->getPort()I

    move-result v5

    invoke-virtual {p3}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v7

    .line 40
    invoke-virtual {p3}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p3}, Ljava/net/URL;->getRef()Ljava/lang/String;

    move-result-object v10

    move-object v1, p0

    move-object v2, p1

    .line 39
    invoke-virtual/range {v1 .. v10}, Lorg/apache/commons/vfs2/impl/URLStreamHandlerProxy;->setURL(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 44
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Ljava/net/MalformedURLException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
