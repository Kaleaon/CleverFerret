.class Lorg/apache/commons/vfs2/provider/AbstractFileObject$1;
.super Ljava/lang/Object;
.source "AbstractFileObject.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/vfs2/provider/AbstractFileObject;->getURL()Ljava/net/URL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedExceptionAction<",
        "Ljava/net/URL;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/AbstractFileObject;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileObject;)V
    .locals 0

    .line 1307
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject$1;->this$0:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1307
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject$1;->run()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public run()Ljava/net/URL;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 1310
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1311
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject$1;->this$0:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->access$000(Lorg/apache/commons/vfs2/provider/AbstractFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileName;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v3

    .line 1312
    new-instance v2, Ljava/net/URL;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject$1;->this$0:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    .line 1313
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->access$100(Lorg/apache/commons/vfs2/provider/AbstractFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getContext()Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileObject$1;->this$0:Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;->access$100(Lorg/apache/commons/vfs2/provider/AbstractFileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileSystem;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/AbstractFileSystem;->getFileSystemOptions()Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v1

    invoke-direct {v7, v0, v1}, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;-><init>(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    const-string v4, ""

    const/4 v5, -0x1

    invoke-direct/range {v2 .. v7}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/net/URLStreamHandler;)V

    return-object v2
.end method
