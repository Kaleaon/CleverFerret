.class public Lorg/apache/commons/vfs2/tasks/DeleteTask;
.super Lorg/apache/commons/vfs2/tasks/VfsTask;
.source "DeleteTask.java"


# instance fields
.field private file:Ljava/lang/String;

.field private filesList:Ljava/lang/String;

.field private srcDirUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lorg/apache/commons/vfs2/tasks/VfsTask;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .line 69
    const-string v0, "/"

    iget-object v1, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->file:Ljava/lang/String;

    if-nez v1, :cond_0

    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->srcDirUrl:Ljava/lang/String;

    if-eqz v2, :cond_1

    :cond_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->srcDirUrl:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v3, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->filesList:Ljava/lang/String;

    if-eqz v3, :cond_1

    goto :goto_0

    .line 70
    :cond_1
    const-string v0, "vfs.tasks/delete.no-source-files.error"

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 71
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :cond_2
    :goto_0
    const-string v3, "Deleting "

    if-eqz v2, :cond_5

    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->filesList:Ljava/lang/String;

    if-eqz v2, :cond_5

    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->filesList:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " in the directory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->srcDirUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/tasks/DeleteTask;->log(Ljava/lang/String;)V

    .line 77
    iget-object v1, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->srcDirUrl:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->srcDirUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->srcDirUrl:Ljava/lang/String;

    .line 80
    :cond_3
    new-instance v0, Ljava/util/StringTokenizer;

    iget-object v1, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->filesList:Ljava/lang/String;

    const-string v2, ", \t\n\r\u000c"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 81
    :goto_1
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 82
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->srcDirUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/tasks/DeleteTask;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    .line 84
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->deleteAll()I

    goto :goto_1

    :cond_4
    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    .line 87
    :cond_5
    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/tasks/DeleteTask;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getPublicURIString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/tasks/DeleteTask;->log(Ljava/lang/String;)V

    .line 89
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->deleteAll()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 92
    :goto_2
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setFile(Ljava/lang/String;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->file:Ljava/lang/String;

    return-void
.end method

.method public setIncludes(Ljava/lang/String;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->filesList:Ljava/lang/String;

    return-void
.end method

.method public setSrcDir(Ljava/lang/String;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/DeleteTask;->srcDirUrl:Ljava/lang/String;

    return-void
.end method
