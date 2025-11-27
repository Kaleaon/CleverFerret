.class public Lorg/apache/commons/vfs2/impl/VirtualFileName;
.super Lorg/apache/commons/vfs2/provider/AbstractFileName;
.source "VirtualFileName.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-void
.end method


# virtual methods
.method protected appendRootUri(Ljava/lang/StringBuilder;Z)V
    .locals 0

    .line 38
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/VirtualFileName;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
    .locals 2

    .line 33
    new-instance v0, Lorg/apache/commons/vfs2/impl/VirtualFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/VirtualFileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lorg/apache/commons/vfs2/impl/VirtualFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object v0
.end method
