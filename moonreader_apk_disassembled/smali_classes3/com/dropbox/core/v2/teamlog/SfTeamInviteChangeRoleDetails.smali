.class public Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;
.super Ljava/lang/Object;
.source "SfTeamInviteChangeRoleDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Builder;
    }
.end annotation


# instance fields
.field protected final newSharingPermission:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final originalFolderName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousSharingPermission:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final targetAssetIndex:J


# direct methods
.method public constructor <init>(JLjava/lang/String;)V
    .locals 6
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    .line 74
    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-wide p1, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->targetAssetIndex:J

    if-eqz p3, :cond_0

    .line 56
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->originalFolderName:Ljava/lang/String;

    .line 57
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->newSharingPermission:Ljava/lang/String;

    .line 58
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->previousSharingPermission:Ljava/lang/String;

    return-void

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'originalFolderName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(JLjava/lang/String;)Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Builder;
    .locals 1

    .line 129
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Builder;

    invoke-direct {v0, p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Builder;-><init>(JLjava/lang/String;)V

    return-object v0
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

    .line 207
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 208
    check-cast p1, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;

    .line 209
    iget-wide v2, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->targetAssetIndex:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->targetAssetIndex:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_5

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->originalFolderName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->originalFolderName:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    .line 210
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->newSharingPermission:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->newSharingPermission:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_5

    .line 211
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->previousSharingPermission:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->previousSharingPermission:Ljava/lang/String;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_5

    .line 212
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    :cond_4
    return v0

    :cond_5
    return v1
.end method

.method public getNewSharingPermission()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 103
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->newSharingPermission:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalFolderName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->originalFolderName:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviousSharingPermission()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 113
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->previousSharingPermission:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetAssetIndex()J
    .locals 2

    .line 83
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->targetAssetIndex:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 6

    .line 189
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->targetAssetIndex:J

    .line 190
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->originalFolderName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->newSharingPermission:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails;->previousSharingPermission:Ljava/lang/String;

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

    .line 189
    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 222
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 234
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SfTeamInviteChangeRoleDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
