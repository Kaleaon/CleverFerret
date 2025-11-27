.class public Lcom/github/junrar/vfs2/provider/rar/RARFileObject;
.super Lorg/apache/commons/vfs2/provider/AbstractFileObject;
.source "RARFileObject.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileObject;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/vfs2/provider/AbstractFileObject<",
        "Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;",
        ">;",
        "Lorg/apache/commons/vfs2/FileObject;"
    }
.end annotation


# instance fields
.field protected archive:Lcom/github/junrar/Archive;

.field private final children:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final fs:Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;

.field protected header:Lcom/github/junrar/rarfile/FileHeader;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 51
    invoke-direct {p0, p1, p4}, Lorg/apache/commons/vfs2/provider/AbstractFileObject;-><init>(Lorg/apache/commons/vfs2/provider/AbstractFileName;Lorg/apache/commons/vfs2/provider/AbstractFileSystem;)V

    .line 47
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->children:Ljava/util/HashSet;

    .line 52
    iput-object p4, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->fs:Lcom/github/junrar/vfs2/provider/rar/RARFileSystem;

    .line 53
    iput-object p2, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->archive:Lcom/github/junrar/Archive;

    .line 54
    iput-object p3, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->header:Lcom/github/junrar/rarfile/FileHeader;

    .line 55
    invoke-virtual {p2}, Lcom/github/junrar/Archive;->getMainHeader()Lcom/github/junrar/rarfile/MainHeader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/github/junrar/rarfile/MainHeader;->isFirstVolume()Z

    return-void
.end method


# virtual methods
.method public attachChild(Lorg/apache/commons/vfs2/FileName;)V
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->children:Ljava/util/HashSet;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected doGetContentSize()J
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->header:Lcom/github/junrar/rarfile/FileHeader;

    invoke-virtual {v0}, Lcom/github/junrar/rarfile/FileHeader;->getFullUnpackSize()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 97
    invoke-virtual {p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->archive:Lcom/github/junrar/Archive;

    iget-object v1, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->header:Lcom/github/junrar/rarfile/FileHeader;

    invoke-virtual {v0, v1}, Lcom/github/junrar/Archive;->getInputStream(Lcom/github/junrar/rarfile/FileHeader;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    .line 98
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/read-not-file.error"

    .line 99
    invoke-virtual {p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected doGetLastModifiedTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->header:Lcom/github/junrar/rarfile/FileHeader;

    invoke-virtual {v0}, Lcom/github/junrar/rarfile/FileHeader;->getMTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method protected doGetType()Lorg/apache/commons/vfs2/FileType;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->header:Lcom/github/junrar/rarfile/FileHeader;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/github/junrar/rarfile/FileHeader;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 68
    :cond_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    return-object v0

    .line 66
    :cond_1
    :goto_0
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method public doIsWriteable()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected doListChildren()[Ljava/lang/String;
    .locals 2

    .line 75
    :try_start_0
    invoke-virtual {p0}, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0
    :try_end_0
    .catch Lorg/apache/commons/vfs2/FileSystemException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->children:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0

    :catch_0
    move-exception v0

    .line 80
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setHeader(Lcom/github/junrar/rarfile/FileHeader;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/github/junrar/vfs2/provider/rar/RARFileObject;->header:Lcom/github/junrar/rarfile/FileHeader;

    return-void
.end method
