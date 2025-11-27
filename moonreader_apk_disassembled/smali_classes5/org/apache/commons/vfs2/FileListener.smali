.class public interface abstract Lorg/apache/commons/vfs2/FileListener;
.super Ljava/lang/Object;
.source "FileListener.java"


# virtual methods
.method public abstract fileChanged(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract fileCreated(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract fileDeleted(Lorg/apache/commons/vfs2/FileChangeEvent;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
