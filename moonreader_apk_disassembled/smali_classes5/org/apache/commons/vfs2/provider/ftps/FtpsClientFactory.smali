.class public final Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory;
.super Ljava/lang/Object;
.source "FtpsClientFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createConnection(Ljava/lang/String;I[C[CLjava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPSClient;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 54
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;

    invoke-static {}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;-><init>(Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$1;)V

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 55
    invoke-virtual/range {v0 .. v6}, Lorg/apache/commons/vfs2/provider/ftps/FtpsClientFactory$FtpsConnectionFactory;->createConnection(Ljava/lang/String;I[C[CLjava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/net/ftp/FTPSClient;

    return-object p0
.end method
