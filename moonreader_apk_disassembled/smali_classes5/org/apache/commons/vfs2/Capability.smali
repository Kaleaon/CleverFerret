.class public final enum Lorg/apache/commons/vfs2/Capability;
.super Ljava/lang/Enum;
.source "Capability.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/Capability;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/Capability;

.field public static final enum APPEND_CONTENT:Lorg/apache/commons/vfs2/Capability;

.field public static final enum ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

.field public static final enum COMPRESS:Lorg/apache/commons/vfs2/Capability;

.field public static final enum CREATE:Lorg/apache/commons/vfs2/Capability;

.field public static final enum DELETE:Lorg/apache/commons/vfs2/Capability;

.field public static final enum DIRECTORY_READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

.field public static final enum DISPATCHER:Lorg/apache/commons/vfs2/Capability;

.field public static final enum FS_ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

.field public static final enum GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

.field public static final enum GET_TYPE:Lorg/apache/commons/vfs2/Capability;

.field public static final enum JUNCTIONS:Lorg/apache/commons/vfs2/Capability;

.field public static final enum LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

.field public static final enum LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

.field public static final enum MANIFEST_ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

.field public static final enum RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

.field public static final enum RANDOM_ACCESS_SET_LENGTH:Lorg/apache/commons/vfs2/Capability;

.field public static final enum RANDOM_ACCESS_WRITE:Lorg/apache/commons/vfs2/Capability;

.field public static final enum READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

.field public static final enum RENAME:Lorg/apache/commons/vfs2/Capability;

.field public static final enum SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

.field public static final enum SET_LAST_MODIFIED_FOLDER:Lorg/apache/commons/vfs2/Capability;

.field public static final enum SIGNING:Lorg/apache/commons/vfs2/Capability;

.field public static final enum URI:Lorg/apache/commons/vfs2/Capability;

.field public static final enum VIRTUAL:Lorg/apache/commons/vfs2/Capability;

.field public static final enum WRITE_CONTENT:Lorg/apache/commons/vfs2/Capability;


