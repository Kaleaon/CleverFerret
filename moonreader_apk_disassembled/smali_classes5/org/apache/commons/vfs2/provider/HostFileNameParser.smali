.class public Lorg/apache/commons/vfs2/provider/HostFileNameParser;
.super Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;
.source "HostFileNameParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;
    }
.end annotation


# instance fields
.field private final defaultPort:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileNameParser;-><init>()V

    .line 36
    iput p1, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser;->defaultPort:I

    return-void
.end method


# virtual methods
.method protected extractHostName(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 5

    .line 162
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 165
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-eq v3, v4, :cond_1

    const/16 v4, 0x3b

    if-eq v3, v4, :cond_1

    const/16 v4, 0x3f

    if-eq v3, v4, :cond_1

    const/16 v4, 0x3a

    if-eq v3, v4, :cond_1

    const/16 v4, 0x40

    if-eq v3, v4, :cond_1

    const/16 v4, 0x26

    if-eq v3, v4, :cond_1

    const/16 v4, 0x3d

    if-eq v3, v4, :cond_1

    const/16 v4, 0x2b

    if-eq v3, v4, :cond_1

    const/16 v4, 0x24

    if-eq v3, v4, :cond_1

    const/16 v4, 0x2c

    if-ne v3, v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-nez v2, :cond_2

    const/4 p1, 0x0

    return-object p1

    .line 175
    :cond_2
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 176
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    return-object v0
.end method

.method protected extractPort(Ljava/lang/StringBuilder;Ljava/lang/String;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 191
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_4

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    const/16 v3, 0x3a

    if-eq v2, v3, :cond_0

    goto :goto_2

    .line 195
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/4 v3, 0x1

    :goto_0
    if-ge v3, v2, :cond_2

    .line 198
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    const/16 v5, 0x30

    if-lt v4, v5, :cond_2

    const/16 v5, 0x39

    if-le v4, v5, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 204
    :cond_2
    :goto_1
    invoke-virtual {p1, v1, v3}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 205
    invoke-virtual {p1, v0, v3}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 206
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_3

    .line 210
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    return p1

    .line 207
    :cond_3
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/missing-port.error"

    invoke-direct {p1, v0, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    :cond_4
    :goto_2
    const/4 p1, -0x1

    return p1
.end method

.method protected extractToPath(Ljava/lang/String;Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 71
    new-instance v0, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;-><init>()V

    .line 74
    invoke-static {p1, p2}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$002(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;

    .line 77
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_6

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_6

    const/4 v3, 0x1

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v4, :cond_6

    .line 80
    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser;->extractUserInfo(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    if-eqz v2, :cond_1

    const/16 v6, 0x3a

    .line 87
    invoke-virtual {v2, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_0

    goto :goto_0

    .line 92
    :cond_0
    invoke-virtual {v2, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    add-int/2addr v6, v3

    .line 93
    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    move-object v8, v5

    move-object v5, v2

    move-object v2, v8

    :goto_0
    move-object v8, v5

    move-object v5, v2

    move-object v2, v8

    goto :goto_1

    :cond_1
    move-object v2, v5

    .line 99
    :goto_1
    invoke-static {v5}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$302(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;

    .line 100
    invoke-static {v2}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$402(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$400(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$400(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "{"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$400(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "}"

    invoke-virtual {v2, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 104
    :try_start_0
    invoke-static {}, Lorg/apache/commons/vfs2/util/CryptorFactory;->getCryptor()Lorg/apache/commons/vfs2/util/Cryptor;

    move-result-object v2

    .line 105
    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$400(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$400(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v3

    invoke-virtual {v5, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/vfs2/util/Cryptor;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$402(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 107
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "Unable to decrypt password"

    invoke-direct {p2, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 112
    :cond_2
    :goto_2
    invoke-virtual {p0, p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser;->extractHostName(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 116
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$102(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;Ljava/lang/String;)Ljava/lang/String;

    .line 119
    invoke-virtual {p0, p2, p1}, Lorg/apache/commons/vfs2/provider/HostFileNameParser;->extractPort(Ljava/lang/StringBuilder;Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$202(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;I)I

    .line 122
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_4

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p2

    if-ne p2, v4, :cond_3

    goto :goto_3

    .line 123
    :cond_3
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/missing-hostname-path-sep.error"

    invoke-direct {p2, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2

    :cond_4
    :goto_3
    return-object v0

    .line 114
    :cond_5
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/missing-hostname.error"

    invoke-direct {p2, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2

    .line 78
    :cond_6
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/missing-double-slashes.error"

    invoke-direct {p2, v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
.end method

.method protected extractUserInfo(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 5

    .line 136
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 138
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0x40

    if-ne v3, v4, :cond_0

    .line 141
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v2, v2, 0x1

    .line 142
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    return-object v0

    :cond_0
    const/16 v4, 0x2f

    if-eq v3, v4, :cond_2

    const/16 v4, 0x3f

    if-ne v3, v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getDefaultPort()I
    .locals 1

    .line 40
    iget v0, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser;->defaultPort:I

    return v0
.end method

.method public parseUri(Lorg/apache/commons/vfs2/provider/VfsComponentContext;Lorg/apache/commons/vfs2/FileName;Ljava/lang/String;)Lorg/apache/commons/vfs2/FileName;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 47
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    invoke-virtual {p0, p3, p1}, Lorg/apache/commons/vfs2/provider/HostFileNameParser;->extractToPath(Ljava/lang/String;Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;

    move-result-object p2

    const/4 p3, 0x0

    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    invoke-static {p1, p3, v0, p0}, Lorg/apache/commons/vfs2/provider/UriParser;->canonicalizePath(Ljava/lang/StringBuilder;IILorg/apache/commons/vfs2/provider/FileNameParser;)V

    .line 54
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->fixSeparators(Ljava/lang/StringBuilder;)Z

    .line 55
    invoke-static {p1}, Lorg/apache/commons/vfs2/provider/UriParser;->normalisePath(Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/FileType;

    move-result-object v9

    .line 56
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 58
    new-instance v1, Lorg/apache/commons/vfs2/provider/GenericFileName;

    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$000(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$100(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$200(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)I

    move-result v4

    iget v5, p0, Lorg/apache/commons/vfs2/provider/HostFileNameParser;->defaultPort:I

    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$300(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p2}, Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;->access$400(Lorg/apache/commons/vfs2/provider/HostFileNameParser$Authority;)Ljava/lang/String;

    move-result-object v7

    invoke-direct/range {v1 .. v9}, Lorg/apache/commons/vfs2/provider/GenericFileName;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object v1
.end method
