.class public Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;
.super Ljava/lang/Object;
.source "GroupsUpdateBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 33
    iput-object p1, p0, Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 37
    iput-object p2, p0, Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;->_builder:Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

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
.method public start()Lcom/dropbox/core/v2/team/GroupFullInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/GroupUpdateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;->_builder:Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->build()Lcom/dropbox/core/v2/team/GroupUpdateArgs;

    move-result-object v0

    .line 103
    iget-object v1, p0, Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->groupsUpdate(Lcom/dropbox/core/v2/team/GroupUpdateArgs;)Lcom/dropbox/core/v2/team/GroupFullInfo;

    move-result-object v0

    return-object v0
.end method

.method public withNewGroupExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;->_builder:Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->withNewGroupExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    return-object p0
.end method

.method public withNewGroupManagementType(Lcom/dropbox/core/v2/teamcommon/GroupManagementType;)Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;->_builder:Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->withNewGroupManagementType(Lcom/dropbox/core/v2/teamcommon/GroupManagementType;)Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    return-object p0
.end method

.method public withNewGroupName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;->_builder:Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->withNewGroupName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    return-object p0
.end method

.method public withReturnMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsUpdateBuilder;->_builder:Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;->withReturnMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/GroupUpdateArgs$Builder;

    return-object p0
.end method
