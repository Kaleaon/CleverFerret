.class public Lorg/apache/commons/vfs2/provider/res/ResourceFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractFileProvider;
.source "ResourceFileProvider.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x50

.field protected static final capabilities:Ljava/util/Collection;
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

    const/4 v0, 0x1

    .line 38
    new-array v0, v0, [Lorg/apache/commons/vfs2/Capability;

    const/4 v1, 0x0

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->DISPATCHER:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    .line 39
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/res/ResourceFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V
    .locals 0

    return-void
.end method

.method public findFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 59
    new-instance p1, Ljava/lang/StringBuilder;

    const/16 v0, 0x50

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 60
    invoke-static {p2, p1}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 63
    invoke-static {}, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;->getClassLoader(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/ClassLoader;

    move-result-object p3

    if-nez p3, :cond_0

    .line 65
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p3

    .line 67
    :cond_0
    invoke-virtual {p3, p1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 73
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/res/ResourceFileProvider;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object p2

    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    .line 70
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p3, "vfs.provider.url/badly-formed-uri.error"

    invoke-direct {p1, p3, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
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

    .line 88
    sget-object v0, Lorg/apache/commons/vfs2/provider/res/ResourceFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    .line 78
    invoke-static {}, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;

    move-result-object v0

    return-object v0
.end method
