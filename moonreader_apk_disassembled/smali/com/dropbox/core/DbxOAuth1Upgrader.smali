.class public final Lcom/dropbox/core/DbxOAuth1Upgrader;
.super Ljava/lang/Object;
.source "DbxOAuth1Upgrader.java"


# static fields
.field public static final ResponseReader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final appInfo:Lcom/dropbox/core/DbxAppInfo;

.field private final requestConfig:Lcom/dropbox/core/DbxRequestConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 120
    new-instance v0, Lcom/dropbox/core/DbxOAuth1Upgrader$3;

    invoke-direct {v0}, Lcom/dropbox/core/DbxOAuth1Upgrader$3;-><init>()V

    sput-object v0, Lcom/dropbox/core/DbxOAuth1Upgrader;->ResponseReader:Lcom/dropbox/core/json/JsonReader;

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxAppInfo;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 37
    iput-object p1, p0, Lcom/dropbox/core/DbxOAuth1Upgrader;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/DbxOAuth1Upgrader;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    return-void

    .line 35
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'appInfo\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 34
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'requestConfig\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private buildOAuth1Header(Lcom/dropbox/core/DbxOAuth1AccessToken;)Ljava/lang/String;
    .locals 2

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OAuth oauth_version=\"1.0\", oauth_signature_method=\"PLAINTEXT\", oauth_consumer_key=\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    iget-object v1, p0, Lcom/dropbox/core/DbxOAuth1Upgrader;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    invoke-virtual {v1}, Lcom/dropbox/core/DbxAppInfo;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/dropbox/core/DbxOAuth1Upgrader;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\", oauth_token=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {p1}, Lcom/dropbox/core/DbxOAuth1AccessToken;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/dropbox/core/DbxOAuth1Upgrader;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\", oauth_signature=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    iget-object v1, p0, Lcom/dropbox/core/DbxOAuth1Upgrader;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    invoke-virtual {v1}, Lcom/dropbox/core/DbxAppInfo;->getSecret()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/dropbox/core/DbxOAuth1Upgrader;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxOAuth1AccessToken;->getSecret()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/dropbox/core/DbxOAuth1Upgrader;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 110
    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 113
    const-string v0, "UTF-8 should always be supported"

    invoke-static {v0, p0}, Lcom/dropbox/core/util/LangUtil;->mkAssert(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
.end method

.method private getHeaders(Lcom/dropbox/core/DbxOAuth1AccessToken;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/DbxOAuth1AccessToken;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;"
        }
    .end annotation

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 93
    new-instance v1, Lcom/dropbox/core/http/HttpRequestor$Header;

    const-string v2, "Authorization"

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxOAuth1Upgrader;->buildOAuth1Header(Lcom/dropbox/core/DbxOAuth1AccessToken;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, v2, p1}, Lcom/dropbox/core/http/HttpRequestor$Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method


# virtual methods
.method public createOAuth2AccessToken(Lcom/dropbox/core/DbxOAuth1AccessToken;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 49
    iget-object v0, p0, Lcom/dropbox/core/DbxOAuth1Upgrader;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v1, p0, Lcom/dropbox/core/DbxOAuth1Upgrader;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    .line 52
    invoke-virtual {v1}, Lcom/dropbox/core/DbxAppInfo;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    .line 55
    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxOAuth1Upgrader;->getHeaders(Lcom/dropbox/core/DbxOAuth1AccessToken;)Ljava/util/ArrayList;

    move-result-object v5

    new-instance v6, Lcom/dropbox/core/DbxOAuth1Upgrader$1;

    invoke-direct {v6, p0}, Lcom/dropbox/core/DbxOAuth1Upgrader$1;-><init>(Lcom/dropbox/core/DbxOAuth1Upgrader;)V

    .line 49
    const-string v1, "Dropbox-Java-SDK"

    const-string v3, "1/oauth2/token_from_oauth1"

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lcom/dropbox/core/DbxRequestUtil;->doPostNoAuth(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 48
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\'token\' can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public disableOAuth1AccessToken(Lcom/dropbox/core/DbxOAuth1AccessToken;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 73
    iget-object v0, p0, Lcom/dropbox/core/DbxOAuth1Upgrader;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v1, p0, Lcom/dropbox/core/DbxOAuth1Upgrader;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    .line 76
    invoke-virtual {v1}, Lcom/dropbox/core/DbxAppInfo;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    .line 79
    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxOAuth1Upgrader;->getHeaders(Lcom/dropbox/core/DbxOAuth1AccessToken;)Ljava/util/ArrayList;

    move-result-object v5

    new-instance v6, Lcom/dropbox/core/DbxOAuth1Upgrader$2;

    invoke-direct {v6, p0}, Lcom/dropbox/core/DbxOAuth1Upgrader$2;-><init>(Lcom/dropbox/core/DbxOAuth1Upgrader;)V

    .line 73
    const-string v1, "Dropbox-Java-SDK"

    const-string v3, "1/disable_access_token"

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lcom/dropbox/core/DbxRequestUtil;->doPostNoAuth(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    return-void

    .line 72
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\'token\' can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
