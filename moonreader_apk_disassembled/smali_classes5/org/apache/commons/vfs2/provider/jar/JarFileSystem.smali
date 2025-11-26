.class public Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;
.super Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;
.source "JarFileSystem.java"


# instance fields
.field private attributes:Ljava/util/jar/Attributes;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 45
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-void
.end method


# virtual methods
.method protected addCapabilities(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;)V"
        }
    .end annotation

    .line 75
    sget-object v0, Lorg/apache/commons/vfs2/provider/jar/JarFileProvider;->capabilities:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected createZipFile(Ljava/io/File;)Ljava/util/zip/ZipFile;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 57
    :try_start_0
    new-instance v0, Ljava/util/jar/JarFile;

    invoke-direct {v0, p1}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 59
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v2, "vfs.provider.jar/open-jar-file.error"

    invoke-direct {v1, v2, p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected createZipFileObject(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;)Lorg/apache/commons/vfs2/provider/zip/ZipFileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 66
    new-instance v0, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, p0, v1}, Lorg/apache/commons/vfs2/provider/jar/JarFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Ljava/util/zip/ZipEntry;Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;Z)V

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 153
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->lookupName(Ljava/lang/String;)Ljava/util/jar/Attributes$Name;

    move-result-object p1

    .line 154
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->getAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method getAttribute(Ljava/util/jar/Attributes$Name;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 96
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->getAttributes()Ljava/util/jar/Attributes;

    move-result-object v0

    .line 97
    invoke-virtual {v0, p1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 100
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {p1}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method getAttributes()Ljava/util/jar/Attributes;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->attributes:Ljava/util/jar/Attributes;

    if-nez v0, :cond_1

    .line 80
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->getZipFile()Ljava/util/zip/ZipFile;

    move-result-object v0

    check-cast v0, Ljava/util/jar/JarFile;

    invoke-virtual {v0}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 82
    new-instance v0, Ljava/util/jar/Attributes;

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->attributes:Ljava/util/jar/Attributes;

    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual {v0}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->attributes:Ljava/util/jar/Attributes;

    if-nez v0, :cond_1

    .line 86
    new-instance v0, Ljava/util/jar/Attributes;

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->attributes:Ljava/util/jar/Attributes;

    .line 91
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/jar/JarFileSystem;->attributes:Ljava/util/jar/Attributes;

    return-object v0
.end method

.method protected getZipFile()Ljava/util/zip/ZipFile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 160
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/zip/ZipFileSystem;->getZipFile()Ljava/util/zip/ZipFile;

    move-result-object v0

    return-object v0
.end method

.method lookupName(Ljava/lang/String;)Ljava/util/jar/Attributes$Name;
    .locals 1

    .line 105
    sget-object v0, Ljava/util/jar/Attributes$Name;->CLASS_PATH:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    sget-object p1, Ljava/util/jar/Attributes$Name;->CLASS_PATH:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 107
    :cond_0
    sget-object v0, Ljava/util/jar/Attributes$Name;->CONTENT_TYPE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 108
    sget-object p1, Ljava/util/jar/Attributes$Name;->CONTENT_TYPE:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 109
    :cond_1
    sget-object v0, Ljava/util/jar/Attributes$Name;->EXTENSION_INSTALLATION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 110
    sget-object p1, Ljava/util/jar/Attributes$Name;->EXTENSION_INSTALLATION:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 111
    :cond_2
    sget-object v0, Ljava/util/jar/Attributes$Name;->EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 112
    sget-object p1, Ljava/util/jar/Attributes$Name;->EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 113
    :cond_3
    sget-object v0, Ljava/util/jar/Attributes$Name;->EXTENSION_NAME:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 114
    sget-object p1, Ljava/util/jar/Attributes$Name;->EXTENSION_NAME:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 115
    :cond_4
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 116
    sget-object p1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 117
    :cond_5
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_URL:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 118
    sget-object p1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_URL:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 119
    :cond_6
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 120
    sget-object p1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 121
    :cond_7
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR_ID:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 122
    sget-object p1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR_ID:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 123
    :cond_8
    sget-object v0, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 124
    sget-object p1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 125
    :cond_9
    sget-object v0, Ljava/util/jar/Attributes$Name;->MAIN_CLASS:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 126
    sget-object p1, Ljava/util/jar/Attributes$Name;->MAIN_CLASS:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 127
    :cond_a
    sget-object v0, Ljava/util/jar/Attributes$Name;->MANIFEST_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 128
    sget-object p1, Ljava/util/jar/Attributes$Name;->MANIFEST_VERSION:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 129
    :cond_b
    sget-object v0, Ljava/util/jar/Attributes$Name;->SEALED:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 130
    sget-object p1, Ljava/util/jar/Attributes$Name;->SEALED:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 131
    :cond_c
    sget-object v0, Ljava/util/jar/Attributes$Name;->SIGNATURE_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 132
    sget-object p1, Ljava/util/jar/Attributes$Name;->SIGNATURE_VERSION:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 133
    :cond_d
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 134
    sget-object p1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 135
    :cond_e
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 136
    sget-object p1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 137
    :cond_f
    sget-object v0, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v0}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 138
    sget-object p1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    return-object p1

    .line 140
    :cond_10
    new-instance v0, Ljava/util/jar/Attributes$Name;

    invoke-direct {v0, p1}, Ljava/util/jar/Attributes$Name;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
