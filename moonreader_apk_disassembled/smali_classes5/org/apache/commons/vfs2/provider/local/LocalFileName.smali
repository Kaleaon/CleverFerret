.class public Lorg/apache/commons/vfs2/provider/local/LocalFileName;
.super Lorg/apache/commons/vfs2/provider/AbstractFileName;
.source "LocalFileName.java"


# static fields
.field private static final RESERVED_URI_CHARS:[C


# instance fields
.field private final rootFile:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    .line 41
    new-array v0, v0, [C

    const/16 v1, 0x23

    const/4 v2, 0x0

    aput-char v1, v0, v2

    sput-object v0, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->RESERVED_URI_CHARS:[C

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p3, p4}, Lorg/apache/commons/vfs2/provider/AbstractFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    .line 47
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->rootFile:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected appendRootUri(Ljava/lang/StringBuilder;Z)V
    .locals 0

    .line 138
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    const-string p2, "://"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->rootFile:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
    .locals 3

    .line 68
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/LocalFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->rootFile:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p1, p2}, Lorg/apache/commons/vfs2/provider/local/LocalFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object v0
.end method

.method public getFriendlyURI()Ljava/lang/String;
    .locals 2

    .line 102
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getFriendlyURI()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 104
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 108
    :try_start_0
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 110
    sget-object v1, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->RESERVED_URI_CHARS:[C

    invoke-static {v0, v1}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-object v0
.end method

.method public getRootFile()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->rootFile:Ljava/lang/String;

    return-object v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 2

    .line 78
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getURI()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 84
    :try_start_0
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 86
    sget-object v1, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->RESERVED_URI_CHARS:[C

    invoke-static {v0, v1}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 127
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getURI()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 129
    :catch_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
