.class public final Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;
.super Ljava/lang/Object;
.source "RemoveFileMemberError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Serializer;,
        Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

.field private noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

.field private userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 65
    new-instance v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->withTag(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->OTHER:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;)Lcom/dropbox/core/v2/sharing/SharingUserError;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;)Lcom/dropbox/core/v2/sharing/SharingFileAccessError;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;)Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 237
    new-instance v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    move-result-object p0

    return-object p0

    .line 235
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static noExplicitAccess(Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 286
    new-instance v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->withTagAndNoExplicitAccess(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    move-result-object p0

    return-object p0

    .line 284
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userError(Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 191
    new-instance v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->withTagAndUserError(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    move-result-object p0

    return-object p0

    .line 189
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;
    .locals 1

    .line 86
    new-instance v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;-><init>()V

    .line 87
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;-><init>()V

    .line 120
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    .line 121
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0
.end method

.method private withTagAndNoExplicitAccess(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;
    .locals 1

    .line 139
    new-instance v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;-><init>()V

    .line 140
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    .line 141
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object v0
.end method

.method private withTagAndUserError(Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;
    .locals 1

    .line 102
    new-instance v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;-><init>()V

    .line 103
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    .line 104
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

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

    .line 339
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    if-eqz v2, :cond_d

    .line 340
    check-cast p1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;

    .line 341
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 344
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$1;->$SwitchMap$com$dropbox$core$v2$sharing$RemoveFileMemberError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->ordinal()I

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

    .line 350
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

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

    .line 348
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

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

    .line 346
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharingUserError;->equals(Ljava/lang/Object;)Z

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

.method public getAccessErrorValue()Lcom/dropbox/core/v2/sharing/SharingFileAccessError;
    .locals 3

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0

    .line 251
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNoExplicitAccessValue()Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;
    .locals 3

    .line 303
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 306
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object v0

    .line 304
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NO_EXPLICIT_ACCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserErrorValue()Lcom/dropbox/core/v2/sharing/SharingUserError;
    .locals 3

    .line 203
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 206
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    return-object v0

    .line 204
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 322
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

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

.method public isAccessError()Z
    .locals 2

    .line 217
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoExplicitAccess()Z
    .locals 2

    .line 264
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 317
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserError()Z
    .locals 2

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 364
    sget-object v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 376
    sget-object v0, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/RemoveFileMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
