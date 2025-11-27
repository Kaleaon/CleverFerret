.class public Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;
.super Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;
.source "FtpFileProvider.java"


# static fields
.field public static final ATTR_FILE_ENTRY_PARSER:Ljava/lang/String; = "FEP"

.field public static final AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

.field static final capabilities:Ljava/util/Collection;
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
    .locals 5

    const/4 v0, 0x2

    .line 45
    new-array v1, v0, [Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;->AUTHENTICATOR_TYPES:[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const/16 v1, 0xb

    .line 48
    new-array v1, v1, [Lorg/apache/commons/vfs2/Capability;

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->CREATE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->DELETE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RENAME:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x3

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_TYPE:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x4

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->LIST_CHILDREN:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x5

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->READ_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x6

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->GET_LAST_MODIFIED:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/4 v0, 0x7

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->URI:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/16 v0, 0x8

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->WRITE_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/16 v0, 0x9

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->APPEND_CONTENT:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    const/16 v0, 0xa

    sget-object v2, Lorg/apache/commons/vfs2/Capability;->RANDOM_ACCESS_READ:Lorg/apache/commons/vfs2/Capability;

    aput-object v2, v1, v0

    .line 49
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 48
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;->capabilities:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 57
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractOriginatingFileProvider;-><init>()V

    .line 58
    invoke-static {}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileNameParser;->getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

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

    .line 68
    check-cast p1, Lorg/apache/commons/vfs2/provider/GenericFileName;

    .line 70
    new-instance v0, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/ftp/FTPClientWrapper;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    .line 76
    new-instance v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    invoke-direct {v1, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;-><init>(Lorg/apache/commons/vfs2/provider/GenericFileName;Lorg/apache/commons/vfs2/provider/ftp/FtpClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v1
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

    .line 86
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method

.method public getConfigBuilder()Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 1

    .line 81
    invoke-static {}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    move-result-object v0

    return-object v0
.end method
