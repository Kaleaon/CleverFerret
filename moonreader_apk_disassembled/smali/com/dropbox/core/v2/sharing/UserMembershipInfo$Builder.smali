.class public Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;
.super Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
.source "UserMembershipInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/UserMembershipInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final user:Lcom/dropbox/core/v2/sharing/UserInfo;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/UserInfo;)V
    .locals 0

    .line 155
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;)V

    if-eqz p2, :cond_0

    .line 159
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->user:Lcom/dropbox/core/v2/sharing/UserInfo;

    return-void

    .line 157
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'user\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/sharing/MembershipInfo;
    .locals 1

    .line 151
    invoke-virtual {p0}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->build()Lcom/dropbox/core/v2/sharing/UserMembershipInfo;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/sharing/UserMembershipInfo;
    .locals 6

    .line 214
    new-instance v0, Lcom/dropbox/core/v2/sharing/UserMembershipInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->user:Lcom/dropbox/core/v2/sharing/UserInfo;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->permissions:Ljava/util/List;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->initials:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->isInherited:Z

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/UserInfo;Ljava/util/List;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public bridge synthetic withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 151
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;
    .locals 0

    .line 187
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 151
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;
    .locals 0

    .line 203
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 151
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberPermission;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;"
        }
    .end annotation

    .line 175
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;

    return-object p0
.end method
