.class public final Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;
.super Ljava/lang/Object;
.source "TeamFolderPermanentlyDeleteError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Serializer;,
        Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

.field private statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

.field private teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 53
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->withTag(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;)Lcom/dropbox/core/v2/team/TeamFolderAccessError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;)Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;)Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;
    .locals 2

    if-eqz p0, :cond_0

    .line 165
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->withTagAndAccessError(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    move-result-object p0

    return-object p0

    .line 163
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static statusError(Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;
    .locals 2

    if-eqz p0, :cond_0

    .line 212
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->withTagAndStatusError(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    move-result-object p0

    return-object p0

    .line 210
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;
    .locals 2

    if-eqz p0, :cond_0

    .line 259
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->withTagAndTeamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    move-result-object p0

    return-object p0

    .line 257
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;
    .locals 1

    .line 72
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;-><init>()V

    .line 73
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;
    .locals 1

    .line 86
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;-><init>()V

    .line 87
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    .line 88
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object v0
.end method

.method private withTagAndStatusError(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;
    .locals 1

    .line 101
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;-><init>()V

    .line 102
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    .line 103
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object v0
.end method

.method private withTagAndTeamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;
    .locals 1

    .line 116
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;-><init>()V

    .line 117
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    .line 118
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

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

    .line 310
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    if-eqz v2, :cond_d

    .line 311
    check-cast p1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;

    .line 312
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 315
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$1;->$SwitchMap$com$dropbox$core$v2$team$TeamFolderPermanentlyDeleteError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->ordinal()I

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

    .line 321
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 319
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    .line 317
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderAccessError;->equals(Ljava/lang/Object;)Z

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

.method public getAccessErrorValue()Lcom/dropbox/core/v2/team/TeamFolderAccessError;
    .locals 3

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    if-ne v0, v1, :cond_0

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object v0

    .line 179
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getStatusErrorValue()Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;
    .locals 3

    .line 225
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    if-ne v0, v1, :cond_0

    .line 228
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object v0

    .line 226
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.STATUS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamSharedDropboxErrorValue()Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;
    .locals 3

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    if-ne v0, v1, :cond_0

    .line 276
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    return-object v0

    .line 274
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_SHARED_DROPBOX_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 292
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

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

    .line 298
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isAccessError()Z
    .locals 2

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 287
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isStatusError()Z
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamSharedDropboxError()Z
    .locals 2

    .line 239
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 335
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 347
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderPermanentlyDeleteError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
