.class public final enum Lcom/dropbox/core/v2/team/MembersRemoveError;
.super Ljava/lang/Enum;
.source "MembersRemoveError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MembersRemoveError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/MembersRemoveError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_KEEP_ACCOUNT:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_KEEP_ACCOUNT_AND_DELETE_DATA:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_KEEP_ACCOUNT_AND_TRANSFER:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_KEEP_ACCOUNT_REQUIRED_TO_SIGN_TOS:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_KEEP_ACCOUNT_UNDER_LEGAL_HOLD:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_KEEP_INVITED_USER_ACCOUNT:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_RETAIN_SHARES_WHEN_DATA_WIPED:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_RETAIN_SHARES_WHEN_NO_ACCOUNT_KEPT:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum CANNOT_RETAIN_SHARES_WHEN_TEAM_EXTERNAL_SHARING_OFF:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum EMAIL_ADDRESS_TOO_LONG_TO_BE_DISABLED:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum RECIPIENT_NOT_VERIFIED:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum REMOVED_AND_TRANSFER_ADMIN_SHOULD_DIFFER:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum REMOVED_AND_TRANSFER_DEST_SHOULD_DIFFER:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum REMOVE_LAST_ADMIN:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum TRANSFER_ADMIN_IS_NOT_ADMIN:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum TRANSFER_ADMIN_USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum TRANSFER_ADMIN_USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum TRANSFER_DEST_USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum TRANSFER_DEST_USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum UNSPECIFIED_TRANSFER_ADMIN_ID:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersRemoveError;

.field public static final enum USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersRemoveError;


