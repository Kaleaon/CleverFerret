.class public final Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;
.source "WebdavFileSystemConfigBuilder.java"


# static fields
.field private static final BUILDER:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

.field private static final DEFAULT_FOLLOW_REDIRECT:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    new-instance v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 34
    const-string v0, "webdav."

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/http/HttpFileSystemConfigBuilder;
    .locals 1

    .line 43
    sget-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;

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

    .line 104
    const-class v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystem;

    return-object v0
.end method

.method public getCreatorName(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 63
    const-string v0, "creatorName"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getFollowRedirect(Lorg/apache/commons/vfs2/FileSystemOptions;)Z
    .locals 2

    .line 76
    const-string v0, "followRedirect"

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public isVersioning(Lorg/apache/commons/vfs2/FileSystemOptions;)Z
    .locals 2

    .line 96
    const-string v0, "versioning"

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public setCreatorName(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 53
    const-string v0, "creatorName"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setVersioning(Lorg/apache/commons/vfs2/FileSystemOptions;Z)V
    .locals 1

    .line 86
    const-string v0, "versioning"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
