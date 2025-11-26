.class public final Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
.super Ljava/lang/Object;
.source "FederationStatusChangeAdditionalInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

.field private connectedTeamNameValue:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

.field private nonTrustedTeamDetailsValue:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

.field private organizationNameValue:Lcom/dropbox/core/v2/teamlog/OrganizationName;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 68
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->withTag(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;)Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->connectedTeamNameValue:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;)Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->nonTrustedTeamDetailsValue:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;)Lcom/dropbox/core/v2/teamlog/OrganizationName;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->organizationNameValue:Lcom/dropbox/core/v2/teamlog/OrganizationName;

    return-object p0
.end method

.method public static connectedTeamName(Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 190
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->CONNECTED_TEAM_NAME:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->withTagAndConnectedTeamName(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object p0

    return-object p0

    .line 188
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static nonTrustedTeamDetails(Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 239
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->NON_TRUSTED_TEAM_DETAILS:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->withTagAndNonTrustedTeamDetails(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object p0

    return-object p0

    .line 237
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static organizationName(Lcom/dropbox/core/v2/teamlog/OrganizationName;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 289
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->ORGANIZATION_NAME:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->withTagAndOrganizationName(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;Lcom/dropbox/core/v2/teamlog/OrganizationName;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    move-result-object p0

    return-object p0

    .line 287
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 1

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;-><init>()V

    .line 89
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    return-object v0
.end method

.method private withTagAndConnectedTeamName(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 1

    .line 104
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;-><init>()V

    .line 105
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    .line 106
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->connectedTeamNameValue:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

    return-object v0
.end method

.method private withTagAndNonTrustedTeamDetails(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 1

    .line 121
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;-><init>()V

    .line 122
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    .line 123
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->nonTrustedTeamDetailsValue:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

    return-object v0
.end method

.method private withTagAndOrganizationName(Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;Lcom/dropbox/core/v2/teamlog/OrganizationName;)Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;
    .locals 1

    .line 138
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;-><init>()V

    .line 139
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    .line 140
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->organizationNameValue:Lcom/dropbox/core/v2/teamlog/OrganizationName;

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

    .line 340
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    if-eqz v2, :cond_d

    .line 341
    check-cast p1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;

    .line 342
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 345
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$FederationStatusChangeAdditionalInfo$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_a

    const/4 v3, 0x2

    if-eq v2, v3, :cond_7

    const/4 v3, 0x3

    if-eq v2, v3, :cond_4

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 351
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->organizationNameValue:Lcom/dropbox/core/v2/teamlog/OrganizationName;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->organizationNameValue:Lcom/dropbox/core/v2/teamlog/OrganizationName;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/OrganizationName;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 349
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->nonTrustedTeamDetailsValue:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->nonTrustedTeamDetailsValue:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    .line 347
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->connectedTeamNameValue:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->connectedTeamNameValue:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_2

    :cond_b
    return v1

    :cond_c
    :goto_2
    return v0

    :cond_d
    return v1
.end method

.method public getConnectedTeamNameValue()Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;
    .locals 3

    .line 205
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->CONNECTED_TEAM_NAME:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->connectedTeamNameValue:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

    return-object v0

    .line 206
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.CONNECTED_TEAM_NAME, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNonTrustedTeamDetailsValue()Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;
    .locals 3

    .line 255
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->NON_TRUSTED_TEAM_DETAILS:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 258
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->nonTrustedTeamDetailsValue:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

    return-object v0

    .line 256
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NON_TRUSTED_TEAM_DETAILS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getOrganizationNameValue()Lcom/dropbox/core/v2/teamlog/OrganizationName;
    .locals 3

    .line 304
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->ORGANIZATION_NAME:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 307
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->organizationNameValue:Lcom/dropbox/core/v2/teamlog/OrganizationName;

    return-object v0

    .line 305
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ORGANIZATION_NAME, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 323
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->connectedTeamNameValue:Lcom/dropbox/core/v2/teamlog/ConnectedTeamName;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->nonTrustedTeamDetailsValue:Lcom/dropbox/core/v2/teamlog/NonTrustedTeamDetails;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->organizationNameValue:Lcom/dropbox/core/v2/teamlog/OrganizationName;

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

.method public isConnectedTeamName()Z
    .locals 2

    .line 170
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->CONNECTED_TEAM_NAME:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNonTrustedTeamDetails()Z
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->NON_TRUSTED_TEAM_DETAILS:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOrganizationName()Z
    .locals 2

    .line 269
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->ORGANIZATION_NAME:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 318
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo;->_tag:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 365
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 377
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FederationStatusChangeAdditionalInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
