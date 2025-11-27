.class public final Lorg/apache/commons/vfs2/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyContent(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    invoke-interface {p0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p0

    invoke-interface {p0, p1}, Lorg/apache/commons/vfs2/FileContent;->write(Lorg/apache/commons/vfs2/FileObject;)J

    return-void
.end method

.method public static getContent(Lorg/apache/commons/vfs2/FileObject;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    invoke-interface {p0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p0

    .line 40
    invoke-interface {p0}, Lorg/apache/commons/vfs2/FileContent;->getSize()J

    move-result-wide v0

    long-to-int v1, v0

    .line 41
    new-array v0, v1, [B

    .line 43
    invoke-interface {p0}, Lorg/apache/commons/vfs2/FileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    if-ltz v3, :cond_0

    sub-int v3, v1, v2

    .line 47
    :try_start_0
    invoke-virtual {p0, v0, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/2addr v2, v3

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 50
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v0

    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-object v0
.end method

.method public static writeContent(Lorg/apache/commons/vfs2/FileObject;Ljava/io/OutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    invoke-interface {p0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p0

    invoke-interface {p0, p1}, Lorg/apache/commons/vfs2/FileContent;->write(Ljava/io/OutputStream;)J

    return-void
.end method
