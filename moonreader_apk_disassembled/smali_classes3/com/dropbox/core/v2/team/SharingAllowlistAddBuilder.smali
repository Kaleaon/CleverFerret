.class public Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;
.super Ljava/lang/Object;
.source "SharingAllowlistAddBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;->_builder:Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;

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
.method public start()Lcom/dropbox/core/v2/team/SharingAllowlistAddResponse;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/SharingAllowlistAddErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;->_builder:Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->build()Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;

    move-result-object v0

    .line 78
    iget-object v1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->sharingAllowlistAdd(Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;)Lcom/dropbox/core/v2/team/SharingAllowlistAddResponse;

    move-result-object v0

    return-object v0
.end method

.method public withDomains(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;->_builder:Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->withDomains(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;

    return-object p0
.end method

.method public withEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddBuilder;->_builder:Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->withEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;

    return-object p0
.end method
