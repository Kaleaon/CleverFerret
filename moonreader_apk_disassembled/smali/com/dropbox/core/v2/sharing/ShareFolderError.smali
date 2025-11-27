.class public final Lcom/dropbox/core/v2/sharing/ShareFolderError;
.super Ljava/lang/Object;
.source "ShareFolderError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/ShareFolderError$Serializer;,
        Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;
    }
.end annotation


# static fields
.field public static final DISALLOWED_SHARED_LINK_POLICY:Lcom/dropbox/core/v2/sharing/ShareFolderError;

.field public static final EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/ShareFolderError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/ShareFolderError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/ShareFolderError;

.field public static final TEAM_POLICY_DISALLOWS_MEMBER_POLICY:Lcom/dropbox/core/v2/sharing/ShareFolderError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

.field private badPathValue:Lcom/dropbox/core/v2/sharing/SharePathError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 73
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/ShareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/ShareFolderError;

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->TEAM_POLICY_DISALLOWS_MEMBER_POLICY:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/ShareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->TEAM_POLICY_DISALLOWS_MEMBER_POLICY:Lcom/dropbox/core/v2/sharing/ShareFolderError;

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->DISALLOWED_SHARED_LINK_POLICY:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/ShareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->DISALLOWED_SHARED_LINK_POLICY:Lcom/dropbox/core/v2/sharing/ShareFolderError;

    .line 91
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/ShareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->OTHER:Lcom/dropbox/core/v2/sharing/ShareFolderError;

    .line 95
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderError;->withTag(Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/ShareFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/ShareFolderError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/ShareFolderError;)Lcom/dropbox/core/v2/sharing/SharePathError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->badPathValue:Lcom/dropbox/core/v2/sharing/SharePathError;

    return-object p0
.end method

.method public static badPath(Lcom/dropbox/core/v2/sharing/SharePathError;)Lcom/dropbox/core/v2/sharing/ShareFolderError;
    .locals 2

    if-eqz p0, :cond_0

    .line 187
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->BAD_PATH:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;->withTagAndBadPath(Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;Lcom/dropbox/core/v2/sharing/SharePathError;)Lcom/dropbox/core/v2/sharing/ShareFolderError;

    move-result-object p0

    return-object p0

    .line 185
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;)Lcom/dropbox/core/v2/sharing/ShareFolderError;
    .locals 1

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;-><init>()V

    .line 113
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    return-object v0
.end method

.method private withTagAndBadPath(Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;Lcom/dropbox/core/v2/sharing/SharePathError;)Lcom/dropbox/core/v2/sharing/ShareFolderError;
    .locals 1

    .line 127
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderError;-><init>()V

    .line 128
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    .line 129
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->badPathValue:Lcom/dropbox/core/v2/sharing/SharePathError;

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

    .line 269
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    if-eqz v2, :cond_5

    .line 270
    check-cast p1, Lcom/dropbox/core/v2/sharing/ShareFolderError;

    .line 271
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 274
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/ShareFolderError$1;->$SwitchMap$com$dropbox$core$v2$sharing$ShareFolderError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 278
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->badPathValue:Lcom/dropbox/core/v2/sharing/SharePathError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/ShareFolderError;->badPathValue:Lcom/dropbox/core/v2/sharing/SharePathError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharePathError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    :pswitch_2
    return v0

    :cond_5
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getBadPathValue()Lcom/dropbox/core/v2/sharing/SharePathError;
    .locals 3

    .line 201
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->BAD_PATH:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    if-ne v0, v1, :cond_0

    .line 204
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->badPathValue:Lcom/dropbox/core/v2/sharing/SharePathError;

    return-object v0

    .line 202
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.BAD_PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->badPathValue:Lcom/dropbox/core/v2/sharing/SharePathError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 257
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isBadPath()Z
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->BAD_PATH:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDisallowedSharedLinkPolicy()Z
    .locals 2

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->DISALLOWED_SHARED_LINK_POLICY:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEmailUnverified()Z
    .locals 2

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 248
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

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
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamPolicyDisallowsMemberPolicy()Z
    .locals 2

    .line 215
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;->TEAM_POLICY_DISALLOWS_MEMBER_POLICY:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderError;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 298
    sget-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/ShareFolderError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 310
    sget-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/ShareFolderError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
