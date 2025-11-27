.class public final Lcom/dropbox/core/v2/sharing/GetFileMetadataError;
.super Ljava/lang/Object;
.source "GetFileMetadataError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Serializer;,
        Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/sharing/GetFileMetadataError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

.field private userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 59
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->withTag(Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;)Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->OTHER:Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/GetFileMetadataError;)Lcom/dropbox/core/v2/sharing/SharingUserError;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/GetFileMetadataError;)Lcom/dropbox/core/v2/sharing/SharingFileAccessError;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/GetFileMetadataError;
    .locals 2

    if-eqz p0, :cond_0

    .line 210
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    move-result-object p0

    return-object p0

    .line 208
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userError(Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/GetFileMetadataError;
    .locals 2

    if-eqz p0, :cond_0

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->withTagAndUserError(Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    move-result-object p0

    return-object p0

    .line 162
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;)Lcom/dropbox/core/v2/sharing/GetFileMetadataError;
    .locals 1

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;-><init>()V

    .line 80
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;Lcom/dropbox/core/v2/sharing/SharingFileAccessError;)Lcom/dropbox/core/v2/sharing/GetFileMetadataError;
    .locals 1

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;-><init>()V

    .line 113
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    .line 114
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0
.end method

.method private withTagAndUserError(Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;Lcom/dropbox/core/v2/sharing/SharingUserError;)Lcom/dropbox/core/v2/sharing/GetFileMetadataError;
    .locals 1

    .line 95
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;-><init>()V

    .line 96
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    .line 97
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

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

    .line 258
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    if-eqz v2, :cond_a

    .line 259
    check-cast p1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;

    .line 260
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 263
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$1;->$SwitchMap$com$dropbox$core$v2$sharing$GetFileMetadataError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 267
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

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

    .line 265
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

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

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    if-ne v0, v1, :cond_0

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

    return-object v0

    .line 224
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserErrorValue()Lcom/dropbox/core/v2/sharing/SharingUserError;
    .locals 3

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    if-ne v0, v1, :cond_0

    .line 179
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    return-object v0

    .line 177
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 242
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->userErrorValue:Lcom/dropbox/core/v2/sharing/SharingUserError;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharingFileAccessError;

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

    .line 190
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 237
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserError()Z
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;->USER_ERROR:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError;->_tag:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 281
    sget-object v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 293
    sget-object v0, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/GetFileMetadataError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
