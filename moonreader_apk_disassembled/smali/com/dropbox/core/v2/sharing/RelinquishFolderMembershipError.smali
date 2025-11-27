.class public final Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;
.super Ljava/lang/Object;
.source "RelinquishFolderMembershipError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Serializer;,
        Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;
    }
.end annotation


# static fields
.field public static final FOLDER_OWNER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

.field public static final GROUP_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

.field public static final MOUNTED:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

.field public static final NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

.field public static final TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->FOLDER_OWNER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->FOLDER_OWNER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    .line 87
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->MOUNTED:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->MOUNTED:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    .line 92
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->GROUP_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->GROUP_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    .line 96
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    .line 105
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    .line 113
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->OTHER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;)Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;
    .locals 2

    if-eqz p0, :cond_0

    .line 196
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    move-result-object p0

    return-object p0

    .line 194
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;
    .locals 1

    .line 130
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    .line 131
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;
    .locals 1

    .line 144
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;-><init>()V

    .line 145
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    .line 146
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

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

    .line 309
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    if-eqz v2, :cond_5

    .line 310
    check-cast p1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;

    .line 311
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 314
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$1;->$SwitchMap$com$dropbox$core$v2$sharing$RelinquishFolderMembershipError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 316
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

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

    .line 209
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0

    .line 210
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 294
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

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

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFolderOwner()Z
    .locals 2

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->FOLDER_OWNER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isGroupAccess()Z
    .locals 2

    .line 245
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->GROUP_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isMounted()Z
    .locals 2

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->MOUNTED:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoExplicitAccess()Z
    .locals 2

    .line 278
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 267
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 289
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamFolder()Z
    .locals 2

    .line 256
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 342
    sget-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 354
    sget-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFolderMembershipError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
