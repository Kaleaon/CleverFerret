.class public Lorg/apache/commons/vfs2/util/WeakRefFileListener;
.super Ljava/lang/Object;
.source "WeakRefFileListener.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileListener;


# instance fields
.field private final fs:Lorg/apache/commons/vfs2/FileSystem;

.field private final listener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lorg/apache/commons/vfs2/FileListener;",
            ">;"
        }
    .end annotation
.end field

.field private final name:Lorg/apache/commons/vfs2/FileName;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->fs:Lorg/apache/commons/vfs2/FileSystem;

    .line 39
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->name:Lorg/apache/commons/vfs2/FileName;

    .line 40
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->listener:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static installListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V
    .locals 2

    .line 50
    new-instance v0, Lorg/apache/commons/vfs2/util/WeakRefFileListener;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/vfs2/util/WeakRefFileListener;-><init>(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    .line 52
    invoke-interface {p0}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object p1

    new-instance v1, Lorg/apache/commons/vfs2/util/WeakRefFileListener;

    invoke-direct {v1, p0, v0}, Lorg/apache/commons/vfs2/util/WeakRefFileListener;-><init>(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    invoke-interface {p1, p0, v1}, Lorg/apache/commons/vfs2/FileSystem;->addListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    return-void
.end method


# virtual methods
.method public fileChanged(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 111
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->getListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 115
    :cond_0
    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileListener;->fileChanged(Lorg/apache/commons/vfs2/FileChangeEvent;)V

    return-void
.end method

.method public fileCreated(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 79
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->getListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 83
    :cond_0
    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileListener;->fileCreated(Lorg/apache/commons/vfs2/FileChangeEvent;)V

    return-void
.end method

.method public fileDeleted(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->getListener()Lorg/apache/commons/vfs2/FileListener;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 98
    :cond_0
    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileListener;->fileDeleted(Lorg/apache/commons/vfs2/FileChangeEvent;)V

    return-void
.end method

.method protected getListener()Lorg/apache/commons/vfs2/FileListener;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->listener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/FileListener;

    if-nez v0, :cond_0

    .line 65
    iget-object v1, p0, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->fs:Lorg/apache/commons/vfs2/FileSystem;

    iget-object v2, p0, Lorg/apache/commons/vfs2/util/WeakRefFileListener;->name:Lorg/apache/commons/vfs2/FileName;

    invoke-interface {v1, v2}, Lorg/apache/commons/vfs2/FileSystem;->resolveFile(Lorg/apache/commons/vfs2/FileName;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v1

    .line 66
    invoke-interface {v1}, Lorg/apache/commons/vfs2/FileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v2

    invoke-interface {v2, v1, p0}, Lorg/apache/commons/vfs2/FileSystem;->removeListener(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileListener;)V

    :cond_0
    return-object v0
.end method
