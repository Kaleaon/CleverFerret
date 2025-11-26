.class public final Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
.source "ResourceFileSystemConfigBuilder.java"


# static fields
.field private static final BUILDER:Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    new-instance v0, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 31
    const-string v0, "resource."

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;
    .locals 1

    .line 40
    sget-object v0, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;

    return-object v0
.end method


# virtual methods
.method public getClassLoader(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/ClassLoader;
    .locals 1

    .line 48
    const-class v0, Ljava/lang/ClassLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ClassLoader;

    return-object p1
.end method

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

    .line 53
    const-class v0, Lorg/apache/commons/vfs2/provider/url/UrlFileSystem;

    return-object v0
.end method

.method public setClassLoader(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/ClassLoader;)V
    .locals 1

    .line 44
    const-class v0, Ljava/lang/ClassLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/res/ResourceFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
