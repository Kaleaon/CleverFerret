.class public Lcom/dropbox/core/v2/sharing/VisibilityPolicy;
.super Ljava/lang/Object;
.source "VisibilityPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;
    }
.end annotation


# instance fields
.field protected final allowed:Z

.field protected final disallowedReason:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final policy:Lcom/dropbox/core/v2/sharing/RequestedVisibility;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final resolvedPolicy:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/sharing/RequestedVisibility;Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;Z)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/sharing/RequestedVisibility;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 83
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;-><init>(Lcom/dropbox/core/v2/sharing/RequestedVisibility;Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;ZLcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/sharing/RequestedVisibility;Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;ZLcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/sharing/RequestedVisibility;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 55
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->policy:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    if-eqz p2, :cond_0

    .line 59
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->resolvedPolicy:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;

    .line 60
    iput-boolean p3, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->allowed:Z

    .line 61
    iput-object p4, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->disallowedReason:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    return-void

    .line 57
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'resolvedPolicy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 53
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'policy\' is null"

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

    .line 150
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 151
    check-cast p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;

    .line 152
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->policy:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->policy:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/RequestedVisibility;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->resolvedPolicy:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->resolvedPolicy:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;

    if-eq v2, v3, :cond_3

    .line 153
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->allowed:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->allowed:Z

    if-ne v2, v3, :cond_5

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->disallowedReason:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->disallowedReason:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_5

    .line 155
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    :cond_4
    return v0

    :cond_5
    return v1
.end method

.method public getAllowed()Z
    .locals 1

    .line 115
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->allowed:Z

    return v0
.end method

.method public getDisallowedReason()Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->disallowedReason:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    return-object v0
.end method

.method public getPolicy()Lcom/dropbox/core/v2/sharing/RequestedVisibility;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->policy:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    return-object v0
.end method

.method public getResolvedPolicy()Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->resolvedPolicy:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 132
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->policy:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->resolvedPolicy:Lcom/dropbox/core/v2/sharing/AlphaResolvedVisibility;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->allowed:Z

    .line 135
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy;->disallowedReason:Lcom/dropbox/core/v2/sharing/VisibilityPolicyDisallowedReason;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    .line 132
    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 165
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 177
    sget-object v0, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/VisibilityPolicy$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
