.class public Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystem;
.super Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;
.source "FtpsFileSystem.java"


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createWrapper()Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 30
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystem;->createWrapper()Lorg/apache/commons/vfs2/provider/ftps/FtpsClientWrapper;

    move-result-object v0

    return-object v0
.end method

.method protected createWrapper()Lorg/apache/commons/vfs2/provider/ftps/FtpsClientWrapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 46
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientWrapper;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystem;->getRoot()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/GenericFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientWrapper;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v0
.end method
