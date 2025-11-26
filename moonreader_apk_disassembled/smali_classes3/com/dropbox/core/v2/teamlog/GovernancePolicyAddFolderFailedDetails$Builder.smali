.class public Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;
.super Ljava/lang/Object;
.source "GovernancePolicyAddFolderFailedDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final folder:Ljava/lang/String;

.field protected final governancePolicyId:Ljava/lang/String;

.field protected final name:Ljava/lang/String;

.field protected policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

.field protected reason:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 168
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->governancePolicyId:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 172
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->name:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 176
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->folder:Ljava/lang/String;

    const/4 p1, 0x0

    .line 177
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    .line 178
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->reason:Ljava/lang/String;

    return-void

    .line 174
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'folder\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 170
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 166
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'governancePolicyId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails;
    .locals 6

    .line 213
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->governancePolicyId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->folder:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->reason:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/PolicyType;Ljava/lang/String;)V

    return-object v0
.end method

.method public withPolicyType(Lcom/dropbox/core/v2/teamlog/PolicyType;)Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;
    .locals 0

    .line 189
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    return-object p0
.end method

.method public withReason(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;
    .locals 0

    .line 201
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFolderFailedDetails$Builder;->reason:Ljava/lang/String;

    return-object p0
.end method
