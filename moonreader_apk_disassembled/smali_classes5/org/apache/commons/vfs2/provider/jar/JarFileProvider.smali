.class public Lorg/apache/commons/vfs2/provider/jar/JarFileProvider;
.super Lorg/apache/commons/vfs2/provider/zip/ZipFileProvider;
.source "JarFileProvider.java"


# static fields
.field static final capabilities:Ljava/util/Collection;
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
    .locals 4

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    sget-object v1, Lorg/apache/commons/vfs2/provider/zip/ZipFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    const/4 v1, 0x5

    .line 45
    new-array v1, v1, [Lorg/apache/commons/vfs2/Capability;

    const/4 v2, 0x0

    sget-object v3, Lorg/apache/commons/vfs2/Capability;->ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Lorg/apache/commons/vfs2/Capability;->FS_ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Lorg/apache/commons/vfs2/Capability;->SIGNING:Lorg/apache/commons/vfs2/Capability;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    sget-object v3, Lorg/apache/commons/vfs2/Capability;->MANIFEST_ATTRIBUTES:Lorg/apache/commons/vfs2/Capability;

    aput-object v3, v1, v2

    const/4 v2, 0x4

    sget-object v3, Lorg/apache/commons/vfs2/Capability;->VIRTUAL:Lorg/apache/commons/vfs2/Capability;

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 47
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/jar/JarFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileProvider;-><init>()V

    return-void
.end method


# virtual methods
.method protected doCreateFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 64
    new-instance v0, Lorg/apache/commons/vfs2/provider/LayeredFileName;

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    const-string v2, "/"

    sget-object v3, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-direct {v0, p1, v1, v2, v3}, Lorg/apache/commons/vfs2/provider/LayeredFileName;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    .line 65
    new-instance p1, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;

    invoke-direct {p1, v0, p2, p3}, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object p1
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

    .line 70
    sget-object v0, Lorg/apache/commons/vfs2/provider/jar/JarFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method
