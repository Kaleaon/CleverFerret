.class public Lorg/apache/commons/vfs2/provider/tar/TarFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "TarFileObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;",
        ">;"
    }
.end annotation


# instance fields
.field private final children:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private entry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

.field private type:Lorg/apache/commons/vfs2/FileType;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 40
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 35
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->children:Ljava/util/HashSet;

    .line 41
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->setTarEntry(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V

    if-nez p4, :cond_0

    .line 43
    sget-object p1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    :cond_0
    return-void
.end method


# virtual methods
.method protected attachChild(Lorg/apache/commons/vfs2/FileName;)V
    .locals 1

    .line 72
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->children:Ljava/util/HashSet;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected doGetContentSize()J
    .locals 2

    .line 117
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->entry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 121
    :cond_0
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 146
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->entry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/tar/TarFileSystem;->getInputStream(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    .line 147
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/read-not-file.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->entry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 133
    :cond_0
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getModTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 1

    .line 91
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 2

    .line 100
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 108
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->children:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0

    :catch_0
    move-exception v0

    .line 105
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected setTarEntry(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)V
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->entry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_2

    .line 57
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 60
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    goto :goto_1

    .line 58
    :cond_2
    :goto_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    .line 63
    :goto_1
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/tar/TarFileObject;->entry:Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    return-void
.end method
