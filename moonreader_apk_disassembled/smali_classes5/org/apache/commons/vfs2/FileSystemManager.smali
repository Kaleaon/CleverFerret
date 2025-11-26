.class public interface abstract Lorg/apache/commons/vfs2/FileSystemManager;
.super Ljava/lang/Object;
.source "FileSystemManager.java"


# virtual methods
.method public abstract addOperationProvider(Ljava/lang/String;Lorg/apache/commons/vfs2/operations/FileOperationProvider;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract addOperationProvider([Ljava/lang/String;Lorg/apache/commons/vfs2/operations/FileOperationProvider;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract canCreateFileSystem(Lorg/apache/commons/vfs2/FileObject;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract closeFileSystem(Lorg/apache/commons/vfs2/FileSystem;)V
.end method

.method public abstract createFileSystem(Ljava/lang/String;Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract createFileSystem(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract createVirtualFileSystem(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract createVirtualFileSystem(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getBaseFile()Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getCacheStrategy()Lorg/apache/commons/vfs2/CacheStrategy;
.end method

.method public abstract getFileContentInfoFactory()Lorg/apache/commons/vfs2/FileContentInfoFactory;
.end method

.method public abstract getFileObjectDecorator()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end method

.method public abstract getFileObjectDecoratorConst()Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end method

.method public abstract getFileSystemConfigBuilder(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getFilesCache()Lorg/apache/commons/vfs2/FilesCache;
.end method

.method public abstract getOperationProviders(Ljava/lang/String;)[Lorg/apache/commons/vfs2/operations/FileOperationProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getProviderCapabilities(Ljava/lang/String;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getSchemes()[Ljava/lang/String;
.end method

.method public abstract getURLStreamHandlerFactory()Ljava/net/URLStreamHandlerFactory;
.end method

.method public abstract hasProvider(Ljava/lang/String;)Z
.end method

.method public abstract resolveFile(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Ljava/net/URI;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Ljava/net/URL;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract resolveURI(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract setLogger(Lorg/apache/commons/logging/Log;)V
.end method

.method public abstract toFileObject(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method
