.class public final Lcom/dropbox/core/v2/sharing/TransferFolderError;
.super Ljava/lang/Object;
.source "TransferFolderError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/TransferFolderError$Serializer;,
        Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;
    }
.end annotation


# static fields
.field public static final INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/TransferFolderError;

.field public static final NEW_OWNER_EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/TransferFolderError;

.field public static final NEW_OWNER_NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/TransferFolderError;

.field public static final NEW_OWNER_UNMOUNTED:Lcom/dropbox/core/v2/sharing/TransferFolderError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/TransferFolderError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/TransferFolderError;

.field public static final TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/TransferFolderError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError;->withTag(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;)Lcom/dropbox/core/v2/sharing/TransferFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/TransferFolderError;

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->NEW_OWNER_NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError;->withTag(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;)Lcom/dropbox/core/v2/sharing/TransferFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->NEW_OWNER_NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/TransferFolderError;

    .line 87
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->NEW_OWNER_UNMOUNTED:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError;->withTag(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;)Lcom/dropbox/core/v2/sharing/TransferFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->NEW_OWNER_UNMOUNTED:Lcom/dropbox/core/v2/sharing/TransferFolderError;

    .line 94
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->NEW_OWNER_EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError;->withTag(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;)Lcom/dropbox/core/v2/sharing/TransferFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->NEW_OWNER_EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/TransferFolderError;

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError;->withTag(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;)Lcom/dropbox/core/v2/sharing/TransferFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/TransferFolderError;

    .line 102
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError;->withTag(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;)Lcom/dropbox/core/v2/sharing/TransferFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/TransferFolderError;

    .line 110
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError;->withTag(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;)Lcom/dropbox/core/v2/sharing/TransferFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->OTHER:Lcom/dropbox/core/v2/sharing/TransferFolderError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/TransferFolderError;)Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/TransferFolderError;
    .locals 2

    if-eqz p0, :cond_0

    .line 193
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/TransferFolderError;

    move-result-object p0

    return-object p0

    .line 191
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;)Lcom/dropbox/core/v2/sharing/TransferFolderError;
    .locals 1

    .line 127
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    .line 128
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/TransferFolderError;
    .locals 1

    .line 141
    new-instance v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/TransferFolderError;-><init>()V

    .line 142
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    .line 143
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

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

    .line 306
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    if-eqz v2, :cond_5

    .line 307
    check-cast p1, Lcom/dropbox/core/v2/sharing/TransferFolderError;

    .line 308
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 311
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/TransferFolderError$1;->$SwitchMap$com$dropbox$core$v2$sharing$TransferFolderError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 313
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/TransferFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getAccessErrorValue()Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 3

    .line 206
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    .line 209
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0

    .line 207
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 291
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isAccessError()Z
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidDropboxId()Z
    .locals 2

    .line 220
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNewOwnerEmailUnverified()Z
    .locals 2

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->NEW_OWNER_EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNewOwnerNotAMember()Z
    .locals 2

    .line 231
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->NEW_OWNER_NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNewOwnerUnmounted()Z
    .locals 2

    .line 242
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->NEW_OWNER_UNMOUNTED:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 275
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 286
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamFolder()Z
    .locals 2

    .line 264
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/TransferFolderError;->_tag:Lcom/dropbox/core/v2/sharing/TransferFolderError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 339
    sget-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/TransferFolderError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 351
    sget-object v0, Lcom/dropbox/core/v2/sharing/TransferFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/TransferFolderError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/TransferFolderError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
