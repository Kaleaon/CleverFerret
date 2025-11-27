.class public final Lcom/dropbox/core/v2/team/GroupsGetInfoItem;
.super Ljava/lang/Object;
.source "GroupsGetInfoItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Serializer;,
        Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

.field private groupInfoValue:Lcom/dropbox/core/v2/team/GroupFullInfo;

.field private idNotFoundValue:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/GroupsGetInfoItem;)Ljava/lang/String;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/GroupsGetInfoItem;)Lcom/dropbox/core/v2/team/GroupFullInfo;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->groupInfoValue:Lcom/dropbox/core/v2/team/GroupFullInfo;

    return-object p0
.end method

.method public static groupInfo(Lcom/dropbox/core/v2/team/GroupFullInfo;)Lcom/dropbox/core/v2/team/GroupsGetInfoItem;
    .locals 2

    if-eqz p0, :cond_0

    .line 196
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->GROUP_INFO:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->withTagAndGroupInfo(Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;Lcom/dropbox/core/v2/team/GroupFullInfo;)Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    move-result-object p0

    return-object p0

    .line 194
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static idNotFound(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupsGetInfoItem;
    .locals 2

    if-eqz p0, :cond_0

    .line 145
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->withTagAndIdNotFound(Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    move-result-object p0

    return-object p0

    .line 143
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;)Lcom/dropbox/core/v2/team/GroupsGetInfoItem;
    .locals 1

    .line 61
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;-><init>()V

    .line 62
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    return-object v0
.end method

.method private withTagAndGroupInfo(Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;Lcom/dropbox/core/v2/team/GroupFullInfo;)Lcom/dropbox/core/v2/team/GroupsGetInfoItem;
    .locals 1

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;-><init>()V

    .line 94
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    .line 95
    iput-object p2, v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->groupInfoValue:Lcom/dropbox/core/v2/team/GroupFullInfo;

    return-object v0
.end method

.method private withTagAndIdNotFound(Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupsGetInfoItem;
    .locals 1

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;-><init>()V

    .line 79
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    .line 80
    iput-object p2, v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->idNotFoundValue:Ljava/lang/String;

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

    .line 234
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    if-eqz v2, :cond_9

    .line 235
    check-cast p1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;

    .line 236
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 239
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$1;->$SwitchMap$com$dropbox$core$v2$team$GroupsGetInfoItem$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 243
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->groupInfoValue:Lcom/dropbox/core/v2/team/GroupFullInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->groupInfoValue:Lcom/dropbox/core/v2/team/GroupFullInfo;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/GroupFullInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 241
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->idNotFoundValue:Ljava/lang/String;

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

.method public getGroupInfoValue()Lcom/dropbox/core/v2/team/GroupFullInfo;
    .locals 3

    .line 210
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->GROUP_INFO:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    if-ne v0, v1, :cond_0

    .line 213
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->groupInfoValue:Lcom/dropbox/core/v2/team/GroupFullInfo;

    return-object v0

    .line 211
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.GROUP_INFO, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getIdNotFoundValue()Ljava/lang/String;
    .locals 3

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    if-ne v0, v1, :cond_0

    .line 165
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    return-object v0

    .line 163
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ID_NOT_FOUND, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 218
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->idNotFoundValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->groupInfoValue:Lcom/dropbox/core/v2/team/GroupFullInfo;

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

.method public isGroupInfo()Z
    .locals 2

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->GROUP_INFO:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isIdNotFound()Z
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem;->_tag:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 255
    sget-object v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 267
    sget-object v0, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/GroupsGetInfoItem$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
