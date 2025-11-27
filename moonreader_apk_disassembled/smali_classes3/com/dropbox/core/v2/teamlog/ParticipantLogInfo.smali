.class public final Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;
.super Ljava/lang/Object;
.source "ParticipantLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

.field private groupValue:Lcom/dropbox/core/v2/teamlog/GroupLogInfo;

.field private userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;)Lcom/dropbox/core/v2/teamlog/GroupLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->groupValue:Lcom/dropbox/core/v2/teamlog/GroupLogInfo;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;)Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object p0
.end method

.method public static group(Lcom/dropbox/core/v2/teamlog/GroupLogInfo;)Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 167
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->GROUP:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->withTagAndGroup(Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/GroupLogInfo;)Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    move-result-object p0

    return-object p0

    .line 165
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static user(Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 215
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->USER:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->withTagAndUser(Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    move-result-object p0

    return-object p0

    .line 213
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    return-object v0
.end method

.method private withTagAndGroup(Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/GroupLogInfo;)Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;
    .locals 1

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;-><init>()V

    .line 99
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    .line 100
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->groupValue:Lcom/dropbox/core/v2/teamlog/GroupLogInfo;

    return-object v0
.end method

.method private withTagAndUser(Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;
    .locals 1

    .line 115
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;-><init>()V

    .line 116
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    .line 117
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

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

    .line 264
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    if-eqz v2, :cond_a

    .line 265
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    .line 266
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 269
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$ParticipantLogInfo$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->ordinal()I

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

    .line 273
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/UserLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 271
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->groupValue:Lcom/dropbox/core/v2/teamlog/GroupLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->groupValue:Lcom/dropbox/core/v2/teamlog/GroupLogInfo;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/GroupLogInfo;->equals(Ljava/lang/Object;)Z

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

.method public getGroupValue()Lcom/dropbox/core/v2/teamlog/GroupLogInfo;
    .locals 3

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->GROUP:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 184
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->groupValue:Lcom/dropbox/core/v2/teamlog/GroupLogInfo;

    return-object v0

    .line 182
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.GROUP, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserValue()Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .locals 3

    .line 229
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->USER:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 232
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object v0

    .line 230
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 248
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->groupValue:Lcom/dropbox/core/v2/teamlog/GroupLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

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

.method public isGroup()Z
    .locals 2

    .line 147
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->GROUP:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 243
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUser()Z
    .locals 2

    .line 195
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;->USER:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 287
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 299
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
