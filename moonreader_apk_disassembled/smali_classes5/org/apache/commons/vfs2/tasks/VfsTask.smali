.class public Lorg/apache/commons/vfs2/tasks/VfsTask;
.super Lorg/apache/tools/ant/Task;
.source "VfsTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;,
        Lorg/apache/commons/vfs2/tasks/VfsTask$CloseListener;
    }
.end annotation


# static fields
.field private static manager:Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method


# virtual methods
.method protected closeManager()V
    .locals 1

    .line 57
    sget-object v0, Lorg/apache/commons/vfs2/tasks/VfsTask;->manager:Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->close()V

    const/4 v0, 0x0

    .line 59
    sput-object v0, Lorg/apache/commons/vfs2/tasks/VfsTask;->manager:Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;

    :cond_0
    return-void
.end method

.method protected resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 43
    sget-object v0, Lorg/apache/commons/vfs2/tasks/VfsTask;->manager:Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;-><init>()V

    .line 45
    new-instance v1, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;-><init>(Lorg/apache/commons/vfs2/tasks/VfsTask;Lorg/apache/commons/vfs2/tasks/VfsTask$1;)V

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->setLogger(Lorg/apache/commons/logging/Log;)V

    .line 46
    invoke-virtual {v0}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->init()V

    .line 47
    sput-object v0, Lorg/apache/commons/vfs2/tasks/VfsTask;->manager:Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;

    .line 48
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/tasks/VfsTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    new-instance v1, Lorg/apache/commons/vfs2/tasks/VfsTask$CloseListener;

    invoke-direct {v1, p0, v2}, Lorg/apache/commons/vfs2/tasks/VfsTask$CloseListener;-><init>(Lorg/apache/commons/vfs2/tasks/VfsTask;Lorg/apache/commons/vfs2/tasks/VfsTask$1;)V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 50
    :cond_0
    sget-object v0, Lorg/apache/commons/vfs2/tasks/VfsTask;->manager:Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/tasks/VfsTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/apache/commons/vfs2/impl/StandardFileSystemManager;->resolveFile(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method
