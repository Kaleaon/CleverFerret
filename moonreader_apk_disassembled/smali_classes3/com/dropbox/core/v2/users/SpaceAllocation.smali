.class public final Lcom/dropbox/core/v2/users/SpaceAllocation;
.super Ljava/lang/Object;
.source "SpaceAllocation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/SpaceAllocation$Serializer;,
        Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/users/SpaceAllocation;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

.field private individualValue:Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;

.field private teamValue:Lcom/dropbox/core/v2/users/TeamSpaceAllocation;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/users/SpaceAllocation;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/SpaceAllocation;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->OTHER:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/users/SpaceAllocation;->withTag(Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;)Lcom/dropbox/core/v2/users/SpaceAllocation;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/users/SpaceAllocation;->OTHER:Lcom/dropbox/core/v2/users/SpaceAllocation;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/users/SpaceAllocation;)Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->individualValue:Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/users/SpaceAllocation;)Lcom/dropbox/core/v2/users/TeamSpaceAllocation;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->teamValue:Lcom/dropbox/core/v2/users/TeamSpaceAllocation;

    return-object p0
.end method

.method public static individual(Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;)Lcom/dropbox/core/v2/users/SpaceAllocation;
    .locals 2

    if-eqz p0, :cond_0

    .line 169
    new-instance v0, Lcom/dropbox/core/v2/users/SpaceAllocation;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/SpaceAllocation;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->INDIVIDUAL:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/users/SpaceAllocation;->withTagAndIndividual(Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;)Lcom/dropbox/core/v2/users/SpaceAllocation;

    move-result-object p0

    return-object p0

    .line 167
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static team(Lcom/dropbox/core/v2/users/TeamSpaceAllocation;)Lcom/dropbox/core/v2/users/SpaceAllocation;
    .locals 2

    if-eqz p0, :cond_0

    .line 217
    new-instance v0, Lcom/dropbox/core/v2/users/SpaceAllocation;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/SpaceAllocation;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->TEAM:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/users/SpaceAllocation;->withTagAndTeam(Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;Lcom/dropbox/core/v2/users/TeamSpaceAllocation;)Lcom/dropbox/core/v2/users/SpaceAllocation;

    move-result-object p0

    return-object p0

    .line 215
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;)Lcom/dropbox/core/v2/users/SpaceAllocation;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/users/SpaceAllocation;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/SpaceAllocation;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    return-object v0
.end method

.method private withTagAndIndividual(Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;)Lcom/dropbox/core/v2/users/SpaceAllocation;
    .locals 1

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/users/SpaceAllocation;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/SpaceAllocation;-><init>()V

    .line 100
    iput-object p1, v0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    .line 101
    iput-object p2, v0, Lcom/dropbox/core/v2/users/SpaceAllocation;->individualValue:Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;

    return-object v0
.end method

.method private withTagAndTeam(Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;Lcom/dropbox/core/v2/users/TeamSpaceAllocation;)Lcom/dropbox/core/v2/users/SpaceAllocation;
    .locals 1

    .line 116
    new-instance v0, Lcom/dropbox/core/v2/users/SpaceAllocation;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/SpaceAllocation;-><init>()V

    .line 117
    iput-object p1, v0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    .line 118
    iput-object p2, v0, Lcom/dropbox/core/v2/users/SpaceAllocation;->teamValue:Lcom/dropbox/core/v2/users/TeamSpaceAllocation;

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

    .line 266
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/users/SpaceAllocation;

    if-eqz v2, :cond_a

    .line 267
    check-cast p1, Lcom/dropbox/core/v2/users/SpaceAllocation;

    .line 268
    iget-object v2, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 271
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/users/SpaceAllocation$1;->$SwitchMap$com$dropbox$core$v2$users$SpaceAllocation$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->ordinal()I

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

    .line 275
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->teamValue:Lcom/dropbox/core/v2/users/TeamSpaceAllocation;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/SpaceAllocation;->teamValue:Lcom/dropbox/core/v2/users/TeamSpaceAllocation;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/users/TeamSpaceAllocation;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 273
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->individualValue:Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/SpaceAllocation;->individualValue:Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;->equals(Ljava/lang/Object;)Z

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

.method public getIndividualValue()Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;
    .locals 3

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->INDIVIDUAL:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    if-ne v0, v1, :cond_0

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->individualValue:Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;

    return-object v0

    .line 184
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INDIVIDUAL, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamValue()Lcom/dropbox/core/v2/users/TeamSpaceAllocation;
    .locals 3

    .line 231
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->TEAM:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    if-ne v0, v1, :cond_0

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->teamValue:Lcom/dropbox/core/v2/users/TeamSpaceAllocation;

    return-object v0

    .line 232
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->individualValue:Lcom/dropbox/core/v2/users/IndividualSpaceAllocation;

    iget-object v2, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->teamValue:Lcom/dropbox/core/v2/users/TeamSpaceAllocation;

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

.method public isIndividual()Z
    .locals 2

    .line 148
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->INDIVIDUAL:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 245
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->OTHER:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeam()Z
    .locals 2

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;->TEAM:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/dropbox/core/v2/users/SpaceAllocation;->_tag:Lcom/dropbox/core/v2/users/SpaceAllocation$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 289
    sget-object v0, Lcom/dropbox/core/v2/users/SpaceAllocation$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/SpaceAllocation$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/SpaceAllocation$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 301
    sget-object v0, Lcom/dropbox/core/v2/users/SpaceAllocation$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/SpaceAllocation$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/SpaceAllocation$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
