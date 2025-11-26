.class public Lcom/flyersoft/tools/compress/MyZip_Java;
.super Lcom/flyersoft/tools/compress/MyZip_Base;
.source "MyZip_Java.java"


# static fields
.field public static final ZIPPED_FILENAMES_FILE:Ljava/lang/String; = "_names.list"

.field private static baseFolder:Ljava/lang/String;

.field private static numFilenames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field fileInfoList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation
.end field

.field fileList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private zf:Ljava/util/zip/ZipFile;

.field private zipEntryCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/zip/ZipEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 173
    invoke-direct {p0}, Lcom/flyersoft/tools/compress/MyZip_Base;-><init>()V

    .line 174
    new-instance v0, Ljava/util/zip/ZipFile;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    return-void
.end method

.method public constructor <init>(Ljava/util/zip/ZipFile;)V
    .locals 0

    .line 169
    invoke-direct {p0}, Lcom/flyersoft/tools/compress/MyZip_Base;-><init>()V

    .line 170
    iput-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    return-void
.end method

.method private static ZipFiles(Ljava/lang/String;Ljava/lang/String;Ljava/util/zip/ZipOutputStream;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 388
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 389
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 390
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/compress/MyZip_Java;->isIgnoreFile(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_3

    if-eqz p3, :cond_0

    .line 392
    invoke-static {p1}, Lcom/flyersoft/tools/compress/MyZip_Java;->createNumFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 393
    :cond_0
    new-instance p0, Ljava/util/zip/ZipEntry;

    invoke-direct {p0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 394
    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 395
    invoke-virtual {p2, p0}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    const/16 p0, 0x1000

    .line 397
    new-array p0, p0, [B

    .line 398
    :goto_0
    invoke-virtual {p1, p0}, Ljava/io/FileInputStream;->read([B)I

    move-result p3

    const/4 v0, -0x1

    if-eq p3, v0, :cond_1

    .line 399
    invoke-virtual {p2, p0, v2, p3}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_0

    .line 400
    :cond_1
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V

    .line 401
    invoke-virtual {p2}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    return-void

    .line 404
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 411
    :goto_1
    array-length v1, v0

    if-ge v2, v1, :cond_3

    .line 412
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v0, v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, p2, p3}, Lcom/flyersoft/tools/compress/MyZip_Java;->ZipFiles(Ljava/lang/String;Ljava/lang/String;Ljava/util/zip/ZipOutputStream;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public static ZipFolder(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 250
    invoke-static {p0, p1, v0}, Lcom/flyersoft/tools/compress/MyZip_Java;->ZipFolder(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public static ZipFolder(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    .line 257
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/tools/compress/MyZip_Java;->ZipFolder(Ljava/lang/String;Ljava/lang/String;ZZZLandroid/os/Handler;)V

    return-void
.end method

.method public static ZipFolder(Ljava/lang/String;Ljava/lang/String;ZZZLandroid/os/Handler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 263
    invoke-static {p0}, Lcom/flyersoft/tools/compress/MyZip_Java;->initNumFilenames(Ljava/lang/String;)V

    .line 265
    :cond_0
    new-instance v0, Ljava/util/zip/ZipOutputStream;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 266
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 267
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0, p2}, Lcom/flyersoft/tools/compress/MyZip_Java;->ZipFiles(Ljava/lang/String;Ljava/lang/String;Ljava/util/zip/ZipOutputStream;Z)V

    if-nez p3, :cond_1

    if-eqz p4, :cond_d

    .line 270
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object p0

    .line 271
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    .line 272
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0x14

    if-le v1, v2, :cond_2

    .line 273
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const/16 v1, 0x3e8

    if-eqz p3, :cond_8

    .line 276
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_3
    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 277
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 278
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    if-eqz p5, :cond_4

    .line 280
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p5, v1, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {p5, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 281
    :cond_4
    invoke-static {v0, v2}, Lcom/flyersoft/tools/compress/MyZip_Java;->addOuterFile(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;)V

    goto :goto_1

    .line 284
    :cond_5
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_6
    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 285
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 286
    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 287
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    if-eqz p5, :cond_7

    .line 289
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p5, v1, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {p5, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 290
    :cond_7
    invoke-static {v0, v2}, Lcom/flyersoft/tools/compress/MyZip_Java;->addOuterFile(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;)V

    goto :goto_2

    :cond_8
    if-eqz p4, :cond_d

    .line 296
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_3
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_a

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    if-eqz p5, :cond_9

    .line 298
    invoke-virtual {p5, v1, p4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {p5, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 299
    :cond_9
    invoke-static {v0, p4}, Lcom/flyersoft/tools/compress/MyZip_Java;->addOuterFile(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;)V

    goto :goto_3

    .line 301
    :cond_a
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_b
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 302
    iget-object p4, p3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_b

    if-eqz p5, :cond_c

    .line 304
    iget-object p4, p3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {p5, v1, p4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p4

    invoke-virtual {p5, p4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 305
    :cond_c
    iget-object p3, p3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0, p3}, Lcom/flyersoft/tools/compress/MyZip_Java;->addOuterFile(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;)V

    goto :goto_4

    :cond_d
    if-eqz p2, :cond_e

    .line 312
    invoke-static {v0}, Lcom/flyersoft/tools/compress/MyZip_Java;->saveNumFilenames(Ljava/util/zip/ZipOutputStream;)V

    .line 314
    :cond_e
    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->finish()V

    .line 315
    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->close()V

    return-void
.end method

.method private static addOuterFile(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;)V
    .locals 6

    const-string v0, "*"

    const-string v1, "?"

    .line 319
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    .line 321
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/miscellaneous/SD;->isSDFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 322
    sget-object v1, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 324
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 325
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/compress/MyZip_Java;->baseFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ".tag"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 326
    new-instance v1, Ljava/util/zip/ZipEntry;

    invoke-direct {v1, v0}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 327
    new-instance v0, Ljava/io/FileInputStream;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 328
    invoke-virtual {p0, v1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    const/16 v1, 0x1000

    .line 330
    new-array v1, v1, [B

    .line 331
    :goto_1
    invoke-virtual {v0, v1}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    const/4 v5, 0x0

    if-eq v3, v4, :cond_1

    .line 332
    invoke-virtual {p0, v1, v5, v3}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_1

    .line 333
    :cond_1
    invoke-virtual {p0}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 334
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "zip: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    aput-object p0, p1, v5

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 336
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 337
    sget-object p0, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, v2

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_2
    return-void
.end method

.method public static addToZip(Ljava/util/zip/ZipOutputStream;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 342
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 344
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipEntry;

    invoke-direct {v0, p2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 345
    new-instance p2, Ljava/io/FileInputStream;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p2, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 346
    invoke-virtual {p0, v0}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    const/16 v0, 0x1000

    .line 348
    new-array v0, v0, [B

    .line 349
    :goto_0
    invoke-virtual {p2, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 350
    invoke-virtual {p0, v0, v1, v2}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_0

    .line 351
    :cond_0
    invoke-virtual {p0}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 352
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "add zip: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x1

    new-array p2, p1, [Ljava/lang/Object;

    aput-object p0, p2, v1

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p0

    .line 355
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return v1
.end method

.method public static compress(Ljava/lang/String;)[B
    .locals 3

    .line 472
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 474
    :try_start_0
    new-instance v1, Ljava/util/zip/DeflaterOutputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 475
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 476
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 477
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 478
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 480
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 482
    :goto_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method private static createNumFilename(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 426
    sget-object v0, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 427
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/compress/MyZip_Java;->baseFolder:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ".tag"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static decompress([B)Ljava/lang/String;
    .locals 5

    .line 486
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 487
    new-instance p0, Ljava/util/zip/InflaterInputStream;

    invoke-direct {p0, v0}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 488
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v2, 0x400

    .line 490
    :try_start_0
    new-array v2, v2, [B

    .line 492
    :goto_0
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    const/4 v4, 0x0

    .line 493
    invoke-virtual {v1, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 494
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 495
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    .line 496
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 497
    new-instance p0, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const/4 v0, 0x1

    .line 499
    invoke-static {p0, v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static getFilenameFromNumFiles(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 122
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 123
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const-string v3, "/"

    if-ge v1, v2, :cond_3

    .line 124
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ".tag"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 125
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 126
    const-string p2, "?"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p0, 0x1

    .line 127
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 128
    :cond_0
    const-string p2, "*"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 129
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 131
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    move v1, v4

    goto :goto_0

    .line 134
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getNumFilenamesText(Ljava/util/zip/ZipFile;Ljava/lang/String;Z)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/zip/ZipFile;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 139
    new-instance p1, Lcom/flyersoft/tools/compress/MyZip_Java;

    invoke-direct {p1, p0}, Lcom/flyersoft/tools/compress/MyZip_Java;-><init>(Ljava/util/zip/ZipFile;)V

    .line 143
    invoke-virtual {p1}, Lcom/flyersoft/tools/compress/MyZip_Java;->getFileListOfZip()Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 144
    const-string v1, "_names.list"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 145
    invoke-virtual {p1, v0}, Lcom/flyersoft/tools/compress/MyZip_Java;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->inputStream2StringList(Ljava/io/InputStream;)Ljava/util/ArrayList;

    move-result-object p0

    if-eqz p2, :cond_2

    const/4 p1, 0x0

    .line 147
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_2

    .line 148
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 149
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 150
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 151
    const-string v1, ".moonreader/"

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 152
    const-string v1, ".moonreaderp/"

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 153
    const-string v1, ".moonreaderpj/"

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 154
    const-string v1, ".seekbooks/"

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 155
    const-string v0, "dropbox.xml"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 158
    :cond_1
    invoke-virtual {p0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    return-object p0

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method private static initNumFilenames(Ljava/lang/String;)V
    .locals 1

    .line 421
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    .line 422
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/flyersoft/tools/compress/MyZip_Java;->baseFolder:Ljava/lang/String;

    return-void
.end method

.method public static isIgnoreFile(Ljava/lang/String;)Z
    .locals 5

    .line 361
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 362
    const-string v0, "/alpha_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string v0, ".png"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 363
    invoke-static {}, Lcom/flyersoft/tools/A;->getBackgroundImageFile()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    .line 365
    :cond_0
    const-string v0, "/cache"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    const-string v0, "/google_"

    .line 366
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_2

    const-string v0, "webview"

    .line 367
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_2

    const-string v0, "/files/"

    .line 368
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_2

    const-string v0, "dropbox.xml"

    .line 369
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_2

    const-string v0, "/lib"

    .line 370
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_2

    const-string v0, "/app_"

    .line 371
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_2

    const-string v0, ".licensing."

    .line 375
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_2

    const-string v0, "/code_"

    .line 377
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v3, :cond_2

    const-string v0, ".so"

    .line 378
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_3

    .line 381
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "*ignore: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_3
    return v0
.end method

.method private static saveNumFilenames(Ljava/util/zip/ZipOutputStream;)V
    .locals 5

    const-string v0, "/_names.list"

    .line 432
    sget-object v1, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 435
    :cond_0
    :try_start_0
    new-instance v1, Ljava/util/zip/ZipEntry;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/compress/MyZip_Java;->baseFolder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 436
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 437
    sget-object v2, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 438
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 439
    sput-object v2, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    .line 441
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 442
    invoke-virtual {p0, v1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    const/16 v1, 0x1000

    .line 444
    new-array v1, v1, [B

    .line 445
    :goto_1
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2

    const/4 v3, 0x0

    .line 446
    invoke-virtual {p0, v1, v3, v2}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_1

    .line 447
    :cond_2
    invoke-virtual {p0}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 449
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method

.method public static unZipFile(Ljava/lang/String;Ljava/lang/String;ZLcom/flyersoft/tools/compress/MyZip_Base$ZipDone;ZZZLandroid/os/Handler;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p7

    .line 43
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_0

    if-eqz v1, :cond_10

    .line 45
    const-string v0, "Invalided file"

    invoke-interface {v1, v0, v5}, Lcom/flyersoft/tools/compress/MyZip_Base$ZipDone;->OnZipDone(Ljava/lang/String;Ljava/util/ArrayList;)V

    return-void

    .line 49
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 50
    const-string v6, "/"

    if-eqz p2, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v8, p1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object v8, v7

    goto :goto_0

    :cond_1
    move-object/from16 v8, p1

    .line 51
    :goto_0
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 52
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 53
    invoke-static {v8}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 56
    :cond_2
    invoke-static {v8}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 57
    invoke-static {v8}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    .line 60
    :cond_3
    :try_start_0
    new-instance v7, Ljava/util/zip/ZipFile;

    invoke-direct {v7, v3}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    const/4 v3, 0x1

    .line 61
    new-array v9, v3, [Ljava/lang/Object;

    const-string v10, "unzip start..."

    const/4 v11, 0x0

    aput-object v10, v9, v11

    invoke-static {v9}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-eqz p5, :cond_4

    move/from16 v9, p6

    .line 65
    invoke-static {v7, v0, v9}, Lcom/flyersoft/tools/compress/MyZip_Java;->getNumFilenamesText(Ljava/util/zip/ZipFile;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v0

    move-object v9, v0

    goto :goto_1

    :cond_4
    move-object v9, v5

    .line 67
    :goto_1
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v10

    :cond_5
    :goto_2
    invoke-interface {v10}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    if-eqz v0, :cond_f

    .line 70
    :try_start_1
    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/zip/ZipEntry;

    if-eqz p5, :cond_7

    if-eqz v9, :cond_7

    .line 74
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v12

    const-string v13, "_names.list"

    invoke-virtual {v12, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_6

    goto :goto_2

    .line 76
    :cond_6
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-static {v8, v12, v9}, Lcom/flyersoft/tools/compress/MyZip_Java;->getFilenameFromNumFiles(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v12

    goto :goto_3

    .line 78
    :cond_7
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 79
    :goto_3
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "unzip: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    new-array v14, v3, [Ljava/lang/Object;

    aput-object v13, v14, v11

    invoke-static {v14}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-eqz v2, :cond_8

    .line 80
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_8

    const/16 v13, 0x3e8

    .line 81
    invoke-virtual {v2, v13, v12}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v13

    invoke-virtual {v2, v13}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 83
    :cond_8
    invoke-virtual {v7, v0}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v0

    .line 84
    invoke-static {v12}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_9

    .line 85
    invoke-static {v12}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    :cond_9
    const/16 v13, 0x400

    .line 86
    new-array v13, v13, [B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v14, v5

    .line 88
    :goto_4
    :try_start_2
    invoke-virtual {v0, v13}, Ljava/io/InputStream;->read([B)I

    move-result v15

    if-lez v15, :cond_b

    if-nez v14, :cond_a

    .line 90
    invoke-static {v12}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v14

    .line 91
    :cond_a
    invoke-virtual {v14, v13, v11, v15}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4

    .line 93
    :cond_b
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 94
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v14, :cond_5

    .line 105
    :try_start_3
    invoke-virtual {v14}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    goto/16 :goto_2

    :catch_0
    move-exception v0

    .line 107
    :goto_5
    :try_start_4
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto/16 :goto_2

    :catchall_0
    move-exception v0

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object v14, v5

    .line 96
    :goto_6
    :try_start_5
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    if-nez p4, :cond_d

    if-eqz v1, :cond_c

    .line 99
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0, v4}, Lcom/flyersoft/tools/compress/MyZip_Base$ZipDone;->OnZipDone(Ljava/lang/String;Ljava/util/ArrayList;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :cond_c
    if-eqz v14, :cond_10

    .line 105
    :try_start_6
    invoke-virtual {v14}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    goto :goto_8

    :catch_1
    move-exception v0

    .line 107
    :try_start_7
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_8

    :cond_d
    if-eqz v14, :cond_5

    .line 105
    :try_start_8
    invoke-virtual {v14}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto/16 :goto_2

    :catch_2
    move-exception v0

    goto :goto_5

    :catchall_2
    move-exception v0

    move-object v2, v0

    if-eqz v14, :cond_e

    :try_start_9
    invoke-virtual {v14}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_7

    :catch_3
    move-exception v0

    .line 107
    :try_start_a
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 109
    :cond_e
    :goto_7
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    :cond_f
    if-eqz v1, :cond_10

    .line 117
    invoke-interface {v1, v5, v4}, Lcom/flyersoft/tools/compress/MyZip_Base$ZipDone;->OnZipDone(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_8

    :catchall_3
    move-exception v0

    .line 112
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    if-eqz v1, :cond_10

    .line 113
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0, v4}, Lcom/flyersoft/tools/compress/MyZip_Base$ZipDone;->OnZipDone(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_10
    :goto_8
    return-void
.end method

.method public static unZipFiles(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 532
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipFile;

    invoke-direct {v0, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 533
    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 534
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/zip/ZipEntry;

    .line 535
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 536
    invoke-virtual {v0, v1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v1

    .line 537
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v2

    const/16 v3, 0x400

    .line 538
    new-array v3, v3, [B

    .line 540
    :goto_1
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    if-lez v4, :cond_0

    const/4 v5, 0x0

    .line 541
    invoke-virtual {v2, v3, v5, v4}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1

    .line 543
    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 546
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public static zipFiles(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 508
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 509
    new-instance p1, Ljava/util/zip/ZipOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p1, v1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 510
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 511
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 512
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 513
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 514
    new-instance v4, Ljava/util/zip/ZipEntry;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    const/16 v2, 0x1000

    .line 516
    new-array v2, v2, [B

    .line 517
    :goto_1
    invoke-virtual {v3, v2}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 518
    invoke-virtual {p1, v2, v0, v4}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_1

    .line 519
    :cond_0
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 520
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 523
    :cond_2
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->finish()V

    .line 524
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 526
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    return-void
.end method

.method public free()V
    .locals 1

    .line 455
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 456
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 457
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileInfoList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 458
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 459
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/compress/MyZip_Java;->numFilenames:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    .line 460
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_2
    return-void
.end method

.method public getFileInfoOfZip()Ljava/util/ArrayList;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;",
            ">;"
        }
    .end annotation

    .line 196
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileInfoList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    return-object v0

    .line 201
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileInfoList:Ljava/util/ArrayList;

    .line 202
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zipEntryCache:Ljava/util/HashMap;

    .line 204
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 205
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/zip/ZipEntry;

    .line 206
    iget-object v2, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileInfoList:Ljava/util/ArrayList;

    new-instance v3, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 207
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    .line 208
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v6

    .line 209
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v8

    .line 210
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v10

    .line 211
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v12

    .line 212
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    move-result-object v13

    move-object v4, p0

    invoke-direct/range {v3 .. v13}, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;-><init>(Lcom/flyersoft/tools/compress/MyZip_Base;Ljava/lang/String;JJJZLjava/lang/String;)V

    .line 206
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 214
    iget-object v2, v4, Lcom/flyersoft/tools/compress/MyZip_Java;->zipEntryCache:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    move-object v4, p0

    .line 217
    iget-object v0, v4, Lcom/flyersoft/tools/compress/MyZip_Java;->fileInfoList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFileListOfZip()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    return-object v0

    .line 184
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileList:Ljava/util/ArrayList;

    .line 185
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 186
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/zip/ZipEntry;

    .line 187
    iget-object v2, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 189
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->fileList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4

    .line 221
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 224
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zipEntryCache:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 225
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zipEntryCache:Ljava/util/HashMap;

    goto :goto_0

    .line 227
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/zip/ZipEntry;

    if-eqz v0, :cond_2

    .line 229
    iget-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    invoke-virtual {p1, v0}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    .line 232
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v0

    :cond_3
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 233
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/zip/ZipEntry;

    .line 234
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 235
    iget-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zipEntryCache:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    iget-object p1, p0, Lcom/flyersoft/tools/compress/MyZip_Java;->zf:Ljava/util/zip/ZipFile;

    invoke-virtual {p1, v2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_4
    return-object v1

    :catch_0
    move-exception p1

    .line 240
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v1
.end method
