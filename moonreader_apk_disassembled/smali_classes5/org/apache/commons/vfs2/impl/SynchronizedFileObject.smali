.class public Lorg/apache/commons/vfs2/impl/SynchronizedFileObject;
.super Lorg/apache/commons/vfs2/impl/DecoratedFileObject;
.source "SynchronizedFileObject.java"


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 38
    monitor-enter p0

    .line 39
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->close()V

    .line 40
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 45
    monitor-enter p0

    .line 46
    :try_start_0
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V

    .line 47
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public createFile()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 52
    monitor-enter p0

    .line 53
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->createFile()V

    .line 54
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public createFolder()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 59
    monitor-enter p0

    .line 60
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->createFolder()V

    .line 61
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public delete(Lorg/apache/commons/vfs2/FileSelector;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 73
    monitor-enter p0

    .line 74
    :try_start_0
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->delete(Lorg/apache/commons/vfs2/FileSelector;)I

    move-result p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    .line 75
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public delete()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 66
    monitor-enter p0

    .line 67
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->delete()Z

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 68
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public exists()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 80
    monitor-enter p0

    .line 81
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->exists()Z

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 82
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileSelector;",
            "Z",
            "Ljava/util/List<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 88
    monitor-enter p0

    .line 89
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V

    .line 90
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 95
    monitor-enter p0

    .line 96
    :try_start_0
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    .line 97
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getChild(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 102
    monitor-enter p0

    .line 103
    :try_start_0
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getChild(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    .line 104
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getChildren()[Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 109
    monitor-enter p0

    .line 110
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 111
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getContent()Lorg/apache/commons/vfs2/FileContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 116
    monitor-enter p0

    .line 117
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 118
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getType()Lorg/apache/commons/vfs2/FileType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 123
    monitor-enter p0

    .line 124
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 125
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isExecutable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 151
    monitor-enter p0

    .line 152
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->isExecutable()Z

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 153
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isHidden()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 130
    monitor-enter p0

    .line 131
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->isHidden()Z

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 132
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isReadable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 137
    monitor-enter p0

    .line 138
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->isReadable()Z

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 139
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 144
    monitor-enter p0

    .line 145
    :try_start_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->isWriteable()Z

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 146
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public moveTo(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 179
    monitor-enter p0

    .line 180
    :try_start_0
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->moveTo(Lorg/apache/commons/vfs2/FileObject;)V

    .line 181
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 193
    monitor-enter p0

    .line 194
    :try_start_0
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    .line 195
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 186
    monitor-enter p0

    .line 187
    :try_start_0
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    .line 188
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setExecutable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 172
    monitor-enter p0

    .line 173
    :try_start_0
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->setExecutable(ZZ)Z

    move-result p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    .line 174
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setReadable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 158
    monitor-enter p0

    .line 159
    :try_start_0
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->setReadable(ZZ)Z

    move-result p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    .line 160
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setWritable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 165
    monitor-enter p0

    .line 166
    :try_start_0
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->setWritable(ZZ)Z

    move-result p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    .line 167
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
