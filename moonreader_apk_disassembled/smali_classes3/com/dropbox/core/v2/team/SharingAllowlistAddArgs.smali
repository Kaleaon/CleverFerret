.class Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;
.super Ljava/lang/Object;
.source "SharingAllowlistAddArgs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Serializer;,
        Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;
    }
.end annotation


# instance fields
.field protected final domains:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final emails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 76
    invoke-direct {p0, v0, v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 52
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

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'domains\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 58
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->domains:Ljava/util/List;

    if-eqz p2, :cond_3

    .line 60
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_2

    goto :goto_1

    .line 62
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'emails\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 66
    :cond_3
    iput-object p2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->emails:Ljava/util/List;

    return-void
.end method

.method public static newBuilder()Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;
    .locals 1

    .line 105
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;-><init>()V

    return-object v0
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

    .line 198
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 199
    check-cast p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;

    .line 200
    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->domains:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->domains:Ljava/util/List;

    if-eq v2, v3, :cond_2

    if-eqz v2, :cond_3

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->emails:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->emails:Ljava/util/List;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_3

    .line 201
    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

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

.method public getDomains()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->domains:Ljava/util/List;

    return-object v0
.end method

.method public getEmails()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->emails:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->domains:Ljava/util/List;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;->emails:Ljava/util/List;

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

    .line 211
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 223
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
