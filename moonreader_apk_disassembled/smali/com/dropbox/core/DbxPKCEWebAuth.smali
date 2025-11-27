.class public Lcom/dropbox/core/DbxPKCEWebAuth;
.super Ljava/lang/Object;
.source "DbxPKCEWebAuth.java"


# instance fields
.field private final appInfo:Lcom/dropbox/core/DbxAppInfo;

.field private consumed:Z

.field private final dbxPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

.field private final dbxWebAuth:Lcom/dropbox/core/DbxWebAuth;

.field private final requestConfig:Lcom/dropbox/core/DbxRequestConfig;

.field private started:Z


# direct methods
.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxAppInfo;)V
    .locals 1

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    invoke-virtual {p2}, Lcom/dropbox/core/DbxAppInfo;->hasSecret()Z

    move-result v0

    if-nez v0, :cond_0

    .line 63
    iput-object p1, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    .line 64
    iput-object p2, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    .line 65
    new-instance v0, Lcom/dropbox/core/DbxWebAuth;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/DbxWebAuth;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxAppInfo;)V

    iput-object v0, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->dbxWebAuth:Lcom/dropbox/core/DbxWebAuth;

    .line 66
    new-instance p1, Lcom/dropbox/core/DbxPKCEManager;

    invoke-direct {p1}, Lcom/dropbox/core/DbxPKCEManager;-><init>()V

    iput-object p1, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->dbxPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    const/4 p1, 0x0

    .line 67
    iput-boolean p1, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->started:Z

    .line 68
    iput-boolean p1, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->consumed:Z

    return-void

    .line 59
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PKCE cdoe flow doesn\'t require app secret, if you decide to embed it in your app, please use regular DbxWebAuth instead."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public authorize(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;
    .locals 3

    .line 92
    iget-boolean v0, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->consumed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 97
    iput-boolean v0, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->started:Z

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 100
    iget-object v1, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->dbxPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    invoke-virtual {v1}, Lcom/dropbox/core/DbxPKCEManager;->getCodeChallenge()Ljava/lang/String;

    move-result-object v1

    const-string v2, "code_challenge"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string v1, "code_challenge_method"

    const-string v2, "S256"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v1, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->dbxWebAuth:Lcom/dropbox/core/DbxWebAuth;

    invoke-virtual {v1, p1, v0}, Lcom/dropbox/core/DbxWebAuth;->authorizeImpl(Lcom/dropbox/core/DbxWebAuth$Request;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 93
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "This DbxPKCEWebAuth instance has been consumed already. To start a new PKCE OAuth flow, please create a new instance."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method finish(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 150
    iget-boolean v0, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->started:Z

    if-eqz v0, :cond_1

    .line 155
    iget-boolean v0, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->consumed:Z

    if-nez v0, :cond_0

    .line 162
    iget-object v1, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->dbxPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    iget-object v2, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v0, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    .line 163
    invoke-virtual {v0}, Lcom/dropbox/core/DbxAppInfo;->getKey()Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxAppInfo;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v6

    move-object v3, p1

    move-object v5, p2

    .line 162
    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/DbxPKCEManager;->makeTokenRequest(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    const/4 p2, 0x1

    .line 166
    iput-boolean p2, p0, Lcom/dropbox/core/DbxPKCEWebAuth;->consumed:Z

    .line 167
    invoke-virtual {p1, p3}, Lcom/dropbox/core/DbxAuthFinish;->withUrlState(Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1

    .line 156
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "This DbxPKCEWebAuth instance has been consumed already. To start a new PKCE OAuth flow, please create a new instance."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 151
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Must initialize the PKCE flow by calling authorize first."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 149
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "code"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public finishFromCode(Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 116
    invoke-virtual {p0, p1, v0, v0}, Lcom/dropbox/core/DbxPKCEWebAuth;->finish(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1
.end method

.method public finishFromRedirect(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;Ljava/util/Map;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/DbxSessionStore;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/DbxAuthFinish;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Lcom/dropbox/core/DbxWebAuth$BadRequestException;,
            Lcom/dropbox/core/DbxWebAuth$BadStateException;,
            Lcom/dropbox/core/DbxWebAuth$CsrfException;,
            Lcom/dropbox/core/DbxWebAuth$NotApprovedException;,
            Lcom/dropbox/core/DbxWebAuth$ProviderException;
        }
    .end annotation

    .line 143
    invoke-static {p1, p2, p3}, Lcom/dropbox/core/DbxWebAuth;->validateRedirectUri(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p2

    .line 144
    const-string v0, "code"

    invoke-static {p3, v0}, Lcom/dropbox/core/DbxWebAuth;->getParam(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 145
    invoke-virtual {p0, p3, p1, p2}, Lcom/dropbox/core/DbxPKCEWebAuth;->finish(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1
.end method
