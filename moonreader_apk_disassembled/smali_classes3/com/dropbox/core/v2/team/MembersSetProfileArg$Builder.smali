.class public Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;
.super Ljava/lang/Object;
.source "MembersSetProfileArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MembersSetProfileArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected newEmail:Ljava/lang/String;

.field protected newExternalId:Ljava/lang/String;

.field protected newGivenName:Ljava/lang/String;

.field protected newIsDirectoryRestricted:Ljava/lang/Boolean;

.field protected newPersistentId:Ljava/lang/String;

.field protected newSurname:Ljava/lang/String;

.field protected final user:Lcom/dropbox/core/v2/team/UserSelectorArg;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/team/UserSelectorArg;)V
    .locals 1

    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 234
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    const/4 p1, 0x0

    .line 235
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newEmail:Ljava/lang/String;

    .line 236
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newExternalId:Ljava/lang/String;

    .line 237
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newGivenName:Ljava/lang/String;

    .line 238
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newSurname:Ljava/lang/String;

    .line 239
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newPersistentId:Ljava/lang/String;

    .line 240
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newIsDirectoryRestricted:Ljava/lang/Boolean;

    return-void

    .line 232
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'user\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/MembersSetProfileArg;
    .locals 8

    .line 370
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfileArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->user:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newEmail:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newExternalId:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newGivenName:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newSurname:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newPersistentId:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newIsDirectoryRestricted:Ljava/lang/Boolean;

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/team/MembersSetProfileArg;-><init>(Lcom/dropbox/core/v2/team/UserSelectorArg;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public withNewEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 257
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 260
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 261
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'newEmail\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 258
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'newEmail\' is longer than 255"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 264
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newEmail:Ljava/lang/String;

    return-object p0
.end method

.method public withNewExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 281
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 282
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'newExternalId\' is longer than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 285
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newExternalId:Ljava/lang/String;

    return-object p0
.end method

.method public withNewGivenName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 302
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x64

    if-gt v0, v1, :cond_1

    .line 305
    const-string v0, "[^/:?*<>\"|]*"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 306
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'newGivenName\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 303
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'newGivenName\' is longer than 100"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 309
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newGivenName:Ljava/lang/String;

    return-object p0
.end method

.method public withNewIsDirectoryRestricted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;
    .locals 0

    .line 359
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newIsDirectoryRestricted:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withNewPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;
    .locals 0

    .line 346
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newPersistentId:Ljava/lang/String;

    return-object p0
.end method

.method public withNewSurname(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 326
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x64

    if-gt v0, v1, :cond_1

    .line 329
    const-string v0, "[^/:?*<>\"|]*"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 330
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'newSurname\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 327
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'newSurname\' is longer than 100"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 333
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MembersSetProfileArg$Builder;->newSurname:Ljava/lang/String;

    return-object p0
.end method
