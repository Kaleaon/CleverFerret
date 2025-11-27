.class Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory$JSchLogger;
.super Ljava/lang/Object;
.source "SftpClientFactory.java"

# interfaces
.implements Lcom/jcraft/jsch/Logger;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JSchLogger"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory$1;)V
    .locals 0

    .line 267
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory$JSchLogger;-><init>()V

    return-void
.end method


# virtual methods
.method public isEnabled(I)Z
    .locals 1

    if-eqz p1, :cond_4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 282
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result p1

    return p1

    .line 272
    :cond_0
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/logging/Log;->isFatalEnabled()Z

    move-result p1

    return p1

    .line 274
    :cond_1
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/logging/Log;->isErrorEnabled()Z

    move-result p1

    return p1

    .line 276
    :cond_2
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result p1

    return p1

    .line 280
    :cond_3
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result p1

    return p1

    .line 278
    :cond_4
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result p1

    return p1
.end method

.method public log(ILjava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 306
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    return-void

    .line 291
    :cond_0
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->fatal(Ljava/lang/Object;)V

    return-void

    .line 294
    :cond_1
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    return-void

    .line 297
    :cond_2
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    return-void

    .line 303
    :cond_3
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    return-void

    .line 300
    :cond_4
    invoke-static {}, Lorg/apache/commons/vfs2/provider/sftp/SftpClientFactory;->access$100()Lorg/apache/commons/logging/Log;

    move-result-object p1

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    return-void
.end method
