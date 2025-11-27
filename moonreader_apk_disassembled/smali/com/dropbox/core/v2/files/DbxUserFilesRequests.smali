.class public Lcom/dropbox/core/v2/files/DbxUserFilesRequests;
.super Ljava/lang/Object;
.source "DbxUserFilesRequests.java"


# instance fields
.field private final client:Lcom/dropbox/core/v2/DbxRawClientV2;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    return-void
.end method


# virtual methods
.method alphaGetMetadata(Lcom/dropbox/core/v2/files/AlphaGetMetadataArg;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/AlphaGetMetadataErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 69
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/alpha/get_metadata"

    sget-object v5, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/Metadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/Metadata$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/Metadata;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    const-string v3, "2/files/alpha/get_metadata"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/AlphaGetMetadataError;)V

    throw v0
.end method

.method public alphaGetMetadata(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/AlphaGetMetadataErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 104
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg;-><init>(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->alphaGetMetadata(Lcom/dropbox/core/v2/files/AlphaGetMetadataArg;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object p1

    return-object p1
.end method

.method public alphaGetMetadataBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 127
    invoke-static {p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    move-result-object p1

    .line 128
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;)V

    return-object v0
.end method

.method alphaUpload(Lcom/dropbox/core/v2/files/UploadArg;)Lcom/dropbox/core/v2/files/AlphaUploadUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/files/UploadArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadArg$Serializer;

    const-string v2, "2/files/alpha/upload"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 150
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaUploadUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/files/AlphaUploadUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method public alphaUpload(Ljava/lang/String;)Lcom/dropbox/core/v2/files/AlphaUploadUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 177
    new-instance v0, Lcom/dropbox/core/v2/files/UploadArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg;-><init>(Ljava/lang/String;)V

    .line 178
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->alphaUpload(Lcom/dropbox/core/v2/files/UploadArg;)Lcom/dropbox/core/v2/files/AlphaUploadUploader;

    move-result-object p1

    return-object p1
.end method

.method public alphaUploadBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 201
    invoke-static {p1}, Lcom/dropbox/core/v2/files/UploadArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    move-result-object p1

    .line 202
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/UploadArg$Builder;)V

    return-object v0
.end method

.method copy(Lcom/dropbox/core/v2/files/RelocationArg;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RelocationErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 287
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/copy"

    sget-object v5, Lcom/dropbox/core/v2/files/RelocationArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/Metadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/Metadata$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/RelocationError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/Metadata;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 296
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationError;

    const-string v3, "2/files/copy"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/RelocationErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/RelocationError;)V

    throw v0
.end method

.method public copy(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RelocationErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 325
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/RelocationArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copy(Lcom/dropbox/core/v2/files/RelocationArg;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object p1

    return-object p1
.end method

.method copyBatch(Lcom/dropbox/core/v2/files/RelocationBatchArg;)Lcom/dropbox/core/v2/files/RelocationBatchLaunch;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 473
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/copy_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationBatchLaunch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchLaunch$Serializer;

    .line 479
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 473
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchLaunch;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 482
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"copy_batch\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public copyBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/RelocationBatchLaunch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/RelocationBatchLaunch;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 514
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/RelocationBatchArg;-><init>(Ljava/util/List;)V

    .line 515
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyBatch(Lcom/dropbox/core/v2/files/RelocationBatchArg;)Lcom/dropbox/core/v2/files/RelocationBatchLaunch;

    move-result-object p1

    return-object p1
.end method

.method public copyBatchBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/CopyBatchBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/CopyBatchBuilder;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 540
    invoke-static {p1}, Lcom/dropbox/core/v2/files/RelocationBatchArg;->newBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;

    move-result-object p1

    .line 541
    new-instance v0, Lcom/dropbox/core/v2/files/CopyBatchBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/CopyBatchBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;)V

    return-object v0
.end method

.method copyBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 611
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/copy_batch/check"

    sget-object v5, Lcom/dropbox/core/v2/async/PollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/async/PollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 620
    new-instance v0, Lcom/dropbox/core/v2/async/PollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/async/PollError;

    const-string v3, "2/files/copy_batch/check"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/async/PollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/async/PollError;)V

    throw v0
.end method

.method public copyBatchCheck(Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 640
    new-instance v0, Lcom/dropbox/core/v2/async/PollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/async/PollArg;-><init>(Ljava/lang/String;)V

    .line 641
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    move-result-object p1

    return-object p1
.end method

.method copyBatchCheckV2(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 563
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/copy_batch/check_v2"

    sget-object v5, Lcom/dropbox/core/v2/async/PollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/async/PollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 572
    new-instance v0, Lcom/dropbox/core/v2/async/PollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/async/PollError;

    const-string v3, "2/files/copy_batch/check_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/async/PollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/async/PollError;)V

    throw v0
.end method

.method public copyBatchCheckV2(Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 594
    new-instance v0, Lcom/dropbox/core/v2/async/PollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/async/PollArg;-><init>(Ljava/lang/String;)V

    .line 595
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyBatchCheckV2(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    move-result-object p1

    return-object p1
.end method

.method copyBatchV2(Lcom/dropbox/core/v2/files/RelocationBatchArgBase;)Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 376
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/copy_batch_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/RelocationBatchArgBase$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchArgBase$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationBatchV2Launch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchV2Launch$Serializer;

    .line 382
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 376
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 385
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"copy_batch_v2\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public copyBatchV2(Ljava/util/List;)Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 419
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchArgBase;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/RelocationBatchArgBase;-><init>(Ljava/util/List;)V

    .line 420
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyBatchV2(Lcom/dropbox/core/v2/files/RelocationBatchArgBase;)Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;

    move-result-object p1

    return-object p1
.end method

.method public copyBatchV2(Ljava/util/List;Z)Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;Z)",
            "Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 452
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchArgBase;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/RelocationBatchArgBase;-><init>(Ljava/util/List;Z)V

    .line 453
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyBatchV2(Lcom/dropbox/core/v2/files/RelocationBatchArgBase;)Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;

    move-result-object p1

    return-object p1
.end method

.method public copyBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/CopyBuilder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 351
    invoke-static {p1, p2}, Lcom/dropbox/core/v2/files/RelocationArg;->newBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationArg$Builder;

    move-result-object p1

    .line 352
    new-instance p2, Lcom/dropbox/core/v2/files/CopyBuilder;

    invoke-direct {p2, p0, p1}, Lcom/dropbox/core/v2/files/CopyBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/RelocationArg$Builder;)V

    return-object p2
.end method

.method copyReferenceGet(Lcom/dropbox/core/v2/files/GetCopyReferenceArg;)Lcom/dropbox/core/v2/files/GetCopyReferenceResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetCopyReferenceErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 656
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/copy_reference/get"

    sget-object v5, Lcom/dropbox/core/v2/files/GetCopyReferenceArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetCopyReferenceArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/GetCopyReferenceResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetCopyReferenceResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/GetCopyReferenceError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetCopyReferenceError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetCopyReferenceResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 665
    new-instance v0, Lcom/dropbox/core/v2/files/GetCopyReferenceErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetCopyReferenceError;

    const-string v3, "2/files/copy_reference/get"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/GetCopyReferenceErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/GetCopyReferenceError;)V

    throw v0
.end method

.method public copyReferenceGet(Ljava/lang/String;)Lcom/dropbox/core/v2/files/GetCopyReferenceResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetCopyReferenceErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 683
    new-instance v0, Lcom/dropbox/core/v2/files/GetCopyReferenceArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/GetCopyReferenceArg;-><init>(Ljava/lang/String;)V

    .line 684
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyReferenceGet(Lcom/dropbox/core/v2/files/GetCopyReferenceArg;)Lcom/dropbox/core/v2/files/GetCopyReferenceResult;

    move-result-object p1

    return-object p1
.end method

.method copyReferenceSave(Lcom/dropbox/core/v2/files/SaveCopyReferenceArg;)Lcom/dropbox/core/v2/files/SaveCopyReferenceResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SaveCopyReferenceErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 698
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/copy_reference/save"

    sget-object v5, Lcom/dropbox/core/v2/files/SaveCopyReferenceArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/SaveCopyReferenceResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SaveCopyReferenceResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 707
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    const-string v3, "2/files/copy_reference/save"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/SaveCopyReferenceErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/SaveCopyReferenceError;)V

    throw v0
.end method

.method public copyReferenceSave(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SaveCopyReferenceResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SaveCopyReferenceErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 725
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/SaveCopyReferenceArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 726
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyReferenceSave(Lcom/dropbox/core/v2/files/SaveCopyReferenceArg;)Lcom/dropbox/core/v2/files/SaveCopyReferenceResult;

    move-result-object p1

    return-object p1
.end method

.method copyV2(Lcom/dropbox/core/v2/files/RelocationArg;)Lcom/dropbox/core/v2/files/RelocationResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RelocationErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 216
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/copy_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/RelocationArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/RelocationError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 225
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationError;

    const-string v3, "2/files/copy_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/RelocationErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/RelocationError;)V

    throw v0
.end method

.method public copyV2(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RelocationErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 248
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/RelocationArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyV2(Lcom/dropbox/core/v2/files/RelocationArg;)Lcom/dropbox/core/v2/files/RelocationResult;

    move-result-object p1

    return-object p1
.end method

.method public copyV2Builder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/CopyV2Builder;
    .locals 0

    .line 270
    invoke-static {p1, p2}, Lcom/dropbox/core/v2/files/RelocationArg;->newBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationArg$Builder;

    move-result-object p1

    .line 271
    new-instance p2, Lcom/dropbox/core/v2/files/CopyV2Builder;

    invoke-direct {p2, p0, p1}, Lcom/dropbox/core/v2/files/CopyV2Builder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/RelocationArg$Builder;)V

    return-object p2
.end method

.method createFolder(Lcom/dropbox/core/v2/files/CreateFolderArg;)Lcom/dropbox/core/v2/files/FolderMetadata;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/CreateFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 795
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/create_folder"

    sget-object v5, Lcom/dropbox/core/v2/files/CreateFolderArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/FolderMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FolderMetadata$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/CreateFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/FolderMetadata;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 804
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/CreateFolderError;

    const-string v3, "2/files/create_folder"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/CreateFolderErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/CreateFolderError;)V

    throw v0
.end method

.method public createFolder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/FolderMetadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/CreateFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 825
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/CreateFolderArg;-><init>(Ljava/lang/String;)V

    .line 826
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->createFolder(Lcom/dropbox/core/v2/files/CreateFolderArg;)Lcom/dropbox/core/v2/files/FolderMetadata;

    move-result-object p1

    return-object p1
.end method

.method public createFolder(Ljava/lang/String;Z)Lcom/dropbox/core/v2/files/FolderMetadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/CreateFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 845
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/CreateFolderArg;-><init>(Ljava/lang/String;Z)V

    .line 846
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->createFolder(Lcom/dropbox/core/v2/files/CreateFolderArg;)Lcom/dropbox/core/v2/files/FolderMetadata;

    move-result-object p1

    return-object p1
.end method

.method createFolderBatch(Lcom/dropbox/core/v2/files/CreateFolderBatchArg;)Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 869
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/create_folder_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch$Serializer;

    .line 875
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 869
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 878
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"create_folder_batch\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public createFolderBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 909
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;-><init>(Ljava/util/List;)V

    .line 910
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->createFolderBatch(Lcom/dropbox/core/v2/files/CreateFolderBatchArg;)Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch;

    move-result-object p1

    return-object p1
.end method

.method public createFolderBatchBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;"
        }
    .end annotation

    .line 934
    invoke-static {p1}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg;->newBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

    move-result-object p1

    .line 935
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;)V

    return-object v0
