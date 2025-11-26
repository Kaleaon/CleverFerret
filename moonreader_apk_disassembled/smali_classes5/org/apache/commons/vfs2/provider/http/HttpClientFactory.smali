.class public final Lorg/apache/commons/vfs2/provider/http/HttpClientFactory;
.super Ljava/lang/Object;
.source "HttpClientFactory.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createConnection(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/httpclient/HttpClient;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 44
    invoke-static {}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/vfs2/provider/http/HttpClientFactory;->createConnection(Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/httpclient/HttpClient;

    move-result-object p0

    return-object p0
.end method

.method public static createConnection(Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/httpclient/HttpClient;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 67
    :try_start_0
    new-instance v6, Lorg/apache/commons/httpclient/MultiThreadedHttpConnectionManager;

    invoke-direct {v6}, Lorg/apache/commons/httpclient/MultiThreadedHttpConnectionManager;-><init>()V

    .line 68
    invoke-interface {v6}, Lorg/apache/commons/httpclient/HttpConnectionManager;->getParams()Lorg/apache/commons/httpclient/params/HttpConnectionManagerParams;

    move-result-object v7

    .line 70
    new-instance v8, Lorg/apache/commons/httpclient/HttpClient;

    invoke-direct {v8, v6}, Lorg/apache/commons/httpclient/HttpClient;-><init>(Lorg/apache/commons/httpclient/HttpConnectionManager;)V

    .line 72
    new-instance v6, Lorg/apache/commons/httpclient/HostConfiguration;

    invoke-direct {v6}, Lorg/apache/commons/httpclient/HostConfiguration;-><init>()V

    move-object/from16 v9, p1

    move/from16 v10, p3

    .line 73
    invoke-virtual {v6, v1, v10, v9}, Lorg/apache/commons/httpclient/HostConfiguration;->setHost(Ljava/lang/String;ILjava/lang/String;)V

    const/4 v9, -0x1

    if-eqz v3, :cond_3

    .line 76
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getProxyHost(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v10

    .line 77
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getProxyPort(Lorg/apache/commons/vfs2/FileSystemOptions;)I

    move-result v11

    if-eqz v10, :cond_0

    .line 79
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_0

    if-lez v11, :cond_0

    .line 80
    invoke-virtual {v6, v10, v11}, Lorg/apache/commons/httpclient/HostConfiguration;->setProxy(Ljava/lang/String;I)V

    .line 83
    :cond_0
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getProxyAuthenticator(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/UserAuthenticator;

    move-result-object v11

    if-eqz v11, :cond_2

    const/4 v12, 0x2

    .line 85
    new-array v12, v12, [Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    sget-object v13, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    aput-object v13, v12, v4

    sget-object v13, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    aput-object v13, v12, v5

    invoke-static {v11, v12}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->authenticate(Lorg/apache/commons/vfs2/UserAuthenticator;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;

    move-result-object v11

    if-eqz v11, :cond_1

    .line 90
    new-instance v12, Lorg/apache/commons/httpclient/UsernamePasswordCredentials;

    sget-object v13, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v14, 0x0

    .line 91
    invoke-static {v11, v13, v14}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v13

    invoke-static {v13}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object v13

    sget-object v15, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 93
    invoke-static {v11, v15, v14}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C

    move-result-object v11

    invoke-static {v11}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v12, v13, v11}, Lorg/apache/commons/httpclient/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    new-instance v11, Lorg/apache/commons/httpclient/auth/AuthScope;

    invoke-direct {v11, v10, v9}, Lorg/apache/commons/httpclient/auth/AuthScope;-><init>(Ljava/lang/String;I)V

    .line 97
    invoke-virtual {v8}, Lorg/apache/commons/httpclient/HttpClient;->getState()Lorg/apache/commons/httpclient/HttpState;

    move-result-object v10

    invoke-virtual {v10, v11, v12}, Lorg/apache/commons/httpclient/HttpState;->setProxyCredentials(Lorg/apache/commons/httpclient/auth/AuthScope;Lorg/apache/commons/httpclient/Credentials;)V

    .line 100
    :cond_1
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->isPreemptiveAuth(Lorg/apache/commons/vfs2/FileSystemOptions;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 101
    new-instance v10, Lorg/apache/commons/httpclient/params/HttpClientParams;

    invoke-direct {v10}, Lorg/apache/commons/httpclient/params/HttpClientParams;-><init>()V

    .line 102
    invoke-virtual {v10, v5}, Lorg/apache/commons/httpclient/params/HttpClientParams;->setAuthenticationPreemptive(Z)V

    .line 103
    invoke-virtual {v8, v10}, Lorg/apache/commons/httpclient/HttpClient;->setParams(Lorg/apache/commons/httpclient/params/HttpClientParams;)V

    .line 107
    :cond_2
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getCookies(Lorg/apache/commons/vfs2/FileSystemOptions;)[Lorg/apache/commons/httpclient/Cookie;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 109
    invoke-virtual {v8}, Lorg/apache/commons/httpclient/HttpClient;->getState()Lorg/apache/commons/httpclient/HttpState;

    move-result-object v11

    invoke-virtual {v11, v10}, Lorg/apache/commons/httpclient/HttpState;->addCookies([Lorg/apache/commons/httpclient/Cookie;)V

    .line 117
    :cond_3
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getMaxConnectionsPerHost(Lorg/apache/commons/vfs2/FileSystemOptions;)I

    move-result v10

    invoke-virtual {v7, v6, v10}, Lorg/apache/commons/httpclient/params/HttpConnectionManagerParams;->setMaxConnectionsPerHost(Lorg/apache/commons/httpclient/HostConfiguration;I)V

    .line 118
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getMaxTotalConnections(Lorg/apache/commons/vfs2/FileSystemOptions;)I

    move-result v10

    invoke-virtual {v7, v10}, Lorg/apache/commons/httpclient/params/HttpConnectionManagerParams;->setMaxTotalConnections(I)V

    .line 120
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getConnectionTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)I

    move-result v10

    invoke-virtual {v7, v10}, Lorg/apache/commons/httpclient/params/HttpConnectionManagerParams;->setConnectionTimeout(I)V

    .line 121
    invoke-virtual {v0, v3}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;->getSoTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)I

    move-result v0

    invoke-virtual {v7, v0}, Lorg/apache/commons/httpclient/params/HttpConnectionManagerParams;->setSoTimeout(I)V

    .line 123
    invoke-virtual {v8, v6}, Lorg/apache/commons/httpclient/HttpClient;->setHostConfiguration(Lorg/apache/commons/httpclient/HostConfiguration;)V

    if-eqz v2, :cond_4

    .line 126
    new-instance v0, Lorg/apache/commons/httpclient/UsernamePasswordCredentials;

    move-object/from16 v3, p5

    invoke-direct {v0, v2, v3}, Lorg/apache/commons/httpclient/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    new-instance v2, Lorg/apache/commons/httpclient/auth/AuthScope;

    invoke-direct {v2, v1, v9}, Lorg/apache/commons/httpclient/auth/AuthScope;-><init>(Ljava/lang/String;I)V

    .line 128
    invoke-virtual {v8}, Lorg/apache/commons/httpclient/HttpClient;->getState()Lorg/apache/commons/httpclient/HttpState;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lorg/apache/commons/httpclient/HttpState;->setCredentials(Lorg/apache/commons/httpclient/auth/AuthScope;Lorg/apache/commons/httpclient/Credentials;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    return-object v8

    :catch_0
    move-exception v0

    .line 131
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    new-array v3, v5, [Ljava/lang/Object;

    aput-object v1, v3, v4

    const-string v1, "vfs.provider.http/connect.error"

    invoke-direct {v2, v1, v0, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v2
.end method
