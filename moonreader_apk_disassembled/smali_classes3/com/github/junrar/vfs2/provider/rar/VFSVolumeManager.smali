.class public Lcom/github/junrar/vfs2/provider/rar/VFSVolumeManager;
.super Ljava/lang/Object;
.source "VFSVolumeManager.java"

# interfaces
.implements Lcom/github/junrar/VolumeManager;


# instance fields
.field private final firstVolume:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolumeManager;->firstVolume:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method


# virtual methods
.method public nextArchive(Lcom/github/junrar/Archive;Lcom/github/junrar/Volume;)Lcom/github/junrar/Volume;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p2, :cond_0

    .line 26
    new-instance p2, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;

    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolumeManager;->firstVolume:Lorg/apache/commons/vfs2/FileObject;

    invoke-direct {p2, p1, v0}, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;-><init>(Lcom/github/junrar/Archive;Lorg/apache/commons/vfs2/FileObject;)V

    return-object p2

    .line 28
    :cond_0
    check-cast p2, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;

    .line 29
    invoke-virtual {p1}, Lcom/github/junrar/Archive;->getMainHeader()Lcom/github/junrar/rarfile/MainHeader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/junrar/rarfile/MainHeader;->isNewNumbering()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 30
    invoke-virtual {p1}, Lcom/github/junrar/Archive;->isOldFormat()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 31
    :goto_1
    invoke-virtual {p2}, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p2

    .line 32
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object p2

    .line 31
    invoke-static {p2, v0}, Lcom/github/junrar/util/VolumeHelper;->nextVolumeName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p2

    .line 33
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/VFSVolumeManager;->firstVolume:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-interface {v0, p2}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p2

    .line 36
    new-instance v0, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;

    invoke-direct {v0, p1, p2}, Lcom/github/junrar/vfs2/provider/rar/VFSVolume;-><init>(Lcom/github/junrar/Archive;Lorg/apache/commons/vfs2/FileObject;)V

    return-object v0
.end method
