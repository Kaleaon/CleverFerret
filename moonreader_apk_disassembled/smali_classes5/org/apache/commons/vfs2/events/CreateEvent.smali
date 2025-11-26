.class public Lorg/apache/commons/vfs2/events/CreateEvent;
.super Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;
.source "CreateEvent.java"


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method


# virtual methods
.method public notify(Lorg/apache/commons/vfs2/FileListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    invoke-interface {p1, p0}, Lorg/apache/commons/vfs2/FileListener;->fileCreated(Lorg/apache/commons/vfs2/FileChangeEvent;)V

    return-void
.end method
