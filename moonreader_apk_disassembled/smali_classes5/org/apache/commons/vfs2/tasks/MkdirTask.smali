.class public Lorg/apache/commons/vfs2/tasks/MkdirTask;
.super Lorg/apache/commons/vfs2/tasks/VfsTask;
.source "MkdirTask.java"


# instance fields
.field private dirName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Lorg/apache/commons/vfs2/tasks/VfsTask;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/MkdirTask;->dirName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 52
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/tasks/MkdirTask;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 53
    const-string v1, "vfs.tasks/mkdir.create-folder.info"

    invoke-static {v1, v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 54
    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/tasks/MkdirTask;->log(Ljava/lang/String;)V

    .line 55
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->createFolder()V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 57
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 47
    :cond_0
    const-string v0, "vfs.tasks/no-directory-specified.error"

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setDir(Ljava/lang/String;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/MkdirTask;->dirName:Ljava/lang/String;

    return-void
.end method
