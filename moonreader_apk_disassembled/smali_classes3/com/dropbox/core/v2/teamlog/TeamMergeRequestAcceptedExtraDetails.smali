.class public final Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;
.super Ljava/lang/Object;
.source "TeamMergeRequestAcceptedExtraDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

.field private primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;

.field private secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->withTag(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;)Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;)Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;

    return-object p0
.end method

.method public static primaryTeam(Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 168
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->withTagAndPrimaryTeam(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    move-result-object p0

    return-object p0

    .line 166
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static secondaryTeam(Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 217
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->withTagAndSecondaryTeam(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    move-result-object p0

    return-object p0

    .line 215
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    return-object v0
.end method

.method private withTagAndPrimaryTeam(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;
    .locals 1

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;-><init>()V

    .line 100
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    .line 101
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;

    return-object v0
.end method

.method private withTagAndSecondaryTeam(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;
    .locals 1

    .line 116
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;-><init>()V

    .line 117
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    .line 118
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;

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

    .line 267
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    if-eqz v2, :cond_a

    .line 268
    check-cast p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;

    .line 269
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 272
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$1;->$SwitchMap$com$dropbox$core$v2$teamlog$TeamMergeRequestAcceptedExtraDetails$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->ordinal()I

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

    .line 276
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 274
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;->equals(Ljava/lang/Object;)Z

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

.method public getPrimaryTeamValue()Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;
    .locals 3

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;

    return-object v0

    .line 184
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PRIMARY_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSecondaryTeamValue()Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;
    .locals 3

    .line 232
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 235
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;

    return-object v0

    .line 233
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SECONDARY_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 251
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestAcceptedDetails;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestAcceptedDetails;

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

.method public isOther()Z
    .locals 2

    .line 246
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPrimaryTeam()Z
    .locals 2

    .line 148
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSecondaryTeam()Z
    .locals 2

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;->SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 290
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 302
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestAcceptedExtraDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
