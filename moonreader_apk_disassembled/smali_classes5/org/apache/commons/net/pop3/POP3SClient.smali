.class public Lorg/apache/commons/net/pop3/POP3SClient;
.super Lorg/apache/commons/net/pop3/POP3Client;
.source "POP3SClient.java"


# static fields
.field private static final DEFAULT_POP3S_PORT:I = 0x3e3

.field private static final DEFAULT_PROTOCOL:Ljava/lang/String; = "TLS"


# instance fields
.field private context:Ljavax/net/ssl/SSLContext;

.field private hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private final isImplicit:Z

.field private keyManager:Ljavax/net/ssl/KeyManager;

.field private final protocol:Ljava/lang/String;

.field private protocols:[Ljava/lang/String;

.field private suites:[Ljava/lang/String;

.field private tlsEndpointChecking:Z

.field private trustManager:Ljavax/net/ssl/TrustManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 99
    const-string v0, "TLS"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/net/pop3/POP3SClient;-><init>(Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 118
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/pop3/POP3SClient;-><init>(Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 128
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/net/pop3/POP3SClient;-><init>(Ljava/lang/String;ZLjavax/net/ssl/SSLContext;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLjavax/net/ssl/SSLContext;)V
    .locals 0

    .line 139
    invoke-direct {p0}, Lorg/apache/commons/net/pop3/POP3Client;-><init>()V

    .line 140
    iput-object p1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->protocol:Ljava/lang/String;

    .line 141
    iput-boolean p2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->isImplicit:Z

    .line 142
    iput-object p3, p0, Lorg/apache/commons/net/pop3/POP3SClient;->context:Ljavax/net/ssl/SSLContext;

    if-eqz p2, :cond_0

    const/16 p1, 0x3e3

    .line 144
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/pop3/POP3SClient;->setDefaultPort(I)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;)V
    .locals 1

    const/4 v0, 0x0

    .line 165
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/pop3/POP3SClient;-><init>(ZLjavax/net/ssl/SSLContext;)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    .line 108
    const-string v0, "TLS"

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/pop3/POP3SClient;-><init>(Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(ZLjavax/net/ssl/SSLContext;)V
    .locals 1

    .line 155
    const-string v0, "TLS"

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/net/pop3/POP3SClient;-><init>(Ljava/lang/String;ZLjavax/net/ssl/SSLContext;)V

    return-void
.end method

.method private getKeyManager()Ljavax/net/ssl/KeyManager;
    .locals 1

    .line 247
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->keyManager:Ljavax/net/ssl/KeyManager;

    return-object v0
.end method

.method private initSSLContext()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 194
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->context:Ljavax/net/ssl/SSLContext;

    if-nez v0, :cond_0

    .line 196
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->protocol:Ljava/lang/String;

    invoke-direct {p0}, Lorg/apache/commons/net/pop3/POP3SClient;->getKeyManager()Ljavax/net/ssl/KeyManager;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3SClient;->getTrustManager()Ljavax/net/ssl/TrustManager;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/apache/commons/net/util/SSLContextUtils;->createSSLContext(Ljava/lang/String;Ljavax/net/ssl/KeyManager;Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->context:Ljavax/net/ssl/SSLContext;

    :cond_0
    return-void
.end method

.method private performSSLNegotiation()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 207
    invoke-direct {p0}, Lorg/apache/commons/net/pop3/POP3SClient;->initSSLContext()V

    .line 209
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->context:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 210
    iget-object v1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_hostname_:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_hostname_:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3SClient;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    .line 211
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3SClient;->getRemotePort()I

    move-result v2

    .line 212
    iget-object v3, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_socket_:Ljava/net/Socket;

    const/4 v4, 0x1

    .line 213
    invoke-virtual {v0, v3, v1, v2, v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 214
    invoke-virtual {v0, v4}, Ljavax/net/ssl/SSLSocket;->setEnableSessionCreation(Z)V

    .line 215
    invoke-virtual {v0, v4}, Ljavax/net/ssl/SSLSocket;->setUseClientMode(Z)V

    .line 217
    iget-boolean v2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->tlsEndpointChecking:Z

    if-eqz v2, :cond_1

    .line 218
    invoke-static {v0}, Lorg/apache/commons/net/util/SSLSocketUtils;->enableEndpointNameVerification(Ljavax/net/ssl/SSLSocket;)Z

    .line 221
    :cond_1
    iget-object v2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->protocols:[Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 222
    invoke-virtual {v0, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 224
    :cond_2
    iget-object v2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->suites:[Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 225
    invoke-virtual {v0, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 227
    :cond_3
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 230
    iput-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_socket_:Ljava/net/Socket;

    .line 231
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_input_:Ljava/io/InputStream;

    .line 232
    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_output_:Ljava/io/OutputStream;

    .line 233
    new-instance v2, Lorg/apache/commons/net/io/CRLFLineReader;

    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_input_:Ljava/io/InputStream;

    sget-object v5, Lorg/apache/commons/net/pop3/POP3SClient;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v2, v3}, Lorg/apache/commons/net/io/CRLFLineReader;-><init>(Ljava/io/Reader;)V

    iput-object v2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->reader:Ljava/io/BufferedReader;

    .line 234
    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/OutputStreamWriter;

    iget-object v4, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_output_:Ljava/io/OutputStream;

    sget-object v5, Lorg/apache/commons/net/pop3/POP3SClient;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->writer:Ljava/io/BufferedWriter;

    .line 236
    iget-object v2, p0, Lorg/apache/commons/net/pop3/POP3SClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-eqz v2, :cond_5

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v0

    invoke-interface {v2, v1, v0}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    .line 237
    :cond_4
    new-instance v0, Ljavax/net/ssl/SSLHandshakeException;

    const-string v1, "Hostname doesn\'t match certificate"

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLHandshakeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    :goto_1
    return-void
.end method


# virtual methods
.method protected _connectAction_()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    iget-boolean v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->isImplicit:Z

    if-eqz v0, :cond_0

    .line 181
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3SClient;->applySocketAttributes()V

    .line 182
    invoke-direct {p0}, Lorg/apache/commons/net/pop3/POP3SClient;->performSSLNegotiation()V

    .line 184
    :cond_0
    invoke-super {p0}, Lorg/apache/commons/net/pop3/POP3Client;->_connectAction_()V

    return-void
.end method

.method public execTLS()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 319
    const-string v0, "STLS"

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/pop3/POP3SClient;->sendCommand(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 324
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/net/pop3/POP3SClient;->performSSLNegotiation()V

    const/4 v0, 0x1

    return v0
.end method

.method public getEnabledCipherSuites()[Ljava/lang/String;
    .locals 1

    .line 278
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_socket_:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_0

    .line 280
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_socket_:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEnabledProtocols()[Ljava/lang/String;
    .locals 1

    .line 303
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_socket_:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_0

    .line 305
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->_socket_:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    .line 354
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public getTrustManager()Ljavax/net/ssl/TrustManager;
    .locals 1

    .line 334
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->trustManager:Ljavax/net/ssl/TrustManager;

    return-object v0
.end method

.method public isEndpointCheckingEnabled()Z
    .locals 1

    .line 376
    iget-boolean v0, p0, Lorg/apache/commons/net/pop3/POP3SClient;->tlsEndpointChecking:Z

    return v0
.end method

.method public setEnabledCipherSuites([Ljava/lang/String;)V
    .locals 0

    .line 267
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->suites:[Ljava/lang/String;

    return-void
.end method

.method public setEnabledProtocols([Ljava/lang/String;)V
    .locals 0

    .line 292
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->protocols:[Ljava/lang/String;

    return-void
.end method

.method public setEndpointCheckingEnabled(Z)V
    .locals 0

    .line 388
    iput-boolean p1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->tlsEndpointChecking:Z

    return-void
.end method

.method public setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    .locals 0

    .line 364
    iput-object p1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public setKeyManager(Ljavax/net/ssl/KeyManager;)V
    .locals 0

    .line 257
    iput-object p1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->keyManager:Ljavax/net/ssl/KeyManager;

    return-void
.end method

.method public setTrustManager(Ljavax/net/ssl/TrustManager;)V
    .locals 0

    .line 344
    iput-object p1, p0, Lorg/apache/commons/net/pop3/POP3SClient;->trustManager:Ljavax/net/ssl/TrustManager;

    return-void
.end method
