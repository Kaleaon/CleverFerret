.class public Lcom/dropbox/core/v2/users/SpaceUsage;
.super Ljava/lang/Object;
.source "SpaceUsage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;
    }
.end annotation


# instance fields
.field protected final allocation:Lcom/dropbox/core/v2/users/SpaceAllocation;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final used:J


# direct methods
.method public constructor <init>(JLcom/dropbox/core/v2/users/SpaceAllocation;)V
    .locals 0
    .param p3    # Lcom/dropbox/core/v2/users/SpaceAllocation;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-wide p1, p0, Lcom/dropbox/core/v2/users/SpaceUsage;->used:J

    if-eqz p3, :cond_0

    .line 45
    iput-object p3, p0, Lcom/dropbox/core/v2/users/SpaceUsage;->allocation:Lcom/dropbox/core/v2/users/SpaceAllocation;

    return-void

    .line 43
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'allocation\' is null"

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

    .line 85
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 86
    check-cast p1, Lcom/dropbox/core/v2/users/SpaceUsage;

    .line 87
    iget-wide v2, p0, Lcom/dropbox/core/v2/users/SpaceUsage;->used:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/users/SpaceUsage;->used:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/users/SpaceUsage;->allocation:Lcom/dropbox/core/v2/users/SpaceAllocation;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/SpaceUsage;->allocation:Lcom/dropbox/core/v2/users/SpaceAllocation;

    if-eq v2, p1, :cond_2

    .line 88
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/users/SpaceAllocation;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    return v0

    :cond_3
    return v1
.end method

.method public getAllocation()Lcom/dropbox/core/v2/users/SpaceAllocation;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceUsage;->allocation:Lcom/dropbox/core/v2/users/SpaceAllocation;

    return-object v0
.end method

.method public getUsed()J
    .locals 2

    .line 54
    iget-wide v0, p0, Lcom/dropbox/core/v2/users/SpaceUsage;->used:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    .line 69
    iget-wide v0, p0, Lcom/dropbox/core/v2/users/SpaceUsage;->used:J

    .line 70
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v2/users/SpaceUsage;->allocation:Lcom/dropbox/core/v2/users/SpaceAllocation;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 69
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 98
    sget-object v0, Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 110
    sget-object v0, Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/SpaceUsage$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
