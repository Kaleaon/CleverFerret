.class public Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;
.super Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;
.source "UserFileMembershipInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected platformType:Lcom/dropbox/core/v2/seenstate/PlatformType;

.field protected timeLastSeen:Ljava/util/Date;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/UserInfo;)V
    .locals 0

    .line 190
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/UserInfo;)V

    const/4 p1, 0x0

    .line 191
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->timeLastSeen:Ljava/util/Date;

    .line 192
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->platformType:Lcom/dropbox/core/v2/seenstate/PlatformType;

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/sharing/MembershipInfo;
    .locals 1

    .line 184
    invoke-virtual {p0}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->build()Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo;
    .locals 8

    .line 274
    new-instance v0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->user:Lcom/dropbox/core/v2/sharing/UserInfo;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->permissions:Ljava/util/List;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->initials:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->isInherited:Z

    iget-object v6, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->timeLastSeen:Ljava/util/Date;

    iget-object v7, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->platformType:Lcom/dropbox/core/v2/seenstate/PlatformType;

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/UserInfo;Ljava/util/List;Ljava/lang/String;ZLjava/util/Date;Lcom/dropbox/core/v2/seenstate/PlatformType;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/sharing/UserMembershipInfo;
    .locals 1

    .line 184
    invoke-virtual {p0}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->build()Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 184
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;
    .locals 0

    .line 247
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;
    .locals 0

    .line 184
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 184
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;
    .locals 0

    .line 263
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;
    .locals 0

    .line 184
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 184
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberPermission;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;"
        }
    .end annotation

    .line 235
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;->withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/UserMembershipInfo$Builder;
    .locals 0

    .line 184
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPlatformType(Lcom/dropbox/core/v2/seenstate/PlatformType;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;
    .locals 0

    .line 218
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->platformType:Lcom/dropbox/core/v2/seenstate/PlatformType;

    return-object p0
.end method

.method public withTimeLastSeen(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;
    .locals 0

    .line 205
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/UserFileMembershipInfo$Builder;->timeLastSeen:Ljava/util/Date;

    return-object p0
.end method
