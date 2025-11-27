.class public Lcom/dozof/app/mobi/MobiDecoder;
.super Ljava/lang/Object;
.source "MobiDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dozof/app/mobi/MobiDecoder$Ref;
    }
.end annotation


# static fields
.field public static final IMAGE_PREFIX:Ljava/lang/String; = "image-"

.field private static final TAG:Ljava/lang/String; = "com.dozof.app.mobi.MobiDecoder"


# instance fields
.field private context:Landroid/content/Context;

.field private decoder:Ljava/nio/charset/CharsetDecoder;

.field private encoding:Ljava/lang/String;

.field private nativeHandle:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 29
    iput v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->encoding:Ljava/lang/String;

    .line 31
    iput-object v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->decoder:Ljava/nio/charset/CharsetDecoder;

    .line 42
    iput-object p1, p0, Lcom/dozof/app/mobi/MobiDecoder;->context:Landroid/content/Context;

    .line 43
    invoke-direct {p0}, Lcom/dozof/app/mobi/MobiDecoder;->initLibrary()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    .line 47
    invoke-direct {p0, p2}, Lcom/dozof/app/mobi/MobiDecoder;->nativeOpen(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    if-eqz p1, :cond_0

    .line 51
    invoke-direct {p0}, Lcom/dozof/app/mobi/MobiDecoder;->getEncoding()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p1

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object p1

    sget-object p2, Ljava/nio/charset/CodingErrorAction;->IGNORE:Ljava/nio/charset/CodingErrorAction;

    .line 52
    invoke-virtual {p1, p2}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object p1

    sget-object p2, Ljava/nio/charset/CodingErrorAction;->IGNORE:Ljava/nio/charset/CodingErrorAction;

    .line 53
    invoke-virtual {p1, p2}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object p1

    iput-object p1, p0, Lcom/dozof/app/mobi/MobiDecoder;->decoder:Ljava/nio/charset/CharsetDecoder;

    return-void

    .line 49
    :cond_0
    new-instance p1, Ljava/lang/Throwable;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "invalid name "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    throw p1

    .line 45
    :cond_1
    new-instance p2, Ljava/lang/Throwable;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Incompatible device CPU: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/T;->CPU_ABI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public static MOBI_BUILD_CPU()Ljava/lang/String;
    .locals 3

    .line 86
    invoke-static {}, Lcom/flyersoft/tools/T;->CPU_ABI()Ljava/lang/String;

    move-result-object v0

    .line 87
    const-string v1, "x86_64"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 88
    const-string v0, "x86"

    return-object v0

    .line 89
    :cond_0
    const-string v1, "armeabi-v7a"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "armeabi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_1
    return-object v0
.end method

.method private baa_2_sa([[B)[Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 106
    new-array p1, v0, [Ljava/lang/String;

    return-object p1

    .line 107
    :cond_0
    array-length v1, p1

    new-array v2, v1, [Ljava/lang/String;

    :goto_0
    if-ge v0, v1, :cond_1

    .line 109
    aget-object v3, p1, v0

    invoke-virtual {p0, v3}, Lcom/dozof/app/mobi/MobiDecoder;->decode([B)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object v2
.end method

.method private static copySoFile(Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;)Z
    .locals 2

    const-string v0, "mobi/"

    .line 75
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    .line 76
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    .line 77
    :cond_0
    invoke-static {}, Lcom/dozof/app/mobi/MobiDecoder;->MOBI_BUILD_CPU()Ljava/lang/String;

    move-result-object p1

    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Lcom/flyersoft/tools/T;->extractFileFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 80
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

.method private getEncoding()Ljava/lang/String;
    .locals 5

    .line 133
    iget-object v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->encoding:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 136
    :cond_0
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetEncoding(I)I

    move-result v0

    const/16 v1, 0x4e4

    if-eq v0, v1, :cond_2

    const v1, 0xfde9

    .line 137
    const-string v2, "utf-8"

    if-eq v0, v1, :cond_1

    .line 145
    sget-object v1, Lcom/dozof/app/mobi/MobiDecoder;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "unknown encoding: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iput-object v2, p0, Lcom/dozof/app/mobi/MobiDecoder;->encoding:Ljava/lang/String;

    goto :goto_0

    .line 142
    :cond_1
    iput-object v2, p0, Lcom/dozof/app/mobi/MobiDecoder;->encoding:Ljava/lang/String;

    goto :goto_0

    .line 139
    :cond_2
    const-string v0, "cp1252"

    iput-object v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->encoding:Ljava/lang/String;

    .line 149
    :goto_0
    iget-object v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method private initLibrary()Ljava/lang/String;
    .locals 3

    .line 59
    iget-object v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/libmobi4.so"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 61
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/dozof/app/mobi/MobiDecoder;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-static {v2, v0, v1}, Lcom/dozof/app/mobi/MobiDecoder;->copySoFile(Landroid/content/res/AssetManager;Ljava/io/File;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 70
    :cond_0
    const-string v0, "NO SO Library"

    return-object v0

    .line 63
    :cond_1
    :goto_0
    :try_start_0
    invoke-static {v1}, Ljava/lang/System;->load(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    return-object v0

    :catchall_0
    move-exception v0

    .line 65
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 66
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private native nativeClose(I)V
.end method

.method private native nativeGetAuthors(I)[[B
.end method

.method private native nativeGetContributor(I)[B
.end method

.method private native nativeGetCoverImageIndex(I)I
.end method

.method private native nativeGetDescription(I)[B
.end method

.method private native nativeGetDocName(I)Ljava/lang/String;
.end method

.method private native nativeGetEncoding(I)I
.end method

.method private native nativeGetISBN(I)[B
.end method

.method private native nativeGetImageIndices(I)[I
.end method

.method private native nativeGetPublisher(I)[B
.end method

.method private native nativeGetPublishingDate(I)[B
.end method

.method private native nativeGetSubjects(I)[[B
.end method

.method private native nativeGetThumbImageIndex(I)I
.end method

.method private native nativeGetTocIndents(I)[I
.end method

.method private native nativeGetTocLengths(I)[I
.end method

.method private native nativeGetTocPositions(I)[I
.end method

.method private native nativeGetTocTitles(I)[[B
.end method

.method private native nativeGetTotalSize(I)J
.end method

.method private native nativeOpen(Ljava/lang/String;)I
.end method

.method private native nativePrepareTextRead(I)Z
.end method

.method private native nativeReadImageData(I[B)I
.end method

.method private native nativeReadText(I[B)I
.end method

.method private native nativeSetReadImageIndex(II)Z
.end method

.method private native nativeSetReadTextSection(II)Z
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 97
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeClose(I)V

    return-void
.end method

.method public decode([B)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    .line 157
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/dozof/app/mobi/MobiDecoder;->decode([BII)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public decode([BII)Ljava/lang/String;
    .locals 2

    .line 180
    :try_start_0
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 181
    iget-object v1, p0, Lcom/dozof/app/mobi/MobiDecoder;->decoder:Ljava/nio/charset/CharsetDecoder;

    invoke-virtual {v1, v0}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 183
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 185
    :try_start_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([BII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    :catch_1
    move-exception p1

    .line 187
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 188
    const-string p1, ""

    return-object p1
.end method

.method public decode_0([BII)Ljava/lang/String;
    .locals 1

    .line 161
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([BII)V

    return-object v0
.end method

.method public decode_1([BII)Ljava/lang/String;
    .locals 6

    .line 165
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    :goto_0
    if-ge p2, p3, :cond_0

    const/16 v1, 0x400

    .line 168
    new-array v2, v1, [C

    sub-int v3, p3, p2

    .line 169
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 170
    invoke-static {v2}, Ljava/nio/CharBuffer;->wrap([C)Ljava/nio/CharBuffer;

    move-result-object v3

    .line 171
    iget-object v4, p0, Lcom/dozof/app/mobi/MobiDecoder;->decoder:Ljava/nio/charset/CharsetDecoder;

    const/4 v5, 0x1

    invoke-virtual {v4, p1, v3, v5}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    .line 172
    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v3}, Ljava/nio/CharBuffer;->position()I

    move-result v3

    invoke-direct {v4, v2, v5, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr p2, v1

    goto :goto_0

    .line 175
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getAuthors()[Ljava/lang/String;
    .locals 1

    .line 115
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetAuthors(I)[[B

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 116
    new-array v0, v0, [Ljava/lang/String;

    return-object v0

    :cond_0
    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->baa_2_sa([[B)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCoverImageIndex()I
    .locals 1

    .line 202
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetCoverImageIndex(I)I

    move-result v0

    return v0
.end method

.method public getDecoder()Ljava/nio/charset/CharsetDecoder;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->decoder:Ljava/nio/charset/CharsetDecoder;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 282
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetDescription(I)[B

    move-result-object v0

    if-nez v0, :cond_0

    .line 283
    const-string v0, ""

    return-object v0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->decode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageBitmap(I)Landroid/graphics/Bitmap;
    .locals 3

    .line 211
    :try_start_0
    new-instance v0, Lcom/dozof/app/mobi/MobiImageStream;

    invoke-direct {v0, p0, p1}, Lcom/dozof/app/mobi/MobiImageStream;-><init>(Lcom/dozof/app/mobi/MobiDecoder;I)V

    .line 212
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 214
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 216
    sget-object v0, Lcom/dozof/app/mobi/MobiDecoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "get-image: no image at "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method public getImageBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 223
    :cond_0
    const-string v1, "image-"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x6

    .line 225
    :try_start_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 226
    invoke-virtual {p0, p1}, Lcom/dozof/app/mobi/MobiDecoder;->getImageBitmap(I)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 231
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return-object v0
.end method

.method public getImageIndices()[I
    .locals 1

    .line 194
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetImageIndices(I)[I

    move-result-object v0

    return-object v0
.end method

.method public getImageUrl(I)Ljava/lang/String;
    .locals 2

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "image-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSubjects()[Ljava/lang/String;
    .locals 1

    .line 120
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetSubjects(I)[[B

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 121
    new-array v0, v0, [Ljava/lang/String;

    return-object v0

    :cond_0
    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->baa_2_sa([[B)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getThumbImageIndex()I
    .locals 1

    .line 206
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetThumbImageIndex(I)I

    move-result v0

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 101
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetDocName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTocRefs()[Lcom/dozof/app/mobi/MobiDecoder$Ref;
    .locals 7

    .line 242
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetTocTitles(I)[[B

    move-result-object v0

    .line 243
    iget v1, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v1}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetTocPositions(I)[I

    move-result-object v1

    .line 244
    iget v2, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v2}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetTocIndents(I)[I

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v0, :cond_5

    if-eqz v1, :cond_5

    if-nez v2, :cond_0

    goto :goto_3

    .line 247
    :cond_0
    array-length v4, v0

    array-length v5, v1

    if-ne v4, v5, :cond_4

    array-length v4, v0

    array-length v5, v2

    if-eq v4, v5, :cond_1

    goto :goto_2

    .line 253
    :cond_1
    sget-object v3, Lcom/dozof/app/mobi/MobiDecoder;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "refs: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v5, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    array-length v3, v0

    new-array v3, v3, [Lcom/dozof/app/mobi/MobiDecoder$Ref;

    const/4 v4, 0x0

    .line 256
    :goto_0
    array-length v5, v0

    if-ge v4, v5, :cond_3

    .line 257
    new-instance v5, Lcom/dozof/app/mobi/MobiDecoder$Ref;

    invoke-direct {v5}, Lcom/dozof/app/mobi/MobiDecoder$Ref;-><init>()V

    aput-object v5, v3, v4

    .line 258
    aget-object v6, v0, v4

    if-nez v6, :cond_2

    .line 259
    const-string v6, ""

    iput-object v6, v5, Lcom/dozof/app/mobi/MobiDecoder$Ref;->title:Ljava/lang/String;

    goto :goto_1

    .line 261
    :cond_2
    invoke-virtual {p0, v6}, Lcom/dozof/app/mobi/MobiDecoder;->decode([B)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/dozof/app/mobi/MobiDecoder$Ref;->title:Ljava/lang/String;

    .line 263
    :goto_1
    aget v6, v1, v4

    iput v6, v5, Lcom/dozof/app/mobi/MobiDecoder$Ref;->position:I

    .line 264
    aget v6, v2, v4

    iput v6, v5, Lcom/dozof/app/mobi/MobiDecoder$Ref;->indent:I

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    return-object v3

    .line 248
    :cond_4
    :goto_2
    sget-object v2, Lcom/dozof/app/mobi/MobiDecoder;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "toc length not matched: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v0, v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " != "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v0, v1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    :goto_3
    return-object v3
.end method

.method public getTotalTextSize()J
    .locals 2

    .line 270
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativeGetTotalSize(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public prepareTextRead()Z
    .locals 1

    .line 125
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0}, Lcom/dozof/app/mobi/MobiDecoder;->nativePrepareTextRead(I)Z

    move-result v0

    return v0
.end method

.method public readImageData([B)I
    .locals 1

    .line 238
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0, p1}, Lcom/dozof/app/mobi/MobiDecoder;->nativeReadImageData(I[B)I

    move-result p1

    return p1
.end method

.method public readText([B)I
    .locals 1

    .line 129
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0, p1}, Lcom/dozof/app/mobi/MobiDecoder;->nativeReadText(I[B)I

    move-result p1

    return p1
.end method

.method public setReadImageIndex(I)Z
    .locals 1

    .line 278
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0, p1}, Lcom/dozof/app/mobi/MobiDecoder;->nativeSetReadImageIndex(II)Z

    move-result p1

    return p1
.end method

.method public setReadTextSection(I)Z
    .locals 1

    .line 274
    iget v0, p0, Lcom/dozof/app/mobi/MobiDecoder;->nativeHandle:I

    invoke-direct {p0, v0, p1}, Lcom/dozof/app/mobi/MobiDecoder;->nativeSetReadTextSection(II)Z

    move-result p1

    return p1
.end method
