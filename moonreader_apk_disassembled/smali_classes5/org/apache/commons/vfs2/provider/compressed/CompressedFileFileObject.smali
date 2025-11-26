.class public abstract Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "CompressedFileFileObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FS:",
        "Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;",
        ">",
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "TFS;>;"
    }
.end annotation


# instance fields
.field private final children:[Ljava/lang/String;

.field private final container:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileSystem;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/provider/AbstractFileName;",
            "Lorg/apache/commons/vfs2/FileObject;",
            "TFS;)V"
        }
    .end annotation

    .line 40
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 41
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->container:Lorg/apache/commons/vfs2/FileObject;

    .line 44
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object p1

    const/16 p2, 0x2e

    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p2

    if-lez p2, :cond_0

    const/4 p3, 0x0

    .line 47
    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 49
    :cond_0
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->children:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public createFile()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->container:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->createFile()V

    .line 106
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->injectType(Lorg/apache/commons/vfs2/FileType;)V

    return-void
.end method

.method protected doGetContentSize()J
    .locals 2

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 96
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->container:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 68
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 71
    :cond_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 1

    .line 79
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->children:[Ljava/lang/String;

    return-object v0
.end method

.method protected getContainer()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 100
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->container:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public isWriteable()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 60
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/compressed/CompressedFileFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->WRITE_CONTENT:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/FileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    return v0
.end method
