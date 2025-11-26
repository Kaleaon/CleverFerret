.class public Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
.super Ljava/lang/Object;
.source "DbxAppListFolderBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/files/DbxAppFilesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/files/DbxAppFilesRequests;Lcom/dropbox/core/v2/files/ListFolderArg$Builder;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 33
    iput-object p1, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_client:Lcom/dropbox/core/v2/files/DbxAppFilesRequests;

    if-eqz p2, :cond_0

    .line 37
    iput-object p2, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

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
.method public start()Lcom/dropbox/core/v2/files/ListFolderResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->build()Lcom/dropbox/core/v2/files/ListFolderArg;

    move-result-object v0

    .line 192
    iget-object v1, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_client:Lcom/dropbox/core/v2/files/DbxAppFilesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/files/DbxAppFilesRequests;->listFolder(Lcom/dropbox/core/v2/files/ListFolderArg;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object v0

    return-object v0
.end method

.method public withIncludeDeleted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withIncludeDeleted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method

.method public withIncludeHasExplicitSharedMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withIncludeHasExplicitSharedMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method

.method public withIncludeMediaInfo(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withIncludeMediaInfo(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method

.method public withIncludeMountedFolders(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withIncludeMountedFolders(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method

.method public withIncludeNonDownloadableFiles(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withIncludeNonDownloadableFiles(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method

.method public withIncludePropertyGroups(Lcom/dropbox/core/v2/fileproperties/TemplateFilterBase;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withIncludePropertyGroups(Lcom/dropbox/core/v2/fileproperties/TemplateFilterBase;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method

.method public withRecursive(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withRecursive(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method

.method public withSharedLink(Lcom/dropbox/core/v2/files/SharedLink;)Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DbxAppListFolderBuilder;->_builder:Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListFolderArg$Builder;->withSharedLink(Lcom/dropbox/core/v2/files/SharedLink;)Lcom/dropbox/core/v2/files/ListFolderArg$Builder;

    return-object p0
.end method
