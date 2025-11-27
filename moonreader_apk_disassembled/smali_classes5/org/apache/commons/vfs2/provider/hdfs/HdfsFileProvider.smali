.class public Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;
.source "HdfsFileProvider.java"


# static fields
.field static final CAPABILITIES:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x8

    .line 38
    new-array v0, v0, [Lorg/apache/commons/vfs2/Capability;

    const/4 v1, 0x0

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_TYPE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->URI:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->DIRECTORY_READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    .line 39
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileProvider;->CAPABILITIES:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;-><init>()V

    .line 48
    invoke-static {}, Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;->getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

    return-void
.end method


# virtual methods
.method protected doCreateFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 61
    new-instance v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v0
.end method

.method public getCapabilities()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation

    .line 71
    sget-object v0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileProvider;->CAPABILITIES:Ljava/util/Collection;

    return-object v0
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    .line 82
    invoke-static {}, Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/hdfs/HdfsFileSystemConfigBuilder;

    move-result-object v0

    return-object v0
.end method
