.class public interface abstract Lorg/apache/commons/vfs2/provider/VfsComponent;
.super Ljava/lang/Object;
.source "VfsComponent.java"


# virtual methods
.method public abstract close()V
.end method

.method public abstract init()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public abstract setContext(Lorg/apache/commons/vfs2/provider/VfsComponentContext;)V
.end method

.method public abstract setLogger(Lorg/apache/commons/logging/Log;)V
.end method
