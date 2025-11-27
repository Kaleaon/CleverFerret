.class final Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager$VfsStreamHandlerFactory;
.super Ljava/lang/Object;
.source "DefaultFileSystemManager.java"

# interfaces
.implements Ljava/net/URLStreamHandlerFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "VfsStreamHandlerFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;)V
    .locals 0

    .line 1020
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager$VfsStreamHandlerFactory;->this$0:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createURLStreamHandler(Ljava/lang/String;)Ljava/net/URLStreamHandler;
    .locals 1

    .line 1023
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager$VfsStreamHandlerFactory;->this$0:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-static {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->access$000(Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/FileProvider;

    if-eqz p1, :cond_0

    .line 1025
    new-instance p1, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;

    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager$VfsStreamHandlerFactory;->this$0:Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;

    invoke-static {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;->access$100(Lorg/apache/commons/vfs2/impl/DefaultFileSystemManager;)Lorg/apache/commons/vfs2/impl/DefaultVfsComponentContext;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;-><init>(Lorg/apache/commons/vfs2/provider/VfsComponentContext;)V

    return-object p1

    .line 1029
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/impl/URLStreamHandlerProxy;

    invoke-direct {p1}, Lorg/apache/commons/vfs2/impl/URLStreamHandlerProxy;-><init>()V

    return-object p1
.end method
