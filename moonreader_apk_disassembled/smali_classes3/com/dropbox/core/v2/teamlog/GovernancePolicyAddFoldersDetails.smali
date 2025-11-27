.class public Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;
.super Ljava/lang/Object;
.source "GovernancePolicyAddFoldersDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Builder;
    }
.end annotation


# instance fields
.field protected final folders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final governancePolicyId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final name:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 84
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/PolicyType;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/PolicyType;Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/PolicyType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v2/teamlog/PolicyType;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 56
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->governancePolicyId:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 60
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->name:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    if-eqz p4, :cond_1

    .line 63
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 65
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'folders\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 69
    :cond_1
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->folders:Ljava/util/List;

    return-void

    .line 58
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'governancePolicyId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Builder;
    .locals 1

    .line 139
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
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

    .line 230
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 231
    check-cast p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;

    .line 232
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->governancePolicyId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->governancePolicyId:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->name:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 233
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_5

    .line 234
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/PolicyType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->folders:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->folders:Ljava/util/List;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 235
    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

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

.method public getFolders()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 124
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->folders:Ljava/util/List;

    return-object v0
.end method

.method public getGovernancePolicyId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->governancePolicyId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPolicyType()Lcom/dropbox/core/v2/teamlog/PolicyType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 114
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->governancePolicyId:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->policyType:Lcom/dropbox/core/v2/teamlog/PolicyType;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails;->folders:Ljava/util/List;

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

    .line 245
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 257
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GovernancePolicyAddFoldersDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
