.class public Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;
.super Ljava/lang/Object;
.source "ListFileMembersBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

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
.method public start()Lcom/dropbox/core/v2/sharing/SharedFileMembers;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/sharing/ListFileMembersErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;->build()Lcom/dropbox/core/v2/sharing/ListFileMembersArg;

    move-result-object v0

    .line 98
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;->listFileMembers(Lcom/dropbox/core/v2/sharing/ListFileMembersArg;)Lcom/dropbox/core/v2/sharing/SharedFileMembers;

    move-result-object v0

    return-object v0
.end method

.method public withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberAction;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;->withActions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

    return-object p0
.end method

.method public withIncludeInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;->withIncludeInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ListFileMembersBuilder;->_builder:Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;->withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/ListFileMembersArg$Builder;

    return-object p0
.end method
