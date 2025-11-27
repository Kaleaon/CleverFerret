.class public Lorg/apache/commons/vfs2/provider/gzip/GzipFileObject;
.super Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;
.source "GzipFileObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject<",
        "Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 41
    invoke-static {p3}, Lorg/apache/commons/vfs2/provider/gzip/GzipFileObject;->cast(Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)V

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)V

    return-void
.end method

.method private static cast(Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;
    .locals 1

    .line 61
    instance-of v0, p0, Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;

    if-eqz v0, :cond_0

    .line 62
    check-cast p0, Lorg/apache/commons/vfs2/provider/gzip/GzipFileSystem;

    return-object p0

    .line 64
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "GzipFileObject expects an instance of GzipFileSystem"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 50
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/gzip/GzipFileObject;->getContainer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 51
    new-instance v1, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v1
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 56
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/gzip/GzipFileObject;->getContainer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lorg/apache/commons/vfs2/FileContent;->getOutputStream(Z)Ljava/io/OutputStream;

    move-result-object p1

    .line 57
    new-instance v0, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v0
.end method
