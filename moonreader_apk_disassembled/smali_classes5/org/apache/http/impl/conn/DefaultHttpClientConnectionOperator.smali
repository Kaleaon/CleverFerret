.class public Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;
.super Ljava/lang/Object;
.source "DefaultHttpClientConnectionOperator.java"

# interfaces
.implements Lorg/apache/http/conn/HttpClientConnectionOperator;


# static fields
.field static final SOCKET_FACTORY_REGISTRY:Ljava/lang/String; = "http.socket-factory-registry"


# instance fields
.field private final dnsResolver:Lorg/apache/http/conn/DnsResolver;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

.field private final socketFactoryRegistry:Lorg/apache/http/config/Lookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/config/Lookup<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Lookup<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lorg/apache/http/conn/SchemePortResolver;",
            "Lorg/apache/http/conn/DnsResolver;",
            ")V"
        }
    .end annotation

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    .line 80
    const-string v0, "Socket factory registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->socketFactoryRegistry:Lorg/apache/http/config/Lookup;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 82
    :cond_0
    sget-object p2, Lorg/apache/http/impl/conn/DefaultSchemePortResolver;->INSTANCE:Lorg/apache/http/impl/conn/DefaultSchemePortResolver;

    :goto_0
    iput-object p2, p0, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

    if-eqz p3, :cond_1

    goto :goto_1

    .line 84
    :cond_1
    sget-object p3, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;->INSTANCE:Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;

    :goto_1
    iput-object p3, p0, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    return-void
.end method

.method private getSocketFactoryRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/config/Lookup;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/protocol/HttpContext;",
            ")",
            "Lorg/apache/http/config/Lookup<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;"
        }
    .end annotation

    .line 90
    const-string v0, "http.socket-factory-registry"

    invoke-interface {p1, v0}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/http/config/Lookup;

    if-nez p1, :cond_0

    .line 93
    iget-object p1, p0, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->socketFactoryRegistry:Lorg/apache/http/config/Lookup;

    :cond_0
    return-object p1
.end method


