.class public final Lcom/dropbox/core/v2/sharing/UnshareFolderError;
.super Ljava/lang/Object;
.source "UnshareFolderError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/UnshareFolderError$Serializer;,
        Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;
    }
.end annotation


# static fields
.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UnshareFolderError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/UnshareFolderError;

.field public static final TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/UnshareFolderError;

.field public static final TOO_MANY_FILES:Lcom/dropbox/core/v2/sharing/UnshareFolderError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    .line 71
    new-instance v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->TOO_MANY_FILES:Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->OTHER:Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/UnshareFolderError;)Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UnshareFolderError;
    .locals 2

    if-eqz p0, :cond_0

    .line 162
    new-instance v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    move-result-object p0

    return-object p0

    .line 160
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/UnshareFolderError;
    .locals 1

    .line 96
    new-instance v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;-><init>()V

    .line 97
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UnshareFolderError;
    .locals 1

    .line 110
    new-instance v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UnshareFolderError;-><init>()V

    .line 111
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    .line 112
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

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

    .line 242
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    if-eqz v2, :cond_7

    .line 243
    check-cast p1, Lcom/dropbox/core/v2/sharing/UnshareFolderError;

    .line 244
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 247
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/UnshareFolderError$1;->$SwitchMap$com$dropbox$core$v2$sharing$UnshareFolderError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 249
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->equals(Ljava/lang/Object;)Z

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

.method public getAccessErrorValue()Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 3

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    if-ne v0, v1, :cond_0

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0

    .line 176
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 227
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

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

    .line 142
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamFolder()Z
    .locals 2

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyFiles()Z
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UnshareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 269
    sget-object v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 281
    sget-object v0, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/UnshareFolderError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/UnshareFolderError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
