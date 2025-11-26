.class public Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;
.super Ljava/lang/Object;
.source "ListFolderMembersBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;

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
.method public start()Lcom/dropbox/core/v2/sharing/SharedFolderMembers;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/sharing/SharedFolderAccessErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;->build()Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs;

    move-result-object v0

    .line 84
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;->listFolderMembers(Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs;)Lcom/dropbox/core/v2/sharing/SharedFolderMembers;

    move-result-object v0

    return-object v0
.end method

.method public withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberAction;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;->withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFolderMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;->withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/ListFolderMembersArgs$Builder;

    return-object p0
.end method
