.class public final Lorg/apache/commons/vfs2/provider/UriParser;
.super Ljava/lang/Object;
.source "UriParser.java"


# static fields
.field private static final BITS_IN_HALF_BYTE:I = 0x4

.field private static final HEX_BASE:I = 0x10

.field private static final LOW_MASK:C = '\u000f'

.field private static final SEPARATOR_CHAR:C = '/'

.field public static final TRANS_SEPARATOR:C = '\\'


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendEncoded(Ljava/lang/StringBuilder;Ljava/lang/String;[C)V
    .locals 1

    .line 315
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 316
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-static {p0, v0, p1, p2}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/StringBuilder;II[C)V

    return-void
.end method

.method public static canonicalizePath(Ljava/lang/StringBuilder;IILorg/apache/commons/vfs2/provider/FileNameParser;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    :goto_0
    if-lez p2, :cond_6

    .line 409
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    const/4 v1, -0x1

    const/16 v2, 0x25

    const/16 v3, 0x10

    const/4 v4, 0x1

    if-ne v0, v2, :cond_4

    .line 411
    const-string v0, "vfs.provider/invalid-escape-sequence.error"

    const/4 v5, 0x3

    if-lt p2, v5, :cond_3

    add-int/lit8 v5, p1, 0x1

    .line 417
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v6

    invoke-static {v6, v3}, Ljava/lang/Character;->digit(CI)I

    move-result v6

    add-int/lit8 v7, p1, 0x2

    .line 418
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-static {v8, v3}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    if-eq v6, v1, :cond_2

    if-eq v3, v1, :cond_2

    shl-int/lit8 v0, v6, 0x4

    or-int/2addr v0, v3

    int-to-char v0, v0

    if-eq v0, v2, :cond_1

    .line 425
    invoke-interface {p3, v0}, Lorg/apache/commons/vfs2/provider/FileNameParser;->encodeCharacter(C)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 435
    :cond_0
    invoke-virtual {p0, p1, v0}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    add-int/lit8 v0, p1, 0x3

    .line 436
    invoke-virtual {p0, v5, v0}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, -0x2

    goto :goto_2

    :cond_1
    :goto_1
    add-int/lit8 p2, p2, -0x2

    move p1, v7

    goto :goto_2

    .line 420
    :cond_2
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    add-int/lit8 p3, p1, 0x3

    .line 421
    invoke-virtual {p0, p1, p3}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, v0, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2

    .line 412
    :cond_3
    new-instance p3, Lorg/apache/commons/vfs2/FileSystemException;

    add-int/2addr p2, p1

    .line 413
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p3, v0, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p3

    .line 438
    :cond_4
    invoke-interface {p3, v0}, Lorg/apache/commons/vfs2/provider/FileNameParser;->encodeCharacter(C)Z

    move-result v5

    if-eqz v5, :cond_5

    shr-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0xf

    .line 440
    invoke-static {v5, v3}, Ljava/lang/Character;->forDigit(II)C

    move-result v5

    and-int/lit8 v0, v0, 0xf

    .line 441
    invoke-static {v0, v3}, Ljava/lang/Character;->forDigit(II)C

    move-result v0

    const/4 v3, 0x2

    new-array v3, v3, [C

    const/4 v6, 0x0

    aput-char v5, v3, v6

    aput-char v0, v3, v4

    .line 442
    invoke-virtual {p0, p1, v2}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    add-int/lit8 v0, p1, 0x1

    .line 443
    invoke-virtual {p0, v0, v3}, Ljava/lang/StringBuilder;->insert(I[C)Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x2

    :cond_5
    :goto_2
    add-int/2addr p2, v1

    add-int/2addr p1, v4

    goto/16 :goto_0

    :cond_6
    return-void
.end method

.method public static checkUriEncoding(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 401
    invoke-static {p0}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public static decode(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/16 v0, 0x25

    .line 261
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_1

    return-object p0

    .line 264
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 265
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-static {v0, p0, v1}, Lorg/apache/commons/vfs2/provider/UriParser;->decode(Ljava/lang/StringBuilder;II)V

    .line 266
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static decode(Ljava/lang/StringBuilder;II)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    :goto_0
    if-lez p2, :cond_3

    .line 282
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    const/16 v1, 0x25

    const/4 v2, -0x1

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 286
    :cond_0
    const-string v0, "vfs.provider/invalid-escape-sequence.error"

    const/4 v1, 0x3

    if-lt p2, v1, :cond_2

    add-int/lit8 v1, p1, 0x1

    .line 292
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    add-int/lit8 v5, p1, 0x2

    .line 293
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    invoke-static {v5, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    if-eq v3, v2, :cond_1

    if-eq v4, v2, :cond_1

    shl-int/lit8 v0, v3, 0x4

    or-int/2addr v0, v4

    int-to-char v0, v0

    .line 301
    invoke-virtual {p0, p1, v0}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    add-int/lit8 v0, p1, 0x3

    .line 302
    invoke-virtual {p0, v1, v0}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, -0x2

    :goto_1
    add-int/2addr p2, v2

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 295
    :cond_1
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    add-int/lit8 v1, p1, 0x3

    .line 296
    invoke-virtual {p0, p1, v1}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, v0, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2

    .line 287
    :cond_2
    new-instance v1, Lorg/apache/commons/vfs2/FileSystemException;

    add-int/2addr p2, p1

    .line 288
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, v0, p0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v1

    :cond_3
    return-void
.end method

.method public static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 359
    invoke-static {p0, v0}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static encode(Ljava/lang/String;[C)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 373
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 374
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-static {v0, p0, v1, p1}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/StringBuilder;II[C)V

    .line 375
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static encode(Ljava/lang/StringBuilder;II[C)V
    .locals 7

    :goto_0
    if-lez p2, :cond_4

    .line 332
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    const/16 v1, 0x25

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    if-eqz p3, :cond_2

    const/4 v5, 0x0

    :goto_2
    if-nez v4, :cond_2

    .line 335
    array-length v6, p3

    if-ge v5, v6, :cond_2

    .line 336
    aget-char v6, p3, v5

    if-ne v0, v6, :cond_1

    const/4 v4, 0x1

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_2
    if-eqz v4, :cond_3

    shr-int/lit8 v4, v0, 0x4

    and-int/lit8 v4, v4, 0xf

    const/16 v5, 0x10

    .line 343
    invoke-static {v4, v5}, Ljava/lang/Character;->forDigit(II)C

    move-result v4

    and-int/lit8 v0, v0, 0xf

    .line 344
    invoke-static {v0, v5}, Ljava/lang/Character;->forDigit(II)C

    move-result v0

    const/4 v5, 0x2

    new-array v5, v5, [C

    aput-char v4, v5, v2

    aput-char v0, v5, v3

    .line 345
    invoke-virtual {p0, p1, v1}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    add-int/lit8 v0, p1, 0x1

    .line 346
    invoke-virtual {p0, v0, v5}, Ljava/lang/StringBuilder;->insert(I[C)Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x2

    :cond_3
    add-int/2addr p1, v3

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public static encode([Ljava/lang/String;)[Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/4 v0, 0x0

    .line 388
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 389
    aget-object v1, p0, v0

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/UriParser;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public static extractFirstElement(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 7

    .line 59
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/4 v2, 0x0

    .line 64
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    move v5, v3

    :goto_1
    if-ge v5, v0, :cond_3

    .line 68
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v6

    if-ne v6, v4, :cond_2

    .line 70
    invoke-virtual {p0, v3, v5}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    add-int/2addr v5, v1

    .line 71
    invoke-virtual {p0, v3, v5}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    return-object v0

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 77
    :cond_3
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 78
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    return-object v0
.end method

.method public static extractQueryString(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    .line 456
    :goto_0
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 457
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    const/16 v2, 0x3f

    if-ne v1, v2, :cond_0

    add-int/lit8 v1, v0, 0x1

    .line 458
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 459
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {p0, v0, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static extractScheme(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 198
    invoke-static {p0, v0}, Lorg/apache/commons/vfs2/provider/UriParser;->extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static extractScheme(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 210
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 211
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x0

    if-ge v2, v1, :cond_8

    .line 216
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3a

    if-ne v4, v5, :cond_3

    .line 220
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 221
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v4, 0x1

    if-gt v1, v4, :cond_1

    sget-object v1, Lorg/apache/commons/vfs2/util/Os;->OS_FAMILY_WINDOWS:Lorg/apache/commons/vfs2/util/OsFamily;

    invoke-static {v1}, Lorg/apache/commons/vfs2/util/Os;->isFamily(Lorg/apache/commons/vfs2/util/OsFamily;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v3

    :cond_1
    if-eqz p1, :cond_2

    add-int/2addr v2, v4

    .line 226
    invoke-virtual {p1, v0, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 228
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    const/16 v5, 0x61

    if-lt v4, v5, :cond_4

    const/16 v5, 0x7a

    if-le v4, v5, :cond_7

    :cond_4
    const/16 v5, 0x41

    if-lt v4, v5, :cond_5

    const/16 v5, 0x5a

    if-gt v4, v5, :cond_5

    goto :goto_1

    :cond_5
    if-lez v2, :cond_8

    const/16 v5, 0x30

    if-lt v4, v5, :cond_6

    const/16 v5, 0x39

    if-le v4, v5, :cond_7

    :cond_6
    const/16 v5, 0x2b

    if-eq v4, v5, :cond_7

    const/16 v5, 0x2d

    if-eq v4, v5, :cond_7

    const/16 v5, 0x2e

    if-ne v4, v5, :cond_8

    :cond_7
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_8
    return-object v3
.end method

.method public static fixSeparators(Ljava/lang/StringBuilder;)Z
    .locals 5

    .line 180
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 182
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0x5c

    if-ne v3, v4, :cond_0

    const/16 v2, 0x2f

    .line 184
    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    const/4 v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public static normalisePath(Ljava/lang/StringBuilder;)Lorg/apache/commons/vfs2/FileType;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 99
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FOLDER:Lorg/apache/commons/vfs2/FileType;

    .line 100
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    .line 104
    :cond_0
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    const/16 v3, 0x2f

    if-eq v1, v3, :cond_1

    .line 105
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->FILE:Lorg/apache/commons/vfs2/FileType;

    :cond_1
    const/4 v1, 0x0

    .line 113
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    if-ne v4, v3, :cond_3

    .line 114
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-ne v1, v2, :cond_2

    goto/16 :goto_3

    :cond_2
    const/4 v1, 0x1

    .line 122
    :cond_3
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    move v5, v1

    :goto_0
    if-ge v5, v4, :cond_a

    move v6, v5

    :goto_1
    if-ge v6, v4, :cond_4

    .line 126
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    if-eq v7, v3, :cond_4

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_4
    sub-int v7, v6, v5

    if-nez v7, :cond_5

    add-int/lit8 v4, v6, 0x1

    .line 132
    invoke-virtual {p0, v6, v4}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 133
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    goto :goto_0

    :cond_5
    const/16 v8, 0x2e

    if-ne v7, v2, :cond_6

    .line 136
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v9

    if-ne v9, v8, :cond_6

    add-int/lit8 v6, v6, 0x1

    .line 138
    invoke-virtual {p0, v5, v6}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 139
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    goto :goto_0

    :cond_6
    const/4 v9, 0x2

    if-ne v7, v9, :cond_9

    .line 142
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_9

    add-int/lit8 v7, v5, 0x1

    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_9

    if-eq v5, v1, :cond_8

    add-int/lit8 v5, v5, -0x2

    :goto_2
    if-ltz v5, :cond_7

    .line 151
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    if-eq v4, v3, :cond_7

    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    :cond_7
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v6, v6, 0x1

    .line 155
    invoke-virtual {p0, v5, v6}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 156
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    goto :goto_0

    .line 146
    :cond_8
    new-instance p0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "vfs.provider/invalid-relative-path.error"

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9
    add-int/lit8 v5, v6, 0x1

    goto :goto_0

    .line 165
    :cond_a
    invoke-static {}, Lorg/apache/commons/vfs2/VFS;->isUriStyle()Z

    move-result v1

    if-nez v1, :cond_b

    if-le v4, v2, :cond_b

    add-int/lit8 v1, v4, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    if-ne v2, v3, :cond_b

    .line 166
    invoke-virtual {p0, v1, v4}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    :cond_b
    :goto_3
    return-object v0
.end method
