.class Lcom/dropbox/core/v2/team/SharingAllowlistListArg;
.super Ljava/lang/Object;
.source "SharingAllowlistListArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/SharingAllowlistListArg$Serializer;
    }
.end annotation


# instance fields
.field protected final limit:J


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, 0x3e8

    .line 48
    invoke-direct {p0, v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistListArg;-><init>(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 3

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x1

    cmp-long v2, p1, v0

    if-ltz v2, :cond_1

    const-wide/16 v0, 0x3e8

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    .line 39
    iput-wide p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListArg;->limit:J

    return-void

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'limit\' is larger than 1000L"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 34
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'limit\' is smaller than 1L"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
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

    .line 78
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 79
    check-cast p1, Lcom/dropbox/core/v2/team/SharingAllowlistListArg;

    .line 80
    iget-wide v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListArg;->limit:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/team/SharingAllowlistListArg;->limit:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public getLimit()J
    .locals 2

    .line 58
    iget-wide v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListArg;->limit:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 3

    .line 63
    iget-wide v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListArg;->limit:J

    .line 64
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    .line 63
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 89
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistListArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistListArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistListArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 101
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistListArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistListArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistListArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
