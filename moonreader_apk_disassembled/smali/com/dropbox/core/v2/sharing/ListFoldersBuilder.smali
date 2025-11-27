.class public Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;
.super Ljava/lang/Object;
.source "ListFoldersBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 35
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    if-eqz p2, :cond_0

    .line 39
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;

    return-void

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 33
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/sharing/ListFoldersResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;->build()Lcom/dropbox/core/v2/sharing/ListFoldersArgs;

    move-result-object v0

    .line 85
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;->listFolders(Lcom/dropbox/core/v2/sharing/ListFoldersArgs;)Lcom/dropbox/core/v2/sharing/ListFoldersResult;

    move-result-object v0

    return-object v0
.end method

.method public withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/FolderAction;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;"
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;->withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFoldersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;->withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/ListFoldersArgs$Builder;

    return-object p0
.end method
