.class public final Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;
.super Ljava/lang/Object;
.source "UpdateFolderPolicyError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Serializer;,
        Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;
    }
.end annotation


# static fields
.field public static final DISALLOWED_SHARED_LINK_POLICY:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

.field public static final NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

.field public static final TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

.field public static final TEAM_POLICY_DISALLOWS_MEMBER_POLICY:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->TEAM_POLICY_DISALLOWS_MEMBER_POLICY:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->TEAM_POLICY_DISALLOWS_MEMBER_POLICY:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    .line 85
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->DISALLOWED_SHARED_LINK_POLICY:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->DISALLOWED_SHARED_LINK_POLICY:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    .line 89
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    .line 101
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->OTHER:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;)Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;
    .locals 2

    if-eqz p0, :cond_0

    .line 184
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    move-result-object p0

    return-object p0

    .line 182
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;
    .locals 1

    .line 118
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    .line 119
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;
    .locals 1

    .line 132
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;-><init>()V

    .line 133
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    .line 134
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

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

    .line 286
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    if-eqz v2, :cond_5

    .line 287
    check-cast p1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;

    .line 288
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 291
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$1;->$SwitchMap$com$dropbox$core$v2$sharing$UpdateFolderPolicyError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 293
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getAccessErrorValue()Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 3

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-ne v0, v1, :cond_0

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0

    .line 198
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 271
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

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

    .line 164
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDisallowedSharedLinkPolicy()Z
    .locals 2

    .line 233
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->DISALLOWED_SHARED_LINK_POLICY:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotOnTeam()Z
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 266
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamFolder()Z
    .locals 2

    .line 255
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamPolicyDisallowsMemberPolicy()Z
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;->TEAM_POLICY_DISALLOWS_MEMBER_POLICY:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 317
    sget-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 329
    sget-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderPolicyError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
