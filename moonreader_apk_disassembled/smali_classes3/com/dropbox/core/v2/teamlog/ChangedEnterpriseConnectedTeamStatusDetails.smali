.class public Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;
.super Ljava/lang/Object;
.source "ChangedEnterpriseConnectedTeamStatusDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final action:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final additionalInfo:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 53
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    if-eqz p2, :cond_2

    .line 57
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->additionalInfo:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    if-eqz p3, :cond_1

    .line 61
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eqz p4, :cond_0

    .line 65
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    return-void

    .line 63
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 59
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previousValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 55
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'additionalInfo\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 51
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'action\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 128
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 129
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;

    .line 130
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->additionalInfo:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->additionalInfo:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    if-eq v2, v3, :cond_3

    .line 131
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eq v2, v3, :cond_4

    .line 132
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eq v2, p1, :cond_6

    .line 133
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getAction()Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    return-object v0
.end method

.method public getAdditionalInfo()Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->additionalInfo:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    return-object v0
.end method

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->action:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->additionalInfo:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 143
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 155
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ChangedEnterpriseConnectedTeamStatusDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
