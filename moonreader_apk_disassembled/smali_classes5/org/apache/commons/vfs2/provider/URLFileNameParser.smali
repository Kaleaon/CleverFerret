.class public Lorg/apache/commons/vfs2/provider/URLFileNameParser;
.super Lorg/apache/commons/vfs2/provider/HostFileNameParser;
.source "URLFileNameParser.java"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/HostFileNameParser;-><init>(I)V

    return-void
.end method


# virtual methods
.method public encodeCharacter(C)Z
    .locals 1

    .line 35
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/provider/HostFileNameParser;->encodeCharacter(C)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x3f

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 42
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    invoke-virtual {p0, p3, p1}, Lorg/apache/commons/vfs2/provider/URLFileNameParser;->extractToPath(Ljava/lang/String;Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;

    move-result-object p2

    .line 48
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->extractQueryString(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v9

    const/4 p3, 0x0

    .line 51
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    invoke-static {p1, p3, v0, p0}, Lorg/apache/commons/vfs2/provider/UriParser;->canonicalizePath(Ljava/lang/StringBuilder;IILorg/apache/commons/vfs2/provider/FileNameParser;)V

    .line 52
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->fixSeparators(Ljava/lang/StringBuilder;)Z

    .line 53
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->normalisePath(Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/FileType;

    move-result-object v8

    .line 54
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 56
    new-instance v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->getPort()I

    move-result v3

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileNameParser;->getDefaultPort()I

    move-result v4

    .line 57
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->getUserName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->getPassword()Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v0 .. v9}, Lorg/apache/commons/vfs2/provider/URLFileName;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;Ljava/lang/String;)V

    return-object v0
.end method
