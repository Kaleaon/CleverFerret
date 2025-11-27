.class public Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;
.super Ljava/lang/Object;
.source "ListReceivedFilesBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;

    return-void

    .line 36
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 32
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/sharing/ListFilesResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/sharing/SharingUserErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;->build()Lcom/dropbox/core/v2/sharing/ListFilesArg;

    move-result-object v0

    .line 85
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;->listReceivedFiles(Lcom/dropbox/core/v2/sharing/ListFilesArg;)Lcom/dropbox/core/v2/sharing/ListFilesResult;

    move-result-object v0

    return-object v0
.end method

.method public withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/FileAction;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;"
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;->withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListReceivedFilesBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;->withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/ListFilesArg$Builder;

    return-object p0
.end method
