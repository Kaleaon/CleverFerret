.class public abstract Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;
.super Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;
.source "LocalFileNameParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract createFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
.end method

.method protected abstract extractRootPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public isAbsoluteName(Ljava/lang/String;)Z
    .locals 1

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    :try_start_0
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->fixSeparators(Ljava/lang/StringBuilder;)Z

    .line 41
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;->extractRootPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    const/4 p1, 0x0

    return p1
.end method

.method public parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 61
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    invoke-static {p3, p1}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_0

    .line 66
    const-string p2, "file"

    :cond_0
    const/4 v0, 0x0

    .line 70
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-static {p1, v0, v1, p0}, Lorg/apache/commons/vfs2/provider/UriParser;->canonicalizePath(Ljava/lang/StringBuilder;IILorg/apache/commons/vfs2/provider/FileNameParser;)V

    .line 72
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->fixSeparators(Ljava/lang/StringBuilder;)Z

    .line 75
    invoke-virtual {p0, p3, p1}, Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;->extractRootPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p3

    .line 78
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->normalisePath(Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 82
    invoke-virtual {p0, p2, p3, p1, v0}, Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;->createFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1
.end method
