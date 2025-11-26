.class public Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileObject;
.super Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;
.source "Bzip2FileObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject<",
        "Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileSystem;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileSystem;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)V

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 42
    invoke-static {p3}, Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileObject;->cast(Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileSystem;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)V

    return-void
.end method

.method private static cast(Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileSystem;
    .locals 1

    .line 67
    instance-of v0, p0, Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileSystem;

    if-eqz v0, :cond_0

    .line 68
    check-cast p0, Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileSystem;

    return-object p0

    .line 70
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bzip2FileObject requires a Bzip2FileSystem implementation"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static wrapInputStream(Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 57
    new-instance p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;

    invoke-direct {p0, p1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;-><init>(Ljava/io/InputStream;)V

    return-object p0
.end method


# virtual methods
.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 52
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileObject;->getContainer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 53
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileObject;->wrapInputStream(Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/bzip2/Bzip2FileObject;->getContainer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lorg/apache/commons/vfs2/FileContent;->getOutputStream(Z)Ljava/io/OutputStream;

    move-result-object p1

    .line 63
    new-instance v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;

    invoke-direct {v0, p1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v0
.end method