.end method

.method createFolderBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/CreateFolderBatchJobStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 952
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/create_folder_batch/check"

    sget-object v5, Lcom/dropbox/core/v2/async/PollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/CreateFolderBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderBatchJobStatus$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/async/PollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/CreateFolderBatchJobStatus;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 961
    new-instance v0, Lcom/dropbox/core/v2/async/PollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/async/PollError;

    const-string v3, "2/files/create_folder_batch/check"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/async/PollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/async/PollError;)V

    throw v0
.end method

.method public createFolderBatchCheck(Ljava/lang/String;)Lcom/dropbox/core/v2/files/CreateFolderBatchJobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 978
    new-instance v0, Lcom/dropbox/core/v2/async/PollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/async/PollArg;-><init>(Ljava/lang/String;)V

    .line 979
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->createFolderBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/CreateFolderBatchJobStatus;

    move-result-object p1

    return-object p1
.end method

.method createFolderV2(Lcom/dropbox/core/v2/files/CreateFolderArg;)Lcom/dropbox/core/v2/files/CreateFolderResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/CreateFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 739
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/create_folder_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/CreateFolderArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/CreateFolderResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/CreateFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/CreateFolderResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 748
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/CreateFolderError;

    const-string v3, "2/files/create_folder_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/CreateFolderErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/CreateFolderError;)V

    throw v0
.end method

.method public createFolderV2(Ljava/lang/String;)Lcom/dropbox/core/v2/files/CreateFolderResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/CreateFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 765
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/CreateFolderArg;-><init>(Ljava/lang/String;)V

    .line 766
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->createFolderV2(Lcom/dropbox/core/v2/files/CreateFolderArg;)Lcom/dropbox/core/v2/files/CreateFolderResult;

    move-result-object p1

    return-object p1
.end method

.method public createFolderV2(Ljava/lang/String;Z)Lcom/dropbox/core/v2/files/CreateFolderResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/CreateFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 781
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/CreateFolderArg;-><init>(Ljava/lang/String;Z)V

    .line 782
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->createFolderV2(Lcom/dropbox/core/v2/files/CreateFolderArg;)Lcom/dropbox/core/v2/files/CreateFolderResult;

    move-result-object p1

    return-object p1
.end method

.method delete(Lcom/dropbox/core/v2/files/DeleteArg;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1080
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/delete"

    sget-object v5, Lcom/dropbox/core/v2/files/DeleteArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/Metadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/Metadata$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/DeleteError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/Metadata;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1089
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/DeleteError;

    const-string v3, "2/files/delete"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/DeleteErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/DeleteError;)V

    throw v0
.end method

