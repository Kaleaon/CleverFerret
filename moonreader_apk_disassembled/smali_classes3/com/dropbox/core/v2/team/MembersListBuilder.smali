.class public Lcom/dropbox/core/v2/team/MembersListBuilder;
.super Ljava/lang/Object;
.source "MembersListBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/MembersListArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/MembersListArg$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersListBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/team/MembersListBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersListArg$Builder;

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
.method public start()Lcom/dropbox/core/v2/team/MembersListResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/MembersListErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersListBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersListArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/MembersListArg$Builder;->build()Lcom/dropbox/core/v2/team/MembersListArg;

    move-result-object v0

    .line 78
    iget-object v1, p0, Lcom/dropbox/core/v2/team/MembersListBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->membersList(Lcom/dropbox/core/v2/team/MembersListArg;)Lcom/dropbox/core/v2/team/MembersListResult;

    move-result-object v0

    return-object v0
.end method

.method public withIncludeRemoved(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MembersListBuilder;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersListBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersListArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/MembersListArg$Builder;->withIncludeRemoved(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MembersListArg$Builder;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/team/MembersListBuilder;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersListBuilder;->_builder:Lcom/dropbox/core/v2/team/MembersListArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/MembersListArg$Builder;->withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/team/MembersListArg$Builder;

    return-object p0
.end method