# direct methods
.method static constructor <clinit>()V
    .locals 49

    .line 26
    new-instance v0, Lorg/apache/commons/vfs2/Capability;

    const-string v1, "READ_CONTENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    .line 31
    new-instance v1, Lorg/apache/commons/vfs2/Capability;

    const-string v3, "WRITE_CONTENT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/vfs2/Capability;->WRITE_CONTENT:Lorg/apache/commons/vfs2/Capability;

    .line 36
    new-instance v3, Lorg/apache/commons/vfs2/Capability;

    const-string v5, "RANDOM_ACCESS_READ"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    .line 41
    new-instance v5, Lorg/apache/commons/vfs2/Capability;

    const-string v7, "RANDOM_ACCESS_SET_LENGTH"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_SET_LENGTH:Lorg/apache/commons/vfs2/Capability;

    .line 46
    new-instance v7, Lorg/apache/commons/vfs2/Capability;

    const-string v9, "RANDOM_ACCESS_WRITE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_WRITE:Lorg/apache/commons/vfs2/Capability;

    .line 51
    new-instance v9, Lorg/apache/commons/vfs2/Capability;

    const-string v11, "APPEND_CONTENT"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lorg/apache/commons/vfs2/Capability;->APPEND_CONTENT:Lorg/apache/commons/vfs2/Capability;

    .line 56
    new-instance v11, Lorg/apache/commons/vfs2/Capability;

    const-string v13, "ATTRIBUTES"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lorg/apache/commons/vfs2/Capability;->ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    .line 61
    new-instance v13, Lorg/apache/commons/vfs2/Capability;

    const-string v15, "LAST_MODIFIED"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lorg/apache/commons/vfs2/Capability;->LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    .line 66
    new-instance v15, Lorg/apache/commons/vfs2/Capability;

    const/16 v17, 0x7

    const-string v2, "GET_LAST_MODIFIED"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    .line 71
    new-instance v2, Lorg/apache/commons/vfs2/Capability;

    const/16 v19, 0x8

    const-string v4, "SET_LAST_MODIFIED_FILE"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

    .line 76
    new-instance v4, Lorg/apache/commons/vfs2/Capability;

    const/16 v21, 0x9

    const-string v6, "SET_LAST_MODIFIED_FOLDER"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FOLDER:Lorg/apache/commons/vfs2/Capability;

    .line 81
    new-instance v6, Lorg/apache/commons/vfs2/Capability;

    const/16 v23, 0xa

    const-string v8, "SIGNING"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lorg/apache/commons/vfs2/Capability;->SIGNING:Lorg/apache/commons/vfs2/Capability;

    .line 86
    new-instance v8, Lorg/apache/commons/vfs2/Capability;

    const/16 v25, 0xb

    const-string v10, "CREATE"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lorg/apache/commons/vfs2/Capability;->CREATE:Lorg/apache/commons/vfs2/Capability;

    .line 91
    new-instance v10, Lorg/apache/commons/vfs2/Capability;

    const/16 v27, 0xc

    const-string v12, "DELETE"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lorg/apache/commons/vfs2/Capability;->DELETE:Lorg/apache/commons/vfs2/Capability;

    .line 96
    new-instance v12, Lorg/apache/commons/vfs2/Capability;

    const/16 v29, 0xd

    const-string v14, "RENAME"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lorg/apache/commons/vfs2/Capability;->RENAME:Lorg/apache/commons/vfs2/Capability;

    .line 101
    new-instance v14, Lorg/apache/commons/vfs2/Capability;

    const/16 v31, 0xe

    const-string v0, "GET_TYPE"

    move-object/from16 v32, v1

    const/16 v1, 0xf

    invoke-direct {v14, v0, v1}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lorg/apache/commons/vfs2/Capability;->GET_TYPE:Lorg/apache/commons/vfs2/Capability;

    .line 106
    new-instance v0, Lorg/apache/commons/vfs2/Capability;

    const/16 v33, 0xf

    const-string v1, "LIST_CHILDREN"

    move-object/from16 v34, v2

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/vfs2/Capability;->LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

    .line 111
    new-instance v1, Lorg/apache/commons/vfs2/Capability;

    const/16 v35, 0x10

    const-string v2, "URI"

    move-object/from16 v36, v0

    const/16 v0, 0x11

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/vfs2/Capability;->URI:Lorg/apache/commons/vfs2/Capability;

    .line 116
    new-instance v2, Lorg/apache/commons/vfs2/Capability;

    const/16 v37, 0x11

    const-string v0, "FS_ATTRIBUTES"

    move-object/from16 v38, v1

    const/16 v1, 0x12

    invoke-direct {v2, v0, v1}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lorg/apache/commons/vfs2/Capability;->FS_ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    .line 121
    new-instance v0, Lorg/apache/commons/vfs2/Capability;

    const/16 v39, 0x12

    const-string v1, "JUNCTIONS"

    move-object/from16 v40, v2

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/vfs2/Capability;->JUNCTIONS:Lorg/apache/commons/vfs2/Capability;

    .line 127
    new-instance v1, Lorg/apache/commons/vfs2/Capability;

    const/16 v41, 0x13

    const-string v2, "MANIFEST_ATTRIBUTES"

    move-object/from16 v42, v0

    const/16 v0, 0x14

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/vfs2/Capability;->MANIFEST_ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    .line 135
    new-instance v2, Lorg/apache/commons/vfs2/Capability;

    const/16 v43, 0x14

    const-string v0, "DISPATCHER"

    move-object/from16 v44, v1

    const/16 v1, 0x15

    invoke-direct {v2, v0, v1}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lorg/apache/commons/vfs2/Capability;->DISPATCHER:Lorg/apache/commons/vfs2/Capability;

    .line 140
    new-instance v0, Lorg/apache/commons/vfs2/Capability;

    const/16 v45, 0x15

    const-string v1, "COMPRESS"

    move-object/from16 v46, v2

    const/16 v2, 0x16

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/vfs2/Capability;->COMPRESS:Lorg/apache/commons/vfs2/Capability;

    .line 145
    new-instance v1, Lorg/apache/commons/vfs2/Capability;

    const-string v2, "VIRTUAL"

    move-object/from16 v47, v0

    const/16 v0, 0x17

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/vfs2/Capability;->VIRTUAL:Lorg/apache/commons/vfs2/Capability;

    .line 153
    new-instance v0, Lorg/apache/commons/vfs2/Capability;

    const-string v2, "DIRECTORY_READ_CONTENT"

    move-object/from16 v48, v1

    const/16 v1, 0x18

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/vfs2/Capability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/vfs2/Capability;->DIRECTORY_READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    const/16 v1, 0x19

    .line 22
    new-array v1, v1, [Lorg/apache/commons/vfs2/Capability;

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

    const/16 v2, 0x16

    aput-object v47, v1, v2

    const/16 v2, 0x17

    aput-object v48, v1, v2

    const/16 v2, 0x18

    aput-object v0, v1, v2

    sput-object v1, Lorg/apache/commons/vfs2/Capability;->$VALUES:[Lorg/apache/commons/vfs2/Capability;

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

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/Capability;
    .locals 1

    .line 22
    const-class v0, Lorg/apache/commons/vfs2/Capability;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/Capability;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/Capability;
    .locals 1

    .line 22
    sget-object v0, Lorg/apache/commons/vfs2/Capability;->$VALUES:[Lorg/apache/commons/vfs2/Capability;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/Capability;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/Capability;

    return-object v0
.end method
