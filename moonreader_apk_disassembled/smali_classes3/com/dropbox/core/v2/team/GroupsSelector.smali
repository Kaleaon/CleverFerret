.class public final Lcom/dropbox/core/v2/team/GroupsSelector;
.super Ljava/lang/Object;
.source "GroupsSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/GroupsSelector$Serializer;,
        Lcom/dropbox/core/v2/team/GroupsSelector$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

.field private groupExternalIdsValue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private groupIdsValue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/GroupsSelector;)Ljava/util/List;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupIdsValue:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/GroupsSelector;)Ljava/util/List;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupExternalIdsValue:Ljava/util/List;

    return-object p0
.end method

.method public static groupExternalIds(Ljava/util/List;)Lcom/dropbox/core/v2/team/GroupsSelector;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/GroupsSelector;"
        }
    .end annotation

    if-eqz p0, :cond_2

    .line 203
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 205
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 208
    :cond_1
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsSelector;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->GROUP_EXTERNAL_IDS:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/GroupsSelector;->withTagAndGroupExternalIds(Lcom/dropbox/core/v2/team/GroupsSelector$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/team/GroupsSelector;

    move-result-object p0

    return-object p0

    .line 201
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static groupIds(Ljava/util/List;)Lcom/dropbox/core/v2/team/GroupsSelector;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/GroupsSelector;"
        }
    .end annotation

    if-eqz p0, :cond_2

    .line 149
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 151
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 154
    :cond_1
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsSelector;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->GROUP_IDS:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/GroupsSelector;->withTagAndGroupIds(Lcom/dropbox/core/v2/team/GroupsSelector$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/team/GroupsSelector;

    move-result-object p0

    return-object p0

    .line 147
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/GroupsSelector$Tag;)Lcom/dropbox/core/v2/team/GroupsSelector;
    .locals 1

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsSelector;-><init>()V

    .line 65
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    return-object v0
.end method

.method private withTagAndGroupExternalIds(Lcom/dropbox/core/v2/team/GroupsSelector$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/team/GroupsSelector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/team/GroupsSelector$Tag;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/GroupsSelector;"
        }
    .end annotation

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsSelector;-><init>()V

    .line 100
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    .line 101
    iput-object p2, v0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupExternalIdsValue:Ljava/util/List;

    return-object v0
.end method

.method private withTagAndGroupIds(Lcom/dropbox/core/v2/team/GroupsSelector$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/team/GroupsSelector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/team/GroupsSelector$Tag;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/GroupsSelector;"
        }
    .end annotation

    .line 81
    new-instance v0, Lcom/dropbox/core/v2/team/GroupsSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupsSelector;-><init>()V

    .line 82
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    .line 83
    iput-object p2, v0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupIdsValue:Ljava/util/List;

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

    .line 247
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/GroupsSelector;

    if-eqz v2, :cond_9

    .line 248
    check-cast p1, Lcom/dropbox/core/v2/team/GroupsSelector;

    .line 249
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 252
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/GroupsSelector$1;->$SwitchMap$com$dropbox$core$v2$team$GroupsSelector$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 256
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupExternalIdsValue:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/GroupsSelector;->groupExternalIdsValue:Ljava/util/List;

    if-eq v2, p1, :cond_5

    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 254
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupIdsValue:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/GroupsSelector;->groupIdsValue:Ljava/util/List;

    if-eq v2, p1, :cond_8

    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

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

.method public getGroupExternalIdsValue()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->GROUP_EXTERNAL_IDS:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    if-ne v0, v1, :cond_0

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupExternalIdsValue:Ljava/util/List;

    return-object v0

    .line 224
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.GROUP_EXTERNAL_IDS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getGroupIdsValue()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->GROUP_IDS:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    if-ne v0, v1, :cond_0

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupIdsValue:Ljava/util/List;

    return-object v0

    .line 169
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.GROUP_IDS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 231
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupIdsValue:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->groupExternalIdsValue:Ljava/util/List;

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

.method public isGroupExternalIds()Z
    .locals 2

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->GROUP_EXTERNAL_IDS:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isGroupIds()Z
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupsSelector$Tag;->GROUP_IDS:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/GroupsSelector$Tag;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupsSelector;->_tag:Lcom/dropbox/core/v2/team/GroupsSelector$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 268
    sget-object v0, Lcom/dropbox/core/v2/team/GroupsSelector$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/GroupsSelector$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/GroupsSelector$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 280
    sget-object v0, Lcom/dropbox/core/v2/team/GroupsSelector$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/GroupsSelector$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/GroupsSelector$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
