.class public Lorg/apache/commons/vfs2/provider/ftps/FtpsFileProvider;
.super Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;
.source "FtpsFileProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;-><init>()V

    return-void
.end method


# virtual methods
.method protected doCreateFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 47
    check-cast p1, Lorg/apache/commons/vfs2/provider/GenericFileName;

    .line 49
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientWrapper;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientWrapper;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 51
    new-instance v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystem;

    invoke-direct {v1, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v1
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    .line 56
    invoke-static {}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    move-result-object v0

    return-object v0
.end method
