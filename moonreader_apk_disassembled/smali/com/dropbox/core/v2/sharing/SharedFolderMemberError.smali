.class public final Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;
.super Ljava/lang/Object;
.source "SharedFolderMemberError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Serializer;,
        Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;
    }
.end annotation


# static fields
.field public static final INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

.field public static final NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

.field private noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 62
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    .line 66
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->OTHER:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;)Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object p0
.end method

.method public static noExplicitAccess(Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 181
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->withTagAndNoExplicitAccess(Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    move-result-object p0

    return-object p0

    .line 179
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;
    .locals 1

    .line 91
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;-><init>()V

    .line 92
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    return-object v0
.end method

.method private withTagAndNoExplicitAccess(Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;
    .locals 1

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;-><init>()V

    .line 107
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    .line 108
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

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

    .line 230
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    if-eqz v2, :cond_7

    .line 231
    check-cast p1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    .line 232
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 235
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$1;->$SwitchMap$com$dropbox$core$v2$sharing$SharedFolderMemberError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    const/4 v3, 0x3

    if-eq v2, v3, :cond_4

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 241
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

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

    :cond_7
    return v1
.end method

.method public getNoExplicitAccessValue()Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;
    .locals 3

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 199
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object v0

    .line 197
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NO_EXPLICIT_ACCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 215
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

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

.method public isInvalidDropboxId()Z
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoExplicitAccess()Z
    .locals 2

    .line 160
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotAMember()Z
    .locals 2

    .line 149
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 210
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 255
    sget-object v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 267
    sget-object v0, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
