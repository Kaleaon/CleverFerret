.class public Lcom/dropbox/core/v2/team/MembersInfo;
.super Ljava/lang/Object;
.source "MembersInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MembersInfo$Serializer;
    }
.end annotation


# instance fields
.field protected final permanentlyDeletedUsers:J

.field protected final teamMemberIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;J)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 43
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 45
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'teamMemberIds\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 48
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersInfo;->teamMemberIds:Ljava/util/List;

    .line 49
    iput-wide p2, p0, Lcom/dropbox/core/v2/team/MembersInfo;->permanentlyDeletedUsers:J

    return-void

    .line 41
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'teamMemberIds\' is null"

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

    .line 89
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 90
    check-cast p1, Lcom/dropbox/core/v2/team/MembersInfo;

    .line 91
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersInfo;->teamMemberIds:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/MembersInfo;->teamMemberIds:Ljava/util/List;

    if-eq v2, v3, :cond_2

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-wide v2, p0, Lcom/dropbox/core/v2/team/MembersInfo;->permanentlyDeletedUsers:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/team/MembersInfo;->permanentlyDeletedUsers:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getPermanentlyDeletedUsers()J
    .locals 2

    .line 68
    iget-wide v0, p0, Lcom/dropbox/core/v2/team/MembersInfo;->permanentlyDeletedUsers:J

    return-wide v0
.end method

.method public getTeamMemberIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersInfo;->teamMemberIds:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 73
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersInfo;->teamMemberIds:Ljava/util/List;

    iget-wide v1, p0, Lcom/dropbox/core/v2/team/MembersInfo;->permanentlyDeletedUsers:J

    .line 75
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 73
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 102
    sget-object v0, Lcom/dropbox/core/v2/team/MembersInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 114
    sget-object v0, Lcom/dropbox/core/v2/team/MembersInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
