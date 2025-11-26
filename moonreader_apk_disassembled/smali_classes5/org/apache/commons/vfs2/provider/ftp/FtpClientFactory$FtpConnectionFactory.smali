.class public final Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$FtpConnectionFactory;
.super Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;
.source "FtpClientFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FtpConnectionFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory<",
        "Lorg/apache/commons/net/ftp/FTPClient;",
        "Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;)V
    .locals 0

    .line 65
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$1;)V
    .locals 0

    .line 63
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$FtpConnectionFactory;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;)V

    return-void
.end method


# virtual methods
.method protected createClient(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPClient;
    .locals 0

    .line 70
    new-instance p1, Lorg/apache/commons/net/ftp/FTPClient;

    invoke-direct {p1}, Lorg/apache/commons/net/ftp/FTPClient;-><init>()V

    return-object p1
.end method

.method protected setupOpenConnection(Lorg/apache/commons/net/ftp/FTPClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0

    return-void
.end method
