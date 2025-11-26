.class public Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;
.super Ljava/lang/Object;
.source "GovernancePolicyEditDurationDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final governancePolicyId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final name:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;)V
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 85
    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;Lcom/dropbox/core/v2/teamlog/PolicyType;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;Lcom/dropbox/core/v2/teamlog/PolicyType;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Lcom/dropbox/core/v2/teamlog/PolicyType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 55
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->governancePolicyId:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 59
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->name:Ljava/lang/String;

    .line 60
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    if-eqz p3, :cond_1

    .line 64
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    if-eqz p4, :cond_0

    .line 68
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->newValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    return-void

    .line 66
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 62
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previousValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 57
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 53
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'governancePolicyId\' is null"

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

    .line 159
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 160
    check-cast p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;

    .line 161
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->governancePolicyId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->governancePolicyId:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->name:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 162
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    if-eq v2, v3, :cond_4

    .line 163
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/DurationLogInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->newValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->newValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    if-eq v2, v3, :cond_5

    .line 164
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/DurationLogInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    if-eq v2, p1, :cond_7

    if-eqz v2, :cond_6

    .line 165
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/PolicyType;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_0

    :cond_6
    return v1

    :cond_7
    :goto_0
    return v0

    :cond_8
    return v1
.end method

.method public getGovernancePolicyId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->governancePolicyId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->newValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    return-object v0
.end method

.method public getPolicyType()Lcom/dropbox/core/v2/teamlog/PolicyType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .line 140
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->governancePolicyId:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails;->newValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 175
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 187
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyEditDurationDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
