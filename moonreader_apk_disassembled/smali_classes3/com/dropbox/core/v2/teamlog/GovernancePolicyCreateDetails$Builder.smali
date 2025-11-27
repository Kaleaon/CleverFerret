.class public Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;
.super Ljava/lang/Object;
.source "GovernancePolicyCreateDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final duration:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

.field protected folders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final governancePolicyId:Ljava/lang/String;

.field protected final name:Ljava/lang/String;

.field protected policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;)V
    .locals 0

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 176
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->governancePolicyId:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 180
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->name:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 184
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->duration:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    const/4 p1, 0x0

    .line 185
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    .line 186
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->folders:Ljava/util/List;

    return-void

    .line 182
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'duration\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 178
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 174
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'governancePolicyId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails;
    .locals 6

    .line 230
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->governancePolicyId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->duration:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->folders:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;Lcom/dropbox/core/v2/teamlog/PolicyType;Ljava/util/List;)V

    return-object v0
.end method

.method public withFolders(Ljava/util/List;)Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 213
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 215
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'folders\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 219
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->folders:Ljava/util/List;

    return-object p0
.end method

.method public withPolicyType(Lcom/dropbox/core/v2/teamlog/PolicyType;)Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;
    .locals 0

    .line 197
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyCreateDetails$Builder;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    return-object p0
.end method
