.class public Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
.source "HttpFileSystemConfigBuilder.java"


# static fields
.field private static final BUILDER:Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

.field private static final DEFAULT_CONNECTION_TIMEOUT:I = 0x0

.field private static final DEFAULT_FOLLOW_REDIRECT:Z = true

.field private static final DEFAULT_MAX_CONNECTIONS:I = 0x32

.field private static final DEFAULT_MAX_HOST_CONNECTIONS:I = 0x5

.field private static final DEFAULT_SO_TIMEOUT:I = 0x0

.field private static final DEFAULT_USER_AGENT:Ljava/lang/String; = "Jakarta-Commons-VFS"

.field protected static final KEY_FOLLOW_REDIRECT:Ljava/lang/String; = "followRedirect"

.field private static final KEY_PREEMPTIVE_AUTHENTICATION:Ljava/lang/String; = "preemptiveAuth"

.field protected static final KEY_USER_AGENT:Ljava/lang/String; = "userAgent"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 62
    const-string v0, "http."

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 58
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;
    .locals 1

    .line 71
    sget-object v0, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    return-object v0
.end method


# virtual methods
.method protected getConfigClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation

    .line 338
    const-class v0, Lorg/apache/commons/vfs2/provider/http/HttpFileSystem;

    return-object v0
.end method

.method public getConnectionTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)I
    .locals 2

    .line 292
    const-string v0, "http.connection.timeout"

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getCookies(Lorg/apache/commons/vfs2/FileSystemOptions;)[Lorg/apache/commons/httpclient/Cookie;
    .locals 1

    .line 191
    const-string v0, "cookies"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/commons/httpclient/Cookie;

    check-cast p1, [Lorg/apache/commons/httpclient/Cookie;

    return-object p1
.end method

.method public getFollowRedirect(Lorg/apache/commons/vfs2/FileSystemOptions;)Z
    .locals 2

    .line 203
    const-string v0, "followRedirect"

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public getMaxConnectionsPerHost(Lorg/apache/commons/vfs2/FileSystemOptions;)I
    .locals 2

    .line 247
    const-string v0, "http.connection-manager.max-per-host"

    const/4 v1, 0x5

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getMaxTotalConnections(Lorg/apache/commons/vfs2/FileSystemOptions;)I
    .locals 2

    .line 225
    const-string v0, "http.connection-manager.max-total"

    const/16 v1, 0x32

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getProxyAuthenticator(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/UserAuthenticator;
    .locals 1

    .line 159
    const-string v0, "proxyAuthenticator"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/UserAuthenticator;

    return-object p1
.end method

.method public getProxyHost(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 127
    const-string v0, "proxyHost"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getProxyPort(Lorg/apache/commons/vfs2/FileSystemOptions;)I
    .locals 2

    .line 139
    const-string v0, "proxyPort"

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getSoTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)I
    .locals 2

    .line 314
    const-string v0, "http.socket.timeout"

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getUrlCharset(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 91
    const-string v0, "urlCharset"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getUserAgent(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 332
    const-string v0, "userAgent"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    return-object p1

    .line 333
    :cond_0
    const-string p1, "Jakarta-Commons-VFS"

    return-object p1
.end method

.method public isPreemptiveAuth(Lorg/apache/commons/vfs2/FileSystemOptions;)Z
    .locals 2

    .line 258
    const-string v0, "preemptiveAuth"

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method

.method public setConnectionTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;I)V
    .locals 1

    .line 281
    const-string v0, "http.connection.timeout"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setCookies(Lorg/apache/commons/vfs2/FileSystemOptions;[Lorg/apache/commons/httpclient/Cookie;)V
    .locals 1

    .line 169
    const-string v0, "cookies"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setFollowRedirect(Lorg/apache/commons/vfs2/FileSystemOptions;Z)V
    .locals 1

    .line 181
    const-string v0, "followRedirect"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Z)V

    return-void
.end method

.method public setMaxConnectionsPerHost(Lorg/apache/commons/vfs2/FileSystemOptions;I)V
    .locals 1

    .line 236
    const-string v0, "http.connection-manager.max-per-host"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setMaxTotalConnections(Lorg/apache/commons/vfs2/FileSystemOptions;I)V
    .locals 1

    .line 214
    const-string v0, "http.connection-manager.max-total"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setPreemptiveAuth(Lorg/apache/commons/vfs2/FileSystemOptions;Z)V
    .locals 1

    .line 270
    const-string v0, "preemptiveAuth"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyAuthenticator(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/UserAuthenticator;)V
    .locals 1

    .line 149
    const-string v0, "proxyAuthenticator"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyHost(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 103
    const-string v0, "proxyHost"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxyPort(Lorg/apache/commons/vfs2/FileSystemOptions;I)V
    .locals 1

    .line 115
    const-string v0, "proxyPort"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setSoTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;I)V
    .locals 1

    .line 303
    const-string v0, "http.socket.timeout"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setUrlCharset(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 81
    const-string v0, "urlCharset"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setUserAgent(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 323
    const-string v0, "userAgent"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
