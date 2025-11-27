.class public abstract Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.super Ljava/lang/Object;
.source "AbstractFileObject.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileObject;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<AFS:",
        "Lorg/apache/commons/vfs2/provider/AbstractFileSystem;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/commons/vfs2/FileObject;",
        "Ljava/lang/AutoCloseable;"
    }
.end annotation


# static fields
.field private static final EMPTY_FILE_ARRAY:[Lorg/apache/commons/vfs2/FileName;

.field private static final INITIAL_LIST_SIZE:I = 0x5


# instance fields
.field private attached:Z

.field private children:[Lorg/apache/commons/vfs2/FileName;

.field private content:Lorg/apache/commons/vfs2/FileContent;

.field private final fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

.field private final fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TAFS;"
        }
    .end annotation
.end field

.field private objects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private operations:Lorg/apache/commons/vfs2/operations/FileOperations;

.field private parent:Lorg/apache/commons/vfs2/FileObject;

.field private type:Lorg/apache/commons/vfs2/FileType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 69
    new-array v0, v0, [Lorg/apache/commons/vfs2/FileName;

    sput-object v0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->EMPTY_FILE_ARRAY:[Lorg/apache/commons/vfs2/FileName;

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/provider/AbstractFileName;",
            "TAFS;)V"
        }
    .end annotation

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    .line 102
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    .line 103
    invoke-virtual {p2, p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fileObjectHanded(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/provider/AbstractFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileName;
    .locals 0

    .line 60
    iget-object p0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    return-object p0
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/provider/AbstractFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
    .locals 0

    .line 60
    iget-object p0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    return-object p0
.end method

.method private attach()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 149
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 150
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attached:Z

    if-eqz v1, :cond_0

    .line 151
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 156
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doAttach()V

    .line 157
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attached:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    :try_start_2
    monitor-exit v0

    return-void

    :catch_0
    move-exception v2

    .line 165
    new-instance v3, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v4, "vfs.provider/get-type.error"

    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v5, v1, v6

    invoke-direct {v3, v4, v2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v3

    :catchall_0
    move-exception v1

    .line 169
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private deleteSelf()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 443
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    const/4 v1, 0x1

    .line 452
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doDelete()V

    .line 455
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->handleDelete()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 462
    :try_start_1
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    goto :goto_0

    :catch_0
    move-exception v2

    .line 459
    new-instance v3, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v4, "vfs.provider/delete.error"

    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v5, v1, v6

    invoke-direct {v3, v4, v2, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v3

    :catch_1
    move-exception v1

    .line 457
    throw v1

    .line 463
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private detach()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 473
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 474
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attached:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 476
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doDetach()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 478
    :try_start_2
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attached:Z

    .line 479
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->setFileType(Lorg/apache/commons/vfs2/FileType;)V

    .line 480
    iput-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->parent:Lorg/apache/commons/vfs2/FileObject;

    .line 484
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->removeChildrenCache()V

    goto :goto_0

    :catchall_0
    move-exception v3

    .line 478
    iput-boolean v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attached:Z

    .line 479
    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->setFileType(Lorg/apache/commons/vfs2/FileType;)V

    .line 480
    iput-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->parent:Lorg/apache/commons/vfs2/FileObject;

    .line 484
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->removeChildrenCache()V

    throw v3

    .line 488
    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method private extractNames([Lorg/apache/commons/vfs2/FileObject;)[Lorg/apache/commons/vfs2/FileName;
    .locals 3

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 897
    :cond_0
    array-length v0, p1

    new-array v0, v0, [Lorg/apache/commons/vfs2/FileName;

    const/4 v1, 0x0

    .line 898
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 899
    aget-object v2, p1, v1

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private notifyParent(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1638
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->parent:Lorg/apache/commons/vfs2/FileObject;

    if-nez v0, :cond_0

    .line 1639
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1642
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v1, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileFromCache(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->parent:Lorg/apache/commons/vfs2/FileObject;

    .line 1646
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->parent:Lorg/apache/commons/vfs2/FileObject;

    if-eqz v0, :cond_1

    .line 1647
    invoke-static {v0}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->childrenChanged(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V

    :cond_1
    return-void
.end method

.method private removeChildrenCache()V
    .locals 1

    const/4 v0, 0x0

    .line 1690
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;

    return-void
.end method

.method private resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1694
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method private resolveFiles([Lorg/apache/commons/vfs2/FileName;)[Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 1730
    :cond_0
    array-length v0, p1

    new-array v0, v0, [Lorg/apache/commons/vfs2/FileObject;

    const/4 v1, 0x0

    .line 1731
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 1732
    aget-object v2, p1, v1

    invoke-direct {p0, v2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private setFileType(Lorg/apache/commons/vfs2/FileType;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1748
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-eq p1, v0, :cond_0

    .line 1750
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->setType(Lorg/apache/commons/vfs2/FileType;)V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1752
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileSystemException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1755
    :cond_0
    :goto_0
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    return-void
.end method

.method private static traverse(Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;",
            "Lorg/apache/commons/vfs2/FileSelector;",
            "Z",
            "Ljava/util/List<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 112
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 113
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v1

    .line 116
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1, p0}, Lorg/apache/commons/vfs2/FileSelector;->traverseDescendents(Lorg/apache/commons/vfs2/FileSelectInfo;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 117
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->getDepth()I

    move-result v2

    add-int/lit8 v3, v2, 0x1

    .line 118
    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->setDepth(I)V

    .line 121
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    .line 122
    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_0

    aget-object v6, v3, v5

    .line 123
    invoke-virtual {p0, v6}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->setFile(Lorg/apache/commons/vfs2/FileObject;)V

    .line 124
    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->traverse(Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 127
    :cond_0
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->setFile(Lorg/apache/commons/vfs2/FileObject;)V

    .line 128
    invoke-virtual {p0, v2}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->setDepth(I)V

    .line 132
    :cond_1
    invoke-interface {p1, p0}, Lorg/apache/commons/vfs2/FileSelector;->includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z

    move-result p0

    if-eqz p0, :cond_3

    if-eqz p2, :cond_2

    .line 135
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 138
    :cond_2
    invoke-interface {p3, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public canRenameTo(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 1

    .line 180
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected childrenChanged(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 193
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 196
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p2, v1}, Lorg/apache/commons/vfs2/FileType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 197
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 199
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/commons/vfs2/FileName;

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;

    .line 202
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 206
    :cond_1
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->onChildrenChanged(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V

    return-void
.end method

.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 219
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->content:Lorg/apache/commons/vfs2/FileContent;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 221
    :try_start_0
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->close()V

    .line 222
    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->content:Lorg/apache/commons/vfs2/FileContent;
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v1, v0

    .line 230
    :cond_0
    :goto_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->detach()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    .line 232
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/close.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    :goto_1
    if-nez v1, :cond_1

    return-void

    .line 236
    :cond_1
    throw v1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 60
    check-cast p1, Lorg/apache/commons/vfs2/FileObject;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->compareTo(Lorg/apache/commons/vfs2/FileObject;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/FileObject;)I
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 252
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 264
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 269
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 270
    invoke-interface {p1, p2, v1, v0}, Lorg/apache/commons/vfs2/FileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V

    .line 273
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/FileObject;

    .line 275
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/vfs2/FileName;->getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;

    move-result-object v2

    .line 276
    sget-object v3, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT_OR_SELF:Lorg/apache/commons/vfs2/NameScope;

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v2

    .line 279
    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v3

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v4

    if-eq v3, v4, :cond_1

    .line 283
    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->deleteAll()I

    .line 288
    :cond_1
    :try_start_0
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/vfs2/FileType;->hasContent()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 289
    invoke-static {v0, v2}, Lorg/apache/commons/vfs2/FileUtil;->copyContent(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileObject;)V

    goto :goto_0

    .line 290
    :cond_2
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 291
    invoke-interface {v2}, Lorg/apache/commons/vfs2/FileObject;->createFolder()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 294
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v1

    const/4 v0, 0x1

    aput-object v2, v3, v0

    const-string v0, "vfs.provider/copy-file.error"

    invoke-direct {p2, v0, p1, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw p2

    :cond_3
    return-void

    .line 265
    :cond_4
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/copy-missing-file.error"

    invoke-direct {p2, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
.end method

.method public createFile()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 306
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 310
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 311
    :cond_0
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/create-file.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v1

    .line 314
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 315
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 316
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->endOutput()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    :cond_2
    :try_start_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    .line 321
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v3, "vfs.provider/create-file.error"

    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v2, v3, v4, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2

    :catch_1
    move-exception v1

    .line 319
    throw v1

    .line 323
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public createFolder()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 333
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 335
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 337
    monitor-exit v0

    return-void

    .line 339
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-ne v1, v2, :cond_2

    .line 349
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 351
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->createFolder()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 356
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doCreateFolder()V

    .line 359
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->handleCreate(Lorg/apache/commons/vfs2/FileType;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 365
    :try_start_2
    monitor-exit v0

    return-void

    :catch_0
    move-exception v1

    .line 363
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v3, "vfs.provider/create-folder.error"

    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v2, v3, v4, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2

    :catch_1
    move-exception v1

    .line 361
    throw v1

    .line 340
    :cond_2
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/create-folder-mismatched-type.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v1

    :catchall_0
    move-exception v1

    .line 365
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public delete(Lorg/apache/commons/vfs2/FileSelector;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 397
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    .line 398
    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V

    .line 401
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, p1, :cond_2

    .line 403
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/FileObject;

    invoke-static {v3}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object v3

    .line 409
    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v4

    array-length v4, v4

    if-eqz v4, :cond_0

    goto :goto_1

    .line 415
    :cond_0
    invoke-direct {v3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->deleteSelf()Z

    move-result v3

    if-eqz v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method public delete()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 378
    sget-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_SELF:Lorg/apache/commons/vfs2/FileSelector;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->delete(Lorg/apache/commons/vfs2/FileSelector;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public deleteAll()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 433
    sget-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_ALL:Lorg/apache/commons/vfs2/FileSelector;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->delete(Lorg/apache/commons/vfs2/FileSelector;)I

    move-result v0

    return v0
.end method

.method protected doAttach()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method protected doCreateFileContent()Lorg/apache/commons/vfs2/FileContent;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 512
    new-instance v0, Lorg/apache/commons/vfs2/provider/DefaultFileContent;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getFileContentInfoFactory()Lorg/apache/commons/vfs2/FileContentInfoFactory;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/vfs2/provider/DefaultFileContent;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileObject;Lorg/apache/commons/vfs2/FileContentInfoFactory;)V

    return-object v0
.end method

.method protected doCreateFolder()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 526
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/create-folder-not-supported.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected doDelete()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 541
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/delete-not-supported.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected doDetach()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method protected doGetAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 567
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    return-object v0
.end method

.method protected doGetCertificates()[Ljava/security/cert/Certificate;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract doGetContentSize()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected abstract doGetInputStream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 615
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/get-last-modified-not-supported.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected doGetOutputStream(Z)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 636
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/write-not-supported.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 649
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/random-access-not-supported.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected abstract doGetType()Lorg/apache/commons/vfs2/FileType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected doIsExecutable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected doIsHidden()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected doIsReadable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    return v0
.end method

.method protected doIsSameFile(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

.method protected doIsWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    return v0
.end method

.method protected abstract doListChildren()[Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected doListChildrenResolved()[Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected doRemoveAttribute(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 764
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/remove-attribute-not-supported.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected doRename(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 781
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/rename-not-supported.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected doSetAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 796
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.provider/set-attribute-not-supported.error"

    invoke-direct {p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected doSetExecutable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

.method protected doSetLastModifiedTime(J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 829
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p2, "vfs.provider/set-last-modified-not-supported.error"

    invoke-direct {p1, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected doSetReadable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

.method protected doSetWritable(ZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

.method protected endOutput()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 872
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-ne v0, v1, :cond_0

    .line 874
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->handleCreate(Lorg/apache/commons/vfs2/FileType;)V

    return-void

    .line 877
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->onChange()V

    return-void
.end method

.method public exists()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 889
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 907
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0, p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fileObjectDestroyed(Lorg/apache/commons/vfs2/FileObject;)V

    .line 909
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V
    .locals 2
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

    .line 937
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 939
    new-instance v0, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;-><init>()V

    .line 940
    invoke-virtual {v0, p0}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->setBaseFolder(Lorg/apache/commons/vfs2/FileObject;)V

    const/4 v1, 0x0

    .line 941
    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->setDepth(I)V

    .line 942
    invoke-virtual {v0, p0}, Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;->setFile(Lorg/apache/commons/vfs2/FileObject;)V

    .line 943
    invoke-static {v0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->traverse(Lorg/apache/commons/vfs2/provider/DefaultFileSelectorInfo;Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p1

    .line 946
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p3, "vfs.provider/find-files.error"

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {p2, p3, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public findFiles(Lorg/apache/commons/vfs2/FileSelector;)[Lorg/apache/commons/vfs2/FileObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 921
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->listFiles(Lorg/apache/commons/vfs2/FileSelector;)Ljava/util/List;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 922
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lorg/apache/commons/vfs2/FileObject;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/commons/vfs2/FileObject;

    return-object p1
.end method

.method protected getAbstractFileSystem()Lorg/apache/commons/vfs2/provider/AbstractFileSystem;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TAFS;"
        }
    .end annotation

    .line 956
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    return-object v0
.end method

.method public getChild(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 969
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getChildren()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 970
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 971
    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    .line 973
    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 974
    invoke-direct {p0, v3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getChildren()[Lorg/apache/commons/vfs2/FileObject;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 988
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 990
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 998
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attach()V

    .line 1001
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;

    if-eqz v1, :cond_0

    .line 1002
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->resolveFiles([Lorg/apache/commons/vfs2/FileName;)[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1008
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doListChildrenResolved()[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    .line 1009
    invoke-direct {p0, v3}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->extractNames([Lorg/apache/commons/vfs2/FileObject;)[Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;
    :try_end_1
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_1

    .line 1018
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-object v3

    .line 1024
    :cond_1
    :try_start_3
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doListChildren()[Ljava/lang/String;

    move-result-object v2
    :try_end_3
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v2, :cond_4

    .line 1037
    :try_start_4
    array-length v3, v2

    if-nez v3, :cond_2

    .line 1039
    sget-object v1, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->EMPTY_FILE_ARRAY:[Lorg/apache/commons/vfs2/FileName;

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;

    goto :goto_1

    .line 1042
    :cond_2
    array-length v3, v2

    new-array v3, v3, [Lorg/apache/commons/vfs2/FileName;

    .line 1043
    :goto_0
    array-length v4, v2

    if-ge v1, v4, :cond_3

    .line 1044
    aget-object v4, v2, v1

    .line 1045
    iget-object v5, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v5}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    sget-object v7, Lorg/apache/commons/vfs2/NameScope;->CHILD:Lorg/apache/commons/vfs2/NameScope;

    invoke-interface {v5, v6, v4, v7}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    aput-object v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1049
    :cond_3
    iput-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;

    .line 1052
    :goto_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->children:[Lorg/apache/commons/vfs2/FileName;

    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->resolveFiles([Lorg/apache/commons/vfs2/FileName;)[Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 1036
    :cond_4
    new-instance v1, Lorg/apache/commons/vfs2/FileNotFolderException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2}, Lorg/apache/commons/vfs2/FileNotFolderException;-><init>(Ljava/lang/Object;)V

    throw v1

    :catch_0
    move-exception v3

    .line 1029
    new-instance v4, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v5, "vfs.provider/list-children.error"

    iget-object v6, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v6, v2, v1

    invoke-direct {v4, v5, v3, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v4

    :catch_1
    move-exception v1

    .line 1027
    throw v1

    :catch_2
    move-exception v3

    .line 1014
    new-instance v4, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v5, "vfs.provider/list-children.error"

    iget-object v6, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v6, v2, v1

    invoke-direct {v4, v5, v3, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v4

    :catch_3
    move-exception v1

    .line 1012
    throw v1

    .line 991
    :cond_5
    new-instance v1, Lorg/apache/commons/vfs2/FileNotFolderException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2}, Lorg/apache/commons/vfs2/FileNotFolderException;-><init>(Ljava/lang/Object;)V

    throw v1

    :catchall_0
    move-exception v1

    .line 1053
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v1
.end method

.method public getContent()Lorg/apache/commons/vfs2/FileContent;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1064
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 1065
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attach()V

    .line 1066
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->content:Lorg/apache/commons/vfs2/FileContent;

    if-nez v1, :cond_0

    .line 1067
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doCreateFileContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->content:Lorg/apache/commons/vfs2/FileContent;

    .line 1069
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->content:Lorg/apache/commons/vfs2/FileContent;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 1070
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected getFileContentInfoFactory()Lorg/apache/commons/vfs2/FileContentInfoFactory;
    .locals 1

    .line 1079
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileSystemManager;->getFileContentInfoFactory()Lorg/apache/commons/vfs2/FileContentInfoFactory;

    move-result-object v0

    return-object v0
.end method

.method public getFileOperations()Lorg/apache/commons/vfs2/operations/FileOperations;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1088
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->operations:Lorg/apache/commons/vfs2/operations/FileOperations;

    if-nez v0, :cond_0

    .line 1089
    new-instance v0, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;

    invoke-direct {v0, p0}, Lorg/apache/commons/vfs2/operations/DefaultFileOperations;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->operations:Lorg/apache/commons/vfs2/operations/FileOperations;

    .line 1092
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->operations:Lorg/apache/commons/vfs2/operations/FileOperations;

    return-object v0
.end method

.method public getFileSystem()Lorg/apache/commons/vfs2/FileSystem;
    .locals 1

    .line 1102
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1119
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 1127
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/read.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    .line 1125
    throw v0

    :catch_2
    move-exception v0

    .line 1123
    new-instance v1, Lorg/apache/commons/vfs2/FileNotFoundException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/FileNotFoundException;-><init>(Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1

    :catch_3
    move-exception v0

    .line 1121
    new-instance v1, Lorg/apache/commons/vfs2/FileNotFoundException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/vfs2/FileNotFoundException;-><init>(Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getName()Lorg/apache/commons/vfs2/FileName;
    .locals 1

    .line 1138
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1159
    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getOutputStream(Z)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream(Z)Ljava/io/OutputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 1179
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->APPEND_CONTENT:Lorg/apache/commons/vfs2/Capability;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1180
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/write-append-not-supported.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 1183
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    if-ne v0, v1, :cond_2

    .line 1185
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1187
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->createFolder()V

    .line 1193
    :cond_2
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetOutputStream(Z)Ljava/io/OutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 1197
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const-string v1, "vfs.provider/write.error"

    invoke-direct {v0, v1, p1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v0

    :catch_1
    move-exception p1

    .line 1195
    throw p1
.end method

.method public getParent()Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1209
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getRoot()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->compareTo(Lorg/apache/commons/vfs2/FileObject;)I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 1211
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getParentLayer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    if-nez v0, :cond_0

    return-object v1

    .line 1216
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getParentLayer()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    return-object v0

    .line 1219
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 1221
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->parent:Lorg/apache/commons/vfs2/FileObject;

    if-nez v2, :cond_3

    .line 1222
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-virtual {v2}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    if-nez v2, :cond_2

    .line 1224
    monitor-exit v0

    return-object v1

    .line 1226
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v1, v2}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->parent:Lorg/apache/commons/vfs2/FileObject;

    .line 1228
    :cond_3
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->parent:Lorg/apache/commons/vfs2/FileObject;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 1229
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPublicURIString()Ljava/lang/String;
    .locals 1

    .line 1148
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getFriendlyURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1245
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/util/RandomAccessMode;->requestRead()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1246
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1249
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->isReadable()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1250
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/read-not-readable.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 1247
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/random-access-read-not-supported.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1254
    :cond_2
    :goto_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/util/RandomAccessMode;->requestWrite()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1255
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_WRITE:Lorg/apache/commons/vfs2/Capability;

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1258
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->isWriteable()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 1259
    :cond_3
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/write-read-only.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 1256
    :cond_4
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/random-access-write-not-supported.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1265
    :cond_5
    :goto_1
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetRandomAccessContent(Lorg/apache/commons/vfs2/util/RandomAccessMode;)Lorg/apache/commons/vfs2/RandomAccessContent;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 1267
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/random-access.error"

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v0, v1, v2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getType()Lorg/apache/commons/vfs2/FileType;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1279
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 1280
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attach()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1284
    :try_start_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    if-nez v1, :cond_0

    .line 1285
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doGetType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->setFileType(Lorg/apache/commons/vfs2/FileType;)V

    .line 1287
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    if-nez v1, :cond_1

    .line 1288
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->setFileType(Lorg/apache/commons/vfs2/FileType;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1294
    :cond_1
    :try_start_2
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->type:Lorg/apache/commons/vfs2/FileType;

    monitor-exit v0

    return-object v1

    :catch_0
    move-exception v1

    .line 1291
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v3, "vfs.provider/get-type.error"

    iget-object v4, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v4, v5, v6

    invoke-direct {v2, v3, v1, v5}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v2

    :catchall_0
    move-exception v1

    .line 1295
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public getURL()Ljava/net/URL;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1307
    :try_start_0
    new-instance v0, Lorg/apache/commons/vfs2/provider/AbstractFileObject$1;

    invoke-direct {v0, p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject$1;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileObject;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URL;
    :try_end_0
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 1317
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    move-result-object v0

    const-string v3, "vfs.provider/get-url.error"

    invoke-direct {v1, v3, v2, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected handleChanged()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1330
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0, p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireFileChanged(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method

.method protected handleCreate(Lorg/apache/commons/vfs2/FileType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1340
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 1341
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attached:Z

    if-eqz v1, :cond_0

    .line 1343
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->injectType(Lorg/apache/commons/vfs2/FileType;)V

    .line 1345
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->removeChildrenCache()V

    .line 1348
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->onChange()V

    .line 1352
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->notifyParent(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V

    .line 1355
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {p1, p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireFileCreated(Lorg/apache/commons/vfs2/FileObject;)V

    .line 1356
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected handleDelete()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1365
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    monitor-enter v0

    .line 1366
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attached:Z

    if-eqz v1, :cond_0

    .line 1368
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->injectType(Lorg/apache/commons/vfs2/FileType;)V

    .line 1369
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->removeChildrenCache()V

    .line 1372
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->onChange()V

    .line 1376
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    sget-object v2, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    invoke-direct {p0, v1, v2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->notifyParent(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V

    .line 1379
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v1, p0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->fireFileDeleted(Lorg/apache/commons/vfs2/FileObject;)V

    .line 1380
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public holdObject(Ljava/lang/Object;)V
    .locals 2

    .line 1391
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->objects:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1392
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->objects:Ljava/util/List;

    .line 1394
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->objects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected injectType(Lorg/apache/commons/vfs2/FileType;)V
    .locals 0

    .line 1398
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->setFileType(Lorg/apache/commons/vfs2/FileType;)V

    return-void
.end method

.method public isAttached()Z
    .locals 1

    .line 1408
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attached:Z

    return v0
.end method

.method public isContentOpen()Z
    .locals 1

    .line 1418
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->content:Lorg/apache/commons/vfs2/FileContent;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 1422
    :cond_0
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->isOpen()Z

    move-result v0

    return v0
.end method

.method public isExecutable()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1434
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doIsExecutable()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0

    :catch_0
    move-exception v0

    .line 1436
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/check-is-executable.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isFile()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1451
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/FileType;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isFolder()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1465
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/FileType;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isHidden()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1477
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doIsHidden()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0

    :catch_0
    move-exception v0

    .line 1479
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/check-is-hidden.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isReadable()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1492
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doIsReadable()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0

    :catch_0
    move-exception v0

    .line 1494
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/check-is-readable.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected isSameFile(Lorg/apache/commons/vfs2/FileObject;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1507
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attach()V

    .line 1508
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doIsSameFile(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result p1

    return p1
.end method

.method public isWriteable()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1520
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1521
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doIsWriteable()Z

    move-result v0

    return v0

    .line 1523
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1525
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isWriteable()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    .line 1529
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/check-is-writeable.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation

    .line 1541
    :try_start_0
    sget-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_ALL:Lorg/apache/commons/vfs2/FileSelector;

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->listFiles(Lorg/apache/commons/vfs2/FileSelector;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 1543
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public listFiles(Lorg/apache/commons/vfs2/FileSelector;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileSelector;",
            ")",
            "Ljava/util/List<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1555
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 1559
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    .line 1560
    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->findFiles(Lorg/apache/commons/vfs2/FileSelector;ZLjava/util/List;)V

    return-object v0

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public moveTo(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1572
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->canRenameTo(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eqz v0, :cond_1

    .line 1573
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->isWriteable()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1574
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    .line 1575
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    aput-object v4, v3, v1

    const-string v0, "vfs.provider/rename-parent-read-only.error"

    invoke-direct {p1, v0, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p1

    .line 1578
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->isWriteable()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1583
    :goto_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->isSameFile(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1584
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->deleteAll()I

    .line 1588
    :cond_2
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->canRenameTo(Lorg/apache/commons/vfs2/FileObject;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1591
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->attach()V

    .line 1593
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    .line 1595
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doRename(Lorg/apache/commons/vfs2/FileObject;)V

    .line 1597
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object v4

    invoke-virtual {v4, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->handleCreate(Lorg/apache/commons/vfs2/FileType;)V

    .line 1598
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->close()V

    .line 1600
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->handleDelete()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1604
    new-instance v4, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v5

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v5, v3, v2

    aput-object p1, v3, v1

    const-string p1, "vfs.provider/rename.error"

    invoke-direct {v4, p1, v0, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v4

    :catch_1
    move-exception p1

    .line 1602
    throw p1

    .line 1609
    :cond_3
    sget-object v0, Lorg/apache/commons/vfs2/Selectors;->SELECT_SELF:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {p1, p0, v0}, Lorg/apache/commons/vfs2/FileObject;->copyFrom(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V

    .line 1611
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1612
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/FileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 1613
    :cond_4
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1614
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FOLDER:Lorg/apache/commons/vfs2/Capability;

    invoke-interface {v0, v1}, Lorg/apache/commons/vfs2/FileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    sget-object v1, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    .line 1615
    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->hasCapability(Lorg/apache/commons/vfs2/Capability;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1616
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object p1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getLastModifiedTime()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lorg/apache/commons/vfs2/FileContent;->setLastModifiedTime(J)V

    .line 1619
    :cond_6
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->deleteSelf()Z

    return-void

    .line 1579
    :cond_7
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/rename-read-only.error"

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1
.end method

.method protected notifyAllStreamsClosed()V
    .locals 0

    return-void
.end method

.method protected onChange()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method protected onChildrenChanged(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method public refresh()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1683
    :try_start_0
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->detach()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 1685
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider/resync.error"

    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1707
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-interface {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    .line 1708
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1722
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fs:Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-interface {v1, v2, p1, p2}, Lorg/apache/commons/vfs2/FileSystemManager;->resolveName(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public setExecutable(ZZ)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1741
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doSetExecutable(ZZ)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1

    :catch_0
    move-exception p1

    .line 1743
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/set-executable.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {p2, v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public setReadable(ZZ)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1761
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doSetReadable(ZZ)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1

    :catch_0
    move-exception p1

    .line 1763
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/set-readable.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {p2, v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public setWritable(ZZ)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 1772
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->doSetWritable(ZZ)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1

    :catch_0
    move-exception p1

    .line 1774
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/set-writeable.error"

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-direct {p2, v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1785
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->fileName:Lorg/apache/commons/vfs2/provider/AbstractFileName;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
