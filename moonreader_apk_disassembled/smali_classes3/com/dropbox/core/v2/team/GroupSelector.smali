.class public final Lcom/dropbox/core/v2/team/GroupSelector;
.super Ljava/lang/Object;
.source "GroupSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/GroupSelector$Serializer;,
        Lcom/dropbox/core/v2/team/GroupSelector$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

.field private groupExternalIdValue:Ljava/lang/String;

.field private groupIdValue:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/GroupSelector;)Ljava/lang/String;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->groupIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/GroupSelector;)Ljava/lang/String;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->groupExternalIdValue:Ljava/lang/String;

    return-object p0
.end method

.method public static groupExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupSelector;
    .locals 2

    if-eqz p0, :cond_0

    .line 194
    new-instance v0, Lcom/dropbox/core/v2/team/GroupSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupSelector;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->GROUP_EXTERNAL_ID:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/GroupSelector;->withTagAndGroupExternalId(Lcom/dropbox/core/v2/team/GroupSelector$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupSelector;

    move-result-object p0

    return-object p0

    .line 192
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static groupId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupSelector;
    .locals 2

    if-eqz p0, :cond_0

    .line 146
    new-instance v0, Lcom/dropbox/core/v2/team/GroupSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupSelector;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->GROUP_ID:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/GroupSelector;->withTagAndGroupId(Lcom/dropbox/core/v2/team/GroupSelector$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupSelector;

    move-result-object p0

    return-object p0

    .line 144
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/GroupSelector$Tag;)Lcom/dropbox/core/v2/team/GroupSelector;
    .locals 1

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/team/GroupSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupSelector;-><init>()V

    .line 64
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    return-object v0
.end method

.method private withTagAndGroupExternalId(Lcom/dropbox/core/v2/team/GroupSelector$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupSelector;
    .locals 1

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/team/GroupSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupSelector;-><init>()V

    .line 98
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    .line 99
    iput-object p2, v0, Lcom/dropbox/core/v2/team/GroupSelector;->groupExternalIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndGroupId(Lcom/dropbox/core/v2/team/GroupSelector$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupSelector;
    .locals 1

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/team/GroupSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/GroupSelector;-><init>()V

    .line 80
    iput-object p1, v0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    .line 81
    iput-object p2, v0, Lcom/dropbox/core/v2/team/GroupSelector;->groupIdValue:Ljava/lang/String;

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
    instance-of v2, p1, Lcom/dropbox/core/v2/team/GroupSelector;

    if-eqz v2, :cond_9

    .line 234
    check-cast p1, Lcom/dropbox/core/v2/team/GroupSelector;

    .line 235
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 238
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/GroupSelector$1;->$SwitchMap$com$dropbox$core$v2$team$GroupSelector$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 242
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupSelector;->groupExternalIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/GroupSelector;->groupExternalIdValue:Ljava/lang/String;

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

    .line 240
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupSelector;->groupIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/GroupSelector;->groupIdValue:Ljava/lang/String;

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

.method public getGroupExternalIdValue()Ljava/lang/String;
    .locals 3

    .line 209
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->GROUP_EXTERNAL_ID:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    if-ne v0, v1, :cond_0

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->groupExternalIdValue:Ljava/lang/String;

    return-object v0

    .line 210
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.GROUP_EXTERNAL_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getGroupIdValue()Ljava/lang/String;
    .locals 3

    .line 160
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->GROUP_ID:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    if-ne v0, v1, :cond_0

    .line 163
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->groupIdValue:Ljava/lang/String;

    return-object v0

    .line 161
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.GROUP_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->name()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/GroupSelector;->groupIdValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/GroupSelector;->groupExternalIdValue:Ljava/lang/String;

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

.method public isGroupExternalId()Z
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->GROUP_EXTERNAL_ID:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isGroupId()Z
    .locals 2

    .line 126
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/GroupSelector$Tag;->GROUP_ID:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/GroupSelector$Tag;
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/team/GroupSelector;->_tag:Lcom/dropbox/core/v2/team/GroupSelector$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 254
    sget-object v0, Lcom/dropbox/core/v2/team/GroupSelector$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/GroupSelector$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/GroupSelector$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 266
    sget-object v0, Lcom/dropbox/core/v2/team/GroupSelector$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/GroupSelector$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/GroupSelector$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
