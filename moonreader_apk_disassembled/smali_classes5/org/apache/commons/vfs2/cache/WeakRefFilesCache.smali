.class public Lorg/apache/commons/vfs2/cache/WeakRefFilesCache;
.super Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;
.source "WeakRefFilesCache.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lorg/apache/commons/vfs2/cache/SoftRefFilesCache;-><init>()V

    return-void
.end method


# virtual methods
.method protected createReference(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/ref/ReferenceQueue;)Ljava/lang/ref/Reference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileObject;",
            "Ljava/lang/ref/ReferenceQueue<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;)",
            "Ljava/lang/ref/Reference<",
            "Lorg/apache/commons/vfs2/FileObject;",
            ">;"
        }
    .end annotation

    .line 35
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    return-object v0
.end method
