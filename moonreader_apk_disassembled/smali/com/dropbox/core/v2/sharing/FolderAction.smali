.class public final enum Lcom/dropbox/core/v2/sharing/FolderAction;
.super Ljava/lang/Enum;
.source "FolderAction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/FolderAction$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/FolderAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum CHANGE_OPTIONS:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum CREATE_LINK:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum DISABLE_VIEWER_INFO:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum EDIT_CONTENTS:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum ENABLE_VIEWER_INFO:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum INVITE_EDITOR:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum INVITE_VIEWER:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum INVITE_VIEWER_NO_COMMENT:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum LEAVE_A_COPY:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum RELINQUISH_MEMBERSHIP:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum SET_ACCESS_INHERITANCE:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum SHARE_LINK:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum UNMOUNT:Lcom/dropbox/core/v2/sharing/FolderAction;

.field public static final enum UNSHARE:Lcom/dropbox/core/v2/sharing/FolderAction;


# direct methods
.method static constructor <clinit>()V
    .locals 31

    .line 27
    new-instance v0, Lcom/dropbox/core/v2/sharing/FolderAction;

    const-string v1, "CHANGE_OPTIONS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/FolderAction;->CHANGE_OPTIONS:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 31
    new-instance v1, Lcom/dropbox/core/v2/sharing/FolderAction;

    const-string v3, "DISABLE_VIEWER_INFO"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/FolderAction;->DISABLE_VIEWER_INFO:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 35
    new-instance v3, Lcom/dropbox/core/v2/sharing/FolderAction;

    const-string v5, "EDIT_CONTENTS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/FolderAction;->EDIT_CONTENTS:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 39
    new-instance v5, Lcom/dropbox/core/v2/sharing/FolderAction;

    const-string v7, "ENABLE_VIEWER_INFO"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/sharing/FolderAction;->ENABLE_VIEWER_INFO:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 43
    new-instance v7, Lcom/dropbox/core/v2/sharing/FolderAction;

    const-string v9, "INVITE_EDITOR"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/sharing/FolderAction;->INVITE_EDITOR:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 47
    new-instance v9, Lcom/dropbox/core/v2/sharing/FolderAction;

    const-string v11, "INVITE_VIEWER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/sharing/FolderAction;->INVITE_VIEWER:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 52
    new-instance v11, Lcom/dropbox/core/v2/sharing/FolderAction;

    const-string v13, "INVITE_VIEWER_NO_COMMENT"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/sharing/FolderAction;->INVITE_VIEWER_NO_COMMENT:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 56
    new-instance v13, Lcom/dropbox/core/v2/sharing/FolderAction;

    const-string v15, "RELINQUISH_MEMBERSHIP"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/sharing/FolderAction;->RELINQUISH_MEMBERSHIP:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 60
    new-instance v15, Lcom/dropbox/core/v2/sharing/FolderAction;

    const/16 v17, 0x7

    const-string v2, "UNMOUNT"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/sharing/FolderAction;->UNMOUNT:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 64
    new-instance v2, Lcom/dropbox/core/v2/sharing/FolderAction;

    const/16 v19, 0x8

    const-string v4, "UNSHARE"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/sharing/FolderAction;->UNSHARE:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 68
    new-instance v4, Lcom/dropbox/core/v2/sharing/FolderAction;

    const/16 v21, 0x9

    const-string v6, "LEAVE_A_COPY"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/dropbox/core/v2/sharing/FolderAction;->LEAVE_A_COPY:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 72
    new-instance v6, Lcom/dropbox/core/v2/sharing/FolderAction;

    const/16 v23, 0xa

    const-string v8, "SHARE_LINK"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/dropbox/core/v2/sharing/FolderAction;->SHARE_LINK:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 76
    new-instance v8, Lcom/dropbox/core/v2/sharing/FolderAction;

    const/16 v25, 0xb

    const-string v10, "CREATE_LINK"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lcom/dropbox/core/v2/sharing/FolderAction;->CREATE_LINK:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 80
    new-instance v10, Lcom/dropbox/core/v2/sharing/FolderAction;

    const/16 v27, 0xc

    const-string v12, "SET_ACCESS_INHERITANCE"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lcom/dropbox/core/v2/sharing/FolderAction;->SET_ACCESS_INHERITANCE:Lcom/dropbox/core/v2/sharing/FolderAction;

    .line 88
    new-instance v12, Lcom/dropbox/core/v2/sharing/FolderAction;

    const/16 v29, 0xd

    const-string v14, "OTHER"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0}, Lcom/dropbox/core/v2/sharing/FolderAction;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lcom/dropbox/core/v2/sharing/FolderAction;->OTHER:Lcom/dropbox/core/v2/sharing/FolderAction;

    const/16 v14, 0xf

    .line 22
    new-array v14, v14, [Lcom/dropbox/core/v2/sharing/FolderAction;

    aput-object v30, v14, v16

    aput-object v1, v14, v18

    aput-object v3, v14, v20

    aput-object v5, v14, v22

    aput-object v7, v14, v24

    aput-object v9, v14, v26

    aput-object v11, v14, v28

    aput-object v13, v14, v17

    aput-object v15, v14, v19

    aput-object v2, v14, v21

    aput-object v4, v14, v23

    aput-object v6, v14, v25

    aput-object v8, v14, v27

    aput-object v10, v14, v29

    aput-object v12, v14, v0

    sput-object v14, Lcom/dropbox/core/v2/sharing/FolderAction;->$VALUES:[Lcom/dropbox/core/v2/sharing/FolderAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FolderAction;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/sharing/FolderAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/FolderAction;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/FolderAction;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/sharing/FolderAction;->$VALUES:[Lcom/dropbox/core/v2/sharing/FolderAction;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/FolderAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/FolderAction;

    return-object v0
.end method
