.class public Lorg/apache/commons/vfs2/provider/LayeredFileName;
.super Lorg/apache/commons/vfs2/provider/AbstractFileName;
.source "LayeredFileName.java"


# instance fields
.field private final outerUri:Lorg/apache/commons/vfs2/FileName;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p3, p4}, Lorg/apache/commons/vfs2/provider/AbstractFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    .line 30
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/LayeredFileName;->outerUri:Lorg/apache/commons/vfs2/FileName;

    return-void
.end method


# virtual methods
.method protected appendRootUri(Ljava/lang/StringBuilder;Z)V
    .locals 0

    .line 56
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/LayeredFileName;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/LayeredFileName;->getOuterName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    const-string p2, "!"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
    .locals 3

    .line 51
    new-instance v0, Lorg/apache/commons/vfs2/provider/LayeredFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/LayeredFileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/LayeredFileName;->getOuterName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1, p2}, Lorg/apache/commons/vfs2/provider/LayeredFileName;-><init>(Ljava/lang/String;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object v0
.end method

.method public getOuterName()Lorg/apache/commons/vfs2/FileName;
    .locals 1

    .line 39
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/LayeredFileName;->outerUri:Lorg/apache/commons/vfs2/FileName;

    return-object v0
.end method
