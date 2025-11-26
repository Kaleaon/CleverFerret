.class public interface abstract Lorg/apache/commons/vfs2/operations/FileOperationProvider;
.super Ljava/lang/Object;
.source "FileOperationProvider.java"


# virtual methods
.method public abstract collectOperations(Ljava/util/Collection;Lorg/apache/commons/vfs2/FileObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;>;",
            "Lorg/apache/commons/vfs2/FileObject;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract getOperation(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/Class;)Lorg/apache/commons/vfs2/operations/FileOperation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileObject;",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;)",
            "Lorg/apache/commons/vfs2/operations/FileOperation;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method
