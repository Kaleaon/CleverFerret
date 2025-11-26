.class public Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;
.super Ljava/lang/Object;
.source "DbxUserPaperRequests.java"


# instance fields
.field private final client:Lcom/dropbox/core/v2/DbxRawClientV2;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    return-void
.end method


# virtual methods
.method docsArchive(Lcom/dropbox/core/v2/paper/RefPaperDoc;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 51
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/archive"

    sget-object v5, Lcom/dropbox/core/v2/paper/RefPaperDoc$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/RefPaperDoc$Serializer;

    .line 56
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 51
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/archive"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsArchive(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/paper/RefPaperDoc;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/RefPaperDoc;-><init>(Ljava/lang/String;)V

    .line 89
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsArchive(Lcom/dropbox/core/v2/paper/RefPaperDoc;)V

    return-void
.end method

.method public docsCreate(Lcom/dropbox/core/v2/paper/ImportFormat;)Lcom/dropbox/core/v2/paper/DocsCreateUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;-><init>(Lcom/dropbox/core/v2/paper/ImportFormat;)V

    .line 143
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsCreate(Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;)Lcom/dropbox/core/v2/paper/DocsCreateUploader;

    move-result-object p1

    return-object p1
.end method

.method public docsCreate(Lcom/dropbox/core/v2/paper/ImportFormat;Ljava/lang/String;)Lcom/dropbox/core/v2/paper/DocsCreateUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 173
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;-><init>(Lcom/dropbox/core/v2/paper/ImportFormat;Ljava/lang/String;)V

    .line 174
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsCreate(Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;)Lcom/dropbox/core/v2/paper/DocsCreateUploader;

    move-result-object p1

    return-object p1
.end method

.method docsCreate(Lcom/dropbox/core/v2/paper/PaperDocCreateArgs;)Lcom/dropbox/core/v2/paper/DocsCreateUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocCreateArgs$Serializer;

    const-string v2, "2/paper/docs/create"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 115
    new-instance v0, Lcom/dropbox/core/v2/paper/DocsCreateUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/paper/DocsCreateUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method docsDownload(Lcom/dropbox/core/v2/paper/PaperDocExport;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/paper/PaperDocExport;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/paper/PaperDocExportResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 197
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/download"

    sget-object v6, Lcom/dropbox/core/v2/paper/PaperDocExport$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocExport$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/PaperDocExportResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocExportResult$Serializer;

    sget-object v8, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v8}, Lcom/dropbox/core/v2/DbxRawClientV2;->downloadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLjava/util/List;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 207
    new-instance p2, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v2, "2/paper/docs/download"

    invoke-direct {p2, v2, v0, v1, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw p2
.end method

.method public docsDownload(Ljava/lang/String;Lcom/dropbox/core/v2/paper/ExportFormat;)Lcom/dropbox/core/DbxDownloader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v2/paper/ExportFormat;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/paper/PaperDocExportResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 236
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperDocExport;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/paper/PaperDocExport;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/paper/ExportFormat;)V

    .line 237
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsDownload(Lcom/dropbox/core/v2/paper/PaperDocExport;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method public docsDownloadBuilder(Ljava/lang/String;Lcom/dropbox/core/v2/paper/ExportFormat;)Lcom/dropbox/core/v2/paper/DocsDownloadBuilder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 262
    new-instance v0, Lcom/dropbox/core/v2/paper/DocsDownloadBuilder;

    invoke-direct {v0, p0, p1, p2}, Lcom/dropbox/core/v2/paper/DocsDownloadBuilder;-><init>(Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;Ljava/lang/String;Lcom/dropbox/core/v2/paper/ExportFormat;)V

    return-object v0
.end method

.method docsFolderUsersList(Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 284
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/folder_users/list"

    sget-object v5, Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 293
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/folder_users/list"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsFolderUsersList(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 324
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs;-><init>(Ljava/lang/String;)V

    .line 325
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsFolderUsersList(Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;

    move-result-object p1

    return-object p1
.end method

.method public docsFolderUsersList(Ljava/lang/String;I)Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    if-lt p2, v0, :cond_1

    const/16 v0, 0x3e8

    if-gt p2, v0, :cond_0

    .line 362
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs;-><init>(Ljava/lang/String;I)V

    .line 363
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsFolderUsersList(Lcom/dropbox/core/v2/paper/ListUsersOnFolderArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;

    move-result-object p1

    return-object p1

    .line 360
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'limit\' is larger than 1000"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 357
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'limit\' is smaller than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method docsFolderUsersListContinue(Lcom/dropbox/core/v2/paper/ListUsersOnFolderContinueArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/ListUsersCursorErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 384
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/folder_users/list/continue"

    sget-object v5, Lcom/dropbox/core/v2/paper/ListUsersOnFolderContinueArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersOnFolderContinueArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 393
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersCursorErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    const-string v3, "2/paper/docs/folder_users/list/continue"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/ListUsersCursorErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/ListUsersCursorError;)V

    throw v0
.end method

.method public docsFolderUsersListContinue(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/ListUsersCursorErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 424
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersOnFolderContinueArgs;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/paper/ListUsersOnFolderContinueArgs;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsFolderUsersListContinue(Lcom/dropbox/core/v2/paper/ListUsersOnFolderContinueArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnFolderResponse;

    move-result-object p1

    return-object p1
.end method

.method docsGetFolderInfo(Lcom/dropbox/core/v2/paper/RefPaperDoc;)Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 453
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/get_folder_info"

    sget-object v5, Lcom/dropbox/core/v2/paper/RefPaperDoc$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/RefPaperDoc$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 462
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/get_folder_info"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsGetFolderInfo(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 499
    new-instance v0, Lcom/dropbox/core/v2/paper/RefPaperDoc;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/RefPaperDoc;-><init>(Ljava/lang/String;)V

    .line 500
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsGetFolderInfo(Lcom/dropbox/core/v2/paper/RefPaperDoc;)Lcom/dropbox/core/v2/paper/FoldersContainingPaperDoc;

    move-result-object p1

    return-object p1
.end method

.method public docsList()Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 555
    new-instance v0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;-><init>()V

    .line 556
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsList(Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;)Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;

    move-result-object v0

    return-object v0
.end method

.method docsList(Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;)Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 521
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/list"

    sget-object v5, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/ListPaperDocsResponse$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListPaperDocsResponse$Serializer;

    .line 527
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 521
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 530
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"docs/list\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public docsListBuilder()Lcom/dropbox/core/v2/paper/DocsListBuilder;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 577
    invoke-static {}, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;->newBuilder()Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    move-result-object v0

    .line 578
    new-instance v1, Lcom/dropbox/core/v2/paper/DocsListBuilder;

    invoke-direct {v1, p0, v0}, Lcom/dropbox/core/v2/paper/DocsListBuilder;-><init>(Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;)V

    return-object v1
.end method

.method docsListContinue(Lcom/dropbox/core/v2/paper/ListPaperDocsContinueArgs;)Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/ListDocsCursorErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 599
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/list/continue"

    sget-object v5, Lcom/dropbox/core/v2/paper/ListPaperDocsContinueArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListPaperDocsContinueArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/ListPaperDocsResponse$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListPaperDocsResponse$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 608
    new-instance v0, Lcom/dropbox/core/v2/paper/ListDocsCursorErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    const-string v3, "2/paper/docs/list/continue"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/ListDocsCursorErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/ListDocsCursorError;)V

    throw v0
.end method

.method public docsListContinue(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/ListDocsCursorErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 638
    new-instance v0, Lcom/dropbox/core/v2/paper/ListPaperDocsContinueArgs;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/ListPaperDocsContinueArgs;-><init>(Ljava/lang/String;)V

    .line 639
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsListContinue(Lcom/dropbox/core/v2/paper/ListPaperDocsContinueArgs;)Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;

    move-result-object p1

    return-object p1
.end method

.method docsPermanentlyDelete(Lcom/dropbox/core/v2/paper/RefPaperDoc;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 660
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/permanently_delete"

    sget-object v5, Lcom/dropbox/core/v2/paper/RefPaperDoc$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/RefPaperDoc$Serializer;

    .line 665
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 660
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 669
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/permanently_delete"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsPermanentlyDelete(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 697
    new-instance v0, Lcom/dropbox/core/v2/paper/RefPaperDoc;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/RefPaperDoc;-><init>(Ljava/lang/String;)V

    .line 698
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsPermanentlyDelete(Lcom/dropbox/core/v2/paper/RefPaperDoc;)V

    return-void
.end method

.method docsSharingPolicyGet(Lcom/dropbox/core/v2/paper/RefPaperDoc;)Lcom/dropbox/core/v2/paper/SharingPolicy;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 719
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/sharing_policy/get"

    sget-object v5, Lcom/dropbox/core/v2/paper/RefPaperDoc$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/RefPaperDoc$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/SharingPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/SharingPolicy$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/SharingPolicy;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 728
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/sharing_policy/get"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsSharingPolicyGet(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/SharingPolicy;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 755
    new-instance v0, Lcom/dropbox/core/v2/paper/RefPaperDoc;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/RefPaperDoc;-><init>(Ljava/lang/String;)V

    .line 756
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsSharingPolicyGet(Lcom/dropbox/core/v2/paper/RefPaperDoc;)Lcom/dropbox/core/v2/paper/SharingPolicy;

    move-result-object p1

    return-object p1
.end method

.method docsSharingPolicySet(Lcom/dropbox/core/v2/paper/PaperDocSharingPolicy;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 779
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/sharing_policy/set"

    sget-object v5, Lcom/dropbox/core/v2/paper/PaperDocSharingPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocSharingPolicy$Serializer;

    .line 784
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 779
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 788
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/sharing_policy/set"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsSharingPolicySet(Ljava/lang/String;Lcom/dropbox/core/v2/paper/SharingPolicy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 821
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperDocSharingPolicy;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/paper/PaperDocSharingPolicy;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/paper/SharingPolicy;)V

    .line 822
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsSharingPolicySet(Lcom/dropbox/core/v2/paper/PaperDocSharingPolicy;)V

    return-void
.end method

.method docsUpdate(Lcom/dropbox/core/v2/paper/PaperDocUpdateArgs;)Lcom/dropbox/core/v2/paper/DocsUpdateUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 843
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/paper/PaperDocUpdateArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocUpdateArgs$Serializer;

    const-string v2, "2/paper/docs/update"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 848
    new-instance v0, Lcom/dropbox/core/v2/paper/DocsUpdateUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/paper/DocsUpdateUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method public docsUpdate(Ljava/lang/String;Lcom/dropbox/core/v2/paper/PaperDocUpdatePolicy;JLcom/dropbox/core/v2/paper/ImportFormat;)Lcom/dropbox/core/v2/paper/DocsUpdateUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 881
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperDocUpdateArgs;

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/paper/PaperDocUpdateArgs;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/paper/PaperDocUpdatePolicy;JLcom/dropbox/core/v2/paper/ImportFormat;)V

    .line 882
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsUpdate(Lcom/dropbox/core/v2/paper/PaperDocUpdateArgs;)Lcom/dropbox/core/v2/paper/DocsUpdateUploader;

    move-result-object p1

    return-object p1
.end method

.method docsUsersAdd(Lcom/dropbox/core/v2/paper/AddPaperDocUser;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/paper/AddPaperDocUser;",
            ")",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/AddPaperDocUserMemberResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 903
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/users/add"

    sget-object v5, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/AddPaperDocUser$Serializer;

    sget-object v3, Lcom/dropbox/core/v2/paper/AddPaperDocUserMemberResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/AddPaperDocUserMemberResult$Serializer;

    .line 908
    invoke-static {v3}, Lcom/dropbox/core/stone/StoneSerializers;->list(Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 903
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 912
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/users/add"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsUsersAdd(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/AddMember;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/AddPaperDocUserMemberResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 946
    new-instance v0, Lcom/dropbox/core/v2/paper/AddPaperDocUser;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/paper/AddPaperDocUser;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 947
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsUsersAdd(Lcom/dropbox/core/v2/paper/AddPaperDocUser;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public docsUsersAddBuilder(Ljava/lang/String;Ljava/util/List;)Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/AddMember;",
            ">;)",
            "Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 976
    invoke-static {p1, p2}, Lcom/dropbox/core/v2/paper/AddPaperDocUser;->newBuilder(Ljava/lang/String;Ljava/util/List;)Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;

    move-result-object p1

    .line 977
    new-instance p2, Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;

    invoke-direct {p2, p0, p1}, Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;-><init>(Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;)V

    return-object p2
.end method

.method docsUsersList(Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1000
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/users/list"

    sget-object v5, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1009
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/users/list"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsUsersList(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1042
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs;-><init>(Ljava/lang/String;)V

    .line 1043
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsUsersList(Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse;

    move-result-object p1

    return-object p1
.end method

.method public docsUsersListBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/DocsUsersListBuilder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1071
    invoke-static {p1}, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs$Builder;

    move-result-object p1

    .line 1072
    new-instance v0, Lcom/dropbox/core/v2/paper/DocsUsersListBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/paper/DocsUsersListBuilder;-><init>(Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocArgs$Builder;)V

    return-object v0
.end method

.method docsUsersListContinue(Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocContinueArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/ListUsersCursorErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1093
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/users/list/continue"

    sget-object v5, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocContinueArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocContinueArgs$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1102
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersCursorErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    const-string v3, "2/paper/docs/users/list/continue"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/ListUsersCursorErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/ListUsersCursorError;)V

    throw v0
.end method

.method public docsUsersListContinue(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/ListUsersCursorErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1133
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocContinueArgs;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocContinueArgs;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1134
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsUsersListContinue(Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocContinueArgs;)Lcom/dropbox/core/v2/paper/ListUsersOnPaperDocResponse;

    move-result-object p1

    return-object p1
.end method

.method docsUsersRemove(Lcom/dropbox/core/v2/paper/RemovePaperDocUser;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1155
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/docs/users/remove"

    sget-object v5, Lcom/dropbox/core/v2/paper/RemovePaperDocUser$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/RemovePaperDocUser$Serializer;

    .line 1160
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/DocLookupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 1155
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1164
    new-instance v0, Lcom/dropbox/core/v2/paper/DocLookupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/DocLookupError;

    const-string v3, "2/paper/docs/users/remove"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/DocLookupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/DocLookupError;)V

    throw v0
.end method

.method public docsUsersRemove(Ljava/lang/String;Lcom/dropbox/core/v2/sharing/MemberSelector;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1194
    new-instance v0, Lcom/dropbox/core/v2/paper/RemovePaperDocUser;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/paper/RemovePaperDocUser;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/sharing/MemberSelector;)V

    .line 1195
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsUsersRemove(Lcom/dropbox/core/v2/paper/RemovePaperDocUser;)V

    return-void
.end method

.method foldersCreate(Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;)Lcom/dropbox/core/v2/paper/PaperFolderCreateResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/PaperFolderCreateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1214
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/paper/folders/create"

    sget-object v5, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/paper/PaperFolderCreateResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperFolderCreateResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/paper/PaperFolderCreateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperFolderCreateError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/PaperFolderCreateResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1223
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperFolderCreateErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/paper/PaperFolderCreateError;

    const-string v3, "2/paper/folders/create"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/paper/PaperFolderCreateErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/paper/PaperFolderCreateError;)V

    throw v0
.end method

.method public foldersCreate(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/PaperFolderCreateResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/PaperFolderCreateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1248
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;-><init>(Ljava/lang/String;)V

    .line 1249
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->foldersCreate(Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;)Lcom/dropbox/core/v2/paper/PaperFolderCreateResult;

    move-result-object p1

    return-object p1
.end method

.method public foldersCreateBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1273
    invoke-static {p1}, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;

    move-result-object p1

    .line 1274
    new-instance v0, Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;-><init>(Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;)V

    return-object v0
.end method
