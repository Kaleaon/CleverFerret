.class public final enum Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;
.super Ljava/lang/Enum;
.source "HdfsFileAttributes.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

.field public static final enum BLOCK_SIZE:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

.field public static final enum GROUP:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

.field public static final enum LAST_ACCESS_TIME:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

.field public static final enum LENGTH:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

.field public static final enum MODIFICATION_TIME:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

.field public static final enum OWNER:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

.field public static final enum PERMISSIONS:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 28
    new-instance v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    const-string v1, "LAST_ACCESS_TIME"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->LAST_ACCESS_TIME:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    .line 33
    new-instance v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    const-string v3, "BLOCK_SIZE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->BLOCK_SIZE:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    .line 38
    new-instance v3, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    const-string v5, "GROUP"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->GROUP:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    .line 43
    new-instance v5, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    const-string v7, "OWNER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->OWNER:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    .line 48
    new-instance v7, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    const-string v9, "PERMISSIONS"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->PERMISSIONS:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    .line 53
    new-instance v9, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    const-string v11, "LENGTH"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->LENGTH:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    .line 58
    new-instance v11, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    const-string v13, "MODIFICATION_TIME"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->MODIFICATION_TIME:Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    const/4 v13, 0x7

    .line 24
    new-array v13, v13, [Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    sput-object v13, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->$VALUES:[Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;
    .locals 1

    .line 24
    const-class v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;
    .locals 1

    .line 24
    sget-object v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->$VALUES:[Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileAttributes;

    return-object v0
.end method
