.class public Lorg/apache/commons/vfs2/provider/ram/RamFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;
.source "RamFileProvider.java"


# static fields
.field public static final capabilities:Ljava/util/Collection;
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

    const/16 v0, 0xf

    .line 35
    new-array v0, v0, [Lorg/apache/commons/vfs2/Capability;

    const/4 v1, 0x0

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->CREATE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->DELETE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RENAME:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_TYPE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FOLDER:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->URI:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->WRITE_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->APPEND_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_SET_LENGTH:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_WRITE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    .line 36
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 35
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ram/RamFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;-><init>()V

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

    .line 58
    new-instance v0, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/ram/RamFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

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

    .line 68
    sget-object v0, Lorg/apache/commons/vfs2/provider/ram/RamFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method