.method public delete(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1117
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/DeleteArg;-><init>(Ljava/lang/String;)V

    .line 1118
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->delete(Lcom/dropbox/core/v2/files/DeleteArg;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object p1

    return-object p1
.end method

.method public delete(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-eqz p2, :cond_2

    .line 1149
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_1

    .line 1152
    const-string v0, "[0-9a-f]+"

    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1153
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'parentRev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1150
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'parentRev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1156
    :cond_2
    :goto_0
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/DeleteArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1157
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->delete(Lcom/dropbox/core/v2/files/DeleteArg;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object p1

    return-object p1
.end method

.method deleteBatch(Lcom/dropbox/core/v2/files/DeleteBatchArg;)Lcom/dropbox/core/v2/files/DeleteBatchLaunch;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1176
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/delete_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/DeleteBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/DeleteBatchLaunch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchLaunch$Serializer;

    .line 1182
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 1176
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/DeleteBatchLaunch;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1185
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"delete_batch\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public deleteBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/DeleteBatchLaunch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/DeleteArg;",
            ">;)",
            "Lcom/dropbox/core/v2/files/DeleteBatchLaunch;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1207
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/DeleteBatchArg;-><init>(Ljava/util/List;)V

    .line 1208
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->deleteBatch(Lcom/dropbox/core/v2/files/DeleteBatchArg;)Lcom/dropbox/core/v2/files/DeleteBatchLaunch;

    move-result-object p1

    return-object p1
.end method

.method deleteBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1225
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/delete_batch/check"

    sget-object v5, Lcom/dropbox/core/v2/async/PollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/async/PollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1234
    new-instance v0, Lcom/dropbox/core/v2/async/PollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/async/PollError;

    const-string v3, "2/files/delete_batch/check"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/async/PollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/async/PollError;)V

    throw v0
.end method

.method public deleteBatchCheck(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1251
    new-instance v0, Lcom/dropbox/core/v2/async/PollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/async/PollArg;-><init>(Ljava/lang/String;)V

    .line 1252
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->deleteBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    move-result-object p1

    return-object p1
.end method

.method deleteV2(Lcom/dropbox/core/v2/files/DeleteArg;)Lcom/dropbox/core/v2/files/DeleteResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 996
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/delete_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/DeleteArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/DeleteResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/DeleteError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/DeleteResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1005
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/DeleteError;

    const-string v3, "2/files/delete_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/DeleteErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/DeleteError;)V

    throw v0
.end method

.method public deleteV2(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeleteResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1027
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/DeleteArg;-><init>(Ljava/lang/String;)V

    .line 1028
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->deleteV2(Lcom/dropbox/core/v2/files/DeleteArg;)Lcom/dropbox/core/v2/files/DeleteResult;

    move-result-object p1

    return-object p1
.end method

.method public deleteV2(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeleteResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p2, :cond_2

    .line 1053
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_1

    .line 1056
    const-string v0, "[0-9a-f]+"

    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1057
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'parentRev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1054
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'parentRev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1060
    :cond_2
    :goto_0
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/DeleteArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1061
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->deleteV2(Lcom/dropbox/core/v2/files/DeleteArg;)Lcom/dropbox/core/v2/files/DeleteResult;

    move-result-object p1

    return-object p1
.end method

.method download(Lcom/dropbox/core/v2/files/DownloadArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/files/DownloadArg;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/FileMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DownloadErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1269
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/download"

    sget-object v6, Lcom/dropbox/core/v2/files/DownloadArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DownloadArg$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/FileMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileMetadata$Serializer;

    sget-object v8, Lcom/dropbox/core/v2/files/DownloadError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DownloadError$Serializer;

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

    .line 1279
    new-instance p2, Lcom/dropbox/core/v2/files/DownloadErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/DownloadError;

    const-string v2, "2/files/download"

    invoke-direct {p2, v2, v0, v1, p1}, Lcom/dropbox/core/v2/files/DownloadErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/DownloadError;)V

    throw p2
.end method

.method public download(Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/FileMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DownloadErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1297
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/DownloadArg;-><init>(Ljava/lang/String;)V

    .line 1298
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->download(Lcom/dropbox/core/v2/files/DownloadArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method public download(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/FileMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DownloadErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p2, :cond_2

    .line 1319
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_1

    .line 1322
    const-string v0, "[0-9a-f]+"

    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1323
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1320
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1326
    :cond_2
    :goto_0
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/DownloadArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1327
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->download(Lcom/dropbox/core/v2/files/DownloadArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method public downloadBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DownloadBuilder;
    .locals 1

    .line 1344
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/DownloadBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Ljava/lang/String;)V

    return-object v0
.end method

.method downloadZip(Lcom/dropbox/core/v2/files/DownloadZipArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/files/DownloadZipArg;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/DownloadZipResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DownloadZipErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1365
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/download_zip"

    sget-object v6, Lcom/dropbox/core/v2/files/DownloadZipArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DownloadZipArg$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/DownloadZipResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DownloadZipResult$Serializer;

    sget-object v8, Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;

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

    .line 1375
    new-instance p2, Lcom/dropbox/core/v2/files/DownloadZipErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/DownloadZipError;

    const-string v2, "2/files/download_zip"

    invoke-direct {p2, v2, v0, v1, p1}, Lcom/dropbox/core/v2/files/DownloadZipErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/DownloadZipError;)V

    throw p2
.end method

.method public downloadZip(Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/DownloadZipResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DownloadZipErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1399
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadZipArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/DownloadZipArg;-><init>(Ljava/lang/String;)V

    .line 1400
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->downloadZip(Lcom/dropbox/core/v2/files/DownloadZipArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method public downloadZipBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DownloadZipBuilder;
    .locals 1

    .line 1421
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadZipBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/DownloadZipBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Ljava/lang/String;)V

    return-object v0
.end method

.method export(Lcom/dropbox/core/v2/files/ExportArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/files/ExportArg;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/ExportResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ExportErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1441
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/export"

    sget-object v6, Lcom/dropbox/core/v2/files/ExportArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ExportArg$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/ExportResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ExportResult$Serializer;

    sget-object v8, Lcom/dropbox/core/v2/files/ExportError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ExportError$Serializer;

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

    .line 1451
    new-instance p2, Lcom/dropbox/core/v2/files/ExportErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ExportError;

    const-string v2, "2/files/export"

    invoke-direct {p2, v2, v0, v1, p1}, Lcom/dropbox/core/v2/files/ExportErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/ExportError;)V

    throw p2
.end method

.method public export(Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/ExportResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ExportErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1472
    new-instance v0, Lcom/dropbox/core/v2/files/ExportArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ExportArg;-><init>(Ljava/lang/String;)V

    .line 1473
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->export(Lcom/dropbox/core/v2/files/ExportArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method public export(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/ExportResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ExportErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1499
    new-instance v0, Lcom/dropbox/core/v2/files/ExportArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/ExportArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1500
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->export(Lcom/dropbox/core/v2/files/ExportArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method public exportBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ExportBuilder;
    .locals 1

    .line 1520
    new-instance v0, Lcom/dropbox/core/v2/files/ExportBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/ExportBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Ljava/lang/String;)V

    return-object v0
.end method

.method getFileLockBatch(Lcom/dropbox/core/v2/files/LockFileBatchArg;)Lcom/dropbox/core/v2/files/LockFileBatchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/LockFileErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1533
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/get_file_lock_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/LockFileBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/LockFileBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileBatchResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/LockFileBatchResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1542
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/LockFileError;

    const-string v3, "2/files/get_file_lock_batch"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/LockFileErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/LockFileError;)V

    throw v0
.end method

.method public getFileLockBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/LockFileBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/LockFileArg;",
            ">;)",
            "Lcom/dropbox/core/v2/files/LockFileBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/LockFileErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1558
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/LockFileBatchArg;-><init>(Ljava/util/List;)V

    .line 1559
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getFileLockBatch(Lcom/dropbox/core/v2/files/LockFileBatchArg;)Lcom/dropbox/core/v2/files/LockFileBatchResult;

    move-result-object p1

    return-object p1
.end method

.method getMetadata(Lcom/dropbox/core/v2/files/GetMetadataArg;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetMetadataErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1575
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/get_metadata"

    sget-object v5, Lcom/dropbox/core/v2/files/GetMetadataArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetMetadataArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/Metadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/Metadata$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/Metadata;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1584
    new-instance v0, Lcom/dropbox/core/v2/files/GetMetadataErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetMetadataError;

    const-string v3, "2/files/get_metadata"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/GetMetadataErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/GetMetadataError;)V

    throw v0
.end method

.method public getMetadata(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetMetadataErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1606
    new-instance v0, Lcom/dropbox/core/v2/files/GetMetadataArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/GetMetadataArg;-><init>(Ljava/lang/String;)V

    .line 1607
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getMetadata(Lcom/dropbox/core/v2/files/GetMetadataArg;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object p1

    return-object p1
.end method

.method public getMetadataBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/GetMetadataBuilder;
    .locals 1

    .line 1625
    invoke-static {p1}, Lcom/dropbox/core/v2/files/GetMetadataArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    move-result-object p1

    .line 1626
    new-instance v0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/GetMetadataBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;)V

    return-object v0
.end method

.method getPreview(Lcom/dropbox/core/v2/files/PreviewArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/files/PreviewArg;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/FileMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/PreviewErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1648
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/get_preview"

    sget-object v6, Lcom/dropbox/core/v2/files/PreviewArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PreviewArg$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/FileMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileMetadata$Serializer;

    sget-object v8, Lcom/dropbox/core/v2/files/PreviewError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PreviewError$Serializer;

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

    .line 1658
    new-instance p2, Lcom/dropbox/core/v2/files/PreviewErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/PreviewError;

    const-string v2, "2/files/get_preview"

    invoke-direct {p2, v2, v0, v1, p1}, Lcom/dropbox/core/v2/files/PreviewErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/PreviewError;)V

    throw p2
.end method

.method public getPreview(Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/FileMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/PreviewErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1685
    new-instance v0, Lcom/dropbox/core/v2/files/PreviewArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/PreviewArg;-><init>(Ljava/lang/String;)V

    .line 1686
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getPreview(Lcom/dropbox/core/v2/files/PreviewArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method public getPreview(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/FileMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/PreviewErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p2, :cond_2

    .line 1716
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_1

    .line 1719
    const-string v0, "[0-9a-f]+"

    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1720
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1717
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1723
    :cond_2
    :goto_0
    new-instance v0, Lcom/dropbox/core/v2/files/PreviewArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/PreviewArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1724
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getPreview(Lcom/dropbox/core/v2/files/PreviewArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method public getPreviewBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/GetPreviewBuilder;
    .locals 1

    .line 1746
    new-instance v0, Lcom/dropbox/core/v2/files/GetPreviewBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/GetPreviewBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Ljava/lang/String;)V

    return-object v0
.end method

.method getTemporaryLink(Lcom/dropbox/core/v2/files/GetTemporaryLinkArg;)Lcom/dropbox/core/v2/files/GetTemporaryLinkResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetTemporaryLinkErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1762
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/get_temporary_link"

    sget-object v5, Lcom/dropbox/core/v2/files/GetTemporaryLinkArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetTemporaryLinkArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/GetTemporaryLinkResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetTemporaryLinkResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetTemporaryLinkError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetTemporaryLinkResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1771
    new-instance v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetTemporaryLinkError;

    const-string v3, "2/files/get_temporary_link"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/GetTemporaryLinkError;)V

    throw v0
.end method

.method public getTemporaryLink(Ljava/lang/String;)Lcom/dropbox/core/v2/files/GetTemporaryLinkResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetTemporaryLinkErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1790
    new-instance v0, Lcom/dropbox/core/v2/files/GetTemporaryLinkArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/GetTemporaryLinkArg;-><init>(Ljava/lang/String;)V

    .line 1791
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getTemporaryLink(Lcom/dropbox/core/v2/files/GetTemporaryLinkArg;)Lcom/dropbox/core/v2/files/GetTemporaryLinkResult;

    move-result-object p1

    return-object p1
.end method

.method public getTemporaryUploadLink(Lcom/dropbox/core/v2/files/CommitInfo;)Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1922
    new-instance v0, Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg;-><init>(Lcom/dropbox/core/v2/files/CommitInfo;)V

    .line 1923
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getTemporaryUploadLink(Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg;)Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkResult;

    move-result-object p1

    return-object p1
.end method

.method public getTemporaryUploadLink(Lcom/dropbox/core/v2/files/CommitInfo;D)Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkResult;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const-wide/high16 v0, 0x404e000000000000L    # 60.0

    cmpg-double v2, p2, v0

    if-ltz v2, :cond_1

    const-wide v0, 0x40cc200000000000L    # 14400.0

    cmpl-double v2, p2, v0

    if-gtz v2, :cond_0

    .line 1996
    new-instance v0, Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg;

    invoke-direct {v0, p1, p2, p3}, Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg;-><init>(Lcom/dropbox/core/v2/files/CommitInfo;D)V

    .line 1997
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getTemporaryUploadLink(Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg;)Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkResult;

    move-result-object p1

    return-object p1

    .line 1994
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'duration\' is larger than 14400.0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1991
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'duration\' is smaller than 60.0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method getTemporaryUploadLink(Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg;)Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1846
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/get_temporary_upload_link"

    sget-object v5, Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkResult$Serializer;

    .line 1852
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 1846
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetTemporaryUploadLinkResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1855
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"get_temporary_upload_link\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method getThumbnail(Lcom/dropbox/core/v2/files/ThumbnailArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/files/ThumbnailArg;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/FileMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ThumbnailErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2017
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/get_thumbnail"

    sget-object v6, Lcom/dropbox/core/v2/files/ThumbnailArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailArg$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/FileMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileMetadata$Serializer;

    sget-object v8, Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;

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

    .line 2027
    new-instance p2, Lcom/dropbox/core/v2/files/ThumbnailErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ThumbnailError;

    const-string v2, "2/files/get_thumbnail"

    invoke-direct {p2, v2, v0, v1, p1}, Lcom/dropbox/core/v2/files/ThumbnailErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/ThumbnailError;)V

    throw p2
.end method

.method public getThumbnail(Ljava/lang/String;)Lcom/dropbox/core/DbxDownloader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/files/FileMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ThumbnailErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2053
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ThumbnailArg;-><init>(Ljava/lang/String;)V

    .line 2054
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getThumbnail(Lcom/dropbox/core/v2/files/ThumbnailArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object p1

    return-object p1
.end method

.method getThumbnailBatch(Lcom/dropbox/core/v2/files/GetThumbnailBatchArg;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetThumbnailBatchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2174
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/get_thumbnail_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/GetThumbnailBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetThumbnailBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/GetThumbnailBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetThumbnailBatchResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/GetThumbnailBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetThumbnailBatchError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2183
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchError;

    const-string v3, "2/files/get_thumbnail_batch"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/GetThumbnailBatchError;)V

    throw v0
.end method

.method public getThumbnailBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/ThumbnailArg;",
            ">;)",
            "Lcom/dropbox/core/v2/files/GetThumbnailBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetThumbnailBatchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2202
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchArg;-><init>(Ljava/util/List;)V

    .line 2203
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getThumbnailBatch(Lcom/dropbox/core/v2/files/GetThumbnailBatchArg;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public getThumbnailBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/GetThumbnailBuilder;
    .locals 1

    .line 2075
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;

    move-result-object p1

    .line 2076
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/GetThumbnailBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/ThumbnailArg$Builder;)V

    return-object v0
.end method

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

    .line 2132
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;-><init>(Lcom/dropbox/core/v2/files/PathOrLink;)V

    .line 2133
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getThumbnailV2(Lcom/dropbox/core/v2/files/ThumbnailV2Arg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

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

    .line 2096
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

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

    .line 2106
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

.method public getThumbnailV2Builder(Lcom/dropbox/core/v2/files/PathOrLink;)Lcom/dropbox/core/v2/files/DbxUserGetThumbnailV2Builder;
    .locals 1

    .line 2154
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->newBuilder(Lcom/dropbox/core/v2/files/PathOrLink;)Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Builder;

    move-result-object p1

    .line 2155
    new-instance v0, Lcom/dropbox/core/v2/files/DbxUserGetThumbnailV2Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/DbxUserGetThumbnailV2Builder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Builder;)V

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

    .line 2239
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

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

    .line 2248
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

    .line 2296
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg;-><init>(Ljava/lang/String;)V

    .line 2297
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolder(Lcom/dropbox/core/v2/files/ListFolderArg;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object p1

    return-object p1
.end method

.method public listFolderBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DbxUserListFolderBuilder;
    .locals 1

    .line 2336
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ListFolderArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    move-result-object p1

    .line 2337
    new-instance v0, Lcom/dropbox/core/v2/files/DbxUserListFolderBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/DbxUserListFolderBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/ListFolderArg$Builder;)V

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

    .line 2353
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

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

    .line 2362
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

    .line 2381
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderContinueArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderContinueArg;-><init>(Ljava/lang/String;)V

    .line 2382
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolderContinue(Lcom/dropbox/core/v2/files/ListFolderContinueArg;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object p1

    return-object p1
.end method

.method listFolderGetLatestCursor(Lcom/dropbox/core/v2/files/ListFolderArg;)Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2400
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/list_folder/get_latest_cursor"

    sget-object v5, Lcom/dropbox/core/v2/files/ListFolderArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/ListFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2409
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderError;

    const-string v3, "2/files/list_folder/get_latest_cursor"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/ListFolderErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/ListFolderError;)V

    throw v0
.end method

.method public listFolderGetLatestCursor(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2431
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg;-><init>(Ljava/lang/String;)V

    .line 2432
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolderGetLatestCursor(Lcom/dropbox/core/v2/files/ListFolderArg;)Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorResult;

    move-result-object p1

    return-object p1
.end method

.method public listFolderGetLatestCursorBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorBuilder;
    .locals 1

    .line 2453
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ListFolderArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    move-result-object p1

    .line 2454
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/ListFolderGetLatestCursorBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/ListFolderArg$Builder;)V

    return-object v0
.end method

.method listFolderLongpoll(Lcom/dropbox/core/v2/files/ListFolderLongpollArg;)Lcom/dropbox/core/v2/files/ListFolderLongpollResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderLongpollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2474
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getNotify()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/list_folder/longpoll"

    sget-object v5, Lcom/dropbox/core/v2/files/ListFolderLongpollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderLongpollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/ListFolderLongpollResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderLongpollResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/ListFolderLongpollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderLongpollError$Serializer;

    const/4 v4, 0x1

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderLongpollResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2483
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderLongpollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderLongpollError;

    const-string v3, "2/files/list_folder/longpoll"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/ListFolderLongpollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/ListFolderLongpollError;)V

    throw v0
.end method

.method public listFolderLongpoll(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderLongpollResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderLongpollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2511
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderLongpollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderLongpollArg;-><init>(Ljava/lang/String;)V

    .line 2512
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolderLongpoll(Lcom/dropbox/core/v2/files/ListFolderLongpollArg;)Lcom/dropbox/core/v2/files/ListFolderLongpollResult;

    move-result-object p1

    return-object p1
.end method

.method public listFolderLongpoll(Ljava/lang/String;J)Lcom/dropbox/core/v2/files/ListFolderLongpollResult;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderLongpollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const-wide/16 v0, 0x1e

    cmp-long v2, p2, v0

    if-ltz v2, :cond_1

    const-wide/16 v0, 0x1e0

    cmp-long v2, p2, v0

    if-gtz v2, :cond_0

    .line 2548
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderLongpollArg;

    invoke-direct {v0, p1, p2, p3}, Lcom/dropbox/core/v2/files/ListFolderLongpollArg;-><init>(Ljava/lang/String;J)V

    .line 2549
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolderLongpoll(Lcom/dropbox/core/v2/files/ListFolderLongpollArg;)Lcom/dropbox/core/v2/files/ListFolderLongpollResult;

    move-result-object p1

    return-object p1

    .line 2546
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'timeout\' is larger than 480L"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2543
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'timeout\' is smaller than 30L"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method listRevisions(Lcom/dropbox/core/v2/files/ListRevisionsArg;)Lcom/dropbox/core/v2/files/ListRevisionsResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListRevisionsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2570
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/list_revisions"

    sget-object v5, Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/ListRevisionsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListRevisionsResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/ListRevisionsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListRevisionsError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListRevisionsResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2579
    new-instance v0, Lcom/dropbox/core/v2/files/ListRevisionsErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/ListRevisionsError;

    const-string v3, "2/files/list_revisions"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/ListRevisionsErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/ListRevisionsError;)V

    throw v0
.end method

.method public listRevisions(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListRevisionsResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListRevisionsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2606
    new-instance v0, Lcom/dropbox/core/v2/files/ListRevisionsArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/ListRevisionsArg;-><init>(Ljava/lang/String;)V

    .line 2607
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listRevisions(Lcom/dropbox/core/v2/files/ListRevisionsArg;)Lcom/dropbox/core/v2/files/ListRevisionsResult;

    move-result-object p1

    return-object p1
.end method

.method public listRevisionsBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListRevisionsBuilder;
    .locals 1

    .line 2632
    invoke-static {p1}, Lcom/dropbox/core/v2/files/ListRevisionsArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

    move-result-object p1

    .line 2633
    new-instance v0, Lcom/dropbox/core/v2/files/ListRevisionsBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/ListRevisionsBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;)V

    return-object v0
.end method

.method lockFileBatch(Lcom/dropbox/core/v2/files/LockFileBatchArg;)Lcom/dropbox/core/v2/files/LockFileBatchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/LockFileErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2649
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/lock_file_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/LockFileBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/LockFileBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileBatchResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/LockFileBatchResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2658
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/LockFileError;

    const-string v3, "2/files/lock_file_batch"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/LockFileErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/LockFileError;)V

    throw v0
.end method

.method public lockFileBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/LockFileBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/LockFileArg;",
            ">;)",
            "Lcom/dropbox/core/v2/files/LockFileBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/LockFileErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2677
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/LockFileBatchArg;-><init>(Ljava/util/List;)V

    .line 2678
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->lockFileBatch(Lcom/dropbox/core/v2/files/LockFileBatchArg;)Lcom/dropbox/core/v2/files/LockFileBatchResult;

    move-result-object p1

    return-object p1
.end method

.method move(Lcom/dropbox/core/v2/files/RelocationArg;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RelocationErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2767
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/move"

    sget-object v5, Lcom/dropbox/core/v2/files/RelocationArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/Metadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/Metadata$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/RelocationError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/Metadata;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2776
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationError;

    const-string v3, "2/files/move"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/RelocationErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/RelocationError;)V

    throw v0
.end method

.method public move(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RelocationErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2805
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/RelocationArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2806
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->move(Lcom/dropbox/core/v2/files/RelocationArg;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object p1

    return-object p1
.end method

.method moveBatch(Lcom/dropbox/core/v2/files/RelocationBatchArg;)Lcom/dropbox/core/v2/files/RelocationBatchLaunch;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2947
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/move_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationBatchLaunch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchLaunch$Serializer;

    .line 2953
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 2947
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchLaunch;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2956
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"move_batch\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public moveBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/RelocationBatchLaunch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/RelocationBatchLaunch;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2987
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/RelocationBatchArg;-><init>(Ljava/util/List;)V

    .line 2988
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->moveBatch(Lcom/dropbox/core/v2/files/RelocationBatchArg;)Lcom/dropbox/core/v2/files/RelocationBatchLaunch;

    move-result-object p1

    return-object p1
.end method

.method public moveBatchBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/MoveBatchBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/MoveBatchBuilder;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3012
    invoke-static {p1}, Lcom/dropbox/core/v2/files/RelocationBatchArg;->newBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;

    move-result-object p1

    .line 3013
    new-instance v0, Lcom/dropbox/core/v2/files/MoveBatchBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/MoveBatchBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;)V

    return-object v0
.end method

.method moveBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3083
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/move_batch/check"

    sget-object v5, Lcom/dropbox/core/v2/async/PollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/async/PollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3092
    new-instance v0, Lcom/dropbox/core/v2/async/PollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/async/PollError;

    const-string v3, "2/files/move_batch/check"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/async/PollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/async/PollError;)V

    throw v0
.end method

.method public moveBatchCheck(Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3112
    new-instance v0, Lcom/dropbox/core/v2/async/PollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/async/PollArg;-><init>(Ljava/lang/String;)V

    .line 3113
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->moveBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    move-result-object p1

    return-object p1
.end method

.method moveBatchCheckV2(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3035
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/move_batch/check_v2"

    sget-object v5, Lcom/dropbox/core/v2/async/PollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/async/PollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3044
    new-instance v0, Lcom/dropbox/core/v2/async/PollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/async/PollError;

    const-string v3, "2/files/move_batch/check_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/async/PollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/async/PollError;)V

    throw v0
.end method

.method public moveBatchCheckV2(Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3066
    new-instance v0, Lcom/dropbox/core/v2/async/PollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/async/PollArg;-><init>(Ljava/lang/String;)V

    .line 3067
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->moveBatchCheckV2(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    move-result-object p1

    return-object p1
.end method

.method moveBatchV2(Lcom/dropbox/core/v2/files/MoveBatchArg;)Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2857
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/move_batch_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationBatchV2Launch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchV2Launch$Serializer;

    .line 2863
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 2857
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2866
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"move_batch_v2\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public moveBatchV2(Ljava/util/List;)Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2900
    new-instance v0, Lcom/dropbox/core/v2/files/MoveBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/MoveBatchArg;-><init>(Ljava/util/List;)V

    .line 2901
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->moveBatchV2(Lcom/dropbox/core/v2/files/MoveBatchArg;)Lcom/dropbox/core/v2/files/RelocationBatchV2Launch;

    move-result-object p1

    return-object p1
.end method

.method public moveBatchV2Builder(Ljava/util/List;)Lcom/dropbox/core/v2/files/MoveBatchV2Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/MoveBatchV2Builder;"
        }
    .end annotation

    .line 2926
    invoke-static {p1}, Lcom/dropbox/core/v2/files/MoveBatchArg;->newBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;

    move-result-object p1

    .line 2927
    new-instance v0, Lcom/dropbox/core/v2/files/MoveBatchV2Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/MoveBatchV2Builder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;)V

    return-object v0
.end method

.method public moveBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/MoveBuilder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2831
    invoke-static {p1, p2}, Lcom/dropbox/core/v2/files/RelocationArg;->newBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationArg$Builder;

    move-result-object p1

    .line 2832
    new-instance p2, Lcom/dropbox/core/v2/files/MoveBuilder;

    invoke-direct {p2, p0, p1}, Lcom/dropbox/core/v2/files/MoveBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/RelocationArg$Builder;)V

    return-object p2
.end method

.method moveV2(Lcom/dropbox/core/v2/files/RelocationArg;)Lcom/dropbox/core/v2/files/RelocationResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RelocationErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2693
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/move_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/RelocationArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/RelocationResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/RelocationError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 2702
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RelocationError;

    const-string v3, "2/files/move_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/RelocationErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/RelocationError;)V

    throw v0
.end method

.method public moveV2(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RelocationErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2727
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/RelocationArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2728
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->moveV2(Lcom/dropbox/core/v2/files/RelocationArg;)Lcom/dropbox/core/v2/files/RelocationResult;

    move-result-object p1

    return-object p1
.end method

.method public moveV2Builder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/MoveV2Builder;
    .locals 0

    .line 2750
    invoke-static {p1, p2}, Lcom/dropbox/core/v2/files/RelocationArg;->newBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationArg$Builder;

    move-result-object p1

    .line 2751
    new-instance p2, Lcom/dropbox/core/v2/files/MoveV2Builder;

    invoke-direct {p2, p0, p1}, Lcom/dropbox/core/v2/files/MoveV2Builder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/RelocationArg$Builder;)V

    return-object p2
.end method

.method paperCreate(Lcom/dropbox/core/v2/files/PaperCreateArg;)Lcom/dropbox/core/v2/files/PaperCreateUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3127
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/files/PaperCreateArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperCreateArg$Serializer;

    const-string v2, "2/files/paper/create"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 3132
    new-instance v0, Lcom/dropbox/core/v2/files/PaperCreateUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/files/PaperCreateUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method public paperCreate(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;)Lcom/dropbox/core/v2/files/PaperCreateUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3151
    new-instance v0, Lcom/dropbox/core/v2/files/PaperCreateArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/PaperCreateArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;)V

    .line 3152
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->paperCreate(Lcom/dropbox/core/v2/files/PaperCreateArg;)Lcom/dropbox/core/v2/files/PaperCreateUploader;

    move-result-object p1

    return-object p1
.end method

.method paperUpdate(Lcom/dropbox/core/v2/files/PaperUpdateArg;)Lcom/dropbox/core/v2/files/PaperUpdateUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3166
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateArg$Serializer;

    const-string v2, "2/files/paper/update"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 3171
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/files/PaperUpdateUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method public paperUpdate(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;)Lcom/dropbox/core/v2/files/PaperUpdateUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3192
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateArg;

    invoke-direct {v0, p1, p2, p3}, Lcom/dropbox/core/v2/files/PaperUpdateArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;)V

    .line 3193
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->paperUpdate(Lcom/dropbox/core/v2/files/PaperUpdateArg;)Lcom/dropbox/core/v2/files/PaperUpdateUploader;

    move-result-object p1

    return-object p1
.end method

.method public paperUpdate(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;Ljava/lang/Long;)Lcom/dropbox/core/v2/files/PaperUpdateUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3217
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateArg;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/dropbox/core/v2/files/PaperUpdateArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ImportFormat;Lcom/dropbox/core/v2/files/PaperDocUpdatePolicy;Ljava/lang/Long;)V

    .line 3218
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->paperUpdate(Lcom/dropbox/core/v2/files/PaperUpdateArg;)Lcom/dropbox/core/v2/files/PaperUpdateUploader;

    move-result-object p1

    return-object p1
.end method

.method permanentlyDelete(Lcom/dropbox/core/v2/files/DeleteArg;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3235
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/permanently_delete"

    sget-object v5, Lcom/dropbox/core/v2/files/DeleteArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteArg$Serializer;

    .line 3240
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/files/DeleteError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 3235
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3244
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/DeleteError;

    const-string v3, "2/files/permanently_delete"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/DeleteErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/DeleteError;)V

    throw v0
.end method

.method public permanentlyDelete(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3266
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/DeleteArg;-><init>(Ljava/lang/String;)V

    .line 3267
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->permanentlyDelete(Lcom/dropbox/core/v2/files/DeleteArg;)V

    return-void
.end method

.method public permanentlyDelete(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/DeleteErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p2, :cond_2

    .line 3292
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_1

    .line 3295
    const-string v0, "[0-9a-f]+"

    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 3296
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'parentRev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3293
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'parentRev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3299
    :cond_2
    :goto_0
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/DeleteArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3300
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->permanentlyDelete(Lcom/dropbox/core/v2/files/DeleteArg;)V

    return-void
.end method

.method propertiesAdd(Lcom/dropbox/core/v2/fileproperties/AddPropertiesArg;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/AddPropertiesErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3312
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/properties/add"

    sget-object v5, Lcom/dropbox/core/v2/fileproperties/AddPropertiesArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesArg$Serializer;

    .line 3317
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 3312
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3321
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    const-string v3, "2/files/properties/add"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;)V

    throw v0
.end method

.method public propertiesAdd(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/AddPropertiesErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3342
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesArg;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 3343
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->propertiesAdd(Lcom/dropbox/core/v2/fileproperties/AddPropertiesArg;)V

    return-void
.end method

.method propertiesOverwrite(Lcom/dropbox/core/v2/fileproperties/OverwritePropertyGroupArg;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3355
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/properties/overwrite"

    sget-object v5, Lcom/dropbox/core/v2/fileproperties/OverwritePropertyGroupArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/OverwritePropertyGroupArg$Serializer;

    .line 3360
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 3355
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3364
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    const-string v3, "2/files/properties/overwrite"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;)V

    throw v0
.end method

.method public propertiesOverwrite(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3385
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/OverwritePropertyGroupArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/fileproperties/OverwritePropertyGroupArg;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 3386
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->propertiesOverwrite(Lcom/dropbox/core/v2/fileproperties/OverwritePropertyGroupArg;)V

    return-void
.end method

.method propertiesRemove(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesArg;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/RemovePropertiesErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3398
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/properties/remove"

    sget-object v5, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesArg$Serializer;

    .line 3403
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 3398
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3407
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    const-string v3, "2/files/properties/remove"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;)V

    throw v0
.end method

.method public propertiesRemove(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/RemovePropertiesErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3430
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesArg;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 3431
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->propertiesRemove(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesArg;)V

    return-void
.end method

.method propertiesTemplateGet(Lcom/dropbox/core/v2/fileproperties/GetTemplateArg;)Lcom/dropbox/core/v2/fileproperties/GetTemplateResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/TemplateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3443
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/properties/template/get"

    sget-object v5, Lcom/dropbox/core/v2/fileproperties/GetTemplateArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/GetTemplateArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/fileproperties/GetTemplateResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/GetTemplateResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/fileproperties/GetTemplateResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3452
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    const-string v3, "2/files/properties/template/get"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/fileproperties/TemplateErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/fileproperties/TemplateError;)V

    throw v0
.end method

.method public propertiesTemplateGet(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/GetTemplateResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/TemplateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3472
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/GetTemplateArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/fileproperties/GetTemplateArg;-><init>(Ljava/lang/String;)V

    .line 3473
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->propertiesTemplateGet(Lcom/dropbox/core/v2/fileproperties/GetTemplateArg;)Lcom/dropbox/core/v2/fileproperties/GetTemplateResult;

    move-result-object p1

    return-object p1
.end method

.method public propertiesTemplateList()Lcom/dropbox/core/v2/fileproperties/ListTemplateResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/TemplateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3487
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/properties/template/list"

    .line 3491
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v5

    sget-object v6, Lcom/dropbox/core/v2/fileproperties/ListTemplateResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/ListTemplateResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 3487
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/fileproperties/ListTemplateResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 3496
    new-instance v1, Lcom/dropbox/core/v2/fileproperties/TemplateErrorException;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v3

    invoke-virtual {v0}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    const-string v4, "2/files/properties/template/list"

    invoke-direct {v1, v4, v2, v3, v0}, Lcom/dropbox/core/v2/fileproperties/TemplateErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/fileproperties/TemplateError;)V

    throw v1
.end method

.method propertiesUpdate(Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesArg;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3509
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/properties/update"

    sget-object v5, Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesArg$Serializer;

    .line 3514
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 3509
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3518
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesError;

    const-string v3, "2/files/properties/update"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesError;)V

    throw v0
.end method

.method public propertiesUpdate(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3537
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesArg;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 3538
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->propertiesUpdate(Lcom/dropbox/core/v2/fileproperties/UpdatePropertiesArg;)V

    return-void
.end method

.method restore(Lcom/dropbox/core/v2/files/RestoreArg;)Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RestoreErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3551
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/restore"

    sget-object v5, Lcom/dropbox/core/v2/files/RestoreArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RestoreArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/FileMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileMetadata$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/RestoreError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RestoreError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/FileMetadata;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3560
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RestoreError;

    const-string v3, "2/files/restore"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/RestoreErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/RestoreError;)V

    throw v0
.end method

.method public restore(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RestoreErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3576
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/RestoreArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3577
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->restore(Lcom/dropbox/core/v2/files/RestoreArg;)Lcom/dropbox/core/v2/files/FileMetadata;

    move-result-object p1

    return-object p1
.end method

.method saveUrl(Lcom/dropbox/core/v2/files/SaveUrlArg;)Lcom/dropbox/core/v2/files/SaveUrlResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SaveUrlErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3594
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/save_url"

    sget-object v5, Lcom/dropbox/core/v2/files/SaveUrlArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveUrlArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/SaveUrlError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveUrlError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SaveUrlResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3603
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SaveUrlError;

    const-string v3, "2/files/save_url"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/SaveUrlErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/SaveUrlError;)V

    throw v0
.end method

.method public saveUrl(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SaveUrlResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SaveUrlErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3624
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/SaveUrlArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3625
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->saveUrl(Lcom/dropbox/core/v2/files/SaveUrlArg;)Lcom/dropbox/core/v2/files/SaveUrlResult;

    move-result-object p1

    return-object p1
.end method

.method saveUrlCheckJobStatus(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3641
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/save_url/check_job_status"

    sget-object v5, Lcom/dropbox/core/v2/async/PollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/async/PollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3650
    new-instance v0, Lcom/dropbox/core/v2/async/PollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/async/PollError;

    const-string v3, "2/files/save_url/check_job_status"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/async/PollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/async/PollError;)V

    throw v0
.end method

.method public saveUrlCheckJobStatus(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3666
    new-instance v0, Lcom/dropbox/core/v2/async/PollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/async/PollArg;-><init>(Ljava/lang/String;)V

    .line 3667
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->saveUrlCheckJobStatus(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    move-result-object p1

    return-object p1
.end method

.method search(Lcom/dropbox/core/v2/files/SearchArg;)Lcom/dropbox/core/v2/files/SearchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SearchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3682
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/search"

    sget-object v5, Lcom/dropbox/core/v2/files/SearchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/SearchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/SearchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SearchResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3691
    new-instance v0, Lcom/dropbox/core/v2/files/SearchErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SearchError;

    const-string v3, "2/files/search"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/SearchErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/SearchError;)V

    throw v0
.end method

.method public search(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SearchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3721
    new-instance v0, Lcom/dropbox/core/v2/files/SearchArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/SearchArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3722
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->search(Lcom/dropbox/core/v2/files/SearchArg;)Lcom/dropbox/core/v2/files/SearchResult;

    move-result-object p1

    return-object p1
.end method

.method public searchBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchBuilder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3749
    invoke-static {p1, p2}, Lcom/dropbox/core/v2/files/SearchArg;->newBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchArg$Builder;

    move-result-object p1

    .line 3750
    new-instance p2, Lcom/dropbox/core/v2/files/SearchBuilder;

    invoke-direct {p2, p0, p1}, Lcom/dropbox/core/v2/files/SearchBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/SearchArg$Builder;)V

    return-object p2
.end method

.method searchContinueV2(Lcom/dropbox/core/v2/files/SearchV2ContinueArg;)Lcom/dropbox/core/v2/files/SearchV2Result;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SearchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3846
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/search/continue_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/SearchV2ContinueArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchV2ContinueArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/SearchV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchV2Result$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/SearchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SearchV2Result;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3855
    new-instance v0, Lcom/dropbox/core/v2/files/SearchErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SearchError;

    const-string v3, "2/files/search/continue_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/SearchErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/SearchError;)V

    throw v0
.end method

.method public searchContinueV2(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchV2Result;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SearchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3879
    new-instance v0, Lcom/dropbox/core/v2/files/SearchV2ContinueArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/SearchV2ContinueArg;-><init>(Ljava/lang/String;)V

    .line 3880
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->searchContinueV2(Lcom/dropbox/core/v2/files/SearchV2ContinueArg;)Lcom/dropbox/core/v2/files/SearchV2Result;

    move-result-object p1

    return-object p1
.end method

.method searchV2(Lcom/dropbox/core/v2/files/SearchV2Arg;)Lcom/dropbox/core/v2/files/SearchV2Result;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SearchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3769
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/search_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchV2Arg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/SearchV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchV2Result$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/SearchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SearchV2Result;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3778
    new-instance v0, Lcom/dropbox/core/v2/files/SearchErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/SearchError;

    const-string v3, "2/files/search_v2"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/SearchErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/SearchError;)V

    throw v0
.end method

.method public searchV2(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchV2Result;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SearchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3801
    new-instance v0, Lcom/dropbox/core/v2/files/SearchV2Arg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/SearchV2Arg;-><init>(Ljava/lang/String;)V

    .line 3802
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->searchV2(Lcom/dropbox/core/v2/files/SearchV2Arg;)Lcom/dropbox/core/v2/files/SearchV2Result;

    move-result-object p1

    return-object p1
.end method

.method public searchV2Builder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchV2Builder;
    .locals 1

    .line 3825
    invoke-static {p1}, Lcom/dropbox/core/v2/files/SearchV2Arg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    move-result-object p1

    .line 3826
    new-instance v0, Lcom/dropbox/core/v2/files/SearchV2Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/SearchV2Builder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;)V

    return-object v0
.end method

.method tagsAdd(Lcom/dropbox/core/v2/files/AddTagArg;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/AddTagErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3895
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/tags/add"

    sget-object v5, Lcom/dropbox/core/v2/files/AddTagArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/AddTagArg$Serializer;

    .line 3900
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/files/AddTagError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/AddTagError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 3895
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3904
    new-instance v0, Lcom/dropbox/core/v2/files/AddTagErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/AddTagError;

    const-string v3, "2/files/tags/add"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/AddTagErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/AddTagError;)V

    throw v0
.end method

.method public tagsAdd(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/AddTagErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3924
    new-instance v0, Lcom/dropbox/core/v2/files/AddTagArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/AddTagArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3925
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->tagsAdd(Lcom/dropbox/core/v2/files/AddTagArg;)V

    return-void
.end method

.method tagsGet(Lcom/dropbox/core/v2/files/GetTagsArg;)Lcom/dropbox/core/v2/files/GetTagsResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/BaseTagErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3938
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/tags/get"

    sget-object v5, Lcom/dropbox/core/v2/files/GetTagsArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetTagsArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/GetTagsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetTagsResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/BaseTagError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/BaseTagError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/GetTagsResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3947
    new-instance v0, Lcom/dropbox/core/v2/files/BaseTagErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/BaseTagError;

    const-string v3, "2/files/tags/get"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/BaseTagErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/BaseTagError;)V

    throw v0
.end method

.method public tagsGet(Ljava/util/List;)Lcom/dropbox/core/v2/files/GetTagsResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/files/GetTagsResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/BaseTagErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3961
    new-instance v0, Lcom/dropbox/core/v2/files/GetTagsArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/GetTagsArg;-><init>(Ljava/util/List;)V

    .line 3962
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->tagsGet(Lcom/dropbox/core/v2/files/GetTagsArg;)Lcom/dropbox/core/v2/files/GetTagsResult;

    move-result-object p1

    return-object p1
.end method

.method tagsRemove(Lcom/dropbox/core/v2/files/RemoveTagArg;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RemoveTagErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 3975
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/tags/remove"

    sget-object v5, Lcom/dropbox/core/v2/files/RemoveTagArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RemoveTagArg$Serializer;

    .line 3980
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v6

    sget-object v7, Lcom/dropbox/core/v2/files/RemoveTagError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RemoveTagError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    .line 3975
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3984
    new-instance v0, Lcom/dropbox/core/v2/files/RemoveTagErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/RemoveTagError;

    const-string v3, "2/files/tags/remove"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/RemoveTagErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/RemoveTagError;)V

    throw v0
.end method

.method public tagsRemove(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/RemoveTagErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4001
    new-instance v0, Lcom/dropbox/core/v2/files/RemoveTagArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/RemoveTagArg;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4002
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->tagsRemove(Lcom/dropbox/core/v2/files/RemoveTagArg;)V

    return-void
.end method

.method unlockFileBatch(Lcom/dropbox/core/v2/files/UnlockFileBatchArg;)Lcom/dropbox/core/v2/files/LockFileBatchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/LockFileErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4018
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/unlock_file_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/UnlockFileBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UnlockFileBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/LockFileBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileBatchResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/LockFileBatchResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 4027
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/LockFileError;

    const-string v3, "2/files/unlock_file_batch"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/files/LockFileErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/files/LockFileError;)V

    throw v0
.end method

.method public unlockFileBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/LockFileBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/UnlockFileArg;",
            ">;)",
            "Lcom/dropbox/core/v2/files/LockFileBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/LockFileErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4046
    new-instance v0, Lcom/dropbox/core/v2/files/UnlockFileBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/UnlockFileBatchArg;-><init>(Ljava/util/List;)V

    .line 4047
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->unlockFileBatch(Lcom/dropbox/core/v2/files/UnlockFileBatchArg;)Lcom/dropbox/core/v2/files/LockFileBatchResult;

    move-result-object p1

    return-object p1
.end method

.method upload(Lcom/dropbox/core/v2/files/UploadArg;)Lcom/dropbox/core/v2/files/UploadUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4068
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/files/UploadArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadArg$Serializer;

    const-string v2, "2/files/upload"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 4073
    new-instance v0, Lcom/dropbox/core/v2/files/UploadUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/files/UploadUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method public upload(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4102
    new-instance v0, Lcom/dropbox/core/v2/files/UploadArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg;-><init>(Ljava/lang/String;)V

    .line 4103
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->upload(Lcom/dropbox/core/v2/files/UploadArg;)Lcom/dropbox/core/v2/files/UploadUploader;

    move-result-object p1

    return-object p1
.end method

.method public uploadBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadBuilder;
    .locals 1

    .line 4127
    invoke-static {p1}, Lcom/dropbox/core/v2/files/UploadArg;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    move-result-object p1

    .line 4128
    new-instance v0, Lcom/dropbox/core/v2/files/UploadBuilder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/UploadBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/UploadArg$Builder;)V

    return-object v0
.end method

.method uploadSessionAppend(Lcom/dropbox/core/v2/files/UploadSessionCursor;)Lcom/dropbox/core/v2/files/UploadSessionAppendUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4229
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/files/UploadSessionCursor$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionCursor$Serializer;

    const-string v2, "2/files/upload_session/append"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 4234
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method public uploadSessionAppend(Ljava/lang/String;J)Lcom/dropbox/core/v2/files/UploadSessionAppendUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 4266
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionCursor;

    invoke-direct {v0, p1, p2, p3}, Lcom/dropbox/core/v2/files/UploadSessionCursor;-><init>(Ljava/lang/String;J)V

    .line 4267
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionAppend(Lcom/dropbox/core/v2/files/UploadSessionCursor;)Lcom/dropbox/core/v2/files/UploadSessionAppendUploader;

    move-result-object p1

    return-object p1
.end method

.method uploadSessionAppendV2(Lcom/dropbox/core/v2/files/UploadSessionAppendArg;)Lcom/dropbox/core/v2/files/UploadSessionAppendV2Uploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4149
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;

    const-string v2, "2/files/upload_session/append_v2"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 4154
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendV2Uploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendV2Uploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method public uploadSessionAppendV2(Lcom/dropbox/core/v2/files/UploadSessionCursor;)Lcom/dropbox/core/v2/files/UploadSessionAppendV2Uploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4184
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;-><init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;)V

    .line 4185
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionAppendV2(Lcom/dropbox/core/v2/files/UploadSessionAppendArg;)Lcom/dropbox/core/v2/files/UploadSessionAppendV2Uploader;

    move-result-object p1

    return-object p1
.end method

.method public uploadSessionAppendV2Builder(Lcom/dropbox/core/v2/files/UploadSessionCursor;)Lcom/dropbox/core/v2/files/UploadSessionAppendV2Builder;
    .locals 1

    .line 4208
    invoke-static {p1}, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->newBuilder(Lcom/dropbox/core/v2/files/UploadSessionCursor;)Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;

    move-result-object p1

    .line 4209
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendV2Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/files/UploadSessionAppendV2Builder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;)V

    return-object v0
.end method

.method public uploadSessionFinish(Lcom/dropbox/core/v2/files/UploadSessionCursor;Lcom/dropbox/core/v2/files/CommitInfo;)Lcom/dropbox/core/v2/files/UploadSessionFinishUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4320
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/UploadSessionFinishArg;-><init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;Lcom/dropbox/core/v2/files/CommitInfo;)V

    .line 4321
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionFinish(Lcom/dropbox/core/v2/files/UploadSessionFinishArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishUploader;

    move-result-object p1

    return-object p1
.end method

.method public uploadSessionFinish(Lcom/dropbox/core/v2/files/UploadSessionCursor;Lcom/dropbox/core/v2/files/CommitInfo;Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadSessionFinishUploader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p3, :cond_2

    .line 4355
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-lt v0, v1, :cond_1

    .line 4358
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 4359
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'contentHash\' is longer than 64"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 4356
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'contentHash\' is shorter than 64"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 4362
    :cond_2
    :goto_0
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishArg;

    invoke-direct {v0, p1, p2, p3}, Lcom/dropbox/core/v2/files/UploadSessionFinishArg;-><init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;Lcom/dropbox/core/v2/files/CommitInfo;Ljava/lang/String;)V

    .line 4363
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionFinish(Lcom/dropbox/core/v2/files/UploadSessionFinishArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishUploader;

    move-result-object p1

    return-object p1
.end method

.method uploadSessionFinish(Lcom/dropbox/core/v2/files/UploadSessionFinishArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4288
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/files/UploadSessionFinishArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishArg$Serializer;

    const-string v2, "2/files/upload_session/finish"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 4293
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method uploadSessionFinishBatch(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchLaunch;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4403
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/upload_session/finish_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchLaunch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchLaunch$Serializer;

    .line 4409
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 4403
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchLaunch;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 4412
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"upload_session/finish_batch\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public uploadSessionFinishBatch(Ljava/util/List;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchLaunch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/UploadSessionFinishArg;",
            ">;)",
            "Lcom/dropbox/core/v2/files/UploadSessionFinishBatchLaunch;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 4464
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg;-><init>(Ljava/util/List;)V

    .line 4465
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionFinishBatch(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchLaunch;

    move-result-object p1

    return-object p1
.end method

.method uploadSessionFinishBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4560
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/upload_session/finish_batch/check"

    sget-object v5, Lcom/dropbox/core/v2/async/PollArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/async/PollError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/PollError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 4569
    new-instance v0, Lcom/dropbox/core/v2/async/PollErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/async/PollError;

    const-string v3, "2/files/upload_session/finish_batch/check"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/async/PollErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/async/PollError;)V

    throw v0
.end method

.method public uploadSessionFinishBatchCheck(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/async/PollErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4586
    new-instance v0, Lcom/dropbox/core/v2/async/PollArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/async/PollArg;-><init>(Ljava/lang/String;)V

    .line 4587
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionFinishBatchCheck(Lcom/dropbox/core/v2/async/PollArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    move-result-object p1

    return-object p1
.end method

.method uploadSessionFinishBatchV2(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4496
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/upload_session/finish_batch_v2"

    sget-object v5, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult$Serializer;

    .line 4502
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 4496
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 4505
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"upload_session/finish_batch_v2\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public uploadSessionFinishBatchV2(Ljava/util/List;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/UploadSessionFinishArg;",
            ">;)",
            "Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4542
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg;-><init>(Ljava/util/List;)V

    .line 4543
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionFinishBatchV2(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchArg;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public uploadSessionStart()Lcom/dropbox/core/v2/files/UploadSessionStartUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4715
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionStartArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionStartArg;-><init>()V

    .line 4716
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionStart(Lcom/dropbox/core/v2/files/UploadSessionStartArg;)Lcom/dropbox/core/v2/files/UploadSessionStartUploader;

    move-result-object v0

    return-object v0
.end method

.method uploadSessionStart(Lcom/dropbox/core/v2/files/UploadSessionStartArg;)Lcom/dropbox/core/v2/files/UploadSessionStartUploader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4646
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    sget-object v5, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionStartArg$Serializer;

    const-string v2, "2/files/upload_session/start"

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v2/DbxRawClientV2;->uploadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 4651
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionStartUploader;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/v2/files/UploadSessionStartUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;Ljava/lang/String;)V

    return-object v0
.end method

.method public uploadSessionStartBatch(J)Lcom/dropbox/core/v2/files/UploadSessionStartBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4821
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;-><init>(J)V

    .line 4822
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionStartBatch(Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;)Lcom/dropbox/core/v2/files/UploadSessionStartBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public uploadSessionStartBatch(JLcom/dropbox/core/v2/files/UploadSessionType;)Lcom/dropbox/core/v2/files/UploadSessionStartBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4844
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;

    invoke-direct {v0, p1, p2, p3}, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;-><init>(JLcom/dropbox/core/v2/files/UploadSessionType;)V

    .line 4845
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionStartBatch(Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;)Lcom/dropbox/core/v2/files/UploadSessionStartBatchResult;

    move-result-object p1

    return-object p1
.end method

.method uploadSessionStartBatch(Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;)Lcom/dropbox/core/v2/files/UploadSessionStartBatchResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 4791
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/files/upload_session/start_batch"

    sget-object v5, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/files/UploadSessionStartBatchResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionStartBatchResult$Serializer;

    .line 4797
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 4791
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionStartBatchResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 4800
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"upload_session/start_batch\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public uploadSessionStartBuilder()Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;
    .locals 2

    .line 4771
    invoke-static {}, Lcom/dropbox/core/v2/files/UploadSessionStartArg;->newBuilder()Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    move-result-object v0

    .line 4772
    new-instance v1, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;

    invoke-direct {v1, p0, v0}, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;-><init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;)V

    return-object v1
.end method
