.class public Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;
.super Ljava/lang/Object;
.source "FoldersCreateBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;->_client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;->_builder:Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;

    return-void

    .line 34
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 30
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/paper/PaperFolderCreateResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/PaperFolderCreateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;->_builder:Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->build()Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;

    move-result-object v0

    .line 76
    iget-object v1, p0, Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;->_client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->foldersCreate(Lcom/dropbox/core/v2/paper/PaperFolderCreateArg;)Lcom/dropbox/core/v2/paper/PaperFolderCreateResult;

    move-result-object v0

    return-object v0
.end method

.method public withIsTeamFolder(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;->_builder:Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->withIsTeamFolder(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;

    return-object p0
.end method

.method public withParentFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/FoldersCreateBuilder;->_builder:Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;->withParentFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/PaperFolderCreateArg$Builder;

    return-object p0
.end method
