.class public Lcom/github/junrar/impl/FileVolumeManager;
.super Ljava/lang/Object;
.source "FileVolumeManager.java"

# interfaces
.implements Lcom/github/junrar/VolumeManager;


# instance fields
.field private final firstVolume:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/github/junrar/impl/FileVolumeManager;->firstVolume:Ljava/io/File;

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

    .line 25
    new-instance p2, Lcom/github/junrar/impl/FileVolume;

    iget-object v0, p0, Lcom/github/junrar/impl/FileVolumeManager;->firstVolume:Ljava/io/File;

    invoke-direct {p2, p1, v0}, Lcom/github/junrar/impl/FileVolume;-><init>(Lcom/github/junrar/Archive;Ljava/io/File;)V

    return-object p2

    .line 27
    :cond_0
    check-cast p2, Lcom/github/junrar/impl/FileVolume;

    .line 28
    invoke-virtual {p1}, Lcom/github/junrar/Archive;->getMainHeader()Lcom/github/junrar/rarfile/MainHeader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/junrar/rarfile/MainHeader;->isNewNumbering()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 29
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

    .line 30
    :goto_1
    invoke-virtual {p2}, Lcom/github/junrar/impl/FileVolume;->getFile()Ljava/io/File;

    move-result-object p2

    .line 31
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    .line 30
    invoke-static {p2, v0}, Lcom/github/junrar/util/VolumeHelper;->nextVolumeName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p2

    .line 32
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 34
    new-instance p2, Lcom/github/junrar/impl/FileVolume;

    invoke-direct {p2, p1, v0}, Lcom/github/junrar/impl/FileVolume;-><init>(Lcom/github/junrar/Archive;Ljava/io/File;)V

    return-object p2
.end method
