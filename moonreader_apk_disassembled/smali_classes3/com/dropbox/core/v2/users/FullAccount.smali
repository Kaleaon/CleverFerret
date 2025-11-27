.class public Lcom/dropbox/core/v2/users/FullAccount;
.super Lcom/dropbox/core/v2/users/Account;
.source "FullAccount.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/FullAccount$Serializer;,
        Lcom/dropbox/core/v2/users/FullAccount$Builder;
    }
.end annotation


# instance fields
.field protected final accountType:Lcom/dropbox/core/v2/userscommon/AccountType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final country:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final isPaired:Z

.field protected final locale:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final referralLink:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final rootInfo:Lcom/dropbox/core/v2/common/RootInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final team:Lcom/dropbox/core/v2/users/FullTeam;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final teamMemberId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/users/Name;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v2/userscommon/AccountType;Lcom/dropbox/core/v2/common/RootInfo;)V
    .locals 15
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/users/Name;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p9    # Lcom/dropbox/core/v2/userscommon/AccountType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p10    # Lcom/dropbox/core/v2/common/RootInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    .line 159
    invoke-direct/range {v0 .. v14}, Lcom/dropbox/core/v2/users/FullAccount;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/users/Name;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v2/userscommon/AccountType;Lcom/dropbox/core/v2/common/RootInfo;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/users/FullTeam;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/users/Name;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v2/userscommon/AccountType;Lcom/dropbox/core/v2/common/RootInfo;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/users/FullTeam;Ljava/lang/String;)V
    .locals 12
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/users/Name;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p9    # Lcom/dropbox/core/v2/userscommon/AccountType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p10    # Lcom/dropbox/core/v2/common/RootInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p11    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Lcom/dropbox/core/v2/users/FullTeam;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p14    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    move-object/from16 v0, p6

    move-object/from16 v1, p7

    move-object/from16 v2, p9

    move-object/from16 v3, p10

    move-object/from16 v4, p12

    move-object v5, p0

    move-object v6, p1

    move-object v7, p2

    move-object v8, p3

    move/from16 v9, p4

    move/from16 v10, p5

    move-object/from16 v11, p11

    .line 91
    invoke-direct/range {v5 .. v11}, Lcom/dropbox/core/v2/users/Account;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/users/Name;Ljava/lang/String;ZZLjava/lang/String;)V

    const/4 p1, 0x2

    if-eqz v4, :cond_2

    .line 93
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result p2

    if-lt p2, p1, :cond_1

    .line 96
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result p2

    if-gt p2, p1, :cond_0

    goto :goto_0

    .line 97
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'country\' is longer than 2"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 94
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'country\' is shorter than 2"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 100
    :cond_2
    :goto_0
    iput-object v4, p0, Lcom/dropbox/core/v2/users/FullAccount;->country:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 104
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p2

    if-lt p2, p1, :cond_6

    .line 107
    iput-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->locale:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 111
    iput-object v1, p0, Lcom/dropbox/core/v2/users/FullAccount;->referralLink:Ljava/lang/String;

    move-object/from16 p1, p13

    .line 112
    iput-object p1, p0, Lcom/dropbox/core/v2/users/FullAccount;->team:Lcom/dropbox/core/v2/users/FullTeam;

    move-object/from16 p1, p14

    .line 113
    iput-object p1, p0, Lcom/dropbox/core/v2/users/FullAccount;->teamMemberId:Ljava/lang/String;

    move/from16 p1, p8

    .line 114
    iput-boolean p1, p0, Lcom/dropbox/core/v2/users/FullAccount;->isPaired:Z

    if-eqz v2, :cond_4

    .line 118
    iput-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->accountType:Lcom/dropbox/core/v2/userscommon/AccountType;

    if-eqz v3, :cond_3

    .line 122
    iput-object v3, p0, Lcom/dropbox/core/v2/users/FullAccount;->rootInfo:Lcom/dropbox/core/v2/common/RootInfo;

    return-void

    .line 120
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'rootInfo\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 116
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'accountType\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 109
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'referralLink\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 105
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'locale\' is shorter than 2"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 102
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'locale\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;Lcom/dropbox/core/v2/users/Name;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v2/userscommon/AccountType;Lcom/dropbox/core/v2/common/RootInfo;)Lcom/dropbox/core/v2/users/FullAccount$Builder;
    .locals 11

    .line 342
    new-instance v0, Lcom/dropbox/core/v2/users/FullAccount$Builder;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Lcom/dropbox/core/v2/users/FullAccount$Builder;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/users/Name;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v2/userscommon/AccountType;Lcom/dropbox/core/v2/common/RootInfo;)V

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

    .line 513
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 514
    check-cast p1, Lcom/dropbox/core/v2/users/FullAccount;

    .line 515
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->accountId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->accountId:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->accountId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->accountId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->name:Lcom/dropbox/core/v2/users/Name;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->name:Lcom/dropbox/core/v2/users/Name;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->name:Lcom/dropbox/core/v2/users/Name;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->name:Lcom/dropbox/core/v2/users/Name;

    .line 516
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/users/Name;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->email:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->email:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->email:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->email:Ljava/lang/String;

    .line 517
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_4
    iget-boolean v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->emailVerified:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->emailVerified:Z

    if-ne v2, v3, :cond_d

    iget-boolean v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->disabled:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->disabled:Z

    if-ne v2, v3, :cond_d

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->locale:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->locale:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    .line 520
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->referralLink:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->referralLink:Ljava/lang/String;

    if-eq v2, v3, :cond_6

    .line 521
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_6
    iget-boolean v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->isPaired:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->isPaired:Z

    if-ne v2, v3, :cond_d

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->accountType:Lcom/dropbox/core/v2/userscommon/AccountType;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->accountType:Lcom/dropbox/core/v2/userscommon/AccountType;

    if-eq v2, v3, :cond_7

    .line 523
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/userscommon/AccountType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->rootInfo:Lcom/dropbox/core/v2/common/RootInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->rootInfo:Lcom/dropbox/core/v2/common/RootInfo;

    if-eq v2, v3, :cond_8

    .line 524
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/common/RootInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_8
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->profilePhotoUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->profilePhotoUrl:Ljava/lang/String;

    if-eq v2, v3, :cond_9

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->profilePhotoUrl:Ljava/lang/String;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->profilePhotoUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->profilePhotoUrl:Ljava/lang/String;

    .line 525
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_9
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->country:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->country:Ljava/lang/String;

    if-eq v2, v3, :cond_a

    if-eqz v2, :cond_d

    .line 526
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->team:Lcom/dropbox/core/v2/users/FullTeam;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullAccount;->team:Lcom/dropbox/core/v2/users/FullTeam;

    if-eq v2, v3, :cond_b

    if-eqz v2, :cond_d

    .line 527
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/users/FullTeam;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_b
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->teamMemberId:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/FullAccount;->teamMemberId:Ljava/lang/String;

    if-eq v2, p1, :cond_c

    if-eqz v2, :cond_d

    .line 528
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    :cond_c
    return v0

    :cond_d
    return v1
