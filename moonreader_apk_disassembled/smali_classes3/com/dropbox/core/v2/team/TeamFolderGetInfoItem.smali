.class public final Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;
.super Ljava/lang/Object;
.source "TeamFolderGetInfoItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Serializer;,
        Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

.field private idNotFoundValue:Ljava/lang/String;

.field private teamFolderMetadataValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;)Ljava/lang/String;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;)Lcom/dropbox/core/v2/team/TeamFolderMetadata;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->teamFolderMetadataValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    return-object p0
.end method

.method public static idNotFound(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;
    .locals 2

    if-eqz p0, :cond_0

    .line 143
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->withTagAndIdNotFound(Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    move-result-object p0

    return-object p0

    .line 141
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamFolderMetadata(Lcom/dropbox/core/v2/team/TeamFolderMetadata;)Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;
    .locals 2

    if-eqz p0, :cond_0

    .line 193
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->TEAM_FOLDER_METADATA:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->withTagAndTeamFolderMetadata(Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;Lcom/dropbox/core/v2/team/TeamFolderMetadata;)Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    move-result-object p0

    return-object p0

    .line 191
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;)Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;
    .locals 1

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;-><init>()V

    .line 61
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    return-object v0
.end method

.method private withTagAndIdNotFound(Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;
    .locals 1

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;-><init>()V

    .line 77
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    .line 78
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndTeamFolderMetadata(Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;Lcom/dropbox/core/v2/team/TeamFolderMetadata;)Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;
    .locals 1

    .line 92
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;-><init>()V

    .line 93
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    .line 94
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->teamFolderMetadataValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

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

    .line 233
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    if-eqz v2, :cond_9

    .line 234
    check-cast p1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;

    .line 235
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 238
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$1;->$SwitchMap$com$dropbox$core$v2$team$TeamFolderGetInfoItem$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 242
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->teamFolderMetadataValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->teamFolderMetadataValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderMetadata;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 240
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->idNotFoundValue:Ljava/lang/String;

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

    :cond_9
    return v1
.end method

.method public getIdNotFoundValue()Ljava/lang/String;
    .locals 3

    .line 159
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    if-ne v0, v1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    return-object v0

    .line 160
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ID_NOT_FOUND, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamFolderMetadataValue()Lcom/dropbox/core/v2/team/TeamFolderMetadata;
    .locals 3

    .line 209
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->TEAM_FOLDER_METADATA:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    if-ne v0, v1, :cond_0

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->teamFolderMetadataValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    return-object v0

    .line 210
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_FOLDER_METADATA, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 217
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->teamFolderMetadataValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

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

.method public isIdNotFound()Z
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamFolderMetadata()Z
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;->TEAM_FOLDER_METADATA:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 254
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 266
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderGetInfoItem$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
