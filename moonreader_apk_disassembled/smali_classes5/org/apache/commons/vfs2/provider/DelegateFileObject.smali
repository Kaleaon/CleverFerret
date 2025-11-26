.class public Lorg/apache/commons/vfs2/provider/DelegateFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "DelegateFileObject.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<AFS:",
        "Lorg/apache/commons/vfs2/provider/AbstractFileSystem;",
        ">",
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "TAFS;>;",
        "Lorg/apache/commons/vfs2/FileListener;"
    }
.end annotation


# instance fields
.field private final children:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private file:Lorg/apache/commons/vfs2/FileObject;

.field private ignoreEvent:Z


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/provider/AbstractFileName;",
            "TAFS;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 53
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 48
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->children:Ljava/util/Set;

    .line 54
    iput-object p3, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz p3, :cond_0

    .line 56
    invoke-static {p3, p0}, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->installListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    :cond_0
    return-void
.end method

.method private maybeTypeChanged(Lorg/apache/commons/vfs2/FileType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 108
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->doGetType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    .line 109
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-ne p1, v1, :cond_0

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-eq v0, v1, :cond_0

    .line 110
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->handleCreate(Lorg/apache/commons/vfs2/FileType;)V

    return-void

    .line 111
    :cond_0
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-eq p1, v1, :cond_1

    sget-object p1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-ne v0, p1, :cond_1

    .line 112
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->handleDelete()V

    :cond_1
    return-void
.end method


# virtual methods
.method public attachChild(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 78
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->doGetType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    .line 79
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->children:Ljava/util/Set;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->childrenChanged(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V

    .line 82
    :cond_0
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->maybeTypeChanged(Lorg/apache/commons/vfs2/FileType;)V

    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 350
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->close()V

    .line 352
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_0

    .line 353
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->close()V

    :cond_0
    return-void
.end method

.method protected doCreateFolder()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    .line 204
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    const/4 v0, 0x0

    .line 206
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->createFolder()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 208
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    return-void

    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    throw v1
.end method

.method protected doDelete()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    .line 217
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    const/4 v0, 0x0

    .line 219
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 221
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    return-void

    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    throw v1
.end method

.method protected doGetAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 239
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getAttributes()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected doGetCertificates()[Ljava/security/cert/Certificate;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 255
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0
.end method

.method protected doGetContentInfo()Lorg/apache/commons/vfs2/FileContentInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 379
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getContentInfo()Lorg/apache/commons/vfs2/FileContentInfo;

    move-result-object v0

    return-object v0
.end method

.method protected doGetContentSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 231
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 282
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 263
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 290
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileContent;->getOutputStream(Z)Ljava/io/OutputStream;

    move-result-object p1

    return-object p1
.end method

.method protected doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 411
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileContent;->getRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;

    move-result-object p1

    return-object p1
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_0

    .line 122
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    return-object v0

    .line 123
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->children:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 124
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 126
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method protected doIsExecutable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 157
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_0

    .line 158
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isExecutable()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected doIsHidden()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 168
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_0

    .line 169
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isHidden()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected doIsReadable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_0

    .line 136
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isReadable()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected doIsWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_0

    .line 147
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isWriteable()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_1

    .line 183
    :try_start_0
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileNotFolderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    array-length v1, v0

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 191
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 192
    aget-object v3, v0, v2

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1

    :catch_0
    move-exception v0

    .line 187
    new-instance v1, Lorg/apache/commons/vfs2/FileNotFolderException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/FileNotFolderException;-><init>(Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    .line 196
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->children:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method protected doRemoveAttribute(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 401
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileContent;->removeAttribute(Ljava/lang/String;)V

    return-void
.end method

.method protected doRename(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 391
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    check-cast p1, Lorg/apache/commons/vfs2/provider/DelegateFileObject;

    iget-object p1, p1, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileObject;->moveTo(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method protected doSetAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 247
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/FileContent;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method protected doSetLastModifiedTime(J)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 273
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/FileContent;->setLastModifiedTime(J)V

    const/4 p1, 0x1

    return p1
.end method

.method public fileChanged(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 335
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileChangeEvent;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 338
    :cond_0
    iget-boolean p1, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    if-nez p1, :cond_1

    .line 339
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->handleChanged()V

    :cond_1
    :goto_0
    return-void
.end method

.method public fileCreated(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 301
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileChangeEvent;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 304
    :cond_0
    iget-boolean p1, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    if-nez p1, :cond_1

    .line 305
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->handleCreate(Lorg/apache/commons/vfs2/FileType;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public fileDeleted(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 317
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileChangeEvent;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 320
    :cond_0
    iget-boolean p1, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->ignoreEvent:Z

    if-nez p1, :cond_1

    .line 321
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->handleDelete()V

    :cond_1
    :goto_0
    return-void
.end method

.method public getDelegateFile()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 67
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public refresh()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 365
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->refresh()V

    .line 366
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_0

    .line 367
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->refresh()V

    :cond_0
    return-void
.end method

.method public setFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 92
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->doGetType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 95
    invoke-static {p1, p0}, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->installListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    .line 97
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->file:Lorg/apache/commons/vfs2/FileObject;

    .line 98
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/DelegateFileObject;->maybeTypeChanged(Lorg/apache/commons/vfs2/FileType;)V

    return-void
.end method
