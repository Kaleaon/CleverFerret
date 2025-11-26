.class public final Lcom/dropbox/core/v2/teamlog/ActionDetails;
.super Ljava/lang/Object;
.source "ActionDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ActionDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/ActionDetails;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

.field private removeActionValue:Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;

.field private teamInviteDetailsValue:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;

.field private teamJoinDetailsValue:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 68
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/ActionDetails;->withTag(Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;)Lcom/dropbox/core/v2/teamlog/ActionDetails;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->OTHER:Lcom/dropbox/core/v2/teamlog/ActionDetails;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/ActionDetails;)Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->removeActionValue:Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/ActionDetails;)Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamInviteDetailsValue:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/teamlog/ActionDetails;)Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamJoinDetailsValue:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;

    return-object p0
.end method

.method public static removeAction(Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;)Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 194
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->REMOVE_ACTION:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;->withTagAndRemoveAction(Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;)Lcom/dropbox/core/v2/teamlog/ActionDetails;

    move-result-object p0

    return-object p0

    .line 192
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamInviteDetails(Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;)Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 244
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->TEAM_INVITE_DETAILS:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;->withTagAndTeamInviteDetails(Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;)Lcom/dropbox/core/v2/teamlog/ActionDetails;

    move-result-object p0

    return-object p0

    .line 242
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamJoinDetails(Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;)Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .locals 2

    if-eqz p0, :cond_0

    .line 294
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->TEAM_JOIN_DETAILS:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;->withTagAndTeamJoinDetails(Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;)Lcom/dropbox/core/v2/teamlog/ActionDetails;

    move-result-object p0

    return-object p0

    .line 292
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;)Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .locals 1

    .line 89
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;-><init>()V

    .line 90
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    return-object v0
.end method

.method private withTagAndRemoveAction(Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;)Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .locals 1

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;-><init>()V

    .line 107
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    .line 108
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->removeActionValue:Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;

    return-object v0
.end method

.method private withTagAndTeamInviteDetails(Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;)Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .locals 1

    .line 124
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;-><init>()V

    .line 125
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    .line 126
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamInviteDetailsValue:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;

    return-object v0
.end method

.method private withTagAndTeamJoinDetails(Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;)Lcom/dropbox/core/v2/teamlog/ActionDetails;
    .locals 1

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActionDetails;-><init>()V

    .line 143
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    .line 144
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamJoinDetailsValue:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;

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

    .line 345
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    if-eqz v2, :cond_d

    .line 346
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ActionDetails;

    .line 347
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 350
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/ActionDetails$1;->$SwitchMap$com$dropbox$core$v2$teamlog$ActionDetails$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->ordinal()I

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

    .line 356
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamJoinDetailsValue:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamJoinDetailsValue:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 354
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamInviteDetailsValue:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamInviteDetailsValue:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    .line 352
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->removeActionValue:Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ActionDetails;->removeActionValue:Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;->equals(Ljava/lang/Object;)Z

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

.method public getRemoveActionValue()Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;
    .locals 3

    .line 209
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->REMOVE_ACTION:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->removeActionValue:Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;

    return-object v0

    .line 210
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.REMOVE_ACTION, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamInviteDetailsValue()Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;
    .locals 3

    .line 259
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->TEAM_INVITE_DETAILS:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 262
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamInviteDetailsValue:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;

    return-object v0

    .line 260
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_INVITE_DETAILS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamJoinDetailsValue()Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;
    .locals 3

    .line 309
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->TEAM_JOIN_DETAILS:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    if-ne v0, v1, :cond_0

    .line 312
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamJoinDetailsValue:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;

    return-object v0

    .line 310
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_JOIN_DETAILS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 328
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->removeActionValue:Lcom/dropbox/core/v2/teamlog/MemberRemoveActionType;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamInviteDetailsValue:Lcom/dropbox/core/v2/teamlog/TeamInviteDetails;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->teamJoinDetailsValue:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;

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

.method public isOther()Z
    .locals 2

    .line 323
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRemoveAction()Z
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->REMOVE_ACTION:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamInviteDetails()Z
    .locals 2

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->TEAM_INVITE_DETAILS:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamJoinDetails()Z
    .locals 2

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;->TEAM_JOIN_DETAILS:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActionDetails;->_tag:Lcom/dropbox/core/v2/teamlog/ActionDetails$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 370
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ActionDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ActionDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ActionDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 382
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ActionDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ActionDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ActionDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
