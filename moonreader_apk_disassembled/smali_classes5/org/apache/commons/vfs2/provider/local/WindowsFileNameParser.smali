.class public Lorg/apache/commons/vfs2/provider/local/WindowsFileNameParser;
.super Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;
.source "WindowsFileNameParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/local/LocalFileNameParser;-><init>()V

    return-void
.end method

.method private extractDrivePrefix(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 5

    .line 79
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    return-object v2

    :cond_0
    const/4 v0, 0x0

    .line 83
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    const/16 v3, 0x2f

    if-eq v1, v3, :cond_4

    const/16 v4, 0x3a

    if-ne v1, v4, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    .line 88
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-eq v1, v4, :cond_2

    return-object v2

    :cond_2
    const/4 v1, 0x2

    .line 92
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    if-eq v4, v3, :cond_3

    return-object v2

    .line 97
    :cond_3
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 98
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    :goto_0
    return-object v2
.end method

.method private extractUNCPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 110
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x2f

    if-ge v2, v0, :cond_0

    .line 112
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    if-eq v4, v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 115
    const-string v4, "vfs.provider.local/missing-share-name.error"

    if-ge v2, v0, :cond_3

    move v5, v2

    :goto_1
    if-ge v5, v0, :cond_1

    .line 121
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v6

    if-eq v6, v3, :cond_1

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_1
    if-eq v5, v2, :cond_2

    .line 128
    invoke-virtual {p2, v1, v5}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 129
    invoke-virtual {p2, v1, v5}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    return-object p1

    .line 124
    :cond_2
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, v4, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2

    .line 116
    :cond_3
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, v4, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
.end method

.method private extractWindowsRootPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const/4 v0, 0x4

    .line 51
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x2f

    if-ge v2, v0, :cond_0

    .line 52
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    if-ne v4, v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 54
    :cond_0
    const-string v4, "vfs.provider.local/not-absolute-file-name.error"

    if-ne v2, v0, :cond_2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v5, v2, 0x1

    if-le v0, v5, :cond_2

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    if-eq v0, v3, :cond_1

    goto :goto_1

    .line 56
    :cond_1
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, v4, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2

    .line 58
    :cond_2
    :goto_1
    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 61
    invoke-direct {p0, p2}, Lorg/apache/commons/vfs2/provider/local/WindowsFileNameParser;->extractDrivePrefix(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    return-object v0

    :cond_3
    const/4 v0, 0x2

    if-lt v2, v0, :cond_4

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "//"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/local/WindowsFileNameParser;->extractUNCPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 68
    :cond_4
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, v4, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
.end method


# virtual methods
.method protected createFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
    .locals 1

    .line 38
    new-instance v0, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/apache/commons/vfs2/provider/local/WindowsFileName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    return-object v0
.end method

.method protected extractRootPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/provider/local/WindowsFileNameParser;->extractWindowsRootPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
