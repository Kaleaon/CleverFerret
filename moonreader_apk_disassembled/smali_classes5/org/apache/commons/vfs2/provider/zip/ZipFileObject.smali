.class public Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "ZipFileObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;",
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

.field protected entry:Ljava/util/zip/ZipEntry;

.field private type:Lorg/apache/commons/vfs2/FileType;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;Z)V
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

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->children:Ljava/util/HashSet;

    .line 41
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->setZipEntry(Ljava/util/zip/ZipEntry;)V

    if-nez p4, :cond_0

    .line 43
    sget-object p1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    :cond_0
    return-void
.end method


# virtual methods
.method public attachChild(Lorg/apache/commons/vfs2/FileName;)V
    .locals 1

    .line 76
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->children:Ljava/util/HashSet;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected doAttach()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 151
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getZipFile()Ljava/util/zip/ZipFile;

    return-void
.end method

.method protected doDetach()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 156
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;

    .line 157
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->isOpen()Z

    move-result v1

    if-nez v1, :cond_0

    .line 158
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->close()V

    :cond_0
    return-void
.end method

.method protected doGetContentSize()J
    .locals 2

    .line 121
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->entry:Ljava/util/zip/ZipEntry;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getSize()J

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

    .line 142
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getZipFile()Ljava/util/zip/ZipFile;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->entry:Ljava/util/zip/ZipEntry;

    invoke-virtual {v0, v1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    .line 143
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/read-not-file.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

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
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->entry:Ljava/util/zip/ZipEntry;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 1

    .line 95
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 2

    .line 104
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 112
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->children:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0

    :catch_0
    move-exception v0

    .line 109
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

.method protected setZipEntry(Ljava/util/zip/ZipEntry;)V
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->entry:Ljava/util/zip/ZipEntry;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_2

    .line 57
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 60
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    goto :goto_1

    .line 58
    :cond_2
    :goto_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    .line 63
    :goto_1
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;->entry:Ljava/util/zip/ZipEntry;

    return-void
.end method
