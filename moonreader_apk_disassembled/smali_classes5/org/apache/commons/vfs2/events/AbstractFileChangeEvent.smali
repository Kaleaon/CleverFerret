.class public abstract Lorg/apache/commons/vfs2/events/AbstractFileChangeEvent;
.super Lorg/apache/commons/vfs2/FileChangeEvent;
.source "AbstractFileChangeEvent.java"


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/FileObject;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/FileChangeEvent;-><init>(Lorg/apache/commons/vfs2/FileObject;)V

    return-void
.end method


# virtual methods
.method public abstract notify(Lorg/apache/commons/vfs2/FileListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
