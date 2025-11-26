.class public Lorg/apache/commons/vfs2/tasks/SyncTask;
.super Lorg/apache/commons/vfs2/tasks/CopyTask;
.source "SyncTask.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lorg/apache/commons/vfs2/tasks/CopyTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected detectMissingSourceFiles()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected handleMissingSourceFile(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "deleting "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getPublicURIString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/tasks/SyncTask;->log(Ljava/lang/String;)V

    return-void
.end method
