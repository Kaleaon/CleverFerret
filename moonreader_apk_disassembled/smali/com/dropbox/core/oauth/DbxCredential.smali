.class public Lcom/dropbox/core/oauth/DbxCredential;
.super Ljava/lang/Object;
.source "DbxCredential.java"


# static fields
.field public static final EXPIRE_MARGIN:J = 0x493e0L

.field public static final Reader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/oauth/DbxCredential;",
            ">;"
        }
    .end annotation
.end field

.field public static final Writer:Lcom/dropbox/core/json/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonWriter<",
            "Lcom/dropbox/core/oauth/DbxCredential;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private accessToken:Ljava/lang/String;

.field private final appKey:Ljava/lang/String;

.field private final appSecret:Ljava/lang/String;

.field private expiresAt:Ljava/lang/Long;

.field private final refreshToken:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 265
    new-instance v0, Lcom/dropbox/core/oauth/DbxCredential$2;

    invoke-direct {v0}, Lcom/dropbox/core/oauth/DbxCredential$2;-><init>()V

    sput-object v0, Lcom/dropbox/core/oauth/DbxCredential;->Reader:Lcom/dropbox/core/json/JsonReader;

    .line 317
    new-instance v0, Lcom/dropbox/core/oauth/DbxCredential$3;

    invoke-direct {v0}, Lcom/dropbox/core/oauth/DbxCredential$3;-><init>()V

    sput-object v0, Lcom/dropbox/core/oauth/DbxCredential;->Writer:Lcom/dropbox/core/json/JsonWriter;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 59
    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/oauth/DbxCredential;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 73
    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/oauth/DbxCredential;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    if-eqz p3, :cond_1

    if-eqz p4, :cond_0

    goto :goto_0

    .line 91
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Can\'t refresh without app Key."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    if-eqz p3, :cond_3

    if-eqz p2, :cond_2

    goto :goto_1

    .line 95
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Missing expireAt."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 98
    :cond_3
    :goto_1
    iput-object p1, p0, Lcom/dropbox/core/oauth/DbxCredential;->accessToken:Ljava/lang/String;

    .line 99
    iput-object p2, p0, Lcom/dropbox/core/oauth/DbxCredential;->expiresAt:Ljava/lang/Long;

    .line 100
    iput-object p3, p0, Lcom/dropbox/core/oauth/DbxCredential;->refreshToken:Ljava/lang/String;

    .line 101
    iput-object p4, p0, Lcom/dropbox/core/oauth/DbxCredential;->appKey:Ljava/lang/String;

    .line 102
    iput-object p5, p0, Lcom/dropbox/core/oauth/DbxCredential;->appSecret:Ljava/lang/String;

    return-void

    .line 87
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Missing access token."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/dropbox/core/oauth/DbxCredential;)Ljava/lang/String;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/dropbox/core/oauth/DbxCredential;->accessToken:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/oauth/DbxCredential;)Ljava/lang/Long;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/dropbox/core/oauth/DbxCredential;->expiresAt:Ljava/lang/Long;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/oauth/DbxCredential;)Ljava/lang/String;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/dropbox/core/oauth/DbxCredential;->refreshToken:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/oauth/DbxCredential;)Ljava/lang/String;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/dropbox/core/oauth/DbxCredential;->appKey:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/dropbox/core/oauth/DbxCredential;)Ljava/lang/String;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/dropbox/core/oauth/DbxCredential;->appSecret:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public aboutToExpire()Z
    .locals 6

    .line 147
    invoke-virtual {p0}, Lcom/dropbox/core/oauth/DbxCredential;->getExpiresAt()Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 151
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x493e0

    add-long/2addr v2, v4

    invoke-virtual {p0}, Lcom/dropbox/core/oauth/DbxCredential;->getExpiresAt()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    return v1
.end method

.method public getAccessToken()Ljava/lang/String;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/oauth/DbxCredential;->accessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getAppKey()Ljava/lang/String;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/oauth/DbxCredential;->appKey:Ljava/lang/String;

    return-object v0
.end method

.method public getAppSecret()Ljava/lang/String;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/dropbox/core/oauth/DbxCredential;->appSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getExpiresAt()Ljava/lang/Long;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/dropbox/core/oauth/DbxCredential;->expiresAt:Ljava/lang/Long;

    return-object v0
.end method

.method public getRefreshToken()Ljava/lang/String;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/dropbox/core/oauth/DbxCredential;->refreshToken:Ljava/lang/String;

    return-object v0
.end method

.method public refresh(Lcom/dropbox/core/DbxRequestConfig;)Lcom/dropbox/core/oauth/DbxRefreshResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 236
    sget-object v0, Lcom/dropbox/core/DbxHost;->DEFAULT:Lcom/dropbox/core/DbxHost;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/dropbox/core/oauth/DbxCredential;->refresh(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;)Lcom/dropbox/core/oauth/DbxRefreshResult;

    move-result-object p1

    return-object p1
