.class public final enum Lorg/apache/commons/vfs2/util/PosixPermissions$Type;
.super Ljava/lang/Enum;
.source "PosixPermissions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/util/PosixPermissions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/util/PosixPermissions$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum GroupExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum GroupReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum GroupWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum OtherExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum OtherReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum OtherWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum UserExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum UserReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

.field public static final enum UserWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;


# instance fields
.field private final mask:I


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 37
    new-instance v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const/16 v1, 0x100

    const-string v2, "UserReadable"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 42
    new-instance v1, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const/16 v2, 0x80

    const-string v4, "UserWritable"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 47
    new-instance v2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const/16 v4, 0x40

    const-string v6, "UserExecutable"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 52
    new-instance v4, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const/16 v6, 0x20

    const-string v8, "GroupReadable"

    const/4 v9, 0x3

    invoke-direct {v4, v8, v9, v6}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 57
    new-instance v6, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const/16 v8, 0x10

    const-string v10, "GroupWritable"

    const/4 v11, 0x4

    invoke-direct {v6, v10, v11, v8}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 62
    new-instance v8, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const-string v10, "GroupExecutable"

    const/4 v12, 0x5

    const/16 v13, 0x8

    invoke-direct {v8, v10, v12, v13}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 67
    new-instance v10, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const-string v14, "OtherReadable"

    const/4 v15, 0x6

    invoke-direct {v10, v14, v15, v11}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 72
    new-instance v14, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const/16 v16, 0x0

    const-string v3, "OtherWritable"

    const/16 v17, 0x3

    const/4 v9, 0x7

    invoke-direct {v14, v3, v9, v7}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 77
    new-instance v3, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const/16 v18, 0x2

    const-string v7, "OtherExecutable"

    invoke-direct {v3, v7, v13, v5}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    const/16 v7, 0x9

    .line 33
    new-array v7, v7, [Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    aput-object v0, v7, v16

    aput-object v1, v7, v5

    aput-object v2, v7, v18

    aput-object v4, v7, v17

    aput-object v6, v7, v11

    aput-object v8, v7, v12

    aput-object v10, v7, v15

    aput-object v14, v7, v9

    aput-object v3, v7, v13

    sput-object v7, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->$VALUES:[Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 84
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 85
    iput p3, p0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->mask:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/util/PosixPermissions$Type;
    .locals 1

    .line 33
    const-class v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/util/PosixPermissions$Type;
    .locals 1

    .line 33
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->$VALUES:[Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    return-object v0
.end method


# virtual methods
.method public getMask()I
    .locals 1

    .line 94
    iget v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->mask:I

    return v0
.end method
