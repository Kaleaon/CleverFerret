.class public Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;
.super Ljava/lang/Object;
.source "DbxUserFileRequestsRequests.java"


# instance fields
.field private final client:Lcom/dropbox/core/v2/DbxRawClientV2;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    return-void
.end method


# virtual methods
.method public count()Lcom/dropbox/core/v2/filerequests/CountFileRequestsResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/CountFileRequestsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 39
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/count"

    .line 43
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v5

    sget-object v6, Lcom/dropbox/core/v2/filerequests/CountFileRequestsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/CountFileRequestsResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/CountFileRequestsError$Serializer;

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 39
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/filerequests/CountFileRequestsResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 48
    new-instance v1, Lcom/dropbox/core/v2/filerequests/CountFileRequestsErrorException;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v3

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    const-string v4, "2/file_requests/count"

    invoke-direct {v1, v4, v2, v3, v0}, Lcom/dropbox/core/v2/filerequests/CountFileRequestsErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;)V

    throw v1
.end method

.method create(Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/FileRequest;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/CreateFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 67
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/create"

    sget-object v5, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/filerequests/FileRequest$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/FileRequest$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/FileRequest;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v3, "2/file_requests/create"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;)V

    throw v0
.end method

.method public create(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/FileRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/CreateFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->create(Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/FileRequest;

    move-result-object p1

    return-object p1
.end method

.method public createBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/CreateBuilder;
    .locals 0

    .line 121
    invoke-static {p1, p2}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;->newBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;

    move-result-object p1

    .line 122
    new-instance p2, Lcom/dropbox/core/v2/filerequests/CreateBuilder;

    invoke-direct {p2, p0, p1}, Lcom/dropbox/core/v2/filerequests/CreateBuilder;-><init>(Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;)V

    return-object p2
.end method

.method delete(Lcom/dropbox/core/v2/filerequests/DeleteFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/DeleteFileRequestsResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/DeleteFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 139
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/delete"

    sget-object v5, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestsResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestsResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 148
    new-instance v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;

    const-string v3, "2/file_requests/delete"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/DeleteFileRequestError;)V

    throw v0
.end method

.method public delete(Ljava/util/List;)Lcom/dropbox/core/v2/filerequests/DeleteFileRequestsResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/filerequests/DeleteFileRequestsResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/DeleteFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestArgs;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/filerequests/DeleteFileRequestArgs;-><init>(Ljava/util/List;)V

    .line 165
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->delete(Lcom/dropbox/core/v2/filerequests/DeleteFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/DeleteFileRequestsResult;

    move-result-object p1

    return-object p1
.end method

.method public deleteAllClosed()Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 179
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/delete_all_closed"

    .line 183
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v5

    sget-object v6, Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsError$Serializer;

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 179
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 188
    new-instance v1, Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsErrorException;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v3

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsError;

    const-string v4, "2/file_requests/delete_all_closed"

    invoke-direct {v1, v4, v2, v3, v0}, Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/DeleteAllClosedFileRequestsError;)V

    throw v1
.end method

.method get(Lcom/dropbox/core/v2/filerequests/GetFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/FileRequest;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/GetFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 207
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/get"

    sget-object v5, Lcom/dropbox/core/v2/filerequests/GetFileRequestArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/GetFileRequestArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/filerequests/FileRequest$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/FileRequest$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/GetFileRequestError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/FileRequest;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 216
    new-instance v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/GetFileRequestError;

    const-string v3, "2/file_requests/get"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/GetFileRequestError;)V

    throw v0
.end method

.method public get(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/FileRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/GetFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 234
    new-instance v0, Lcom/dropbox/core/v2/filerequests/GetFileRequestArgs;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/filerequests/GetFileRequestArgs;-><init>(Ljava/lang/String;)V

    .line 235
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->get(Lcom/dropbox/core/v2/filerequests/GetFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/FileRequest;

    move-result-object p1

    return-object p1
.end method

.method public list()Lcom/dropbox/core/v2/filerequests/ListFileRequestsResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/ListFileRequestsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 313
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/list"

    .line 317
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v5

    sget-object v6, Lcom/dropbox/core/v2/filerequests/ListFileRequestsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/ListFileRequestsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsError$Serializer;

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 313
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 322
    new-instance v1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsErrorException;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v3

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsError;

    const-string v4, "2/file_requests/list"

    invoke-direct {v1, v4, v2, v3, v0}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/ListFileRequestsError;)V

    throw v1
.end method

.method listContinue(Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueArg;)Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 343
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/list/continue"

    sget-object v5, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 352
    new-instance v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;

    const-string v3, "2/file_requests/list/continue"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;)V

    throw v0
.end method

.method public listContinue(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 373
    new-instance v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueArg;-><init>(Ljava/lang/String;)V

    .line 374
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->listContinue(Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueArg;)Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;

    move-result-object p1

    return-object p1
.end method

.method public listV2()Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/ListFileRequestsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 280
    new-instance v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;-><init>()V

    .line 281
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->listV2(Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;)Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;

    move-result-object v0

    return-object v0
.end method

.method public listV2(J)Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/ListFileRequestsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 296
    new-instance v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;-><init>(J)V

    .line 297
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->listV2(Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;)Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;

    move-result-object p1

    return-object p1
.end method

.method listV2(Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;)Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/ListFileRequestsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 255
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/list_v2"

    sget-object v5, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/ListFileRequestsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsV2Result;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 264
    new-instance v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsError;

    const-string v3, "2/file_requests/list_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/ListFileRequestsError;)V

    throw v0
.end method

.method update(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/FileRequest;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/UpdateFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 392
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/file_requests/update"

    sget-object v5, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/filerequests/FileRequest$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/FileRequest$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/FileRequest;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 401
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestError;

    const-string v3, "2/file_requests/update"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/filerequests/UpdateFileRequestError;)V

    throw v0
.end method

.method public update(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/FileRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/UpdateFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 422
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;-><init>(Ljava/lang/String;)V

    .line 423
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->update(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/FileRequest;

    move-result-object p1

    return-object p1
.end method

.method public updateBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateBuilder;
    .locals 1

    .line 440
    invoke-static {p1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    move-result-object p1

    .line 441
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;-><init>(Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;)V

    return-object v0
.end method
