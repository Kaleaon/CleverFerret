.class public Lorg/apache/commons/vfs2/provider/url/UrlFileName;
.super Lorg/apache/commons/vfs2/provider/URLFileName;
.source "UrlFileName.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;Ljava/lang/String;)V
    .locals 0

    .line 42
    invoke-direct/range {p0 .. p9}, Lorg/apache/commons/vfs2/provider/URLFileName;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected appendRootUri(Ljava/lang/StringBuilder;Z)V
    .locals 2

    .line 47
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/url/UrlFileName;->getHostName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, ""

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/url/UrlFileName;->getHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 48
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/URLFileName;->appendRootUri(Ljava/lang/StringBuilder;Z)V

    return-void

    .line 52
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/url/UrlFileName;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method
