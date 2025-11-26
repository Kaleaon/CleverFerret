.class public interface abstract Lorg/apache/commons/vfs2/operations/FileOperations;
.super Ljava/lang/Object;
.source "FileOperations.java"


# virtual methods
.method public abstract getOperation(Ljava/lang/Class;)Lorg/apache/commons/vfs2/operations/FileOperation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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

.method public abstract getOperations()[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract hasOperation(Ljava/lang/Class;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method
