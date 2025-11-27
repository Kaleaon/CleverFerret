.class public Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;
.super Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
.source "InviteeMembershipInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final invitee:Lcom/dropbox/core/v2/sharing/InviteeInfo;

.field protected user:Lcom/dropbox/core/v2/sharing/UserInfo;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/InviteeInfo;)V
    .locals 0

    .line 168
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;)V

    if-eqz p2, :cond_0

    .line 172
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->invitee:Lcom/dropbox/core/v2/sharing/InviteeInfo;

    const/4 p1, 0x0

    .line 173
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->user:Lcom/dropbox/core/v2/sharing/UserInfo;

    return-void

    .line 170
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'invitee\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo;
    .locals 7

    .line 240
    new-instance v0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->invitee:Lcom/dropbox/core/v2/sharing/InviteeInfo;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->permissions:Ljava/util/List;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->initials:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->isInherited:Z

    iget-object v6, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->user:Lcom/dropbox/core/v2/sharing/UserInfo;

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/InviteeInfo;Ljava/util/List;Ljava/lang/String;ZLcom/dropbox/core/v2/sharing/UserInfo;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/sharing/MembershipInfo;
    .locals 1

    .line 162
    invoke-virtual {p0}, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->build()Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo;

    move-result-object v0

    return-object v0
.end method

.method public withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;
    .locals 0

    .line 213
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 162
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;
    .locals 0

    .line 229
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 162
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberPermission;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;"
        }
    .end annotation

    .line 201
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 162
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withUser(Lcom/dropbox/core/v2/sharing/UserInfo;)Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;
    .locals 0

    .line 184
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/InviteeMembershipInfo$Builder;->user:Lcom/dropbox/core/v2/sharing/UserInfo;

    return-object p0
.end method
