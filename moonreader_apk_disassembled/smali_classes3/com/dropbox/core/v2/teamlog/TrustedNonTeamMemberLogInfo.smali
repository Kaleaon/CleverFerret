.class public Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;
.super Lcom/dropbox/core/v2/teamlog/UserLogInfo;
.source "TrustedNonTeamMemberLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;
    }
.end annotation


# instance fields
.field protected final team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;)V
    .locals 6
    .param p1    # Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 71
    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;-><init>(Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/TeamLogInfo;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/TeamLogInfo;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Lcom/dropbox/core/v2/teamlog/TeamLogInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0, p2, p3, p4}, Lcom/dropbox/core/v2/teamlog/UserLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 55
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;

    .line 56
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    return-void

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'trustedNonTeamMemberType\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;
    .locals 1

    .line 136
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;-><init>(Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;)V

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

    .line 240
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 241
    check-cast p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

    .line 242
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->accountId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->accountId:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->accountId:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->accountId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->accountId:Ljava/lang/String;

    .line 243
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->displayName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->displayName:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->displayName:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->displayName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->displayName:Ljava/lang/String;

    .line 244
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->email:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->email:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->email:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->email:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->email:Ljava/lang/String;

    .line 245
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    if-eq v2, p1, :cond_7

    if-eqz v2, :cond_6

    .line 246
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/TeamLogInfo;->equals(Ljava/lang/Object;)Z

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

.method public getAccountId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->accountId:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getTeam()Lcom/dropbox/core/v2/teamlog/TeamLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    return-object v0
.end method

.method public getTrustedNonTeamMemberType()Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 227
    invoke-super {p0}, Lcom/dropbox/core/v2/teamlog/UserLogInfo;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 256
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 268
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
