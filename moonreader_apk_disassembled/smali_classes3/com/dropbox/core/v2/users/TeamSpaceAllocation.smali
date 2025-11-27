.class public Lcom/dropbox/core/v2/users/TeamSpaceAllocation;
.super Ljava/lang/Object;
.source "TeamSpaceAllocation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/TeamSpaceAllocation$Serializer;
    }
.end annotation


# instance fields
.field protected final allocated:J

.field protected final used:J

.field protected final userWithinTeamSpaceAllocated:J

.field protected final userWithinTeamSpaceLimitType:Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final userWithinTeamSpaceUsedCached:J


# direct methods
.method public constructor <init>(JJJLcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;J)V
    .locals 0
    .param p7    # Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-wide p1, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->used:J

    .line 50
    iput-wide p3, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->allocated:J

    .line 51
    iput-wide p5, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceAllocated:J

    if-eqz p7, :cond_0

    .line 55
    iput-object p7, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceLimitType:Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;

    .line 56
    iput-wide p8, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceUsedCached:J

    return-void

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'userWithinTeamSpaceLimitType\' is null"

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

    .line 130
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 131
    check-cast p1, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;

    .line 132
    iget-wide v2, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->used:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->used:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_3

    iget-wide v2, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->allocated:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->allocated:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_3

    iget-wide v2, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceAllocated:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceAllocated:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceLimitType:Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceLimitType:Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;

    if-eq v2, v3, :cond_2

    .line 135
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-wide v2, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceUsedCached:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceUsedCached:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getAllocated()J
    .locals 2

    .line 74
    iget-wide v0, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->allocated:J

    return-wide v0
.end method

.method public getUsed()J
    .locals 2

    .line 65
    iget-wide v0, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->used:J

    return-wide v0
.end method

.method public getUserWithinTeamSpaceAllocated()J
    .locals 2

    .line 85
    iget-wide v0, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceAllocated:J

    return-wide v0
.end method

.method public getUserWithinTeamSpaceLimitType()Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceLimitType:Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;

    return-object v0
.end method

.method public getUserWithinTeamSpaceUsedCached()J
    .locals 2

    .line 106
    iget-wide v0, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceUsedCached:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 7

    .line 111
    iget-wide v0, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->used:J

    .line 112
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v1, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->allocated:J

    .line 113
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-wide v2, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceAllocated:J

    .line 114
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-object v3, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceLimitType:Lcom/dropbox/core/v2/teamcommon/MemberSpaceLimitType;

    iget-wide v4, p0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->userWithinTeamSpaceUsedCached:J

    .line 116
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

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

    .line 111
    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 146
    sget-object v0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/TeamSpaceAllocation$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/TeamSpaceAllocation$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 158
    sget-object v0, Lcom/dropbox/core/v2/users/TeamSpaceAllocation$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/TeamSpaceAllocation$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/TeamSpaceAllocation$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
