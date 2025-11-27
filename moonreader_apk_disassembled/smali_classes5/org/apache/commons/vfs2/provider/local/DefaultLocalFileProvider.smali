.class public Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;
.source "DefaultLocalFileProvider.java"

# interfaces
.implements Lorg/apache/commons/vfs2/provider/LocalFileProvider;


# static fields
.field public static final capabilities:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0xf

    .line 40
    new-array v0, v0, [Lorg/apache/commons/vfs2/Capability;

    const/4 v1, 0x0

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->CREATE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->DELETE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RENAME:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_TYPE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FILE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->SET_LAST_MODIFIED_FOLDER:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->URI:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->WRITE_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->APPEND_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_SET_LENGTH:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_WRITE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v0, v1

    .line 41
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 40
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;-><init>()V

    .line 53
    sget-object v0, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_WINDOWS:Lorg/apache/commons/vfs2/util/OsFamily;

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/Os;->isFamily(Lorg/apache/commons/vfs2/util/OsFamily;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/WindowsFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/local/WindowsFileNameParser;-><init>()V

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

    return-void

    .line 56
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/local/GenericFileNameParser;-><init>()V

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

    return-void
.end method


# virtual methods
.method protected doCreateFileSystem(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileSystem;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 108
    check-cast p1, Lorg/apache/commons/vfs2/provider/local/LocalFileName;

    .line 109
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/local/LocalFileName;->getRootFile()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1, p2}, Lorg/apache/commons/vfs2/provider/local/LocalFileSystem;-><init>(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v0
.end method

.method public findLocalFile(Ljava/io/File;)Lorg/apache/commons/vfs2/FileObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 97
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->findLocalFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public findLocalFile(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x5

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 82
    const-string v1, "file:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->parseUri(Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    .line 85
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->findFile(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    return-object p1
.end method

.method public getCapabilities()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation

    .line 114
    sget-object v0, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method

.method public isAbsoluteLocalName(Ljava/lang/String;)Z
    .locals 1

    .line 68
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/local/DefaultLocalFileProvider;->getFileNameParser()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;->isAbsoluteName(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
