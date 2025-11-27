.class public final enum Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;
.super Ljava/lang/Enum;
.source "RelocationBatchError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/RelocationBatchError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum CANT_COPY_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum CANT_MOVE_FOLDER_INTO_ITSELF:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum CANT_MOVE_INTO_FAMILY:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum CANT_MOVE_INTO_VAULT:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum CANT_MOVE_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum CANT_NEST_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum CANT_TRANSFER_OWNERSHIP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum DUPLICATED_OR_NESTED_PATHS:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum FROM_LOOKUP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum FROM_WRITE:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum INSUFFICIENT_QUOTA:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum TO:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum TOO_MANY_FILES:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

.field public static final enum TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 33

    .line 32
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const-string v1, "FROM_LOOKUP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->FROM_LOOKUP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 33
    new-instance v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const-string v3, "FROM_WRITE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->FROM_WRITE:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 34
    new-instance v3, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const-string v5, "TO"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TO:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 38
    new-instance v5, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const-string v7, "CANT_COPY_SHARED_FOLDER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_COPY_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 43
    new-instance v7, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const-string v9, "CANT_NEST_SHARED_FOLDER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_NEST_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 47
    new-instance v9, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const-string v11, "CANT_MOVE_FOLDER_INTO_ITSELF"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_FOLDER_INTO_ITSELF:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 51
    new-instance v11, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const-string v13, "TOO_MANY_FILES"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 56
    new-instance v13, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const-string v15, "DUPLICATED_OR_NESTED_PATHS"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->DUPLICATED_OR_NESTED_PATHS:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 62
    new-instance v15, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v17, 0x7

    const-string v2, "CANT_TRANSFER_OWNERSHIP"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_TRANSFER_OWNERSHIP:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 67
    new-instance v2, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v19, 0x8

    const-string v4, "INSUFFICIENT_QUOTA"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->INSUFFICIENT_QUOTA:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 73
    new-instance v4, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v21, 0x9

    const-string v6, "INTERNAL_ERROR"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 77
    new-instance v6, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v23, 0xa

    const-string v8, "CANT_MOVE_SHARED_FOLDER"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_SHARED_FOLDER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 82
    new-instance v8, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v25, 0xb

    const-string v10, "CANT_MOVE_INTO_VAULT"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_INTO_VAULT:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 87
    new-instance v10, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v27, 0xc

    const-string v12, "CANT_MOVE_INTO_FAMILY"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->CANT_MOVE_INTO_FAMILY:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 96
    new-instance v12, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v29, 0xd

    const-string v14, "OTHER"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    .line 101
    new-instance v14, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v31, 0xe

    const-string v0, "TOO_MANY_WRITE_OPERATIONS"

    move-object/from16 v32, v1

    const/16 v1, 0xf

    invoke-direct {v14, v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    const/16 v0, 0x10

    .line 31
    new-array v0, v0, [Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

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

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;
    .locals 1

    .line 31
    const-class v0, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;
    .locals 1

    .line 31
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/RelocationBatchError$Tag;

    return-object v0
.end method
