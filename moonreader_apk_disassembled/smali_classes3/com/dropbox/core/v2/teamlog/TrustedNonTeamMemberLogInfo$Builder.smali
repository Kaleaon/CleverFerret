.class public Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;
.super Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;
.source "TrustedNonTeamMemberLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

.field protected final trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;)V
    .locals 1

    .line 147
    invoke-direct {p0}, Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;-><init>()V

    if-eqz p1, :cond_0

    .line 151
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;

    const/4 p1, 0x0

    .line 152
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    return-void

    .line 149
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'trustedNonTeamMemberType\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;
    .locals 6

    .line 217
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->trustedNonTeamMemberType:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->accountId:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->displayName:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->email:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;-><init>(Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/TeamLogInfo;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .locals 1

    .line 142
    invoke-virtual {p0}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->build()Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

    move-result-object v0

    return-object v0
.end method

.method public withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;
    .locals 0

    .line 179
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;->withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;
    .locals 0

    .line 142
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;
    .locals 0

    .line 191
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;->withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;
    .locals 0

    .line 142
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;
    .locals 0

    .line 206
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;->withEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/UserLogInfo$Builder;
    .locals 0

    .line 142
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->withEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withTeam(Lcom/dropbox/core/v2/teamlog/TeamLogInfo;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;
    .locals 0

    .line 163
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo$Builder;->team:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    return-object p0
.end method
