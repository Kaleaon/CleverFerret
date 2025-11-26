.class public Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
.super Ljava/lang/Object;
.source "ShareFolderBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

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
.method public start()Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/sharing/ShareFolderErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 164
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->build()Lcom/dropbox/core/v2/sharing/ShareFolderArg;

    move-result-object v0

    .line 165
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;->shareFolder(Lcom/dropbox/core/v2/sharing/ShareFolderArg;)Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    move-result-object v0

    return-object v0
.end method

.method public withAccessInheritance(Lcom/dropbox/core/v2/sharing/AccessInheritance;)Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->withAccessInheritance(Lcom/dropbox/core/v2/sharing/AccessInheritance;)Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    return-object p0
.end method

.method public withAclUpdatePolicy(Lcom/dropbox/core/v2/sharing/AclUpdatePolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->withAclUpdatePolicy(Lcom/dropbox/core/v2/sharing/AclUpdatePolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    return-object p0
.end method

.method public withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/FolderAction;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;"
        }
    .end annotation

    .line 144
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    return-object p0
.end method

.method public withForceAsync(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->withForceAsync(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    return-object p0
.end method

.method public withLinkSettings(Lcom/dropbox/core/v2/sharing/LinkSettings;)Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->withLinkSettings(Lcom/dropbox/core/v2/sharing/LinkSettings;)Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    return-object p0
.end method

.method public withMemberPolicy(Lcom/dropbox/core/v2/sharing/MemberPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->withMemberPolicy(Lcom/dropbox/core/v2/sharing/MemberPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    return-object p0
.end method

.method public withSharedLinkPolicy(Lcom/dropbox/core/v2/sharing/SharedLinkPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->withSharedLinkPolicy(Lcom/dropbox/core/v2/sharing/SharedLinkPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    return-object p0
.end method

.method public withViewerInfoPolicy(Lcom/dropbox/core/v2/sharing/ViewerInfoPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;->withViewerInfoPolicy(Lcom/dropbox/core/v2/sharing/ViewerInfoPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderArg$Builder;

    return-object p0
.end method
