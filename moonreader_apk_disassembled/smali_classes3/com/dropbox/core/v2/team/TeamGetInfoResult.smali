.class public Lcom/dropbox/core/v2/team/TeamGetInfoResult;
.super Ljava/lang/Object;
.source "TeamGetInfoResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/TeamGetInfoResult$Serializer;
    }
.end annotation


# instance fields
.field protected final name:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final numLicensedUsers:J

.field protected final numProvisionedUsers:J

.field protected final numUsedLicenses:J

.field protected final policies:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final teamId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJLcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;)V
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p7    # Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const-wide/16 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-wide v5, p5

    move-object/from16 v7, p7

    .line 82
    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/team/TeamGetInfoResult;-><init>(Ljava/lang/String;Ljava/lang/String;JJLcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;J)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJLcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;J)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p7    # Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 52
    iput-object p1, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->name:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 56
    iput-object p2, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->teamId:Ljava/lang/String;

    .line 57
    iput-wide p3, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numLicensedUsers:J

    .line 58
    iput-wide p5, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numProvisionedUsers:J

    .line 59
    iput-wide p8, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numUsedLicenses:J

    if-eqz p7, :cond_0

    .line 63
    iput-object p7, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->policies:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    return-void

    .line 61
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'policies\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'teamId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 50
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 165
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 166
    check-cast p1, Lcom/dropbox/core/v2/team/TeamGetInfoResult;

    .line 167
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->name:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->teamId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->teamId:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 168
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-wide v2, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numLicensedUsers:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numLicensedUsers:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_5

    iget-wide v2, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numProvisionedUsers:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numProvisionedUsers:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_5

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->policies:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->policies:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    if-eq v2, v3, :cond_4

    .line 171
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-wide v2, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numUsedLicenses:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numUsedLicenses:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_5

    return v0

    :cond_5
    return v1
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNumLicensedUsers()J
    .locals 2

    .line 111
    iget-wide v0, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numLicensedUsers:J

    return-wide v0
.end method

.method public getNumProvisionedUsers()J
    .locals 2

    .line 121
    iget-wide v0, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numProvisionedUsers:J

    return-wide v0
.end method

.method public getNumUsedLicenses()J
    .locals 2

    .line 140
    iget-wide v0, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numUsedLicenses:J

    return-wide v0
.end method

.method public getPolicies()Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->policies:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    return-object v0
.end method

.method public getTeamId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->teamId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->name:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->teamId:Ljava/lang/String;

    iget-wide v2, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numLicensedUsers:J

    .line 148
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-wide v3, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numProvisionedUsers:J

    .line 149
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-wide v4, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->numUsedLicenses:J

    .line 150
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-object v5, p0, Lcom/dropbox/core/v2/team/TeamGetInfoResult;->policies:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    aput-object v3, v6, v0

    const/4 v0, 0x4

    aput-object v4, v6, v0

    const/4 v0, 0x5

    aput-object v5, v6, v0

    .line 145
    invoke-static {v6}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 182
    sget-object v0, Lcom/dropbox/core/v2/team/TeamGetInfoResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamGetInfoResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamGetInfoResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 194
    sget-object v0, Lcom/dropbox/core/v2/team/TeamGetInfoResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamGetInfoResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamGetInfoResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
