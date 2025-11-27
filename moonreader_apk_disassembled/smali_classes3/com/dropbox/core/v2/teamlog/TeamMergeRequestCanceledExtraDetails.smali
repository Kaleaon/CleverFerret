.class public final Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;
.super Ljava/lang/Object;
.source "TeamMergeRequestCanceledExtraDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

.field private primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

.field private secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->withTag(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;)Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;)Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;

    return-object p0
.end method

.method public static primaryTeam(Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 169
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->withTagAndPrimaryTeam(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    move-result-object p0

    return-object p0

    .line 167
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static secondaryTeam(Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 219
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->withTagAndSecondaryTeam(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    move-result-object p0

    return-object p0

    .line 217
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    return-object v0
.end method

.method private withTagAndPrimaryTeam(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;
    .locals 1

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;-><init>()V

    .line 100
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    .line 101
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

    return-object v0
.end method

.method private withTagAndSecondaryTeam(Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;)Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;
    .locals 1

    .line 116
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;-><init>()V

    .line 117
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    .line 118
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;

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

    .line 269
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    if-eqz v2, :cond_a

    .line 270
    check-cast p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;

    .line 271
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 274
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$1;->$SwitchMap$com$dropbox$core$v2$teamlog$TeamMergeRequestCanceledExtraDetails$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->ordinal()I

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

    .line 278
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 276
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;->equals(Ljava/lang/Object;)Z

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

.method public getPrimaryTeamValue()Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;
    .locals 3

    .line 184
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 187
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

    return-object v0

    .line 185
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PRIMARY_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSecondaryTeamValue()Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;
    .locals 3

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 237
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;

    return-object v0

    .line 235
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SECONDARY_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->primaryTeamValue:Lcom/dropbox/core/v2/teamlog/PrimaryTeamRequestCanceledDetails;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->secondaryTeamValue:Lcom/dropbox/core/v2/teamlog/SecondaryTeamRequestCanceledDetails;

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

    .line 248
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

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
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->PRIMARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSecondaryTeam()Z
    .locals 2

    .line 198
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;->SECONDARY_TEAM:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails;->_tag:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 292
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 304
    sget-object v0, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/TeamMergeRequestCanceledExtraDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
