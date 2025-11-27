.class Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;
.super Ljava/lang/Object;
.source "UploadSessionStartBatchArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;
    }
.end annotation


# instance fields
.field protected final numSessions:J

.field protected final sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(J)V
    .locals 1

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;-><init>(JLcom/dropbox/core/v2/files/UploadSessionType;)V

    return-void
.end method

.method public constructor <init>(JLcom/dropbox/core/v2/files/UploadSessionType;)V
    .locals 2
    .param p3    # Lcom/dropbox/core/v2/files/UploadSessionType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p3, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;

    const-wide/16 v0, 0x1

    cmp-long p3, p1, v0

    if-ltz p3, :cond_1

    const-wide/16 v0, 0x3e8

    cmp-long p3, p1, v0

    if-gtz p3, :cond_0

    .line 47
    iput-wide p1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->numSessions:J

    return-void

    .line 45
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'numSessions\' is larger than 1000L"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 42
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'numSessions\' is smaller than 1L"

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

    .line 103
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 104
    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;

    .line 105
    iget-wide v2, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->numSessions:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->numSessions:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;

    if-eq v2, p1, :cond_2

    if-eqz v2, :cond_3

    .line 106
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/UploadSessionType;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    return v0

    :cond_3
    return v1
.end method

.method public getNumSessions()J
    .locals 2

    .line 71
    iget-wide v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->numSessions:J

    return-wide v0
.end method

.method public getSessionType()Lcom/dropbox/core/v2/files/UploadSessionType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 87
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->sessionType:Lcom/dropbox/core/v2/files/UploadSessionType;

    iget-wide v1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg;->numSessions:J

    .line 89
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 87
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 116
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 128
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionStartBatchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
