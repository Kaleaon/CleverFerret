.class public abstract Lorg/apache/commons/vfs2/provider/AbstractFileName;
.super Ljava/lang/Object;
.source "AbstractFileName.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileName;


# instance fields
.field private final absPath:Ljava/lang/String;

.field private baseName:Ljava/lang/String;

.field private decodedAbsPath:Ljava/lang/String;

.field private extension:Ljava/lang/String;

.field private key:Ljava/lang/String;

.field private rootUri:Ljava/lang/String;

.field private final scheme:Ljava/lang/String;

.field private type:Lorg/apache/commons/vfs2/FileType;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->key:Ljava/lang/String;

    .line 44
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->rootUri:Ljava/lang/String;

    .line 45
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->scheme:Ljava/lang/String;

    .line 46
    iput-object p3, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->type:Lorg/apache/commons/vfs2/FileType;

    .line 47
    const-string p1, "/"

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    if-lez p3, :cond_1

    .line 48
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    const/4 v0, 0x1

    if-le p3, v0, :cond_0

    invoke-virtual {p2, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 49
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v0

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->absPath:Ljava/lang/String;

    return-void

    .line 51
    :cond_0
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->absPath:Ljava/lang/String;

    return-void

    .line 54
    :cond_1
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->absPath:Ljava/lang/String;

    return-void
.end method

.method public static checkName(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Z
    .locals 4

    .line 465
    sget-object v0, Lorg/apache/commons/vfs2/NameScope;->FILE_SYSTEM:Lorg/apache/commons/vfs2/NameScope;

    const/4 v1, 0x1

    if-ne p2, v0, :cond_0

    return v1

    .line 470
    :cond_0
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    return v2

    .line 474
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    .line 475
    invoke-static {}, Lorg/apache/commons/vfs2/VFS;->isUriStyle()Z

    move-result v0

    if-eqz v0, :cond_2

    add-int/lit8 p0, p0, -0x1

    .line 480
    :cond_2
    sget-object v0, Lorg/apache/commons/vfs2/NameScope;->CHILD:Lorg/apache/commons/vfs2/NameScope;

    const/16 v3, 0x2f

    if-ne p2, v0, :cond_5

    .line 481
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-eq p2, p0, :cond_4

    if-le p0, v1, :cond_3

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p2

    if-ne p2, v3, :cond_4

    :cond_3
    add-int/2addr p0, v1

    .line 482
    invoke-virtual {p1, v3, p0}, Ljava/lang/String;->indexOf(II)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_9

    :cond_4
    return v2

    .line 485
    :cond_5
    sget-object v0, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT:Lorg/apache/commons/vfs2/NameScope;

    if-ne p2, v0, :cond_7

    .line 486
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-eq p2, p0, :cond_6

    if-le p0, v1, :cond_9

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    if-eq p0, v3, :cond_9

    :cond_6
    return v2

    .line 489
    :cond_7
    sget-object v0, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT_OR_SELF:Lorg/apache/commons/vfs2/NameScope;

    if-ne p2, v0, :cond_8

    if-le p0, v1, :cond_9

    .line 490
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-le p2, p0, :cond_9

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    if-eq p0, v3, :cond_9

    return v2

    .line 493
    :cond_8
    sget-object p0, Lorg/apache/commons/vfs2/NameScope;->FILE_SYSTEM:Lorg/apache/commons/vfs2/NameScope;

    if-ne p2, p0, :cond_a

    :cond_9
    return v1

    .line 494
    :cond_a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method private createURI(ZZ)Ljava/lang/String;
    .locals 1

    .line 253
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->appendRootUri(Ljava/lang/StringBuilder;Z)V

    if-eqz p1, :cond_0

    .line 255
    iget-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->absPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getKey()Ljava/lang/String;
    .locals 1

    .line 236
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->key:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 237
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getURI()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->key:Ljava/lang/String;

    .line 239
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->key:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected abstract appendRootUri(Ljava/lang/StringBuilder;Z)V
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 28
    check-cast p1, Lorg/apache/commons/vfs2/FileName;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->compareTo(Lorg/apache/commons/vfs2/FileName;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/FileName;)I
    .locals 1

    .line 85
    check-cast p1, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    .line 86
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public abstract createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
.end method

.method protected createURI()Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 227
    invoke-direct {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->createURI(ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    if-eqz p1, :cond_2

    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 67
    :cond_1
    check-cast p1, Lorg/apache/commons/vfs2/provider/AbstractFileName;

    .line 69
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public getBaseName()Ljava/lang/String;
    .locals 2

    .line 123
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->baseName:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 124
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 126
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->baseName:Ljava/lang/String;

    goto :goto_0

    .line 128
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->baseName:Ljava/lang/String;

    .line 132
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->baseName:Ljava/lang/String;

    return-object v0
.end method

.method public getDepth()I
    .locals 5

    .line 337
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    const/16 v2, 0x2f

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    .line 338
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v2, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v4, -0x1

    if-le v1, v4, :cond_1

    if-ge v1, v0, :cond_1

    .line 343
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v4, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v3

    :cond_2
    :goto_1
    return v1
.end method

.method public getExtension()Ljava/lang/String;
    .locals 3

    .line 355
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->extension:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 356
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getBaseName()Ljava/lang/String;

    .line 357
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->baseName:Ljava/lang/String;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 363
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->baseName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 367
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->baseName:Ljava/lang/String;

    add-int/2addr v0, v1

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->extension:Ljava/lang/String;

    goto :goto_1

    .line 365
    :cond_1
    :goto_0
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->extension:Ljava/lang/String;

    .line 370
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->extension:Ljava/lang/String;

    return-object v0
.end method

.method public getFriendlyURI()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 249
    invoke-direct {p0, v0, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->createURI(ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lorg/apache/commons/vfs2/FileName;
    .locals 3

    .line 175
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 176
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    if-nez v0, :cond_1

    .line 181
    const-string v0, "/"

    goto :goto_0

    .line 183
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 185
    :goto_0
    sget-object v1, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    return-object v0

    :cond_2
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 2

    .line 142
    invoke-static {}, Lorg/apache/commons/vfs2/VFS;->isUriStyle()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->absPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getUriTrailer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 145
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->absPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPathDecoded()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 160
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->decodedAbsPath:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 161
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->decodedAbsPath:Ljava/lang/String;

    .line 164
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->decodedAbsPath:Ljava/lang/String;

    return-object v0
.end method

.method public getRelativeName(Lorg/apache/commons/vfs2/FileName;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 268
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 271
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 272
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 275
    const-string v2, "."

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    if-ne v1, v3, :cond_0

    return-object v2

    :cond_0
    if-ne v0, v3, :cond_1

    .line 278
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 281
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_2

    .line 283
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v7, v8, :cond_2

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
    if-ne v6, v0, :cond_3

    if-ne v6, v1, :cond_3

    return-object v2

    :cond_3
    const/16 v2, 0x2f

    if-ne v6, v0, :cond_4

    if-ge v6, v1, :cond_4

    .line 289
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_4

    add-int/2addr v6, v3

    .line 291
    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 295
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    if-le v1, v3, :cond_6

    if-lt v6, v1, :cond_5

    .line 296
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-eq v1, v2, :cond_6

    .line 298
    :cond_5
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v2, v6}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v6

    .line 299
    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    :cond_6
    const-string p1, ".."

    invoke-virtual {v0, v5, p1}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object p1

    add-int/2addr v6, v3

    invoke-virtual {p1, v2, v6}, Ljava/lang/String;->indexOf(II)I

    move-result p1

    :goto_1
    const/4 v1, -0x1

    if-eq p1, v1, :cond_7

    .line 307
    const-string v1, "../"

    invoke-virtual {v0, v5, v1}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v1, v2, p1}, Ljava/lang/String;->indexOf(II)I

    move-result p1

    goto :goto_1

    .line 311
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getRoot()Lorg/apache/commons/vfs2/FileName;
    .locals 2

    move-object v0, p0

    .line 196
    :goto_0
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 197
    invoke-interface {v0}, Lorg/apache/commons/vfs2/FileName;->getParent()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getRootURI()Ljava/lang/String;
    .locals 2

    .line 321
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->rootUri:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x1

    .line 323
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->appendRootUri(Ljava/lang/StringBuilder;Z)V

    const/16 v1, 0x2f

    .line 324
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 325
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->rootUri:Ljava/lang/String;

    .line 327
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->rootUri:Ljava/lang/String;

    return-object v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .line 210
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lorg/apache/commons/vfs2/FileType;
    .locals 1

    .line 439
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->type:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 1

    .line 220
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->uri:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 221
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->createURI()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->uri:Ljava/lang/String;

    .line 223
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->uri:Ljava/lang/String;

    return-object v0
.end method

.method protected getUriTrailer()Ljava/lang/String;
    .locals 1

    .line 149
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "/"

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 74
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isAncestor(Lorg/apache/commons/vfs2/FileName;)Z
    .locals 2

    .line 381
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getRootURI()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getRootURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 384
    :cond_0
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT:Lorg/apache/commons/vfs2/NameScope;

    invoke-static {p1, v0, v1}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->checkName(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Z

    move-result p1

    return p1
.end method

.method public isDescendent(Lorg/apache/commons/vfs2/FileName;)Z
    .locals 1

    .line 395
    sget-object v0, Lorg/apache/commons/vfs2/NameScope;->DESCENDENT:Lorg/apache/commons/vfs2/NameScope;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->isDescendent(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/NameScope;)Z

    move-result p1

    return p1
.end method

.method public isDescendent(Lorg/apache/commons/vfs2/FileName;Lorg/apache/commons/vfs2/NameScope;)Z
    .locals 2

    .line 407
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getRootURI()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getRootURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 410
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p2}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->checkName(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/NameScope;)Z

    move-result p1

    return p1
.end method

.method public isFile()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 424
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/vfs2/FileType;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method setType(Lorg/apache/commons/vfs2/FileType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 449
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    if-eq p1, v0, :cond_1

    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    if-eq p1, v0, :cond_1

    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE_OR_FOLDER:Lorg/apache/commons/vfs2/FileType;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 450
    :cond_0
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/filename-type.error"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 453
    :cond_1
    :goto_0
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/AbstractFileName;->type:Lorg/apache/commons/vfs2/FileType;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 96
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/AbstractFileName;->getURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
