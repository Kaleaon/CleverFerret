.class public final enum Lcom/dropbox/core/v2/sharing/SharePathError$Tag;
.super Ljava/lang/Enum;
.source "SharePathError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/SharePathError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/SharePathError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum ALREADY_SHARED:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum CONTAINS_APP_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum CONTAINS_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum CONTAINS_TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum INSIDE_APP_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum INSIDE_OSX_PACKAGE:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum INSIDE_PUBLIC_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum INSIDE_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum INVALID_PATH:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum IS_APP_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum IS_FAMILY:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum IS_FILE:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum IS_OSX_PACKAGE:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum IS_PUBLIC_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum IS_VAULT:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum IS_VAULT_LOCKED:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 35

    .line 39
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const-string v1, "IS_FILE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->IS_FILE:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 43
    new-instance v1, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const-string v3, "INSIDE_SHARED_FOLDER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->INSIDE_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 47
    new-instance v3, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const-string v5, "CONTAINS_SHARED_FOLDER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->CONTAINS_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 51
    new-instance v5, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const-string v7, "CONTAINS_APP_FOLDER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->CONTAINS_APP_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 55
    new-instance v7, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const-string v9, "CONTAINS_TEAM_FOLDER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->CONTAINS_TEAM_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 59
    new-instance v9, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const-string v11, "IS_APP_FOLDER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->IS_APP_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 63
    new-instance v11, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const-string v13, "INSIDE_APP_FOLDER"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->INSIDE_APP_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 67
    new-instance v13, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const-string v15, "IS_PUBLIC_FOLDER"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->IS_PUBLIC_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 72
    new-instance v15, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v17, 0x7

    const-string v2, "INSIDE_PUBLIC_FOLDER"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->INSIDE_PUBLIC_FOLDER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 77
    new-instance v2, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v19, 0x8

    const-string v4, "ALREADY_SHARED"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->ALREADY_SHARED:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 81
    new-instance v4, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v21, 0x9

    const-string v6, "INVALID_PATH"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->INVALID_PATH:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 85
    new-instance v6, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v23, 0xa

    const-string v8, "IS_OSX_PACKAGE"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->IS_OSX_PACKAGE:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 89
    new-instance v8, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v25, 0xb

    const-string v10, "INSIDE_OSX_PACKAGE"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->INSIDE_OSX_PACKAGE:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 93
    new-instance v10, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v27, 0xc

    const-string v12, "IS_VAULT"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->IS_VAULT:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 97
    new-instance v12, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v29, 0xd

    const-string v14, "IS_VAULT_LOCKED"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->IS_VAULT_LOCKED:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 101
    new-instance v14, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v31, 0xe

    const-string v0, "IS_FAMILY"

    move-object/from16 v32, v1

    const/16 v1, 0xf

    invoke-direct {v14, v0, v1}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->IS_FAMILY:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    .line 110
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v33, 0xf

    const-string v1, "OTHER"

    move-object/from16 v34, v2

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    const/16 v1, 0x11

    .line 35
    new-array v1, v1, [Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

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

    aput-object v0, v1, v2

    sput-object v1, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->$VALUES:[Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharePathError$Tag;
    .locals 1

    .line 35
    const-class v0, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/SharePathError$Tag;
    .locals 1

    .line 35
    sget-object v0, Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->$VALUES:[Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/SharePathError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/SharePathError$Tag;

    return-object v0
.end method
