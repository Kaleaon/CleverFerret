.class public Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
.super Ljava/lang/Object;
.source "TeamSharingPolicies.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;
    }
.end annotation


# instance fields
.field protected final groupCreationPolicy:Lcom/dropbox/core/v2/teampolicies/GroupCreation;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharedFolderJoinPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharedFolderLinkRestrictionPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharedFolderMemberPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharedLinkCreatePolicy:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;Lcom/dropbox/core/v2/teampolicies/GroupCreation;Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teampolicies/GroupCreation;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 59
    iput-object p1, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderMemberPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;

    if-eqz p2, :cond_3

    .line 63
    iput-object p2, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderJoinPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;

    if-eqz p3, :cond_2

    .line 67
    iput-object p3, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedLinkCreatePolicy:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;

    if-eqz p4, :cond_1

    .line 71
    iput-object p4, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->groupCreationPolicy:Lcom/dropbox/core/v2/teampolicies/GroupCreation;

    if-eqz p5, :cond_0

    .line 75
    iput-object p5, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderLinkRestrictionPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;

    return-void

    .line 73
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedFolderLinkRestrictionPolicy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 69
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'groupCreationPolicy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 65
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedLinkCreatePolicy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 61
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedFolderJoinPolicy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 57
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedFolderMemberPolicy\' is null"

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

    .line 149
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 150
    check-cast p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    .line 151
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderMemberPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderMemberPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderJoinPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderJoinPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;

    if-eq v2, v3, :cond_3

    .line 152
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedLinkCreatePolicy:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedLinkCreatePolicy:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;

    if-eq v2, v3, :cond_4

    .line 153
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->groupCreationPolicy:Lcom/dropbox/core/v2/teampolicies/GroupCreation;

    iget-object v3, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->groupCreationPolicy:Lcom/dropbox/core/v2/teampolicies/GroupCreation;

    if-eq v2, v3, :cond_5

    .line 154
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/GroupCreation;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderLinkRestrictionPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;

    iget-object p1, p1, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderLinkRestrictionPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;

    if-eq v2, p1, :cond_7

    .line 155
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;->equals(Ljava/lang/Object;)Z

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

.method public getGroupCreationPolicy()Lcom/dropbox/core/v2/teampolicies/GroupCreation;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->groupCreationPolicy:Lcom/dropbox/core/v2/teampolicies/GroupCreation;

    return-object v0
.end method

.method public getSharedFolderJoinPolicy()Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderJoinPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;

    return-object v0
.end method

.method public getSharedFolderLinkRestrictionPolicy()Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderLinkRestrictionPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;

    return-object v0
.end method

.method public getSharedFolderMemberPolicy()Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderMemberPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;

    return-object v0
.end method

.method public getSharedLinkCreatePolicy()Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedLinkCreatePolicy:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .line 130
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderMemberPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderMemberPolicy;

    iget-object v1, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderJoinPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderJoinPolicy;

    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedLinkCreatePolicy:Lcom/dropbox/core/v2/teampolicies/SharedLinkCreatePolicy;

    iget-object v3, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->groupCreationPolicy:Lcom/dropbox/core/v2/teampolicies/GroupCreation;

    iget-object v4, p0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->sharedFolderLinkRestrictionPolicy:Lcom/dropbox/core/v2/teampolicies/SharedFolderBlanketLinkRestrictionPolicy;

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

    .line 165
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 177
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
