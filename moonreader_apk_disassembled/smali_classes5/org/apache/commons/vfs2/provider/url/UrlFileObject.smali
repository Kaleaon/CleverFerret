.class public Lorg/apache/commons/vfs2/provider/url/UrlFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "UrlFileObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lorg/apache/commons/vfs2/provider/url/UrlFileSystem;",
        ">;"
    }
.end annotation


# instance fields
.field private url:Ljava/net/URL;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/url/UrlFileSystem;Lorg/apache/commons/vfs2/provider/AbstractFileName;)V
    .locals 0

    .line 45
    invoke-direct {p0, p2, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    return-void
.end method


# virtual methods
.method protected createURL(Lorg/apache/commons/vfs2/FileName;)Ljava/net/URL;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Lorg/apache/commons/vfs2/FileSystemException;,
            Lorg/apache/commons/httpclient/URIException;
        }
    .end annotation

    .line 61
    instance-of p1, p1, Lorg/apache/commons/vfs2/provider/URLFileName;

    if-eqz p1, :cond_0

    .line 62
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/URLFileName;

    .line 65
    new-instance v0, Ljava/net/URL;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getURIEncoded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 67
    :cond_0
    new-instance p1, Ljava/net/URL;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    return-object p1
.end method

.method protected doAttach()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->url:Ljava/net/URL;

    if-nez v0, :cond_0

    .line 56
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->createURL(Lorg/apache/commons/vfs2/FileName;)Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->url:Ljava/net/URL;

    :cond_0
    return-void
.end method

.method protected doGetContentSize()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 105
    :try_start_0
    invoke-virtual {v0}, Ljava/net/URLConnection;->getContentLength()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v2, v0

    .line 107
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    return-wide v2

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v0
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 138
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 117
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 119
    :try_start_0
    invoke-virtual {v0}, Ljava/net/URLConnection;->getLastModified()J

    move-result-wide v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    return-wide v2

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 77
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileObject;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :try_start_1
    instance-of v2, v0, Ljava/net/HttpURLConnection;

    if-eqz v2, :cond_0

    .line 81
    check-cast v0, Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v2, 0xc8

    if-eq v2, v0, :cond_0

    .line 84
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    :goto_0
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v0

    .line 88
    :cond_0
    :try_start_3
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 90
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v0
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    .line 93
    :catch_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 130
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "Not implemented."

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