.end method

.method public getAccountId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 169
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->accountId:Ljava/lang/String;

    return-object v0
.end method

.method public getAccountType()Lcom/dropbox/core/v2/userscommon/AccountType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->accountType:Lcom/dropbox/core/v2/userscommon/AccountType;

    return-object v0
.end method

.method public getCountry()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 284
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->country:Ljava/lang/String;

    return-object v0
.end method

.method public getDisabled()Z
    .locals 1

    .line 209
    iget-boolean v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->disabled:Z

    return v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getEmailVerified()Z
    .locals 1

    .line 200
    iget-boolean v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->emailVerified:Z

    return v0
.end method

.method public getIsPaired()Z
    .locals 1

    .line 243
    iget-boolean v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->isPaired:Z

    return v0
.end method

.method public getLocale()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 221
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->locale:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Lcom/dropbox/core/v2/users/Name;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 179
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->name:Lcom/dropbox/core/v2/users/Name;

    return-object v0
.end method

.method public getProfilePhotoUrl()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->profilePhotoUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getReferralLink()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 231
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->referralLink:Ljava/lang/String;

    return-object v0
.end method

.method public getRootInfo()Lcom/dropbox/core/v2/common/RootInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 263
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->rootInfo:Lcom/dropbox/core/v2/common/RootInfo;

    return-object v0
.end method

.method public getTeam()Lcom/dropbox/core/v2/users/FullTeam;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 294
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->team:Lcom/dropbox/core/v2/users/FullTeam;

    return-object v0
.end method

.method public getTeamMemberId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 305
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->teamMemberId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 10

    .line 490
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullAccount;->country:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/users/FullAccount;->locale:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullAccount;->referralLink:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/users/FullAccount;->team:Lcom/dropbox/core/v2/users/FullTeam;

    iget-object v4, p0, Lcom/dropbox/core/v2/users/FullAccount;->teamMemberId:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/dropbox/core/v2/users/FullAccount;->isPaired:Z

    .line 496
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iget-object v6, p0, Lcom/dropbox/core/v2/users/FullAccount;->accountType:Lcom/dropbox/core/v2/userscommon/AccountType;

    iget-object v7, p0, Lcom/dropbox/core/v2/users/FullAccount;->rootInfo:Lcom/dropbox/core/v2/common/RootInfo;

    const/16 v8, 0x8

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v0, 0x1

    aput-object v1, v8, v0

    const/4 v0, 0x2

    aput-object v2, v8, v0

    const/4 v0, 0x3

    aput-object v3, v8, v0

    const/4 v0, 0x4

    aput-object v4, v8, v0

    const/4 v0, 0x5

    aput-object v5, v8, v0

    const/4 v0, 0x6

    aput-object v6, v8, v0

    const/4 v0, 0x7

    aput-object v7, v8, v0

    .line 490
    invoke-static {v8}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 500
    invoke-super {p0}, Lcom/dropbox/core/v2/users/Account;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 538
    sget-object v0, Lcom/dropbox/core/v2/users/FullAccount$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FullAccount$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/FullAccount$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 550
    sget-object v0, Lcom/dropbox/core/v2/users/FullAccount$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FullAccount$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/FullAccount$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
