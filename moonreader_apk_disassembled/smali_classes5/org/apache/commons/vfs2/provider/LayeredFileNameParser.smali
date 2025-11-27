.class public Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;
.super Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;
.source "LayeredFileNameParser.java"


# static fields
.field private static final INSTANCE:Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    new-instance v0, Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;
    .locals 1

    .line 37
    sget-object v0, Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;

    return-object v0
.end method


# virtual methods
.method public encodeCharacter(C)Z
    .locals 1

    .line 48
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;->encodeCharacter(C)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x21

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

.method protected extractRootName(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 93
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_0
    const/16 v2, 0x21

    if-lez v1, :cond_0

    .line 95
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    if-eq v3, v2, :cond_0

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    if-nez v1, :cond_1

    .line 98
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    if-eq v3, v2, :cond_1

    move v1, v0

    :cond_1
    const/4 v2, 0x0

    .line 105
    invoke-virtual {p1, v2, v1}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    if-ge v1, v0, :cond_2

    add-int/lit8 v1, v1, 0x1

    .line 107
    invoke-virtual {p1, v2, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    return-object v3

    .line 109
    :cond_2
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    return-object v3
.end method

.method public parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 63
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    invoke-static {p3, p2}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p3

    .line 69
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/LayeredFileNameParser;->extractRootName(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 72
    invoke-interface {p1, v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->parseURI(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/4 v0, 0x0

    .line 76
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-static {p2, v0, v1, p0}, Lorg/apache/commons/vfs2/provider/UriParser;->canonicalizePath(Ljava/lang/StringBuilder;IILorg/apache/commons/vfs2/provider/FileNameParser;)V

    .line 77
    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/UriParser;->fixSeparators(Ljava/lang/StringBuilder;)Z

    .line 78
    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/UriParser;->normalisePath(Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    .line 79
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 81
    new-instance v1, Lorg/apache/commons/vfs2/provider/LayeredFileName;

    invoke-direct {v1, p3, p1, p2, v0}, Lorg/apache/commons/vfs2/provider/LayeredFileName;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object v1
.end method