# direct methods
.method static constructor <clinit>()V
    .locals 47

    .line 25
    new-instance v0, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const-string v1, "USER_NOT_FOUND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersRemoveError;->USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 29
    new-instance v1, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const-string v3, "USER_NOT_IN_TEAM"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/MembersRemoveError;->USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 37
    new-instance v3, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/MembersRemoveError;->OTHER:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 41
    new-instance v5, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const-string v7, "REMOVED_AND_TRANSFER_DEST_SHOULD_DIFFER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/team/MembersRemoveError;->REMOVED_AND_TRANSFER_DEST_SHOULD_DIFFER:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 45
    new-instance v7, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const-string v9, "REMOVED_AND_TRANSFER_ADMIN_SHOULD_DIFFER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/team/MembersRemoveError;->REMOVED_AND_TRANSFER_ADMIN_SHOULD_DIFFER:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 49
    new-instance v9, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const-string v11, "TRANSFER_DEST_USER_NOT_FOUND"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/team/MembersRemoveError;->TRANSFER_DEST_USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 53
    new-instance v11, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const-string v13, "TRANSFER_DEST_USER_NOT_IN_TEAM"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/team/MembersRemoveError;->TRANSFER_DEST_USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 57
    new-instance v13, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const-string v15, "TRANSFER_ADMIN_USER_NOT_IN_TEAM"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/team/MembersRemoveError;->TRANSFER_ADMIN_USER_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 61
    new-instance v15, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v17, 0x7

    const-string v2, "TRANSFER_ADMIN_USER_NOT_FOUND"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/team/MembersRemoveError;->TRANSFER_ADMIN_USER_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 66
    new-instance v2, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v19, 0x8

    const-string v4, "UNSPECIFIED_TRANSFER_ADMIN_ID"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/team/MembersRemoveError;->UNSPECIFIED_TRANSFER_ADMIN_ID:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 70
    new-instance v4, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v21, 0x9

    const-string v6, "TRANSFER_ADMIN_IS_NOT_ADMIN"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/dropbox/core/v2/team/MembersRemoveError;->TRANSFER_ADMIN_IS_NOT_ADMIN:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 74
    new-instance v6, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v23, 0xa

    const-string v8, "RECIPIENT_NOT_VERIFIED"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/dropbox/core/v2/team/MembersRemoveError;->RECIPIENT_NOT_VERIFIED:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 78
    new-instance v8, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v25, 0xb

    const-string v10, "REMOVE_LAST_ADMIN"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lcom/dropbox/core/v2/team/MembersRemoveError;->REMOVE_LAST_ADMIN:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 83
    new-instance v10, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v27, 0xc

    const-string v12, "CANNOT_KEEP_ACCOUNT_AND_TRANSFER"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_KEEP_ACCOUNT_AND_TRANSFER:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 88
    new-instance v12, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v29, 0xd

    const-string v14, "CANNOT_KEEP_ACCOUNT_AND_DELETE_DATA"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_KEEP_ACCOUNT_AND_DELETE_DATA:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 92
    new-instance v14, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v31, 0xe

    const-string v0, "EMAIL_ADDRESS_TOO_LONG_TO_BE_DISABLED"

    move-object/from16 v32, v1

    const/16 v1, 0xf

    invoke-direct {v14, v0, v1}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lcom/dropbox/core/v2/team/MembersRemoveError;->EMAIL_ADDRESS_TOO_LONG_TO_BE_DISABLED:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 96
    new-instance v0, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v33, 0xf

    const-string v1, "CANNOT_KEEP_INVITED_USER_ACCOUNT"

    move-object/from16 v34, v2

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_KEEP_INVITED_USER_ACCOUNT:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 102
    new-instance v1, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v35, 0x10

    const-string v2, "CANNOT_RETAIN_SHARES_WHEN_DATA_WIPED"

    move-object/from16 v36, v0

    const/16 v0, 0x11

    invoke-direct {v1, v2, v0}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_RETAIN_SHARES_WHEN_DATA_WIPED:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 107
    new-instance v2, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v37, 0x11

    const-string v0, "CANNOT_RETAIN_SHARES_WHEN_NO_ACCOUNT_KEPT"

    move-object/from16 v38, v1

    const/16 v1, 0x12

    invoke-direct {v2, v0, v1}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_RETAIN_SHARES_WHEN_NO_ACCOUNT_KEPT:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v39, 0x12

    const-string v1, "CANNOT_RETAIN_SHARES_WHEN_TEAM_EXTERNAL_SHARING_OFF"

    move-object/from16 v40, v2

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_RETAIN_SHARES_WHEN_TEAM_EXTERNAL_SHARING_OFF:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 116
    new-instance v1, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v41, 0x13

    const-string v2, "CANNOT_KEEP_ACCOUNT"

    move-object/from16 v42, v0

    const/16 v0, 0x14

    invoke-direct {v1, v2, v0}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_KEEP_ACCOUNT:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 122
    new-instance v2, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v43, 0x14

    const-string v0, "CANNOT_KEEP_ACCOUNT_UNDER_LEGAL_HOLD"

    move-object/from16 v44, v1

    const/16 v1, 0x15

    invoke-direct {v2, v0, v1}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_KEEP_ACCOUNT_UNDER_LEGAL_HOLD:Lcom/dropbox/core/v2/team/MembersRemoveError;

    .line 127
    new-instance v0, Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v45, 0x15

    const-string v1, "CANNOT_KEEP_ACCOUNT_REQUIRED_TO_SIGN_TOS"

    move-object/from16 v46, v2

    const/16 v2, 0x16

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/MembersRemoveError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersRemoveError;->CANNOT_KEEP_ACCOUNT_REQUIRED_TO_SIGN_TOS:Lcom/dropbox/core/v2/team/MembersRemoveError;

    const/16 v1, 0x17

    .line 19
    new-array v1, v1, [Lcom/dropbox/core/v2/team/MembersRemoveError;

    aput-object v30, v1, v16

    aput-object v32, v1, v18

    aput-object v3, v1, v20

    aput-object v5, v1, v22

    aput-object v7, v1, v24

    aput-object v9, v1, v26

    aput-object v11, v1, v28

    aput-object v13, v1, v17

    aput-object v15, v1, v19

    aput-object v34, v1, v21

    aput-object v4, v1, v23

    aput-object v6, v1, v25

    aput-object v8, v1, v27

    aput-object v10, v1, v29

    aput-object v12, v1, v31

    aput-object v14, v1, v33

    aput-object v36, v1, v35

    aput-object v38, v1, v37

    aput-object v40, v1, v39

    aput-object v42, v1, v41

    aput-object v44, v1, v43

    aput-object v46, v1, v45

    aput-object v0, v1, v2

    sput-object v1, Lcom/dropbox/core/v2/team/MembersRemoveError;->$VALUES:[Lcom/dropbox/core/v2/team/MembersRemoveError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersRemoveError;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/team/MembersRemoveError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/MembersRemoveError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/MembersRemoveError;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/team/MembersRemoveError;->$VALUES:[Lcom/dropbox/core/v2/team/MembersRemoveError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/MembersRemoveError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/MembersRemoveError;

    return-object v0
.end method
