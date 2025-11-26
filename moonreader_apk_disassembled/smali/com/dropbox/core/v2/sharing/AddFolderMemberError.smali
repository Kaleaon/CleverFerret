.class public final Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
.super Ljava/lang/Object;
.source "AddFolderMemberError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Serializer;,
        Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;
    }
.end annotation


# static fields
.field public static final BANNED_MEMBER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final CANT_SHARE_OUTSIDE_TEAM:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final INVALID_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final RATE_LIMIT:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

.field public static final TOO_MANY_INVITEES:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

.field private badMemberValue:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

.field private tooManyMembersValue:Ljava/lang/Long;

.field private tooManyPendingInvitesValue:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 111
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 115
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->BANNED_MEMBER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->BANNED_MEMBER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->CANT_SHARE_OUTSIDE_TEAM:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->CANT_SHARE_OUTSIDE_TEAM:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 124
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->RATE_LIMIT:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->RATE_LIMIT:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 128
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TOO_MANY_INVITEES:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->TOO_MANY_INVITEES:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 134
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 138
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 146
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->INVALID_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->INVALID_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 154
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->OTHER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/AddFolderMemberError;)Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/AddFolderMemberError;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->badMemberValue:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/sharing/AddFolderMemberError;)Ljava/lang/Long;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyMembersValue:Ljava/lang/Long;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/sharing/AddFolderMemberError;)Ljava/lang/Long;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyPendingInvitesValue:Ljava/lang/Long;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 283
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object p0

    return-object p0

    .line 281
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static badMember(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 355
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->BAD_MEMBER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTagAndBadMember(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object p0

    return-object p0

    .line 353
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static tooManyMembers(J)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 2

    .line 410
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TOO_MANY_MEMBERS:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTagAndTooManyMembers(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object p0

    return-object p0
.end method

.method public static tooManyPendingInvites(J)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 2

    .line 454
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TOO_MANY_PENDING_INVITES:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->withTagAndTooManyPendingInvites(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    move-result-object p0

    return-object p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 1

    .line 174
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    .line 175
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 1

    .line 189
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    .line 190
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    .line 191
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0
.end method

.method private withTagAndBadMember(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 1

    .line 205
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    .line 206
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    .line 207
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->badMemberValue:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    return-object v0
.end method

.method private withTagAndTooManyMembers(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 1

    .line 218
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    .line 219
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    .line 220
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyMembersValue:Ljava/lang/Long;

    return-object v0
.end method

.method private withTagAndTooManyPendingInvites(Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;Ljava/lang/Long;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 1

    .line 231
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;-><init>()V

    .line 232
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    .line 233
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyPendingInvitesValue:Ljava/lang/Long;

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

    .line 573
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    if-eqz v2, :cond_9

    .line 574
    check-cast p1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    .line 575
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 578
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$1;->$SwitchMap$com$dropbox$core$v2$sharing$AddFolderMemberError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 592
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyPendingInvitesValue:Ljava/lang/Long;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyPendingInvitesValue:Ljava/lang/Long;

    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    return v1

    .line 590
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyMembersValue:Ljava/lang/Long;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyMembersValue:Ljava/lang/Long;

    if-ne v2, p1, :cond_4

    return v0

    :cond_4
    return v1

    :pswitch_3
    return v0

    .line 586
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->badMemberValue:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->badMemberValue:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    :pswitch_5
    return v0

    .line 580
    :pswitch_6
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    return v1

    :cond_8
    :goto_1
    return v0

    :cond_9
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
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

    .line 298
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 301
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0

    .line 299
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBadMemberValue()Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 3

    .line 370
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->BAD_MEMBER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 373
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->badMemberValue:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    return-object v0

    .line 371
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.BAD_MEMBER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTooManyMembersValue()J
    .locals 3

    .line 425
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TOO_MANY_MEMBERS:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 428
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyMembersValue:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 426
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TOO_MANY_MEMBERS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTooManyPendingInvitesValue()J
    .locals 3

    .line 470
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TOO_MANY_PENDING_INVITES:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 473
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyPendingInvitesValue:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 471
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TOO_MANY_PENDING_INVITES, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 7

    .line 555
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->badMemberValue:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyMembersValue:Ljava/lang/Long;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->tooManyPendingInvitesValue:Ljava/lang/Long;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isAccessError()Z
    .locals 2

    .line 263
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isBadMember()Z
    .locals 2

    .line 334
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->BAD_MEMBER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isBannedMember()Z
    .locals 2

    .line 323
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->BANNED_MEMBER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCantShareOutsideTeam()Z
    .locals 2

    .line 384
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->CANT_SHARE_OUTSIDE_TEAM:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEmailUnverified()Z
    .locals 2

    .line 312
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInsufficientPlan()Z
    .locals 2

    .line 506
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidSharedFolder()Z
    .locals 2

    .line 539
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->INVALID_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 528
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 550
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRateLimit()Z
    .locals 2

    .line 484
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->RATE_LIMIT:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamFolder()Z
    .locals 2

    .line 517
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyInvitees()Z
    .locals 2

    .line 495
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TOO_MANY_INVITEES:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyMembers()Z
    .locals 2

    .line 395
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TOO_MANY_MEMBERS:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyPendingInvites()Z
    .locals 2

    .line 439
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;->TOO_MANY_PENDING_INVITES:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 618
    sget-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 630
    sget-object v0, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
