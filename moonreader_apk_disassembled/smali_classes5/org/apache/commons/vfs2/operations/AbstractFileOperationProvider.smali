.class public abstract Lorg/apache/commons/vfs2/operations/AbstractFileOperationProvider;
.super Ljava/lang/Object;
.source "AbstractFileOperationProvider.java"

# interfaces
.implements Lorg/apache/commons/vfs2/operations/FileOperationProvider;


# instance fields
.field private final operations:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/operations/AbstractFileOperationProvider;->operations:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method protected final addOperation(Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 133
    const-class v0, Lorg/apache/commons/vfs2/operations/FileOperation;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/AbstractFileOperationProvider;->operations:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-void

    .line 134
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.operation/cant-register.error"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public final collectOperations(Ljava/util/Collection;Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
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

    .line 50
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/AbstractFileOperationProvider;->operations:Ljava/util/Collection;

    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/commons/vfs2/operations/AbstractFileOperationProvider;->doCollectOperations(Ljava/util/Collection;Ljava/util/Collection;Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method protected abstract doCollectOperations(Ljava/util/Collection;Ljava/util/Collection;Lorg/apache/commons/vfs2/FileObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;>;",
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

.method public final getOperation(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/Class;)Lorg/apache/commons/vfs2/operations/FileOperation;
    .locals 0
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

    .line 75
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/operations/AbstractFileOperationProvider;->lookupOperation(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p2

    .line 77
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/operations/AbstractFileOperationProvider;->instantiateOperation(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/Class;)Lorg/apache/commons/vfs2/operations/FileOperation;

    move-result-object p1

    return-object p1
.end method

.method protected abstract instantiateOperation(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/Class;)Lorg/apache/commons/vfs2/operations/FileOperation;
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

.method protected final lookupOperation(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/operations/FileOperation;",
            ">;)",
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

    .line 103
    const-class v0, Lorg/apache/commons/vfs2/operations/FileOperation;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 109
    iget-object v0, p0, Lorg/apache/commons/vfs2/operations/AbstractFileOperationProvider;->operations:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 110
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 111
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 112
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    return-object v1

    .line 119
    :cond_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.operation/not-found.error"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    .line 104
    :cond_3
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.operation/wrong-type.error"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method
