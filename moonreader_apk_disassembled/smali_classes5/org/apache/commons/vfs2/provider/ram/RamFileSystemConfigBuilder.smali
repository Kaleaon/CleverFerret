.class public final Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
.source "RamFileSystemConfigBuilder.java"


# static fields
.field private static final MAX_SIZE_KEY:Ljava/lang/String; = "maxsize"

.field private static final SINGLETON:Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    new-instance v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;->SINGLETON:Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 38
    const-string v0, "ram."

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;
    .locals 1

    .line 47
    sget-object v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;->SINGLETON:Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;

    return-object v0
.end method


# virtual methods
.method protected getConfigClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation

    .line 55
    const-class v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    return-object v0
.end method

.method public getLongMaxSize(Lorg/apache/commons/vfs2/FileSystemOptions;)J
    .locals 3

    .line 67
    const-string v0, "maxsize"

    const-wide v1, 0x7fffffffffffffffL

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;->getLong(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaxSize(Lorg/apache/commons/vfs2/FileSystemOptions;)I
    .locals 2

    const-wide/32 v0, 0x7fffffff

    .line 78
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "maxsize"

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;->getLong(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    move-result p1

    return p1
.end method

.method public setMaxSize(Lorg/apache/commons/vfs2/FileSystemOptions;I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    int-to-long v0, p2

    .line 90
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string v0, "maxsize"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setMaxSize(Lorg/apache/commons/vfs2/FileSystemOptions;J)V
    .locals 1

    .line 100
    const-string v0, "maxsize"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
