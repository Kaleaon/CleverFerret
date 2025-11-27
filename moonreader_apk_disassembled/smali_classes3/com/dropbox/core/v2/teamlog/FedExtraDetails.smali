.class public final Lcom/dropbox/core/v2/teamlog/FedExtraDetails;
.super Ljava/lang/Object;
.source "FedExtraDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/FedExtraDetails;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

.field private organizationValue:Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

.field private teamValue:Lcom/dropbox/core/v2/teamlog/TeamDetails;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->withTag(Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->OTHER:Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/FedExtraDetails;)Lcom/dropbox/core/v2/teamlog/OrganizationDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->organizationValue:Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/FedExtraDetails;)Lcom/dropbox/core/v2/teamlog/TeamDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->teamValue:Lcom/dropbox/core/v2/teamlog/TeamDetails;

    return-object p0
.end method

.method public static organization(Lcom/dropbox/core/v2/teamlog/OrganizationDetails;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 167
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->ORGANIZATION:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->withTagAndOrganization(Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/OrganizationDetails;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    move-result-object p0

    return-object p0

    .line 165
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static team(Lcom/dropbox/core/v2/teamlog/TeamDetails;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 216
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->TEAM:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->withTagAndTeam(Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/TeamDetails;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    move-result-object p0

    return-object p0

    .line 214
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    return-object v0
.end method

.method private withTagAndOrganization(Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/OrganizationDetails;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;
    .locals 1

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;-><init>()V

    .line 100
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    .line 101
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->organizationValue:Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

    return-object v0
.end method

.method private withTagAndTeam(Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/TeamDetails;)Lcom/dropbox/core/v2/teamlog/FedExtraDetails;
    .locals 1

    .line 115
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;-><init>()V

    .line 116
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    .line 117
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->teamValue:Lcom/dropbox/core/v2/teamlog/TeamDetails;

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

    .line 265
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    if-eqz v2, :cond_a

    .line 266
    check-cast p1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;

    .line 267
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 270
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$1;->$SwitchMap$com$dropbox$core$v2$teamlog$FedExtraDetails$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 274
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->teamValue:Lcom/dropbox/core/v2/teamlog/TeamDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->teamValue:Lcom/dropbox/core/v2/teamlog/TeamDetails;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/TeamDetails;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 272
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->organizationValue:Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->organizationValue:Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/OrganizationDetails;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    :cond_a
    return v1
.end method

.method public getOrganizationValue()Lcom/dropbox/core/v2/teamlog/OrganizationDetails;
    .locals 3

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->ORGANIZATION:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 185
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->organizationValue:Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

    return-object v0

    .line 183
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ORGANIZATION, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamValue()Lcom/dropbox/core/v2/teamlog/TeamDetails;
    .locals 3

    .line 230
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->TEAM:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 233
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->teamValue:Lcom/dropbox/core/v2/teamlog/TeamDetails;

    return-object v0

    .line 231
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 249
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->organizationValue:Lcom/dropbox/core/v2/teamlog/OrganizationDetails;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->teamValue:Lcom/dropbox/core/v2/teamlog/TeamDetails;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isOrganization()Z
    .locals 2

    .line 147
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->ORGANIZATION:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeam()Z
    .locals 2

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;->TEAM:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 288
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 300
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FedExtraDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
