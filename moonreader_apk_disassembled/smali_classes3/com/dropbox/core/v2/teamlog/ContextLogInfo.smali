.class public final Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
.super Ljava/lang/Object;
.source "ContextLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;
    }
.end annotation


# static fields
.field public static final ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

.field public static final TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

.field private nonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;

.field private organizationTeamValue:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

.field private teamMemberValue:Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;

.field private trustedNonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/ContextLogInfo;)Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->nonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/ContextLogInfo;)Lcom/dropbox/core/v2/teamlog/TeamLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->organizationTeamValue:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/teamlog/ContextLogInfo;)Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->teamMemberValue:Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/teamlog/ContextLogInfo;)Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->trustedNonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

    return-object p0
.end method

.method public static nonTeamMember(Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 239
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->withTagAndNonTeamMember(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    move-result-object p0

    return-object p0

    .line 237
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static organizationTeam(Lcom/dropbox/core/v2/teamlog/TeamLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 289
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->ORGANIZATION_TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->withTagAndOrganizationTeam(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/TeamLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    move-result-object p0

    return-object p0

    .line 287
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamMember(Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 349
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->withTagAndTeamMember(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    move-result-object p0

    return-object p0

    .line 347
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static trustedNonTeamMember(Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 397
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TRUSTED_NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->withTagAndTrustedNonTeamMember(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    move-result-object p0

    return-object p0

    .line 395
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 1

    .line 109
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    .line 110
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    return-object v0
.end method

.method private withTagAndNonTeamMember(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 1

    .line 125
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    .line 126
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 127
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->nonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;

    return-object v0
.end method

.method private withTagAndOrganizationTeam(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/TeamLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 1

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    .line 143
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 144
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->organizationTeamValue:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    return-object v0
.end method

.method private withTagAndTeamMember(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 1

    .line 159
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    .line 160
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 161
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->teamMemberValue:Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;

    return-object v0
.end method

.method private withTagAndTrustedNonTeamMember(Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
    .locals 1

    .line 176
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;-><init>()V

    .line 177
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 178
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->trustedNonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

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

    .line 450
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    if-eqz v2, :cond_b

    .line 451
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    .line 452
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 455
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$ContextLogInfo$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 467
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->trustedNonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->trustedNonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 465
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->teamMemberValue:Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->teamMemberValue:Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    :pswitch_3
    return v0

    .line 461
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->organizationTeamValue:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->organizationTeamValue:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/TeamLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    .line 459
    :pswitch_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->nonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->nonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;

    if-eq v2, p1, :cond_a

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_3

    :cond_9
    return v1

    :cond_a
    :goto_3
    :pswitch_6
    return v0

    :cond_b
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getNonTeamMemberValue()Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;
    .locals 3

    .line 254
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 257
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->nonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;

    return-object v0

    .line 255
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NON_TEAM_MEMBER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getOrganizationTeamValue()Lcom/dropbox/core/v2/teamlog/TeamLogInfo;
    .locals 3

    .line 304
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->ORGANIZATION_TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 307
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->organizationTeamValue:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    return-object v0

    .line 305
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ORGANIZATION_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamMemberValue()Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;
    .locals 3

    .line 363
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 366
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->teamMemberValue:Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;

    return-object v0

    .line 364
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_MEMBER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTrustedNonTeamMemberValue()Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;
    .locals 3

    .line 413
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TRUSTED_NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 416
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->trustedNonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

    return-object v0

    .line 414
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TRUSTED_NON_TEAM_MEMBER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 7

    .line 432
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->nonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/NonTeamMemberLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->organizationTeamValue:Lcom/dropbox/core/v2/teamlog/TeamLogInfo;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->teamMemberValue:Lcom/dropbox/core/v2/teamlog/TeamMemberLogInfo;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->trustedNonTeamMemberValue:Lcom/dropbox/core/v2/teamlog/TrustedNonTeamMemberLogInfo;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isAnonymous()Z
    .locals 2

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNonTeamMember()Z
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOrganizationTeam()Z
    .locals 2

    .line 268
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->ORGANIZATION_TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 427
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeam()Z
    .locals 2

    .line 318
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamMember()Z
    .locals 2

    .line 329
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTrustedNonTeamMember()Z
    .locals 2

    .line 377
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TRUSTED_NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 481
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 493
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
