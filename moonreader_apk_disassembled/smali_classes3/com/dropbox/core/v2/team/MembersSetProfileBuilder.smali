.class public Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;
.super Ljava/lang/Object;
.source "MembersSetProfileBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

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
.method public start()Lcom/dropbox/core/v2/team/TeamMemberInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/MembersSetProfileErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->build()Lcom/dropbox/core/v2/team/MembersSetProfileArg;

    move-result-object v0

    .line 135
    iget-object v1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->membersSetProfile(Lcom/dropbox/core/v2/team/MembersSetProfileArg;)Lcom/dropbox/core/v2/team/TeamMemberInfo;

    move-result-object v0

    return-object v0
.end method

.method public withNewEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->withNewEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    return-object p0
.end method

.method public withNewExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->withNewExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    return-object p0
.end method

.method public withNewGivenName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->withNewGivenName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    return-object p0
.end method

.method public withNewIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->withNewIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    return-object p0
.end method

.method public withNewPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->withNewPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    return-object p0
.end method

.method public withNewSurname(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfileBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->withNewSurname(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;

    return-object p0
.end method
