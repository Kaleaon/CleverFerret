.class public final Lcom/dropbox/core/v2/team/UserSelectorArg;
.super Ljava/lang/Object;
.source "UserSelectorArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;,
        Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

.field private emailValue:Ljava/lang/String;

.field private externalIdValue:Ljava/lang/String;

.field private teamMemberIdValue:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/UserSelectorArg;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->teamMemberIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/UserSelectorArg;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->externalIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/UserSelectorArg;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->emailValue:Ljava/lang/String;

    return-object p0
.end method

.method public static email(Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 2

    if-eqz p0, :cond_2

    .line 262
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 265
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 268
    new-instance v0, Lcom/dropbox/core/v2/team/UserSelectorArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserSelectorArg;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->EMAIL:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserSelectorArg;->withTagAndEmail(Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object p0

    return-object p0

    .line 266
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 263
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 260
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static externalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 2

    if-eqz p0, :cond_1

    .line 210
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-gt v0, v1, :cond_0

    .line 213
    new-instance v0, Lcom/dropbox/core/v2/team/UserSelectorArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserSelectorArg;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->EXTERNAL_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserSelectorArg;->withTagAndExternalId(Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object p0

    return-object p0

    .line 211
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 64"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 208
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamMemberId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 2

    if-eqz p0, :cond_0

    .line 162
    new-instance v0, Lcom/dropbox/core/v2/team/UserSelectorArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserSelectorArg;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->TEAM_MEMBER_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserSelectorArg;->withTagAndTeamMemberId(Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;

    move-result-object p0

    return-object p0

    .line 160
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 1

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/team/UserSelectorArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserSelectorArg;-><init>()V

    .line 61
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    return-object v0
.end method

.method private withTagAndEmail(Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 1

    .line 113
    new-instance v0, Lcom/dropbox/core/v2/team/UserSelectorArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserSelectorArg;-><init>()V

    .line 114
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    .line 115
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserSelectorArg;->emailValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndExternalId(Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 1

    .line 94
    new-instance v0, Lcom/dropbox/core/v2/team/UserSelectorArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserSelectorArg;-><init>()V

    .line 95
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    .line 96
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserSelectorArg;->externalIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndTeamMemberId(Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 1

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/team/UserSelectorArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserSelectorArg;-><init>()V

    .line 77
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    .line 78
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserSelectorArg;->teamMemberIdValue:Ljava/lang/String;

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

    .line 305
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/UserSelectorArg;

    if-eqz v2, :cond_c

    .line 306
    check-cast p1, Lcom/dropbox/core/v2/team/UserSelectorArg;

    .line 307
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 310
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/UserSelectorArg$1;->$SwitchMap$com$dropbox$core$v2$team$UserSelectorArg$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_9

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    return v1

    .line 316
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->emailValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserSelectorArg;->emailValue:Ljava/lang/String;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 314
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->externalIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserSelectorArg;->externalIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    return v1

    :cond_8
    :goto_1
    return v0

    .line 312
    :cond_9
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->teamMemberIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserSelectorArg;->teamMemberIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_b

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    goto :goto_2

    :cond_a
    return v1

    :cond_b
    :goto_2
    return v0

    :cond_c
    return v1
.end method

.method public getEmailValue()Ljava/lang/String;
    .locals 3

    .line 280
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->EMAIL:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    if-ne v0, v1, :cond_0

    .line 283
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->emailValue:Ljava/lang/String;

    return-object v0

    .line 281
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.EMAIL, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getExternalIdValue()Ljava/lang/String;
    .locals 3

    .line 225
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->EXTERNAL_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    if-ne v0, v1, :cond_0

    .line 228
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->externalIdValue:Ljava/lang/String;

    return-object v0

    .line 226
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.EXTERNAL_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamMemberIdValue()Ljava/lang/String;
    .locals 3

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->TEAM_MEMBER_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    if-ne v0, v1, :cond_0

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->teamMemberIdValue:Ljava/lang/String;

    return-object v0

    .line 176
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_MEMBER_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 288
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->teamMemberIdValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->externalIdValue:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->emailValue:Ljava/lang/String;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isEmail()Z
    .locals 2

    .line 239
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->EMAIL:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isExternalId()Z
    .locals 2

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->EXTERNAL_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamMemberId()Z
    .locals 2

    .line 142
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->TEAM_MEMBER_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserSelectorArg;->_tag:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 328
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 340
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UserSelectorArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
