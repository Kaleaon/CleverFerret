.class public Lorg/apache/commons/vfs2/tasks/MoveTask;
.super Lorg/apache/commons/vfs2/tasks/CopyTask;
.source "MoveTask.java"


# instance fields
.field private tryRename:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lorg/apache/commons/vfs2/tasks/CopyTask;-><init>()V

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

    .line 46
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/tasks/MoveTask;->tryRename:Z

    if-eqz v0, :cond_2

    invoke-interface {p1, p2}, Lorg/apache/commons/vfs2/FileObject;->canRenameTo(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 52
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Rename "

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

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/tasks/MoveTask;->log(Ljava/lang/String;)V

    .line 53
    invoke-interface {p1, p2}, Lorg/apache/commons/vfs2/FileObject;->moveTo(Lorg/apache/commons/vfs2/FileObject;)V

    .line 54
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/tasks/MoveTask;->isPreserveLastModified()Z

    move-result p1

    if-nez p1, :cond_1

    .line 55
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    sget-object v0, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {p1, v0}, Lorg/apache/commons/vfs2/FileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 56
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/apache/commons/vfs2/FileContent;->setLastModifiedTime(J)V

    :cond_1
    return-void

    .line 47
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/tasks/CopyTask;->handleOutOfDateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    .line 49
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Deleting "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getPublicURIString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/tasks/MoveTask;->log(Ljava/lang/String;)V

    .line 50
    sget-object p2, Lorg/apache/commons/vfs2/Selectors;->SELECT_SELF:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {p1, p2}, Lorg/apache/commons/vfs2/FileObject;->delete(Lorg/apache/commons/vfs2/FileSelector;)I

    return-void
.end method

.method public setTryRename(Z)V
    .locals 0

    .line 38
    iput-boolean p1, p0, Lorg/apache/commons/vfs2/tasks/MoveTask;->tryRename:Z

    return-void
.end method
