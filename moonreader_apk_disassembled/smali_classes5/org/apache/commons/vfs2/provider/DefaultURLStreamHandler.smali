.class public Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;
.super Ljava/net/URLStreamHandler;
.source "DefaultURLStreamHandler.java"


# instance fields
.field private final context:Lorg/apache/commons/vfs2/provider/VfsComponentContext;

.field private final fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/VfsComponentContext;)V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;-><init>(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/net/URLStreamHandler;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->context:Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    .line 41
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    return-void
.end method


# virtual methods
.method protected openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->context:Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    invoke-interface {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object v0

    .line 47
    new-instance v1, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileObject;->getContent()Lorg/apache/commons/vfs2/FileContent;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lorg/apache/commons/vfs2/provider/DefaultURLConnection;-><init>(Ljava/net/URL;Lorg/apache/commons/vfs2/FileContent;)V

    return-object v1
.end method

.method protected parseURL(Ljava/net/URL;Ljava/lang/String;II)V
    .locals 11

    .line 53
    :try_start_0
    iget-object p4, p0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->context:Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    invoke-interface {p4, v0, v1}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->resolveFile(Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p4

    if-lez p3, :cond_0

    add-int/lit8 p3, p3, -0x1

    .line 56
    invoke-virtual {p2, p3}, Ljava/lang/String;->charAt(I)C

    move-result p3

    const/16 v0, 0x3a

    if-ne p3, v0, :cond_0

    .line 57
    iget-object p3, p0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->context:Lorg/apache/commons/vfs2/provider/VfsComponentContext;

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    invoke-interface {p3, p4, p2, v0}, Lorg/apache/commons/vfs2/provider/VfsComponentContext;->resolveFile(Lorg/apache/commons/vfs2/FileObject;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p2

    goto :goto_0

    .line 59
    :cond_0
    invoke-interface {p4}, Lorg/apache/commons/vfs2/FileObject;->isFile()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p4}, Lorg/apache/commons/vfs2/FileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p3

    if-eqz p3, :cond_1

    .line 61
    invoke-interface {p4}, Lorg/apache/commons/vfs2/FileObject;->getParent()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p3

    invoke-interface {p3, p2}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p2

    goto :goto_0

    .line 63
    :cond_1
    invoke-interface {p4, p2}, Lorg/apache/commons/vfs2/FileObject;->resolveFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p2

    .line 67
    :goto_0
    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileName;->getURI()Ljava/lang/String;

    move-result-object p2

    .line 68
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    invoke-static {p2, p3}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v3

    .line 71
    const-string v4, ""

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v10}, Lorg/apache/commons/vfs2/provider/DefaultURLStreamHandler;->setURL(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 74
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/FileSystemException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method protected toExternalForm(Ljava/net/URL;)Ljava/lang/String;
    .locals 2

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
