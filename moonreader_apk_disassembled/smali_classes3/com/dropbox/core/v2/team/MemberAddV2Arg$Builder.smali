.class public Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;
.super Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;
.source "MemberAddV2Arg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MemberAddV2Arg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected roleIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 202
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 203
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->roleIds:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/team/MemberAddArgBase;
    .locals 1

    .line 197
    invoke-virtual {p0}, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->build()Lcom/dropbox/core/v2/team/MemberAddV2Arg;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/team/MemberAddV2Arg;
    .locals 9

    .line 338
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Arg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->memberEmail:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->memberGivenName:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->memberSurname:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->memberExternalId:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->memberPersistentId:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->sendWelcomeEmail:Z

    iget-object v7, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->isDirectoryRestricted:Ljava/lang/Boolean;

    iget-object v8, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->roleIds:Ljava/util/List;

    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/team/MemberAddV2Arg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Boolean;Ljava/util/List;)V

    return-object v0
.end method

.method public bridge synthetic withIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;
    .locals 0

    .line 197
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->withIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;
    .locals 0

    .line 327
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;->withIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;

    return-object p0
.end method

.method public bridge synthetic withMemberExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;
    .locals 0

    .line 197
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->withMemberExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withMemberExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;
    .locals 0

    .line 282
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;->withMemberExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;

    return-object p0
.end method

.method public bridge synthetic withMemberGivenName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;
    .locals 0

    .line 197
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->withMemberGivenName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withMemberGivenName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;
    .locals 0

    .line 250
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;->withMemberGivenName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;

    return-object p0
.end method

.method public bridge synthetic withMemberPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;
    .locals 0

    .line 197
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->withMemberPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withMemberPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;
    .locals 0

    .line 295
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;->withMemberPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;

    return-object p0
.end method

.method public bridge synthetic withMemberSurname(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;
    .locals 0

    .line 197
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->withMemberSurname(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withMemberSurname(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;
    .locals 0

    .line 266
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;->withMemberSurname(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;

    return-object p0
.end method

.method public withRoleIds(Ljava/util/List;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_4

    .line 219
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_3

    .line 222
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 226
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x80

    if-gt v2, v3, :cond_1

    .line 229
    const-string v2, "pid_dbtmr:.*"

    invoke-static {v2, v1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 230
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Stringan item in list \'roleIds\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 227
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Stringan item in list \'roleIds\' is longer than 128"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 224
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'roleIds\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 220
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "List \'roleIds\' has more than 1 items"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 234
    :cond_4
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->roleIds:Ljava/util/List;

    return-object p0
.end method

.method public bridge synthetic withSendWelcomeEmail(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;
    .locals 0

    .line 197
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;->withSendWelcomeEmail(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withSendWelcomeEmail(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberAddV2Arg$Builder;
    .locals 0

    .line 315
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;->withSendWelcomeEmail(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MemberAddArgBase$Builder;

    return-object p0
.end method
