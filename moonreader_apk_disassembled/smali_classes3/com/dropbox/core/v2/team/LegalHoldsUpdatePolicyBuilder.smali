.class public Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;
.super Ljava/lang/Object;
.source "LegalHoldsUpdatePolicyBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

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
.method public start()Lcom/dropbox/core/v2/team/LegalHoldPolicy;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->build()Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg;

    move-result-object v0

    .line 93
    iget-object v1, p0, Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->legalHoldsUpdatePolicy(Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg;)Lcom/dropbox/core/v2/team/LegalHoldPolicy;

    move-result-object v0

    return-object v0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

    return-object p0
.end method

.method public withMembers(Ljava/util/List;)Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->withMembers(Ljava/util/List;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

    return-object p0
.end method

.method public withName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldsUpdatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->withName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;

    return-object p0
.end method
