.class public Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;
.super Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;
.source "UrlFileNameParser.java"


# instance fields
.field private final generic:Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

.field private final url:Lorg/apache/commons/vfs2/provider/URLFileNameParser;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 37
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;-><init>()V

    .line 33
    new-instance v0, Lorg/apache/commons/vfs2/provider/URLFileNameParser;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/provider/URLFileNameParser;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;->url:Lorg/apache/commons/vfs2/provider/URLFileNameParser;

    .line 34
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;->generic:Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

    return-void
.end method


# virtual methods
.method protected countSlashes(Ljava/lang/String;)I
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 93
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 94
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-nez v2, :cond_1

    const/16 v4, 0x61

    if-lt v3, v4, :cond_0

    const/16 v4, 0x7a

    if-gt v3, v4, :cond_0

    goto :goto_1

    :cond_0
    const/16 v4, 0x3a

    if-ne v3, v4, :cond_2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x1

    if-ne v2, v4, :cond_2

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_3

    add-int/lit8 v1, v1, 0x1

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public encodeCharacter(C)Z
    .locals 1

    .line 42
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;->encodeCharacter(C)Z

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

.method protected isUrlBased(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Z
    .locals 1

    .line 77
    instance-of p1, p1, Lorg/apache/commons/vfs2/provider/URLFileName;

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    return v0

    .line 81
    :cond_0
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;->countSlashes(Ljava/lang/String;)I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_1

    return v0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 57
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;->isUrlBased(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;->url:Lorg/apache/commons/vfs2/provider/URLFileNameParser;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/URLFileNameParser;->parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1

    .line 61
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/url/UrlFileNameParser;->generic:Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;->parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    return-object p1
.end method
