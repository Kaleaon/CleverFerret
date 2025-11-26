.class public Lorg/apache/commons/vfs2/tasks/CopyTask;
.super Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;
.source "CopyTask.java"


# instance fields
.field private overwrite:Z

.field private preserveLastModified:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Lorg/apache/commons/vfs2/tasks/AbstractSyncTask;-><init>()V

    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/tasks/CopyTask;->preserveLastModified:Z

    return-void
.end method


# virtual methods
.method protected handleOutOfDateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Copying "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getPublicURIString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getPublicURIString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/tasks/CopyTask;->log(Ljava/lang/String;)V

    .line 74
    sget-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_SELF:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {p2, p1, v0}, Lorg/apache/commons/vfs2/FileObject;->copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V

    .line 75
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/tasks/CopyTask;->preserveLastModified:Z

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/FileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/FileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v0

    .line 78
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    invoke-interface {p1, v0, v1}, Lorg/apache/commons/vfs2/FileContent;->setLastModifiedTime(J)V

    :cond_0
    return-void
.end method

.method protected handleUpToDateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 90
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/tasks/CopyTask;->overwrite:Z

    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/tasks/CopyTask;->handleOutOfDateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    :cond_0
    return-void
.end method

.method public isOverwrite()Z
    .locals 1

    .line 55
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/tasks/CopyTask;->overwrite:Z

    return v0
.end method

.method public isPreserveLastModified()Z
    .locals 1

    .line 62
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/tasks/CopyTask;->preserveLastModified:Z

    return v0
.end method

.method public setOverwrite(Z)V
    .locals 0

    .line 39
    iput-boolean p1, p0, Lorg/apache/commons/vfs2/tasks/CopyTask;->overwrite:Z

    return-void
.end method

.method public setPreserveLastModified(Z)V
    .locals 0

    .line 48
    iput-boolean p1, p0, Lorg/apache/commons/vfs2/tasks/CopyTask;->preserveLastModified:Z

    return-void
.end method
