.class public final enum Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;
.super Ljava/lang/Enum;
.source "PermissionDeniedReason.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/PermissionDeniedReason;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum FOLDER_IS_INSIDE_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum FOLDER_IS_LIMITED_TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum OWNER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum RESTRICTED_BY_PARENT_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum TARGET_IS_INDIRECT_MEMBER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum TARGET_IS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum TARGET_IS_SELF:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum TARGET_NOT_ACTIVE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum USER_NOT_ALLOWED_BY_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

.field public static final enum USER_NOT_SAME_TEAM_AS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 33

    .line 41
    new-instance v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const-string v1, "USER_NOT_SAME_TEAM_AS_OWNER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_SAME_TEAM_AS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 45
    new-instance v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const-string v3, "USER_NOT_ALLOWED_BY_OWNER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_ALLOWED_BY_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 50
    new-instance v3, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const-string v5, "TARGET_IS_INDIRECT_MEMBER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_INDIRECT_MEMBER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 54
    new-instance v5, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const-string v7, "TARGET_IS_OWNER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_OWNER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 58
    new-instance v7, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const-string v9, "TARGET_IS_SELF"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_IS_SELF:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 62
    new-instance v9, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const-string v11, "TARGET_NOT_ACTIVE"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->TARGET_NOT_ACTIVE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 66
    new-instance v11, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const-string v13, "FOLDER_IS_LIMITED_TEAM_FOLDER"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->FOLDER_IS_LIMITED_TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 71
    new-instance v13, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const-string v15, "OWNER_NOT_ON_TEAM"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->OWNER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 75
    new-instance v15, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v17, 0x7

    const-string v2, "PERMISSION_DENIED"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 79
    new-instance v2, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v19, 0x8

    const-string v4, "RESTRICTED_BY_TEAM"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 83
    new-instance v4, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v21, 0x9

    const-string v6, "USER_ACCOUNT_TYPE"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 87
    new-instance v6, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v23, 0xa

    const-string v8, "USER_NOT_ON_TEAM"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 91
    new-instance v8, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v25, 0xb

    const-string v10, "FOLDER_IS_INSIDE_SHARED_FOLDER"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->FOLDER_IS_INSIDE_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 95
    new-instance v10, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v27, 0xc

    const-string v12, "RESTRICTED_BY_PARENT_FOLDER"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->RESTRICTED_BY_PARENT_FOLDER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 96
    new-instance v12, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v29, 0xd

    const-string v14, "INSUFFICIENT_PLAN"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    .line 105
    new-instance v14, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v31, 0xe

    const-string v0, "OTHER"

    move-object/from16 v32, v1

    const/16 v1, 0xf

    invoke-direct {v14, v0, v1}, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    const/16 v0, 0x10

    .line 37
    new-array v0, v0, [Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    aput-object v30, v0, v16

    aput-object v32, v0, v18

    aput-object v3, v0, v20

    aput-object v5, v0, v22

    aput-object v7, v0, v24

    aput-object v9, v0, v26

    aput-object v11, v0, v28

    aput-object v13, v0, v17

    aput-object v15, v0, v19

    aput-object v2, v0, v21

    aput-object v4, v0, v23

    aput-object v6, v0, v25

    aput-object v8, v0, v27

    aput-object v10, v0, v29

    aput-object v12, v0, v31

    aput-object v14, v0, v1

    sput-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->$VALUES:[Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;
    .locals 1

    .line 37
    const-class v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;
    .locals 1

    .line 37
    sget-object v0, Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->$VALUES:[Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/PermissionDeniedReason$Tag;

    return-object v0
.end method
