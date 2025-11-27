.class Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;
.super Ljava/lang/Object;
.source "ListFileRequestsArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;
    }
.end annotation


# instance fields
.field protected final limit:J


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, 0x3e8

    .line 43
    invoke-direct {p0, v0, v1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;-><init>(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-wide p1, p0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;->limit:J

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

    .line 73
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 74
    check-cast p1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;

    .line 75
    iget-wide v2, p0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;->limit:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;->limit:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public getLimit()J
    .locals 2

    .line 53
    iget-wide v0, p0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;->limit:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 3

    .line 58
    iget-wide v0, p0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg;->limit:J

    .line 59
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    .line 58
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 84
    sget-object v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 96
    sget-object v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
