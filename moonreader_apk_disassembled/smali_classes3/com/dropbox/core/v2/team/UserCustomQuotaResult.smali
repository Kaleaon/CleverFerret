.class public Lcom/dropbox/core/v2/team/UserCustomQuotaResult;
.super Ljava/lang/Object;
.source "UserCustomQuotaResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;
    }
.end annotation


# instance fields
.field protected final quotaGb:Ljava/lang/Long;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final user:Lcom/dropbox/core/v2/team/UserSelectorArg;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/team/UserSelectorArg;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/team/UserSelectorArg;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 69
    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;-><init>(Lcom/dropbox/core/v2/team/UserSelectorArg;Ljava/lang/Long;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/team/UserSelectorArg;Ljava/lang/Long;)V
    .locals 4
    .param p1    # Lcom/dropbox/core/v2/team/UserSelectorArg;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Long;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 48
    iput-object p1, p0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    if-eqz p2, :cond_1

    .line 50
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0xf

    cmp-long p1, v0, v2

    if-ltz p1, :cond_0

    goto :goto_0

    .line 51
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'quotaGb\' is smaller than 15L"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :cond_1
    :goto_0
    iput-object p2, p0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->quotaGb:Ljava/lang/Long;

    return-void

    .line 46
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'user\' is null"

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

    .line 108
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 109
    check-cast p1, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;

    .line 110
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/team/UserSelectorArg;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->quotaGb:Ljava/lang/Long;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->quotaGb:Ljava/lang/Long;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_3

    .line 111
    invoke-virtual {v2, p1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1
.end method

.method public getQuotaGb()Ljava/lang/Long;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 87
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->quotaGb:Ljava/lang/Long;

    return-object v0
.end method

.method public getUser()Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 78
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 92
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult;->quotaGb:Ljava/lang/Long;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 121
    sget-object v0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UserCustomQuotaResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
