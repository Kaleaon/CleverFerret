.class public Lcom/dropbox/core/v2/sharing/LinkAudienceOption;
.super Ljava/lang/Object;
.source "LinkAudienceOption.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/LinkAudienceOption$Serializer;
    }
.end annotation


# instance fields
.field protected final allowed:Z

.field protected final audience:Lcom/dropbox/core/v2/sharing/LinkAudience;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final disallowedReason:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/sharing/LinkAudience;Z)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/sharing/LinkAudience;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 67
    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;-><init>(Lcom/dropbox/core/v2/sharing/LinkAudience;ZLcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/sharing/LinkAudience;ZLcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/sharing/LinkAudience;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 48
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    .line 49
    iput-boolean p2, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->allowed:Z

    .line 50
    iput-object p3, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->disallowedReason:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    return-void

    .line 46
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'audience\' is null"

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

    .line 120
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 121
    check-cast p1, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;

    .line 122
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/LinkAudience;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->allowed:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->allowed:Z

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->disallowedReason:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->disallowedReason:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    if-eq v2, p1, :cond_3

    if-eqz v2, :cond_4

    .line 124
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    :cond_3
    return v0

    :cond_4
    return v1
.end method

.method public getAllowed()Z
    .locals 1

    .line 86
    iget-boolean v0, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->allowed:Z

    return v0
.end method

.method public getAudience()Lcom/dropbox/core/v2/sharing/LinkAudience;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-object v0
.end method

.method public getDisallowedReason()Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 98
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->disallowedReason:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 103
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-boolean v1, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->allowed:Z

    .line 105
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption;->disallowedReason:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 103
    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 134
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkAudienceOption$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/LinkAudienceOption$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 146
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceOption$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkAudienceOption$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/LinkAudienceOption$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
