.class Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory$1;
.super Ljava/io/StringWriter;
.source "FtpClientFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->createConnection(Ljava/lang/String;I[C[CLjava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;I)V
    .locals 0

    .line 106
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory$1;->this$0:Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;

    invoke-direct {p0, p2}, Ljava/io/StringWriter;-><init>(I)V

    return-void
.end method


# virtual methods
.method public flush()V
    .locals 4

    .line 109
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory$1;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 111
    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "PASS "

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x5

    if-le v2, v3, :cond_0

    .line 112
    const-string v1, "PASS ***"

    .line 114
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory$1;->this$0:Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;

    invoke-static {v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->access$100(Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    const/4 v1, 0x0

    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    return-void
.end method
