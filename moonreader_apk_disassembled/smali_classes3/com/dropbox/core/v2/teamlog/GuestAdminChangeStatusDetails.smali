.class public Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;
.super Ljava/lang/Object;
.source "GuestAdminChangeStatusDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;
    }
.end annotation


# instance fields
.field protected final actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final guestTeamName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final hostTeamName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final isGuest:Z

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;)V
    .locals 7
    .param p2    # Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 88
    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;-><init>(ZLcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(ZLcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2    # Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean p1, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->isGuest:Z

    .line 58
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->guestTeamName:Ljava/lang/String;

    .line 59
    iput-object p6, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->hostTeamName:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 63
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eqz p3, :cond_1

    .line 67
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eqz p4, :cond_0

    .line 71
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    return-void

    .line 69
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'actionDetails\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 65
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 61
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previousValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(ZLcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;)Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;
    .locals 1

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;-><init>(ZLcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;)V

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

    .line 254
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 255
    check-cast p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;

    .line 256
    iget-boolean v2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->isGuest:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->isGuest:Z

    if-ne v2, v3, :cond_7

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eq v2, v3, :cond_2

    .line 257
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eq v2, v3, :cond_3

    .line 258
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    if-eq v2, v3, :cond_4

    .line 259
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->guestTeamName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->guestTeamName:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    if-eqz v2, :cond_7

    .line 260
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->hostTeamName:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->hostTeamName:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_7

    .line 261
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    :cond_6
    return v0

    :cond_7
    return v1
.end method

.method public getActionDetails()Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    return-object v0
.end method

.method public getGuestTeamName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->guestTeamName:Ljava/lang/String;

    return-object v0
.end method

.method public getHostTeamName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 147
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->hostTeamName:Ljava/lang/String;

    return-object v0
.end method

.method public getIsGuest()Z
    .locals 1

    .line 97
    iget-boolean v0, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->isGuest:Z

    return v0
.end method

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 107
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .line 234
    iget-boolean v0, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->isGuest:Z

    .line 235
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->guestTeamName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->hostTeamName:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;->actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    aput-object v3, v6, v0

    const/4 v0, 0x4

    aput-object v4, v6, v0

    const/4 v0, 0x5

    aput-object v5, v6, v0

    .line 234
    invoke-static {v6}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 271
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 283
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
