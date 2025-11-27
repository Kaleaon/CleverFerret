.class public Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;
.super Ljava/lang/Object;
.source "SharingAllowlistRemoveBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;->_builder:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;

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
.method public start()Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/SharingAllowlistRemoveErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;->_builder:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;->build()Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs;

    move-result-object v0

    .line 78
    iget-object v1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->sharingAllowlistRemove(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveResponse;

    move-result-object v0

    return-object v0
.end method

.method public withDomains(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;->_builder:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;->withDomains(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;

    return-object p0
.end method

.method public withEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveBuilder;->_builder:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;->withEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveArgs$Builder;

    return-object p0
.end method
