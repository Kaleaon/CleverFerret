.class public Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;
.super Ljava/lang/Object;
.source "GuestAdminChangeStatusDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

.field protected guestTeamName:Ljava/lang/String;

.field protected hostTeamName:Ljava/lang/String;

.field protected final isGuest:Z

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;


# direct methods
.method protected constructor <init>(ZLcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;)V
    .locals 0

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    iput-boolean p1, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->isGuest:Z

    if-eqz p2, :cond_2

    .line 184
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eqz p3, :cond_1

    .line 188
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    if-eqz p4, :cond_0

    .line 192
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    const/4 p1, 0x0

    .line 193
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->guestTeamName:Ljava/lang/String;

    .line 194
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->hostTeamName:Ljava/lang/String;

    return-void

    .line 190
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'actionDetails\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 186
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 182
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previousValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;
    .locals 7

    .line 228
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;

    iget-boolean v1, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->isGuest:Z

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->actionDetails:Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->guestTeamName:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->hostTeamName:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails;-><init>(ZLcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestState;Lcom/dropbox/core/v2/teamlog/TrustedTeamsRequestAction;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withGuestTeamName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;
    .locals 0

    .line 205
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->guestTeamName:Ljava/lang/String;

    return-object p0
.end method

.method public withHostTeamName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;
    .locals 0

    .line 217
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GuestAdminChangeStatusDetails$Builder;->hostTeamName:Ljava/lang/String;

    return-object p0
.end method
