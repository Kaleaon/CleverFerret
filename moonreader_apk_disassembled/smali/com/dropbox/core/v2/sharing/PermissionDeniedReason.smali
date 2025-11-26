.class public final Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;
.super Ljava/lang/Object;
.source "PermissionDeniedReason.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Serializer;,
        Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;
    }
.end annotation


# static fields
.field public static final FOLDER_IS_INSIDE_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final FOLDER_IS_LIMITED_TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final OWNER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final RESTRICTED_BY_PARENT_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final TARGET_IS_INDIRECT_MEMBER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final TARGET_IS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final TARGET_IS_SELF:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final TARGET_NOT_ACTIVE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final USER_NOT_ALLOWED_BY_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

.field public static final USER_NOT_SAME_TEAM_AS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field private insufficientPlanValue:Lcom/dropbox/core/v2/sharing/InsufficientPlan;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 111
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_SAME_TEAM_AS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->USER_NOT_SAME_TEAM_AS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 115
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_ALLOWED_BY_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->USER_NOT_ALLOWED_BY_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 120
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_INDIRECT_MEMBER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->TARGET_IS_INDIRECT_MEMBER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 124
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->TARGET_IS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 128
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_SELF:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->TARGET_IS_SELF:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 132
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_NOT_ACTIVE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->TARGET_NOT_ACTIVE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 136
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->FOLDER_IS_LIMITED_TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->FOLDER_IS_LIMITED_TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 140
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->OWNER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->OWNER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 144
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 148
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 152
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 156
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 160
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->FOLDER_IS_INSIDE_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->FOLDER_IS_INSIDE_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->RESTRICTED_BY_PARENT_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->RESTRICTED_BY_PARENT_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 172
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->OTHER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;)Lcom/dropbox/core/v2/sharing/InsufficientPlan;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->insufficientPlanValue:Lcom/dropbox/core/v2/sharing/InsufficientPlan;

    return-object p0
.end method

.method public static insufficientPlan(Lcom/dropbox/core/v2/sharing/InsufficientPlan;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;
    .locals 2

    if-eqz p0, :cond_0

    .line 411
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->withTagAndInsufficientPlan(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;Lcom/dropbox/core/v2/sharing/InsufficientPlan;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    move-result-object p0

    return-object p0

    .line 409
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;
    .locals 1

    .line 190
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    .line 191
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    return-object v0
.end method

.method private withTagAndInsufficientPlan(Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;Lcom/dropbox/core/v2/sharing/InsufficientPlan;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;
    .locals 1

    .line 205
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;-><init>()V

    .line 206
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 207
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->insufficientPlanValue:Lcom/dropbox/core/v2/sharing/InsufficientPlan;

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

    .line 458
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    if-eqz v2, :cond_5

    .line 459
    check-cast p1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;

    .line 460
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 463
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$1;->$SwitchMap$com$dropbox$core$v2$sharing$PermissionDeniedReason$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 493
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->insufficientPlanValue:Lcom/dropbox/core/v2/sharing/InsufficientPlan;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->insufficientPlanValue:Lcom/dropbox/core/v2/sharing/InsufficientPlan;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/InsufficientPlan;->equals(Ljava/lang/Object;)Z

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
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getInsufficientPlanValue()Lcom/dropbox/core/v2/sharing/InsufficientPlan;
    .locals 3

    .line 424
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    .line 427
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->insufficientPlanValue:Lcom/dropbox/core/v2/sharing/InsufficientPlan;

    return-object v0

    .line 425
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INSUFFICIENT_PLAN, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 443
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->insufficientPlanValue:Lcom/dropbox/core/v2/sharing/InsufficientPlan;

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

.method public isFolderIsInsideSharedFolder()Z
    .locals 2

    .line 369
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->FOLDER_IS_INSIDE_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFolderIsLimitedTeamFolder()Z
    .locals 2

    .line 303
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->FOLDER_IS_LIMITED_TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInsufficientPlan()Z
    .locals 2

    .line 391
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 438
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOwnerNotOnTeam()Z
    .locals 2

    .line 314
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->OWNER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPermissionDenied()Z
    .locals 2

    .line 325
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRestrictedByParentFolder()Z
    .locals 2

    .line 380
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->RESTRICTED_BY_PARENT_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRestrictedByTeam()Z
    .locals 2

    .line 336
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTargetIsIndirectMember()Z
    .locals 2

    .line 259
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_INDIRECT_MEMBER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTargetIsOwner()Z
    .locals 2

    .line 270
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTargetIsSelf()Z
    .locals 2

    .line 281
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_SELF:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTargetNotActive()Z
    .locals 2

    .line 292
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_NOT_ACTIVE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserAccountType()Z
    .locals 2

    .line 347
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserNotAllowedByOwner()Z
    .locals 2

    .line 248
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_ALLOWED_BY_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserNotOnTeam()Z
    .locals 2

    .line 358
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserNotSameTeamAsOwner()Z
    .locals 2

    .line 237
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_SAME_TEAM_AS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;->_tag:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 507
    sget-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 519
    sget-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
