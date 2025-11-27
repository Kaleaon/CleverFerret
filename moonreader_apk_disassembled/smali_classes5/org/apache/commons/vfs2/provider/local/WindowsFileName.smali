.class public Lorg/apache/commons/vfs2/provider/local/WindowsFileName;
.super Lorg/apache/commons/vfs2/provider/local/LocalFileName;
.source "WindowsFileName.java"


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/vfs2/provider/local/LocalFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-void
.end method


# virtual methods
.method protected appendRootUri(Ljava/lang/StringBuilder;Z)V
    .locals 1

    .line 47
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    const-string p2, "://"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;->getRootFile()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;->getRootFile()Ljava/lang/String;

    move-result-object p2

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 51
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;->getRootFile()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
    .locals 3

    .line 39
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;->getRootFile()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1, p2}, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object v0
.end method