# virtual methods
.method public connect(Lorg/apache/http/conn/ManagedHttpClientConnection;Lorg/apache/http/HttpHost;Ljava/net/InetSocketAddress;ILorg/apache/http/config/SocketConfig;Lorg/apache/http/protocol/HttpContext;)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v6, p2

    move-object/from16 v9, p6

    .line 106
    invoke-direct {v1, v9}, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->getSocketFactoryRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/config/Lookup;

    move-result-object v0

    .line 107
    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lorg/apache/http/config/Lookup;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lorg/apache/http/conn/socket/ConnectionSocketFactory;

    if-eqz v3, :cond_c

    .line 112
    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-eqz v0, :cond_0

    new-array v0, v11, [Ljava/net/InetAddress;

    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getAddress()Ljava/net/InetAddress;

    move-result-object v4

    aput-object v4, v0, v10

    goto :goto_0

    :cond_0
    iget-object v0, v1, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/apache/http/conn/DnsResolver;->resolve(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v0

    :goto_0
    move-object v12, v0

    .line 114
    iget-object v0, v1, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

    invoke-interface {v0, v6}, Lorg/apache/http/conn/SchemePortResolver;->resolve(Lorg/apache/http/HttpHost;)I

    move-result v13

    const/4 v14, 0x0

    .line 115
    :goto_1
    array-length v0, v12

    if-ge v14, v0, :cond_b

    .line 116
    aget-object v0, v12, v14

    .line 117
    array-length v4, v12

    sub-int/2addr v4, v11

    if-ne v14, v4, :cond_1

    const/4 v15, 0x1

    goto :goto_2

    :cond_1
    const/4 v15, 0x0

    .line 119
    :goto_2
    invoke-interface {v3, v9}, Lorg/apache/http/conn/socket/ConnectionSocketFactory;->createSocket(Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v5

    .line 120
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->getSoTimeout()I

    move-result v4

    invoke-virtual {v5, v4}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 121
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->isSoReuseAddress()Z

    move-result v4

    invoke-virtual {v5, v4}, Ljava/net/Socket;->setReuseAddress(Z)V

    .line 122
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->isTcpNoDelay()Z

    move-result v4

    invoke-virtual {v5, v4}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 123
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->isSoKeepAlive()Z

    move-result v4

    invoke-virtual {v5, v4}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 124
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->getRcvBufSize()I

    move-result v4

    if-lez v4, :cond_2

    .line 125
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->getRcvBufSize()I

    move-result v4

    invoke-virtual {v5, v4}, Ljava/net/Socket;->setReceiveBufferSize(I)V

    .line 127
    :cond_2
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->getSndBufSize()I

    move-result v4

    if-lez v4, :cond_3

    .line 128
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->getSndBufSize()I

    move-result v4

    invoke-virtual {v5, v4}, Ljava/net/Socket;->setSendBufferSize(I)V

    .line 131
    :cond_3
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/config/SocketConfig;->getSoLinger()I

    move-result v4

    if-ltz v4, :cond_4

    .line 133
    invoke-virtual {v5, v11, v4}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 135
    :cond_4
    invoke-interface {v2, v5}, Lorg/apache/http/conn/ManagedHttpClientConnection;->bind(Ljava/net/Socket;)V

    .line 137
    new-instance v7, Ljava/net/InetSocketAddress;

    invoke-direct {v7, v0, v13}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 138
    iget-object v0, v1, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 139
    iget-object v0, v1, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, "Connecting to "

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_5
    move-object/from16 v8, p3

    move/from16 v4, p4

    .line 142
    :try_start_0
    invoke-interface/range {v3 .. v9}, Lorg/apache/http/conn/socket/ConnectionSocketFactory;->connectSocket(ILjava/net/Socket;Lorg/apache/http/HttpHost;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v0

    .line 144
    invoke-interface {v2, v0}, Lorg/apache/http/conn/ManagedHttpClientConnection;->bind(Ljava/net/Socket;)V

    .line 145
    iget-object v0, v1, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 146
    iget-object v0, v1, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Connection established "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/NoRouteToHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    if-nez v15, :cond_6

    goto :goto_4

    .line 162
    :cond_6
    throw v0

    :catch_1
    move-exception v0

    if-eqz v15, :cond_8

    .line 155
    invoke-virtual {v0}, Ljava/net/ConnectException;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 156
    const-string v3, "Connection timed out"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    new-instance v2, Lorg/apache/http/conn/ConnectTimeoutException;

    invoke-direct {v2, v0, v6, v12}, Lorg/apache/http/conn/ConnectTimeoutException;-><init>(Ljava/io/IOException;Lorg/apache/http/HttpHost;[Ljava/net/InetAddress;)V

    goto :goto_3

    :cond_7
    new-instance v2, Lorg/apache/http/conn/HttpHostConnectException;

    invoke-direct {v2, v0, v6, v12}, Lorg/apache/http/conn/HttpHostConnectException;-><init>(Ljava/io/IOException;Lorg/apache/http/HttpHost;[Ljava/net/InetAddress;)V

    :goto_3
    throw v2

    :catch_2
    move-exception v0

    if-nez v15, :cond_a

    .line 165
    :cond_8
    :goto_4
    iget-object v0, v1, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 166
    iget-object v0, v1, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Connect to "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " timed out. Connection will be retried using another IP address"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_9
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v9, p6

    goto/16 :goto_1

    .line 151
    :cond_a
    new-instance v2, Lorg/apache/http/conn/ConnectTimeoutException;

    invoke-direct {v2, v0, v6, v12}, Lorg/apache/http/conn/ConnectTimeoutException;-><init>(Ljava/io/IOException;Lorg/apache/http/HttpHost;[Ljava/net/InetAddress;)V

    throw v2

    :cond_b
    :goto_5
    return-void

    .line 109
    :cond_c
    new-instance v0, Lorg/apache/http/conn/UnsupportedSchemeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " protocol is not supported"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/http/conn/UnsupportedSchemeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public upgrade(Lorg/apache/http/conn/ManagedHttpClientConnection;Lorg/apache/http/HttpHost;Lorg/apache/http/protocol/HttpContext;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    invoke-static {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v0

    .line 178
    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->getSocketFactoryRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/config/Lookup;

    move-result-object v0

    .line 179
    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/http/config/Lookup;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/socket/ConnectionSocketFactory;

    if-eqz v0, :cond_1

    .line 184
    instance-of v1, v0, Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;

    if-eqz v1, :cond_0

    .line 188
    check-cast v0, Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;

    .line 189
    invoke-interface {p1}, Lorg/apache/http/conn/ManagedHttpClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    .line 190
    iget-object v2, p0, Lorg/apache/http/impl/conn/DefaultHttpClientConnectionOperator;->schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

    invoke-interface {v2, p2}, Lorg/apache/http/conn/SchemePortResolver;->resolve(Lorg/apache/http/HttpHost;)I

    move-result v2

    .line 191
    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, v1, p2, v2, p3}, Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object p2

    .line 192
    invoke-interface {p1, p2}, Lorg/apache/http/conn/ManagedHttpClientConnection;->bind(Ljava/net/Socket;)V

    return-void

    .line 185
    :cond_0
    new-instance p1, Lorg/apache/http/conn/UnsupportedSchemeException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " protocol does not support connection upgrade"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/apache/http/conn/UnsupportedSchemeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 181
    :cond_1
    new-instance p1, Lorg/apache/http/conn/UnsupportedSchemeException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " protocol is not supported"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/apache/http/conn/UnsupportedSchemeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
