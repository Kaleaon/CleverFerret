.class public Lorg/apache/commons/vfs2/provider/jar/JarFileObject;
.super Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;
.source "JarFileObject.java"


# instance fields
.field private attributes:Ljava/util/jar/Attributes;

.field private final fs:Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 44
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;Z)V

    .line 45
    iput-object p3, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->fs:Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;

    .line 48
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->getAttributes()Ljava/util/jar/Attributes;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 50
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method private addAll(Ljava/util/jar/Attributes;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/jar/Attributes;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 104
    invoke-virtual {p1}, Ljava/util/jar/Attributes;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 106
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 107
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method protected doGetAttributes()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 91
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->getFileSystem()Lorg/apache/commons/vfs2/FileSystem;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;

    .line 92
    invoke-virtual {v1}, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->getAttributes()Ljava/util/jar/Attributes;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->addAll(Ljava/util/jar/Attributes;Ljava/util/Map;)V

    .line 95
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->getAttributes()Ljava/util/jar/Attributes;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->addAll(Ljava/util/jar/Attributes;Ljava/util/Map;)V

    return-object v0
.end method

.method protected doGetCertificates()[Ljava/security/cert/Certificate;
    .locals 1

    .line 116
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->entry:Ljava/util/zip/ZipEntry;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 120
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->entry:Ljava/util/zip/ZipEntry;

    check-cast v0, Ljava/util/jar/JarEntry;

    invoke-virtual {v0}, Ljava/util/jar/JarEntry;->getCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0
.end method

.method getAttributes()Ljava/util/jar/Attributes;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->attributes:Ljava/util/jar/Attributes;

    if-nez v0, :cond_1

    .line 70
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->entry:Ljava/util/zip/ZipEntry;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Ljava/util/jar/Attributes;

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->attributes:Ljava/util/jar/Attributes;

    goto :goto_0

    .line 73
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->entry:Ljava/util/zip/ZipEntry;

    check-cast v0, Ljava/util/jar/JarEntry;

    invoke-virtual {v0}, Ljava/util/jar/JarEntry;->getAttributes()Ljava/util/jar/Attributes;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->attributes:Ljava/util/jar/Attributes;

    if-nez v0, :cond_1

    .line 75
    new-instance v0, Ljava/util/jar/Attributes;

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->attributes:Ljava/util/jar/Attributes;

    .line 80
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->attributes:Ljava/util/jar/Attributes;

    return-object v0
.end method

.method getManifest()Ljava/util/jar/Manifest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->fs:Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->getZipFile()Ljava/util/zip/ZipFile;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 62
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;->fs:Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->getZipFile()Ljava/util/zip/ZipFile;

    move-result-object v0

    check-cast v0, Ljava/util/jar/JarFile;

    invoke-virtual {v0}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v0

    return-object v0
.end method
