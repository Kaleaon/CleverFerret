.class public final Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
.super Ljava/lang/Object;
.source "TeamFolderUpdateSyncSettingsError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;,
        Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

.field private statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

.field private syncSettingsErrorValue:Lcom/dropbox/core/v2/files/SyncSettingsError;

.field private teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 58
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->withTag(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderAccessError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;)Lcom/dropbox/core/v2/files/SyncSettingsError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->syncSettingsErrorValue:Lcom/dropbox/core/v2/files/SyncSettingsError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 2

    if-eqz p0, :cond_0

    .line 187
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->withTagAndAccessError(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object p0

    return-object p0

    .line 185
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static statusError(Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 2

    if-eqz p0, :cond_0

    .line 234
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->withTagAndStatusError(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object p0

    return-object p0

    .line 232
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static syncSettingsError(Lcom/dropbox/core/v2/files/SyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 2

    if-eqz p0, :cond_0

    .line 340
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->SYNC_SETTINGS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->withTagAndSyncSettingsError(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;Lcom/dropbox/core/v2/files/SyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object p0

    return-object p0

    .line 338
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 2

    if-eqz p0, :cond_0

    .line 281
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->withTagAndTeamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    move-result-object p0

    return-object p0

    .line 279
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 1

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    .line 79
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 1

    .line 92
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    .line 93
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    .line 94
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object v0
.end method

.method private withTagAndStatusError(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 1

    .line 107
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    .line 108
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    .line 109
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object v0
.end method

.method private withTagAndSyncSettingsError(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;Lcom/dropbox/core/v2/files/SyncSettingsError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 1

    .line 138
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    .line 139
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    .line 140
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->syncSettingsErrorValue:Lcom/dropbox/core/v2/files/SyncSettingsError;

    return-object v0
.end method

.method private withTagAndTeamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;
    .locals 1

    .line 122
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;-><init>()V

    .line 123
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    .line 124
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

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

    .line 382
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    if-eqz v2, :cond_f

    .line 383
    check-cast p1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;

    .line 384
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 387
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$1;->$SwitchMap$com$dropbox$core$v2$team$TeamFolderUpdateSyncSettingsError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_c

    const/4 v3, 0x2

    if-eq v2, v3, :cond_9

    const/4 v3, 0x3

    if-eq v2, v3, :cond_6

    const/4 v3, 0x4

    if-eq v2, v3, :cond_5

    const/4 v3, 0x5

    if-eq v2, v3, :cond_3

    return v1

    .line 397
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->syncSettingsErrorValue:Lcom/dropbox/core/v2/files/SyncSettingsError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->syncSettingsErrorValue:Lcom/dropbox/core/v2/files/SyncSettingsError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/SyncSettingsError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 393
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    return v1

    :cond_8
    :goto_1
    return v0

    .line 391
    :cond_9
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    if-eq v2, p1, :cond_b

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    goto :goto_2

    :cond_a
    return v1

    :cond_b
    :goto_2
    return v0

    .line 389
    :cond_c
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    if-eq v2, p1, :cond_e

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderAccessError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_3

    :cond_d
    return v1

    :cond_e
    :goto_3
    return v0

    :cond_f
    return v1
.end method

.method public getAccessErrorValue()Lcom/dropbox/core/v2/team/TeamFolderAccessError;
    .locals 3

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    .line 203
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object v0

    .line 201
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getStatusErrorValue()Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;
    .locals 3

    .line 247
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object v0

    .line 248
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.STATUS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSyncSettingsErrorValue()Lcom/dropbox/core/v2/files/SyncSettingsError;
    .locals 3

    .line 355
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->SYNC_SETTINGS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    .line 358
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->syncSettingsErrorValue:Lcom/dropbox/core/v2/files/SyncSettingsError;

    return-object v0

    .line 356
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SYNC_SETTINGS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamSharedDropboxErrorValue()Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;
    .locals 3

    .line 295
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    .line 298
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    return-object v0

    .line 296
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_SHARED_DROPBOX_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 7

    .line 363
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->syncSettingsErrorValue:Lcom/dropbox/core/v2/files/SyncSettingsError;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 370
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isAccessError()Z
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 309
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isStatusError()Z
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSyncSettingsError()Z
    .locals 2

    .line 320
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->SYNC_SETTINGS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamSharedDropboxError()Z
    .locals 2

    .line 261
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 409
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 421
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
