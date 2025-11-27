.class public Lcom/dropbox/core/v2/users/DbxUserUsersRequests;
.super Ljava/lang/Object;
.source "DbxUserUsersRequests.java"


# instance fields
.field private final client:Lcom/dropbox/core/v2/DbxRawClientV2;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    return-void
.end method


# virtual methods
.method featuresGetValues(Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchArg;)Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 39
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/users/features/get_values"

    sget-object v5, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 48
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchError;

    const-string v3, "2/users/features/get_values"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchError;)V

    throw v0
.end method

.method public featuresGetValues(Ljava/util/List;)Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/users/UserFeature;",
            ">;)",
            "Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 65
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchArg;-><init>(Ljava/util/List;)V

    .line 66
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->featuresGetValues(Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchArg;)Lcom/dropbox/core/v2/users/UserFeaturesGetValuesBatchResult;

    move-result-object p1

    return-object p1
.end method

.method getAccount(Lcom/dropbox/core/v2/users/GetAccountArg;)Lcom/dropbox/core/v2/users/BasicAccount;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/users/GetAccountErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 81
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/users/get_account"

    sget-object v5, Lcom/dropbox/core/v2/users/GetAccountArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/GetAccountArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/users/BasicAccount$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/BasicAccount$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/users/GetAccountError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/GetAccountError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/users/BasicAccount;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/users/GetAccountErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/users/GetAccountError;

    const-string v3, "2/users/get_account"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/users/GetAccountErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/users/GetAccountError;)V

    throw v0
.end method

.method public getAccount(Ljava/lang/String;)Lcom/dropbox/core/v2/users/BasicAccount;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/users/GetAccountErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/users/GetAccountArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/users/GetAccountArg;-><init>(Ljava/lang/String;)V

    .line 107
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->getAccount(Lcom/dropbox/core/v2/users/GetAccountArg;)Lcom/dropbox/core/v2/users/BasicAccount;

    move-result-object p1

    return-object p1
.end method

.method getAccountBatch(Lcom/dropbox/core/v2/users/GetAccountBatchArg;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/users/GetAccountBatchArg;",
            ")",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/users/BasicAccount;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/users/GetAccountBatchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 121
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/users/get_account_batch"

    sget-object v5, Lcom/dropbox/core/v2/users/GetAccountBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/GetAccountBatchArg$Serializer;

    sget-object v3, Lcom/dropbox/core/v2/users/BasicAccount$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/BasicAccount$Serializer;

    .line 126
    invoke-static {v3}, Lcom/dropbox/core/stone/StoneSerializers;->list(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 121
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 130
    new-instance v0, Lcom/dropbox/core/v2/users/GetAccountBatchErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/users/GetAccountBatchError;

    const-string v3, "2/users/get_account_batch"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/users/GetAccountBatchErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/users/GetAccountBatchError;)V

    throw v0
.end method

.method public getAccountBatch(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/users/BasicAccount;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/users/GetAccountBatchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 146
    new-instance v0, Lcom/dropbox/core/v2/users/GetAccountBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/users/GetAccountBatchArg;-><init>(Ljava/util/List;)V

    .line 147
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->getAccountBatch(Lcom/dropbox/core/v2/users/GetAccountBatchArg;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getCurrentAccount()Lcom/dropbox/core/v2/users/FullAccount;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 161
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/users/get_current_account"

    .line 165
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v5

    sget-object v6, Lcom/dropbox/core/v2/users/FullAccount$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FullAccount$Serializer;

    .line 167
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 161
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/users/FullAccount;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 170
    new-instance v1, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Unexpected error response for \"get_current_account\":"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v1
.end method

.method public getSpaceUsage()Lcom/dropbox/core/v2/users/SpaceUsage;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 185
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/users/get_space_usage"

    .line 189
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v5

    sget-object v6, Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;

    .line 191
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 185
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/users/SpaceUsage;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 194
    new-instance v1, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Unexpected error response for \"get_space_usage\":"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v1
.end method
