.class public Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;
.super Ljava/lang/Object;
.source "RansomwareRestoreProcessCompletedDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final restoredFilesCount:J

.field protected final restoredFilesFailedCount:J

.field protected final status:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;JJ)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 47
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->status:Ljava/lang/String;

    .line 48
    iput-wide p2, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesCount:J

    .line 49
    iput-wide p4, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesFailedCount:J

    return-void

    .line 45
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'status\' is null"

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

    .line 99
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 100
    check-cast p1, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;

    .line 101
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->status:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->status:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-wide v2, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesCount:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesCount:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_3

    iget-wide v2, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesFailedCount:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesFailedCount:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getRestoredFilesCount()J
    .locals 2

    .line 68
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesCount:J

    return-wide v0
.end method

.method public getRestoredFilesFailedCount()J
    .locals 2

    .line 77
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesFailedCount:J

    return-wide v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->status:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 82
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->status:Ljava/lang/String;

    iget-wide v1, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesCount:J

    .line 84
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-wide v2, p0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails;->restoredFilesFailedCount:J

    .line 85
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 82
    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 113
    sget-object v0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 125
    sget-object v0, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/RansomwareRestoreProcessCompletedDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
