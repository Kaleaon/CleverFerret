.class public Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;
.super Ljava/lang/Object;
.source "RelocateAssetReferencesLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo$Serializer;
    }
.end annotation


# instance fields
.field protected final destAssetIndex:J

.field protected final srcAssetIndex:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-wide p1, p0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->srcAssetIndex:J

    .line 38
    iput-wide p3, p0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->destAssetIndex:J

    return-void
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

    .line 77
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 78
    check-cast p1, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;

    .line 79
    iget-wide v2, p0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->srcAssetIndex:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->srcAssetIndex:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-wide v2, p0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->destAssetIndex:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->destAssetIndex:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public getDestAssetIndex()J
    .locals 2

    .line 56
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->destAssetIndex:J

    return-wide v0
.end method

.method public getSrcAssetIndex()J
    .locals 2

    .line 47
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->srcAssetIndex:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    .line 61
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->srcAssetIndex:J

    .line 62
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v1, p0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo;->destAssetIndex:J

    .line 63
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 61
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 90
    sget-object v0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 102
    sget-object v0, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/RelocateAssetReferencesLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
