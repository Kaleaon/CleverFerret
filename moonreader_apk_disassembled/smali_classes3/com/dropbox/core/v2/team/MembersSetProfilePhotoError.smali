.class public final Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;
.super Ljava/lang/Object;
.source "MembersSetProfilePhotoError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;,
        Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

.field public static final SET_PROFILE_DISALLOWED:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

.field public static final USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

.field public static final USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

.field private photoErrorValue:Lcom/dropbox/core/v2/account/SetProfilePhotoError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 66
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->withTag(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    .line 70
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->withTag(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->SET_PROFILE_DISALLOWED:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->withTag(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->SET_PROFILE_DISALLOWED:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->OTHER:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->withTag(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->OTHER:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;)Lcom/dropbox/core/v2/account/SetProfilePhotoError;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->photoErrorValue:Lcom/dropbox/core/v2/account/SetProfilePhotoError;

    return-object p0
.end method

.method public static photoError(Lcom/dropbox/core/v2/account/SetProfilePhotoError;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;
    .locals 2

    if-eqz p0, :cond_0

    .line 198
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->PHOTO_ERROR:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->withTagAndPhotoError(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;Lcom/dropbox/core/v2/account/SetProfilePhotoError;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    move-result-object p0

    return-object p0

    .line 196
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;
    .locals 1

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;-><init>()V

    .line 100
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    return-object v0
.end method

.method private withTagAndPhotoError(Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;Lcom/dropbox/core/v2/account/SetProfilePhotoError;)Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;
    .locals 1

    .line 113
    new-instance v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;-><init>()V

    .line 114
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    .line 115
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->photoErrorValue:Lcom/dropbox/core/v2/account/SetProfilePhotoError;

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

    .line 245
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    if-eqz v2, :cond_7

    .line 246
    check-cast p1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;

    .line 247
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 250
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$1;->$SwitchMap$com$dropbox$core$v2$team$MembersSetProfilePhotoError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    const/4 v3, 0x3

    if-eq v2, v3, :cond_6

    const/4 v3, 0x4

    if-eq v2, v3, :cond_4

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 258
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->photoErrorValue:Lcom/dropbox/core/v2/account/SetProfilePhotoError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->photoErrorValue:Lcom/dropbox/core/v2/account/SetProfilePhotoError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/account/SetProfilePhotoError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getPhotoErrorValue()Lcom/dropbox/core/v2/account/SetProfilePhotoError;
    .locals 3

    .line 210
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->PHOTO_ERROR:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    if-ne v0, v1, :cond_0

    .line 213
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->photoErrorValue:Lcom/dropbox/core/v2/account/SetProfilePhotoError;

    return-object v0

    .line 211
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PHOTO_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 229
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->photoErrorValue:Lcom/dropbox/core/v2/account/SetProfilePhotoError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 233
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isOther()Z
    .locals 2

    .line 224
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->OTHER:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPhotoError()Z
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->PHOTO_ERROR:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSetProfileDisallowed()Z
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->SET_PROFILE_DISALLOWED:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserNotFound()Z
    .locals 2

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserNotInTeam()Z
    .locals 2

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;->USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError;->_tag:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 272
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 284
    sget-object v0, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersSetProfilePhotoError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
