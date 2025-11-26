.class public Lcom/dropbox/core/v2/files/DbxAppFilesRequests;
.super Ljava/lang/Object;
.source "DbxAppFilesRequests.java"


# instance fields
.field private final client:Lcom/dropbox/core/v2/DbxRawClientV2;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/dropbox/core/v2/files/DbxAppFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    return-void
.end method


# virtual methods
.method public getThumbnailV2(Lcom/dropbox/core/v2/files/PathOrLink;)Lcom/dropbox/core/DbxDownloader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/files/PathOrLink;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/PreviewResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ThumbnailV2ErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;-><init>(Lcom/dropbox/core/v2/files/PathOrLink;)V

    .line 84
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxAppFilesRequests;->getThumbnailV2(Lcom/dropbox/core/v2/files/ThumbnailV2Arg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method getThumbnailV2(Lcom/dropbox/core/v2/files/ThumbnailV2Arg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/files/ThumbnailV2Arg;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/PreviewResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ThumbnailV2ErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 47
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/get_thumbnail_v2"

    sget-object v6, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/PreviewResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PreviewResult$Serializer;

    sget-object v8, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;

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

    .line 57
    new-instance p2, Lcom/dropbox/core/v2/files/ThumbnailV2ErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    const-string v2, "2/files/get_thumbnail_v2"

    invoke-direct {p2, v2, v0, v1, p1}, Lcom/dropbox/core/v2/files/ThumbnailV2ErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/ThumbnailV2Error;)V

    throw p2
.end method

.method public getThumbnailV2Builder(Lcom/dropbox/core/v2/files/PathOrLink;)Lcom/dropbox/core/v2/files/DbxAppGetThumbnailV2Builder;
    .locals 1

    .line 105
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->newBuilder(Lcom/dropbox/core/v2/files/PathOrLink;)Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Builder;

    move-result-object p1

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/files/DbxAppGetThumbnailV2Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/DbxAppGetThumbnailV2Builder;-><init>(Lcom/dropbox/core/v2/files/DbxAppFilesRequests;Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Builder;)V

    return-object v0
.end method

.method listFolder(Lcom/dropbox/core/v2/files/ListFolderArg;)Lcom/dropbox/core/v2/files/ListFolderResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 142
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/list_folder"

    sget-object v5, Lcom/dropbox/core/v2/files/ListFolderArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/ListFolderResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/ListFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 151
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderError;

    const-string v3, "2/files/list_folder"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/ListFolderErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/ListFolderError;)V

    throw v0
.end method

.method public listFolder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 199
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg;-><init>(Ljava/lang/String;)V

    .line 200
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxAppFilesRequests;->listFolder(Lcom/dropbox/core/v2/files/ListFolderArg;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object p1

    return-object p1
.end method

.method public listFolderBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 239
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ListFolderArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    move-result-object p1

    .line 240
    new-instance v0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxAppFilesRequests;Lcom/dropbox/core/v2/files/ListFolderArg$Builder;)V

    return-object v0
.end method

.method listFolderContinue(Lcom/dropbox/core/v2/files/ListFolderContinueArg;)Lcom/dropbox/core/v2/files/ListFolderResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderContinueErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 256
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/list_folder/continue"

    sget-object v5, Lcom/dropbox/core/v2/files/ListFolderContinueArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderContinueArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/ListFolderResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/ListFolderContinueError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderContinueError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 265
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderContinueErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderContinueError;

    const-string v3, "2/files/list_folder/continue"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/ListFolderContinueErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/ListFolderContinueError;)V

    throw v0
.end method

.method public listFolderContinue(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderContinueErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 284
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderContinueArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderContinueArg;-><init>(Ljava/lang/String;)V

    .line 285
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxAppFilesRequests;->listFolderContinue(Lcom/dropbox/core/v2/files/ListFolderContinueArg;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object p1

    return-object p1
.end method