.end method

.method public refresh(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;)Lcom/dropbox/core/oauth/DbxRefreshResult;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/DbxRequestConfig;",
            "Lcom/dropbox/core/DbxHost;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/oauth/DbxRefreshResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/oauth/DbxCredential;->refreshToken:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 172
    iget-object v0, p0, Lcom/dropbox/core/oauth/DbxCredential;->appKey:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 177
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 178
    const-string v1, "grant_type"

    const-string v2, "refresh_token"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    const-string v1, "refresh_token"

    iget-object v2, p0, Lcom/dropbox/core/oauth/DbxCredential;->refreshToken:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    const-string v1, "locale"

    invoke-virtual {p1}, Lcom/dropbox/core/DbxRequestConfig;->getUserLocale()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 184
    iget-object v1, p0, Lcom/dropbox/core/oauth/DbxCredential;->appSecret:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 186
    const-string v1, "client_id"

    iget-object v2, p0, Lcom/dropbox/core/oauth/DbxCredential;->appKey:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 188
    :cond_0
    iget-object v2, p0, Lcom/dropbox/core/oauth/DbxCredential;->appKey:Ljava/lang/String;

    invoke-static {v8, v2, v1}, Lcom/dropbox/core/DbxRequestUtil;->addBasicAuthHeader(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    :goto_0
    if-eqz p3, :cond_1

    .line 192
    const-string v1, " "

    invoke-static {p3, v1}, Lcom/dropbox/core/util/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 193
    const-string v1, "scope"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    :cond_1
    const-string v4, "OfficialDropboxJavaSDKv2"

    .line 199
    invoke-virtual {p2}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v5

    const-string v6, "oauth2/token"

    .line 201
    invoke-static {v0}, Lcom/dropbox/core/DbxRequestUtil;->toParamsArray(Ljava/util/Map;)[Ljava/lang/String;

    move-result-object v7

    new-instance v9, Lcom/dropbox/core/oauth/DbxCredential$1;

    invoke-direct {v9, p0}, Lcom/dropbox/core/oauth/DbxCredential$1;-><init>(Lcom/dropbox/core/oauth/DbxCredential;)V

    move-object v3, p1

    .line 196
    invoke-static/range {v3 .. v9}, Lcom/dropbox/core/DbxRequestUtil;->doPostNoAuth(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/oauth/DbxRefreshResult;

    .line 218
    monitor-enter p0

    .line 219
    :try_start_0
    invoke-virtual {p1}, Lcom/dropbox/core/oauth/DbxRefreshResult;->getAccessToken()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/dropbox/core/oauth/DbxCredential;->accessToken:Ljava/lang/String;

    .line 220
    invoke-virtual {p1}, Lcom/dropbox/core/oauth/DbxRefreshResult;->getExpiresAt()Ljava/lang/Long;

    move-result-object p2

    iput-object p2, p0, Lcom/dropbox/core/oauth/DbxCredential;->expiresAt:Ljava/lang/Long;

    .line 221
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 173
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "DbxCredential\'s constructor should always guarantee appKey is not null if refreshToken is not null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 169
    :cond_3
    new-instance p1, Lcom/dropbox/core/oauth/DbxOAuthException;

    new-instance p2, Lcom/dropbox/core/oauth/DbxOAuthError;

    const-string p3, "invalid_request"

    const-string v0, "Cannot refresh becasue there is no refresh token"

    invoke-direct {p2, p3, v0}, Lcom/dropbox/core/oauth/DbxOAuthError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p3, 0x0

    invoke-direct {p1, p3, p2}, Lcom/dropbox/core/oauth/DbxOAuthException;-><init>(Ljava/lang/String;Lcom/dropbox/core/oauth/DbxOAuthError;)V

    throw p1
.end method

.method public refresh(Lcom/dropbox/core/DbxRequestConfig;Ljava/util/Collection;)Lcom/dropbox/core/oauth/DbxRefreshResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/DbxRequestConfig;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/oauth/DbxRefreshResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 254
    sget-object v0, Lcom/dropbox/core/DbxHost;->DEFAULT:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p0, p1, v0, p2}, Lcom/dropbox/core/oauth/DbxCredential;->refresh(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;)Lcom/dropbox/core/oauth/DbxRefreshResult;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 262
    sget-object v0, Lcom/dropbox/core/oauth/DbxCredential;->Writer:Lcom/dropbox/core/json/JsonWriter;

    invoke-virtual {v0, p0}, Lcom/dropbox/core/json/JsonWriter;->writeToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
