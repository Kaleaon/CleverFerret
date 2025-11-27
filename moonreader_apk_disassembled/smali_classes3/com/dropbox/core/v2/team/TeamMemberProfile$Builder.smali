.class public Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
.super Lcom/dropbox/core/v2/team/MemberProfile$Builder;
.source "TeamMemberProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/TeamMemberProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final groups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final memberFolderId:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v2/team/TeamMemberStatus;Lcom/dropbox/core/v2/users/Name;Lcom/dropbox/core/v2/team/TeamMembershipType;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/dropbox/core/v2/team/TeamMemberStatus;",
            "Lcom/dropbox/core/v2/users/Name;",
            "Lcom/dropbox/core/v2/team/TeamMembershipType;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 348
    invoke-direct/range {p0 .. p6}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v2/team/TeamMemberStatus;Lcom/dropbox/core/v2/users/Name;Lcom/dropbox/core/v2/team/TeamMembershipType;)V

    move-object p1, p0

    if-eqz p7, :cond_4

    .line 352
    invoke-interface {p7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    if-eqz p3, :cond_0

    goto :goto_0

    .line 354
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "An item in list \'groups\' is null"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 357
    :cond_1
    iput-object p7, p1, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->groups:Ljava/util/List;

    if-eqz p8, :cond_3

    .line 361
    const-string p2, "[-_0-9a-zA-Z:]+"

    invoke-static {p2, p8}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 364
    iput-object p8, p1, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->memberFolderId:Ljava/lang/String;

    return-void

    .line 362
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "String \'memberFolderId\' does not match pattern"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 359
    :cond_3
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "Required value for \'memberFolderId\' is null"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 350
    :cond_4
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "Required value for \'groups\' is null"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/team/MemberProfile;
    .locals 1

    .line 343
    invoke-virtual {p0}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->build()Lcom/dropbox/core/v2/team/TeamMemberProfile;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/team/TeamMemberProfile;
    .locals 20

    move-object/from16 v0, p0

    .line 501
    new-instance v1, Lcom/dropbox/core/v2/team/TeamMemberProfile;

    iget-object v2, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->teamMemberId:Ljava/lang/String;

    iget-object v3, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->email:Ljava/lang/String;

    iget-boolean v4, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->emailVerified:Z

    iget-object v5, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->status:Lcom/dropbox/core/v2/team/TeamMemberStatus;

    iget-object v6, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->name:Lcom/dropbox/core/v2/users/Name;

    iget-object v7, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->membershipType:Lcom/dropbox/core/v2/team/TeamMembershipType;

    iget-object v8, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->groups:Ljava/util/List;

    iget-object v9, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->memberFolderId:Ljava/lang/String;

    iget-object v10, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->externalId:Ljava/lang/String;

    iget-object v11, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->accountId:Ljava/lang/String;

    iget-object v12, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->secondaryEmails:Ljava/util/List;

    iget-object v13, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->invitedOn:Ljava/util/Date;

    iget-object v14, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->joinedOn:Ljava/util/Date;

    iget-object v15, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->suspendedOn:Ljava/util/Date;

    move-object/from16 v16, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->persistentId:Ljava/lang/String;

    move-object/from16 v17, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->isDirectoryRestricted:Ljava/lang/Boolean;

    move-object/from16 v18, v1

    iget-object v1, v0, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->profilePhotoUrl:Ljava/lang/String;

    move-object/from16 v19, v18

    move-object/from16 v18, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v19

    invoke-direct/range {v1 .. v18}, Lcom/dropbox/core/v2/team/TeamMemberProfile;-><init>(Ljava/lang/String;Ljava/lang/String;ZLcom/dropbox/core/v2/team/TeamMemberStatus;Lcom/dropbox/core/v2/users/Name;Lcom/dropbox/core/v2/team/TeamMembershipType;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    move-object/from16 v16, v1

    return-object v16
.end method

.method public bridge synthetic withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0

    .line 393
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method

.method public bridge synthetic withExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0

    .line 377
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method

.method public bridge synthetic withInvitedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withInvitedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withInvitedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0

    .line 423
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withInvitedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method

.method public bridge synthetic withIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0

    .line 477
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method

.method public bridge synthetic withJoinedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withJoinedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withJoinedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0

    .line 436
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withJoinedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method

.method public bridge synthetic withPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0

    .line 464
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method

.method public bridge synthetic withProfilePhotoUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withProfilePhotoUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withProfilePhotoUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0

    .line 490
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withProfilePhotoUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method

.method public bridge synthetic withSecondaryEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withSecondaryEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withSecondaryEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;",
            ">;)",
            "Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;"
        }
    .end annotation

    .line 409
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withSecondaryEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method

.method public bridge synthetic withSuspendedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;
    .locals 0

    .line 343
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;->withSuspendedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withSuspendedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/TeamMemberProfile$Builder;
    .locals 0

    .line 450
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberProfile$Builder;->withSuspendedOn(Ljava/util/Date;)Lcom/dropbox/core/v2/team/MemberProfile$Builder;

    return-object p0
.end method
