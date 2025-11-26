.class public final Lcom/dropbox/core/v2/team/TeamFolderRenameError;
.super Ljava/lang/Object;
.source "TeamFolderRenameError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/TeamFolderRenameError$Serializer;,
        Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;
    }
.end annotation


# static fields
.field public static final FOLDER_NAME_ALREADY_USED:Lcom/dropbox/core/v2/team/TeamFolderRenameError;

.field public static final FOLDER_NAME_RESERVED:Lcom/dropbox/core/v2/team/TeamFolderRenameError;

.field public static final INVALID_FOLDER_NAME:Lcom/dropbox/core/v2/team/TeamFolderRenameError;

.field public static final OTHER:Lcom/dropbox/core/v2/team/TeamFolderRenameError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

.field private statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

.field private teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 65
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->withTag(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->INVALID_FOLDER_NAME:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->withTag(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->INVALID_FOLDER_NAME:Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    .line 73
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->FOLDER_NAME_ALREADY_USED:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->withTag(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->FOLDER_NAME_ALREADY_USED:Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->FOLDER_NAME_RESERVED:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->withTag(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->FOLDER_NAME_RESERVED:Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/TeamFolderRenameError;)Lcom/dropbox/core/v2/team/TeamFolderAccessError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/TeamFolderRenameError;)Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/TeamFolderRenameError;)Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;
    .locals 2

    if-eqz p0, :cond_0

    .line 189
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->withTagAndAccessError(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    move-result-object p0

    return-object p0

    .line 187
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static statusError(Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;
    .locals 2

    if-eqz p0, :cond_0

    .line 236
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->withTagAndStatusError(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    move-result-object p0

    return-object p0

    .line 234
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;
    .locals 2

    if-eqz p0, :cond_0

    .line 283
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->withTagAndTeamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    move-result-object p0

    return-object p0

    .line 281
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;
    .locals 1

    .line 96
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    .line 97
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;Lcom/dropbox/core/v2/team/TeamFolderAccessError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;
    .locals 1

    .line 110
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    .line 111
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    .line 112
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object v0
.end method

.method private withTagAndStatusError(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;
    .locals 1

    .line 125
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    .line 126
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    .line 127
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object v0
.end method

.method private withTagAndTeamSharedDropboxError(Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;)Lcom/dropbox/core/v2/team/TeamFolderRenameError;
    .locals 1

    .line 140
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderRenameError;-><init>()V

    .line 141
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    .line 142
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

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

    .line 367
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    if-eqz v2, :cond_9

    .line 368
    check-cast p1, Lcom/dropbox/core/v2/team/TeamFolderRenameError;

    .line 369
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 372
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/TeamFolderRenameError$1;->$SwitchMap$com$dropbox$core$v2$team$TeamFolderRenameError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 378
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 376
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    .line 374
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderAccessError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    :cond_9
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getAccessErrorValue()Lcom/dropbox/core/v2/team/TeamFolderAccessError;
    .locals 3

    .line 202
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    .line 205
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    return-object v0

    .line 203
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getStatusErrorValue()Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;
    .locals 3

    .line 249
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    .line 252
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    return-object v0

    .line 250
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.STATUS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamSharedDropboxErrorValue()Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;
    .locals 3

    .line 297
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    .line 300
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

    return-object v0

    .line 298
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_SHARED_DROPBOX_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 349
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->accessErrorValue:Lcom/dropbox/core/v2/team/TeamFolderAccessError;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->statusErrorValue:Lcom/dropbox/core/v2/team/TeamFolderInvalidStatusError;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->teamSharedDropboxErrorValue:Lcom/dropbox/core/v2/team/TeamFolderTeamSharedDropboxError;

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

    .line 355
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isAccessError()Z
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFolderNameAlreadyUsed()Z
    .locals 2

    .line 333
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->FOLDER_NAME_ALREADY_USED:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFolderNameReserved()Z
    .locals 2

    .line 344
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->FOLDER_NAME_RESERVED:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidFolderName()Z
    .locals 2

    .line 322
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->INVALID_FOLDER_NAME:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 311
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->OTHER:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isStatusError()Z
    .locals 2

    .line 216
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->STATUS_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamSharedDropboxError()Z
    .locals 2

    .line 263
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;->TEAM_SHARED_DROPBOX_ERROR:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;
    .locals 1

    .line 158
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderRenameError;->_tag:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 398
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 410
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderRenameError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderRenameError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
