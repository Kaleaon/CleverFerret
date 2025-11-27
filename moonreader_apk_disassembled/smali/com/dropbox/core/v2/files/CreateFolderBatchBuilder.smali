.class public Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;
.super Ljava/lang/Object;
.source "CreateFolderBatchBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 33
    iput-object p1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    if-eqz p2, :cond_0

    .line 37
    iput-object p2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;->_builder:Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

    return-void

    .line 35
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 31
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;->_builder:Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->build()Lcom/dropbox/core/v2/files/CreateFolderBatchArg;

    move-result-object v0

    .line 76
    iget-object v1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->createFolderBatch(Lcom/dropbox/core/v2/files/CreateFolderBatchArg;)Lcom/dropbox/core/v2/files/CreateFolderBatchLaunch;

    move-result-object v0

    return-object v0
.end method

.method public withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;->_builder:Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

    return-object p0
.end method

.method public withForceAsync(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchBuilder;->_builder:Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;->withForceAsync(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CreateFolderBatchArg$Builder;

    return-object p0
.end method
