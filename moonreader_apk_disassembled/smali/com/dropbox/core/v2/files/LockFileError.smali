.class public final Lcom/dropbox/core/v2/files/LockFileError;
.super Ljava/lang/Object;
.source "LockFileError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/LockFileError$Serializer;,
        Lcom/dropbox/core/v2/files/LockFileError$Tag;
    }
.end annotation


# static fields
.field public static final CANNOT_BE_LOCKED:Lcom/dropbox/core/v2/files/LockFileError;

.field public static final FILE_NOT_SHARED:Lcom/dropbox/core/v2/files/LockFileError;

.field public static final INTERNAL_ERROR:Lcom/dropbox/core/v2/files/LockFileError;

.field public static final NO_WRITE_PERMISSION:Lcom/dropbox/core/v2/files/LockFileError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/LockFileError;

.field public static final TOO_MANY_FILES:Lcom/dropbox/core/v2/files/LockFileError;

.field public static final TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/LockFileError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field private lockConflictValue:Lcom/dropbox/core/v2/files/LockConflictError;

.field private pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/LockFileError;->withTag(Lcom/dropbox/core/v2/files/LockFileError$Tag;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileError;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/LockFileError;

    .line 92
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/LockFileError;->withTag(Lcom/dropbox/core/v2/files/LockFileError$Tag;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileError;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/LockFileError;

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->NO_WRITE_PERMISSION:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/LockFileError;->withTag(Lcom/dropbox/core/v2/files/LockFileError$Tag;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileError;->NO_WRITE_PERMISSION:Lcom/dropbox/core/v2/files/LockFileError;

    .line 101
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->CANNOT_BE_LOCKED:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/LockFileError;->withTag(Lcom/dropbox/core/v2/files/LockFileError$Tag;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileError;->CANNOT_BE_LOCKED:Lcom/dropbox/core/v2/files/LockFileError;

    .line 105
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->FILE_NOT_SHARED:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/LockFileError;->withTag(Lcom/dropbox/core/v2/files/LockFileError$Tag;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileError;->FILE_NOT_SHARED:Lcom/dropbox/core/v2/files/LockFileError;

    .line 111
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/LockFileError;->withTag(Lcom/dropbox/core/v2/files/LockFileError$Tag;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileError;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/LockFileError;

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->OTHER:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/LockFileError;->withTag(Lcom/dropbox/core/v2/files/LockFileError$Tag;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileError;->OTHER:Lcom/dropbox/core/v2/files/LockFileError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/LockFileError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/LockFileError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/LockFileError;)Lcom/dropbox/core/v2/files/LockConflictError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/LockFileError;->lockConflictValue:Lcom/dropbox/core/v2/files/LockConflictError;

    return-object p0
.end method

.method public static lockConflict(Lcom/dropbox/core/v2/files/LockConflictError;)Lcom/dropbox/core/v2/files/LockFileError;
    .locals 2

    if-eqz p0, :cond_0

    .line 323
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->LOCK_CONFLICT:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/LockFileError;->withTagAndLockConflict(Lcom/dropbox/core/v2/files/LockFileError$Tag;Lcom/dropbox/core/v2/files/LockConflictError;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object p0

    return-object p0

    .line 321
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static pathLookup(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/LockFileError;
    .locals 2

    if-eqz p0, :cond_0

    .line 220
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/LockFileError;->withTagAndPathLookup(Lcom/dropbox/core/v2/files/LockFileError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/LockFileError;

    move-result-object p0

    return-object p0

    .line 218
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/LockFileError$Tag;)Lcom/dropbox/core/v2/files/LockFileError;
    .locals 1

    .line 137
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    .line 138
    iput-object p1, v0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    return-object v0
.end method

.method private withTagAndLockConflict(Lcom/dropbox/core/v2/files/LockFileError$Tag;Lcom/dropbox/core/v2/files/LockConflictError;)Lcom/dropbox/core/v2/files/LockFileError;
    .locals 1

    .line 168
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    .line 169
    iput-object p1, v0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 170
    iput-object p2, v0, Lcom/dropbox/core/v2/files/LockFileError;->lockConflictValue:Lcom/dropbox/core/v2/files/LockConflictError;

    return-object v0
.end method

.method private withTagAndPathLookup(Lcom/dropbox/core/v2/files/LockFileError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/LockFileError;
    .locals 1

    .line 152
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/LockFileError;-><init>()V

    .line 153
    iput-object p1, v0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 154
    iput-object p2, v0, Lcom/dropbox/core/v2/files/LockFileError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 384
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/LockFileError;

    if-eqz v2, :cond_7

    .line 385
    check-cast p1, Lcom/dropbox/core/v2/files/LockFileError;

    .line 386
    iget-object v2, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 389
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/LockFileError$1;->$SwitchMap$com$dropbox$core$v2$files$LockFileError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/LockFileError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 403
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/files/LockFileError;->lockConflictValue:Lcom/dropbox/core/v2/files/LockConflictError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/LockFileError;->lockConflictValue:Lcom/dropbox/core/v2/files/LockConflictError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LockConflictError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    :pswitch_2
    return v0

    .line 391
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/LockFileError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/LockFileError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    :cond_7
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getLockConflictValue()Lcom/dropbox/core/v2/files/LockConflictError;
    .locals 3

    .line 338
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->LOCK_CONFLICT:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    .line 341
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->lockConflictValue:Lcom/dropbox/core/v2/files/LockConflictError;

    return-object v0

    .line 339
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.LOCK_CONFLICT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/LockFileError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPathLookupValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    .line 237
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 235
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH_LOOKUP, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/LockFileError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 368
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/LockFileError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/LockFileError;->lockConflictValue:Lcom/dropbox/core/v2/files/LockConflictError;

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

.method public isCannotBeLocked()Z
    .locals 2

    .line 281
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->CANNOT_BE_LOCKED:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFileNotShared()Z
    .locals 2

    .line 292
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->FILE_NOT_SHARED:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInternalError()Z
    .locals 2

    .line 352
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isLockConflict()Z
    .locals 2

    .line 303
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->LOCK_CONFLICT:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoWritePermission()Z
    .locals 2

    .line 270
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->NO_WRITE_PERMISSION:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 363
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->OTHER:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPathLookup()Z
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyFiles()Z
    .locals 2

    .line 259
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyWriteOperations()Z
    .locals 2

    .line 248
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/LockFileError$Tag;
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileError;->_tag:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 419
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 431
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/LockFileError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
