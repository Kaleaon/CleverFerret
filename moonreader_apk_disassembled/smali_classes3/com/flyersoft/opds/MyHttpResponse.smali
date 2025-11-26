.class public Lcom/flyersoft/opds/MyHttpResponse;
.super Ljava/lang/Object;
.source "MyHttpResponse.java"


# instance fields
.field public errorMsg:Ljava/lang/String;

.field public html:Ljava/lang/String;

.field public statusCode:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createMyHttpResponse(Lorg/apache/http/HttpResponse;)Lcom/flyersoft/opds/MyHttpResponse;
    .locals 8

    .line 22
    new-instance v0, Lcom/flyersoft/opds/MyHttpResponse;

    invoke-direct {v0}, Lcom/flyersoft/opds/MyHttpResponse;-><init>()V

    const/4 v1, -0x1

    .line 23
    iput v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->statusCode:I

    .line 26
    :try_start_0
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->statusCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 32
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 35
    :goto_0
    iget v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->statusCode:I

    const/16 v2, 0x191

    if-eq v1, v2, :cond_3

    .line 38
    :try_start_1
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_1
    if-ge v3, v2, :cond_1

    aget-object v5, v1, v3

    .line 39
    invoke-interface {v5}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Content-Encoding"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 40
    invoke-interface {v5}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    const-string v6, "gzip"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v4, 0x1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 42
    :cond_1
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p0

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object p0

    if-eqz v4, :cond_2

    .line 44
    new-instance v1, Ljava/util/zip/GZIPInputStream;

    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    move-object p0, v1

    .line 45
    :cond_2
    invoke-static {p0}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lcom/flyersoft/opds/MyHttpResponse;->html:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p0

    .line 47
    invoke-static {p0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->errorMsg:Ljava/lang/String;

    .line 48
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    return-object v0
.end method

.method public static createUrlsConnectionResponse(Ljava/net/HttpURLConnection;)Lcom/flyersoft/opds/MyHttpResponse;
    .locals 3

    .line 55
    new-instance v0, Lcom/flyersoft/opds/MyHttpResponse;

    invoke-direct {v0}, Lcom/flyersoft/opds/MyHttpResponse;-><init>()V

    .line 57
    :try_start_0
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->statusCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 59
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 62
    :goto_0
    iget v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->statusCode:I

    const/16 v2, 0x191

    if-eq v1, v2, :cond_2

    const/16 v2, 0x190

    if-lt v1, v2, :cond_0

    const/16 v2, 0x258

    if-ge v1, v2, :cond_0

    .line 65
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, v0, Lcom/flyersoft/opds/MyHttpResponse;->statusCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lcom/flyersoft/opds/MyHttpResponse;->errorMsg:Ljava/lang/String;

    goto :goto_1

    .line 67
    :cond_0
    const-string v1, "Content-Encoding"

    const-string v2, "gzip"

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 68
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    if-eqz v1, :cond_1

    .line 70
    new-instance v1, Ljava/util/zip/GZIPInputStream;

    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    move-object p0, v1

    .line 71
    :cond_1
    invoke-static {p0}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lcom/flyersoft/opds/MyHttpResponse;->html:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    .line 74
    invoke-static {p0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/opds/MyHttpResponse;->errorMsg:Ljava/lang/String;

    .line 75
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    return-object v0
.end method
