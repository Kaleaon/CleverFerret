.class public Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails;
.super Ljava/lang/Object;
.source "SfInviteGroupDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final targetAssetIndex:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-wide p1, p0, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails;->targetAssetIndex:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 62
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 63
    check-cast p1, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails;

    .line 64
    iget-wide v2, p0, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails;->targetAssetIndex:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails;->targetAssetIndex:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public getTargetAssetIndex()J
    .locals 2

    .line 42
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails;->targetAssetIndex:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 3

    .line 47
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails;->targetAssetIndex:J

    .line 48
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    .line 47
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 73
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 85
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SfInviteGroupDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
