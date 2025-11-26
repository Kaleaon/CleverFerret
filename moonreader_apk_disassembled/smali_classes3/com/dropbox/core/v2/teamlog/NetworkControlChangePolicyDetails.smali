.class public Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;
.super Ljava/lang/Object;
.source "NetworkControlChangePolicyDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final newValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;-><init>(Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 47
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    .line 48
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    return-void

    .line 45
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

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

    .line 104
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 105
    check-cast p1, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;

    .line 106
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_3

    .line 107
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;->equals(Ljava/lang/Object;)Z

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

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 88
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/NetworkControlPolicy;

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

    .line 117
    sget-object v0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 129
    sget-object v0, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/NetworkControlChangePolicyDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
