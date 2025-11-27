.class public Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;
.super Ljava/lang/Object;
.source "MembersRemoveArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MembersRemoveArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected keepAccount:Z

.field protected retainTeamShares:Z

.field protected transferAdminId:Lcom/dropbox/core/v2/team/UserSelectorArg;

.field protected transferDestId:Lcom/dropbox/core/v2/team/UserSelectorArg;

.field protected final user:Lcom/dropbox/core/v2/team/UserSelectorArg;

.field protected wipeData:Z


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/team/UserSelectorArg;)V
    .locals 1

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 195
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    const/4 p1, 0x1

    .line 196
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->wipeData:Z

    const/4 p1, 0x0

    .line 197
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->transferDestId:Lcom/dropbox/core/v2/team/UserSelectorArg;

    .line 198
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->transferAdminId:Lcom/dropbox/core/v2/team/UserSelectorArg;

    const/4 p1, 0x0

    .line 199
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->keepAccount:Z

    .line 200
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->retainTeamShares:Z

    return-void

    .line 193
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'user\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/MembersRemoveArg;
    .locals 7

    .line 317
    new-instance v0, Lcom/dropbox/core/v2/team/MembersRemoveArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->wipeData:Z

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->transferDestId:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->transferAdminId:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-boolean v5, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->keepAccount:Z

    iget-boolean v6, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->retainTeamShares:Z

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/team/MembersRemoveArg;-><init>(Lcom/dropbox/core/v2/team/UserSelectorArg;ZLcom/dropbox/core/v2/team/UserSelectorArg;Lcom/dropbox/core/v2/team/UserSelectorArg;ZZ)V

    return-object v0
.end method

.method public withKeepAccount(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 272
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->keepAccount:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 275
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->keepAccount:Z

    return-object p0
.end method

.method public withRetainTeamShares(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 302
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->retainTeamShares:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 305
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->retainTeamShares:Z

    return-object p0
.end method

.method public withTransferAdminId(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;
    .locals 0

    .line 249
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->transferAdminId:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object p0
.end method

.method public withTransferDestId(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;
    .locals 0

    .line 234
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->transferDestId:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object p0
.end method

.method public withWipeData(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 217
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->wipeData:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 220
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersRemoveArg$Builder;->wipeData:Z

    return-object p0
.end method
