.class public Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;
.super Ljava/net/JarURLConnection;
.source "JarURLConnectionImpl.java"


# static fields
.field private static final HACK_URL:Ljava/lang/String; = "jar:http://somehost/somejar.jar!/"


# instance fields
.field private final content:Lorg/apache/commons/vfs2/FileContent;

.field private final entryName:Ljava/lang/String;

.field private final file:Lorg/apache/commons/vfs2/provider/jar/JarFileObject;

.field private final parentURL:Ljava/net/URL;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/provider/jar/JarFileObject;Lorg/apache/commons/vfs2/FileContent;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 49
    new-instance v0, Ljava/net/URL;

    const-string v1, "jar:http://somehost/somejar.jar!/"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Ljava/net/JarURLConnection;-><init>(Ljava/net/URL;)V

    .line 51
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->getURL()Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->url:Ljava/net/URL;

    .line 52
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->content:Lorg/apache/commons/vfs2/FileContent;

    .line 53
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->getURL()Ljava/net/URL;

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->parentURL:Ljava/net/URL;

    .line 54
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->entryName:Ljava/lang/String;

    .line 55
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->file:Lorg/apache/commons/vfs2/provider/jar/JarFileObject;

    return-void
.end method


# virtual methods
.method public connect()V
    .locals 1

    const/4 v0, 0x1

    .line 95
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->connected:Z

    return-void
.end method

.method public getAttributes()Ljava/util/jar/Attributes;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->file:Lorg/apache/commons/vfs2/provider/jar/JarFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->getAttributes()Ljava/util/jar/Attributes;

    move-result-object v0

    return-object v0
.end method

.method public getCertificates()[Ljava/security/cert/Certificate;
    .locals 1

    .line 90
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->file:Lorg/apache/commons/vfs2/provider/jar/JarFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->doGetCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()I
    .locals 2

    .line 111
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getSize()J

    move-result-wide v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    long-to-int v1, v0

    return v1

    :catch_0
    const/4 v0, -0x1

    return v0
.end method

.method public getEntryName()Ljava/lang/String;
    .locals 1

    .line 65
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->entryName:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getJarEntry()Ljava/util/jar/JarEntry;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.jar/jar-entry-no-access.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getJarFile()Ljava/util/jar/JarFile;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider.jar/jar-file-no-access.error"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getJarFileURL()Ljava/net/URL;
    .locals 1

    .line 60
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->parentURL:Ljava/net/URL;

    return-object v0
.end method

.method public getManifest()Ljava/util/jar/Manifest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->file:Lorg/apache/commons/vfs2/provider/jar/JarFileObject;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarURLConnectionImpl;->content:Lorg/apache/commons/vfs2/FileContent;

    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileContent;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method
