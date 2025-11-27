.class public final enum Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;
.super Ljava/lang/Enum;
.source "VcsStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum ADDED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum CONFLICTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum COPIED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum CORRUPTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum DELETED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum EXTERNAL:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum IGNORED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum MERGED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum MISSING:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum MODIFIED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum MOVED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum NOT_MODIFIED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum NOT_REVERTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum OBSTRUCTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum REPLACED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum RESOLVED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum RESTORED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum REVERTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum UNKNOWN:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum UNVERSIONED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

.field public static final enum UPDATED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;


# instance fields
.field private status:I


# direct methods
.method static constructor <clinit>()V
    .locals 43

    .line 24
    new-instance v0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/4 v1, -0x1

    const-string v2, "UNKNOWN"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->UNKNOWN:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v1, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const-string v2, "NOT_MODIFIED"

    const/4 v4, 0x1

    invoke-direct {v1, v2, v4, v3}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->NOT_MODIFIED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v2, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const-string v5, "ADDED"

    const/4 v6, 0x2

    invoke-direct {v2, v5, v6, v4}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->ADDED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v5, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const-string v7, "CONFLICTED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v6}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->CONFLICTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v7, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const-string v9, "DELETED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v8}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->DELETED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v9, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const-string v11, "MERGED"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v10}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->MERGED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v11, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const-string v13, "IGNORED"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14, v12}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->IGNORED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v13, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const-string v15, "MODIFIED"

    const/16 v16, 0x0

    const/4 v3, 0x7

    invoke-direct {v13, v15, v3, v14}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->MODIFIED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v15, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v17, 0x1

    const-string v4, "REPLACED"

    const/16 v18, 0x2

    const/16 v6, 0x8

    invoke-direct {v15, v4, v6, v3}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v15, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->REPLACED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    .line 25
    new-instance v4, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v19, 0x7

    const-string v3, "UNVERSIONED"

    const/16 v20, 0x3

    const/16 v8, 0x9

    invoke-direct {v4, v3, v8, v6}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->UNVERSIONED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v3, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v21, 0x8

    const-string v6, "MISSING"

    const/16 v22, 0x4

    const/16 v10, 0xa

    invoke-direct {v3, v6, v10, v8}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->MISSING:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v6, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v23, 0x9

    const-string v8, "OBSTRUCTED"

    const/16 v24, 0x5

    const/16 v12, 0xb

    invoke-direct {v6, v8, v12, v10}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->OBSTRUCTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v8, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v25, 0xa

    const-string v10, "REVERTED"

    const/16 v26, 0x6

    const/16 v14, 0xc

    invoke-direct {v8, v10, v14, v12}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->REVERTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v10, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v27, 0xb

    const-string v12, "RESOLVED"

    move-object/from16 v28, v0

    const/16 v0, 0xd

    invoke-direct {v10, v12, v0, v14}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->RESOLVED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v12, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v29, 0xc

    const-string v14, "COPIED"

    move-object/from16 v30, v1

    const/16 v1, 0xe

    invoke-direct {v12, v14, v1, v0}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->COPIED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    .line 26
    new-instance v14, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v31, 0xd

    const-string v0, "MOVED"

    move-object/from16 v32, v2

    const/16 v2, 0xf

    invoke-direct {v14, v0, v2, v1}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->MOVED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v33, 0xe

    const-string v1, "RESTORED"

    move-object/from16 v34, v3

    const/16 v3, 0x10

    invoke-direct {v0, v1, v3, v2}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->RESTORED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v1, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v35, 0xf

    const-string v2, "UPDATED"

    move-object/from16 v36, v0

    const/16 v0, 0x11

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->UPDATED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v2, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v37, 0x11

    const-string v0, "EXTERNAL"

    const/16 v38, 0x10

    const/16 v3, 0x12

    invoke-direct {v2, v0, v3, v3}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->EXTERNAL:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v39, 0x12

    const-string v3, "CORRUPTED"

    move-object/from16 v40, v1

    const/16 v1, 0x13

    invoke-direct {v0, v3, v1, v1}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->CORRUPTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    new-instance v3, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v41, 0x13

    const-string v1, "NOT_REVERTED"

    move-object/from16 v42, v0

    const/16 v0, 0x14

    invoke-direct {v3, v1, v0, v0}, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->NOT_REVERTED:Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    const/16 v1, 0x15

    .line 23
    new-array v1, v1, [Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    aput-object v28, v1, v16

    aput-object v30, v1, v17

    aput-object v32, v1, v18

    aput-object v5, v1, v20

    aput-object v7, v1, v22

    aput-object v9, v1, v24

    aput-object v11, v1, v26

    aput-object v13, v1, v19

    aput-object v15, v1, v21

    aput-object v4, v1, v23

    aput-object v34, v1, v25

    aput-object v6, v1, v27

    aput-object v8, v1, v29

    aput-object v10, v1, v31

    aput-object v12, v1, v33

    aput-object v14, v1, v35

    aput-object v36, v1, v38

    aput-object v40, v1, v37

    aput-object v2, v1, v39

    aput-object v42, v1, v41

    aput-object v3, v1, v0

    sput-object v1, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->$VALUES:[Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 31
    iput p3, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->status:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;
    .locals 1

    .line 23
    const-class v0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;
    .locals 1

    .line 23
    sget-object v0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->$VALUES:[Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;

    return-object v0
.end method


# virtual methods
.method public getStatus()I
    .locals 1

    .line 39
    iget v0, p0, Lorg/apache/commons/vfs2/operations/vcs/VcsStatus;->status:I

    return v0
.end method
