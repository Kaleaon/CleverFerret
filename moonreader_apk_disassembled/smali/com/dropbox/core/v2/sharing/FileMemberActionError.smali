.class public final Lcom/dropbox/core/v2/sharing/FileMemberActionError;
.super Ljava/lang/Object;
.source "FileMemberActionError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/FileMemberActionError$Serializer;,
        Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;
    }
.end annotation


# static fields
.field public static final INVALID_MEMBER:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/FileMemberActionError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

.field private noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 68
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->INVALID_MEMBER:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->withTag(Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->INVALID_MEMBER:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    .line 72
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->withTag(Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->withTag(Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->OTHER:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/FileMemberActionError;)Lcom/dropbox/core/v2/sharing/SharingFileAccessError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/FileMemberActionError;)Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 2

    if-eqz p0, :cond_0

    .line 205
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    move-result-object p0

    return-object p0

    .line 203
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static noExplicitAccess(Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 2

    if-eqz p0, :cond_0

    .line 256
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->withTagAndNoExplicitAccess(Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    move-result-object p0

    return-object p0

    .line 254
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 1

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;-><init>()V

    .line 99
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 1

    .line 113
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;-><init>()V

    .line 114
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    .line 115
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0
.end method

.method private withTagAndNoExplicitAccess(Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 1

    .line 131
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;-><init>()V

    .line 132
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    .line 133
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

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

    .line 308
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    if-eqz v2, :cond_a

    .line 309
    check-cast p1, Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    .line 310
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 313
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/FileMemberActionError$1;->$SwitchMap$com$dropbox$core$v2$sharing$FileMemberActionError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_9

    const/4 v3, 0x2

    if-eq v2, v3, :cond_9

    const/4 v3, 0x3

    if-eq v2, v3, :cond_7

    const/4 v3, 0x4

    if-eq v2, v3, :cond_4

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 321
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;->equals(Ljava/lang/Object;)Z

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
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharingFileAccessError;->equals(Ljava/lang/Object;)Z

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

.method public getAccessErrorValue()Lcom/dropbox/core/v2/sharing/SharingFileAccessError;
    .locals 3

    .line 220
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    if-ne v0, v1, :cond_0

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0

    .line 221
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNoExplicitAccessValue()Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;
    .locals 3

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    if-ne v0, v1, :cond_0

    .line 276
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object v0

    .line 274
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NO_EXPLICIT_ACCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 292
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

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

.method public isAccessError()Z
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidMember()Z
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->INVALID_MEMBER:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoExplicitAccess()Z
    .locals 2

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

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
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 335
    sget-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 347
    sget-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/FileMemberActionError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
