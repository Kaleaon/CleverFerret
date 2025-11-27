.class public abstract Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;
.super Ljava/lang/Object;
.source "AbstractVfsComponent.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/VfsComponent;


# instance fields
.field private context:Lorg/apache/commons/vfs2/provider/VfsComponentContext;

.field private log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    return-void
.end method

.method protected final getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;
    .locals 1

    .line 80
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;->context:Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    return-object v0
.end method

.method protected final getLogger()Lorg/apache/commons/logging/Log;
    .locals 1

    .line 71
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method public init()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    return-void
.end method

.method public final setContext(Lorg/apache/commons/vfs2/provider/VfsComponentContext;)V
    .locals 0

    .line 46
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;->context:Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    return-void
.end method

.method public final setLogger(Lorg/apache/commons/logging/Log;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractVfsComponent;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method
