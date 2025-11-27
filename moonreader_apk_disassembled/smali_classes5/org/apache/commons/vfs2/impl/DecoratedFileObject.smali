.class public Lorg/apache/commons/vfs2/impl/DecoratedFileObject;
.super Ljava/lang/Object;
.source "DecoratedFileObject.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileObject;
.implements Ljava/lang/AutoCloseable;


# instance fields
.field private final decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    return-void
.end method


# virtual methods
.method public canRenameTo(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 1

    .line 46
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileObject;->canRenameTo(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result p1

    return p1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->close()V

    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 36
    check-cast p1, Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->compareTo(Lorg/apache/commons/vfs2/FileObject;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/FileObject;)I
    .locals 1

    .line 56
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileObject;->compareTo(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/FileObject;->copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V

    return-void
.end method

.method public createFile()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 66
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->createFile()V

    return-void
.end method

.method public createFolder()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->createFolder()V

    return-void
.end method

.method public delete(Lorg/apache/commons/vfs2/FileSelector;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileObject;->delete(Lorg/apache/commons/vfs2/FileSelector;)I

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

    .line 76
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->delete()Z

    move-result v0

    return v0
.end method

.method public deleteAll()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 86
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->deleteAll()I

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

    .line 91
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    return v0
.end method

.method public findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V
    .locals 1
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

    .line 102
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/commons/vfs2/FileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V

    return-void
.end method

.method public findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 96
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public getChild(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 107
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileObject;->getChild(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

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

    .line 112
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

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

    .line 117
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    return-object v0
.end method

.method public getDecoratedFileObject()Lorg/apache/commons/vfs2/FileObject;
    .locals 1

    .line 121
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    return-object v0
.end method

.method public getFileOperations()Lorg/apache/commons/vfs2/operations/FileOperations;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 126
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getFileOperations()Lorg/apache/commons/vfs2/operations/FileOperations;

    move-result-object v0

    return-object v0
.end method

.method public getFileSystem()Lorg/apache/commons/vfs2/FileSystem;
    .locals 1

    .line 131
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    return-object v0
.end method

.method public getName()Lorg/apache/commons/vfs2/FileName;
    .locals 1

    .line 141
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    return-object v0
.end method

.method public getPublicURIString()Ljava/lang/String;
    .locals 1

    .line 136
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getPublicURIString()Ljava/lang/String;

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

    .line 151
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    return-object v0
.end method

.method public getURL()Ljava/net/URL;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 156
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public isAttached()Z
    .locals 1

    .line 161
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isAttached()Z

    move-result v0

    return v0
.end method

.method public isContentOpen()Z
    .locals 1

    .line 166
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isContentOpen()Z

    move-result v0

    return v0
.end method

.method public isExecutable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 171
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isExecutable()Z

    move-result v0

    return v0
.end method

.method public isFile()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isFile()Z

    move-result v0

    return v0
.end method

.method public isFolder()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 181
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isFolder()Z

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

    .line 186
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isHidden()Z

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

    .line 191
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isReadable()Z

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

    .line 196
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isWriteable()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation

    .line 201
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public moveTo(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 206
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileObject;->moveTo(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method public refresh()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 211
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->refresh()V

    return-void
.end method

.method public resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 216
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 221
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public setExecutable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 226
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/FileObject;->setExecutable(ZZ)Z

    move-result p1

    return p1
.end method

.method public setReadable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 231
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/FileObject;->setReadable(ZZ)Z

    move-result p1

    return p1
.end method

.method public setWritable(ZZ)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 236
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/vfs2/FileObject;->setWritable(ZZ)Z

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 241
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DecoratedFileObject;->decoratedFileObject:Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
