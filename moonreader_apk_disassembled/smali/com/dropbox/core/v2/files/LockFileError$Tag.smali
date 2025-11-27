.class public final enum Lcom/dropbox/core/v2/files/LockFileError$Tag;
.super Ljava/lang/Enum;
.source "LockFileError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/LockFileError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/LockFileError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum CANNOT_BE_LOCKED:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum FILE_NOT_SHARED:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum INTERNAL_ERROR:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum LOCK_CONFLICT:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum NO_WRITE_PERMISSION:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum PATH_LOOKUP:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum TOO_MANY_FILES:Lcom/dropbox/core/v2/files/LockFileError$Tag;

.field public static final enum TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/LockFileError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 39
    new-instance v0, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const-string v1, "PATH_LOOKUP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/LockFileError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 44
    new-instance v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const-string v3, "TOO_MANY_WRITE_OPERATIONS"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/LockFileError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 49
    new-instance v3, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const-string v5, "TOO_MANY_FILES"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/LockFileError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 54
    new-instance v5, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const-string v7, "NO_WRITE_PERMISSION"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/files/LockFileError$Tag;->NO_WRITE_PERMISSION:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 58
    new-instance v7, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const-string v9, "CANNOT_BE_LOCKED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/files/LockFileError$Tag;->CANNOT_BE_LOCKED:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 62
    new-instance v9, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const-string v11, "FILE_NOT_SHARED"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/files/LockFileError$Tag;->FILE_NOT_SHARED:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 66
    new-instance v11, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const-string v13, "LOCK_CONFLICT"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/files/LockFileError$Tag;->LOCK_CONFLICT:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 72
    new-instance v13, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const-string v15, "INTERNAL_ERROR"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/files/LockFileError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    .line 81
    new-instance v15, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const/16 v17, 0x7

    const-string v2, "OTHER"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/files/LockFileError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/files/LockFileError$Tag;->OTHER:Lcom/dropbox/core/v2/files/LockFileError$Tag;

    const/16 v2, 0x9

    .line 35
    new-array v2, v2, [Lcom/dropbox/core/v2/files/LockFileError$Tag;

    aput-object v0, v2, v16

    aput-object v1, v2, v18

    aput-object v3, v2, v6

    aput-object v5, v2, v8

    aput-object v7, v2, v10

    aput-object v9, v2, v12

    aput-object v11, v2, v14

    aput-object v13, v2, v17

    aput-object v15, v2, v4

    sput-object v2, Lcom/dropbox/core/v2/files/LockFileError$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/LockFileError$Tag;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/LockFileError$Tag;
    .locals 1

    .line 35
    const-class v0, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/LockFileError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/LockFileError$Tag;
    .locals 1

    .line 35
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileError$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/LockFileError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/LockFileError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/LockFileError$Tag;

    return-object v0
.end method
