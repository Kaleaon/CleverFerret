.class public Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;
.super Ljava/lang/Object;
.source "LegalHoldsCreatePolicyBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 35
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 39
    iput-object p2, p0, Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

    return-void

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 33
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
            Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->build()Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg;

    move-result-object v0

    .line 87
    iget-object v1, p0, Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->legalHoldsCreatePolicy(Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg;)Lcom/dropbox/core/v2/team/LegalHoldPolicy;

    move-result-object v0

    return-object v0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

    return-object p0
.end method

.method public withEndDate(Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->withEndDate(Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

    return-object p0
.end method

.method public withStartDate(Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldsCreatePolicyBuilder;->_builder:Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->withStartDate(Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;

    return-object p0
.end method
