.class public final Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;
.super Ljava/lang/Object;
.source "RelinquishFileMembershipError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Serializer;,
        Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;
    }
.end annotation


# static fields
.field public static final GROUP_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 61
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->GROUP_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->GROUP_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    .line 65
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    .line 73
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->withTag(Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->OTHER:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;)Lcom/dropbox/core/v2/sharing/SharingFileAccessError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;
    .locals 2

    if-eqz p0, :cond_0

    .line 156
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    move-result-object p0

    return-object p0

    .line 154
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;)Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;
    .locals 1

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;-><init>()V

    .line 91
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;
    .locals 1

    .line 104
    new-instance v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;-><init>()V

    .line 105
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    .line 106
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

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

    .line 225
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    if-eqz v2, :cond_7

    .line 226
    check-cast p1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;

    .line 227
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 230
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$1;->$SwitchMap$com$dropbox$core$v2$sharing$RelinquishFileMembershipError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 232
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

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

    :cond_7
    return v1
.end method

.method public getAccessErrorValue()Lcom/dropbox/core/v2/sharing/SharingFileAccessError;
    .locals 3

    .line 169
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    if-ne v0, v1, :cond_0

    .line 172
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0

    .line 170
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 210
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

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

    .line 136
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isGroupAccess()Z
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->GROUP_ACCESS:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 194
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 205
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError;->_tag:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 250
    sget-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 262
    sget-object v0, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/RelinquishFileMembershipError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
