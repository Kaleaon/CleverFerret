.class public Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;
.super Ljava/lang/Object;
.source "DbxUserOpenidRequests.java"


# instance fields
.field private final client:Lcom/dropbox/core/v2/DbxRawClientV2;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    return-void
.end method


# virtual methods
.method public userinfo()Lcom/dropbox/core/v2/openid/UserInfoResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/openid/UserInfoErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 58
    new-instance v0, Lcom/dropbox/core/v2/openid/UserInfoArgs;

    invoke-direct {v0}, Lcom/dropbox/core/v2/openid/UserInfoArgs;-><init>()V

    .line 59
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;->userinfo(Lcom/dropbox/core/v2/openid/UserInfoArgs;)Lcom/dropbox/core/v2/openid/UserInfoResult;

    move-result-object v0

    return-object v0
.end method

.method userinfo(Lcom/dropbox/core/v2/openid/UserInfoArgs;)Lcom/dropbox/core/v2/openid/UserInfoResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/openid/UserInfoErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 39
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/openid/userinfo"

    sget-object v5, Lcom/dropbox/core/v2/openid/UserInfoArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/openid/UserInfoArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/openid/UserInfoError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/openid/UserInfoError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/openid/UserInfoResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 48
    new-instance v0, Lcom/dropbox/core/v2/openid/UserInfoErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/openid/UserInfoError;

    const-string v3, "2/openid/userinfo"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/openid/UserInfoErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/openid/UserInfoError;)V

    throw v0
.end method
