.class public Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;
.super Lorg/apache/commons/vfs2/impl/DecoratedFileObject;
.source "OnCallRefreshFileObject.java"


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 40
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->close()V

    return-void
.end method

.method public copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 45
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 46
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V

    return-void
.end method

.method public createFile()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 51
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 52
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->createFile()V

    return-void
.end method

.method public createFolder()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 57
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 58
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->createFolder()V

    return-void
.end method

.method public delete(Lorg/apache/commons/vfs2/FileSelector;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 69
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 70
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->delete(Lorg/apache/commons/vfs2/FileSelector;)I

    move-result p1

    return p1
.end method

.method public delete()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 63
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 64
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->delete()Z

    move-result v0

    return v0
.end method

.method public exists()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 75
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 76
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->exists()Z

    move-result v0

    return v0
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

    .line 82
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 83
    invoke-super {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V

    return-void
.end method

.method public findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 88
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 89
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public getChild(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 95
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getChild(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public getChildren()[Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 100
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 101
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    return-object v0
.end method

.method public getContent()Lorg/apache/commons/vfs2/FileContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 106
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 107
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    return-object v0
.end method

.method public getType()Lorg/apache/commons/vfs2/FileType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 112
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 113
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    return-object v0
.end method

.method public isExecutable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 118
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 119
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->isExecutable()Z

    move-result v0

    return v0
.end method

.method public isHidden()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 124
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 125
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->isHidden()Z

    move-result v0

    return v0
.end method

.method public isReadable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 130
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 131
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->isReadable()Z

    move-result v0

    return v0
.end method

.method public isWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 136
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 137
    invoke-super {p0}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->isWriteable()Z

    move-result v0

    return v0
.end method

.method public moveTo(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 160
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 161
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->moveTo(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method public resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 172
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 173
    invoke-super {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 166
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 167
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public setExecutable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 142
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 143
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->setExecutable(ZZ)Z

    move-result p1

    return p1
.end method

.method public setReadable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 148
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 149
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->setReadable(ZZ)Z

    move-result p1

    return p1
.end method

.method public setWritable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 154
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/cache/OnCallRefreshFileObject;->refresh()V

    .line 155
    invoke-super {p0, p1, p2}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->setWritable(ZZ)Z

    move-result p1

    return p1
.end method
