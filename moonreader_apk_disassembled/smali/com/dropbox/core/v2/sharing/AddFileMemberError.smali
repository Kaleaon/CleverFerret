.class public final Lcom/dropbox/core/v2/sharing/AddFileMemberError;
.super Ljava/lang/Object;
.source "AddFileMemberError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/AddFileMemberError$Serializer;,
        Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;
    }
.end annotation


# static fields
.field public static final INVALID_COMMENT:Lcom/dropbox/core/v2/sharing/AddFileMemberError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/AddFileMemberError;

.field public static final RATE_LIMIT:Lcom/dropbox/core/v2/sharing/AddFileMemberError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

.field private userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->RATE_LIMIT:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->RATE_LIMIT:Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->INVALID_COMMENT:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->INVALID_COMMENT:Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->OTHER:Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/AddFileMemberError;)Lcom/dropbox/core/v2/sharing/SharingUserError;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/AddFileMemberError;)Lcom/dropbox/core/v2/sharing/SharingFileAccessError;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 226
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    move-result-object p0

    return-object p0

    .line 224
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userError(Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 180
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->withTagAndUserError(Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    move-result-object p0

    return-object p0

    .line 178
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;
    .locals 1

    .line 95
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;-><init>()V

    .line 96
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;
    .locals 1

    .line 128
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;-><init>()V

    .line 129
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    .line 130
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0
.end method

.method private withTagAndUserError(Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/AddFileMemberError;
    .locals 1

    .line 111
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberError;-><init>()V

    .line 112
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    .line 113
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

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

    .line 296
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    if-eqz v2, :cond_a

    .line 297
    check-cast p1, Lcom/dropbox/core/v2/sharing/AddFileMemberError;

    .line 298
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 301
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/AddFileMemberError$1;->$SwitchMap$com$dropbox$core$v2$sharing$AddFileMemberError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 305
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharingFileAccessError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 303
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharingUserError;->equals(Ljava/lang/Object;)Z

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

    .line 239
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 242
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0

    .line 240
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserErrorValue()Lcom/dropbox/core/v2/sharing/SharingUserError;
    .locals 3

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 195
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    return-object v0

    .line 193
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 280
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

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

    .line 206
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidComment()Z
    .locals 2

    .line 264
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->INVALID_COMMENT:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 275
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRateLimit()Z
    .locals 2

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->RATE_LIMIT:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserError()Z
    .locals 2

    .line 160
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 323
    sget-object v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 335
    sget-object v0, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/AddFileMemberError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/AddFileMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
