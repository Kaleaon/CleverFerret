.class public Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;
.super Ljava/lang/Object;
.source "TeamInviteDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/TeamInviteDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final additionalLicensePurchase:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final inviteMethod:Lcom/dropbox/core/v2/teamlog/InviteMethod;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/InviteMethod;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/teamlog/InviteMethod;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;-><init>(Lcom/dropbox/core/v2/teamlog/InviteMethod;Ljava/lang/Boolean;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/InviteMethod;Ljava/lang/Boolean;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/InviteMethod;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 48
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->inviteMethod:Lcom/dropbox/core/v2/teamlog/InviteMethod;

    .line 49
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->additionalLicensePurchase:Ljava/lang/Boolean;

    return-void

    .line 46
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'inviteMethod\' is null"

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

    .line 105
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 106
    check-cast p1, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;

    .line 107
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->inviteMethod:Lcom/dropbox/core/v2/teamlog/InviteMethod;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->inviteMethod:Lcom/dropbox/core/v2/teamlog/InviteMethod;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/InviteMethod;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->additionalLicensePurchase:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->additionalLicensePurchase:Ljava/lang/Boolean;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_3

    .line 108
    invoke-virtual {v2, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

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

.method public getAdditionalLicensePurchase()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->additionalLicensePurchase:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getInviteMethod()Lcom/dropbox/core/v2/teamlog/InviteMethod;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->inviteMethod:Lcom/dropbox/core/v2/teamlog/InviteMethod;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 89
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->inviteMethod:Lcom/dropbox/core/v2/teamlog/InviteMethod;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->additionalLicensePurchase:Ljava/lang/Boolean;

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

    .line 118
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 130
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
