.class public Lcom/flyersoft/books/Umd$UMDDecoder;
.super Ljava/lang/Object;
.source "Umd.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/Umd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "UMDDecoder"
.end annotation


# instance fields
.field public chapterPositions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/Umd$ChapterPosition;",
            ">;"
        }
    .end annotation
.end field

.field public sb:Ljava/lang/StringBuilder;

.field final synthetic this$0:Lcom/flyersoft/books/Umd;

.field public umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/Umd;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 176
    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->this$0:Lcom/flyersoft/books/Umd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->sb:Ljava/lang/StringBuilder;

    .line 478
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->chapterPositions:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public decode(Ljava/io/File;Z)Lcom/flyersoft/books/Umd$UMD_Info;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 182
    new-instance v0, Lcom/flyersoft/books/Umd$UMD_Info;

    iget-object v1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->this$0:Lcom/flyersoft/books/Umd;

    invoke-direct {v0, v1}, Lcom/flyersoft/books/Umd$UMD_Info;-><init>(Lcom/flyersoft/books/Umd;)V

    iput-object v0, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 191
    :try_start_0
    new-instance v3, Lcom/flyersoft/books/Umd$UMDInputStream;

    iget-object v4, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->this$0:Lcom/flyersoft/books/Umd;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4, v5}, Lcom/flyersoft/books/Umd$UMDInputStream;-><init>(Lcom/flyersoft/books/Umd;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 193
    :try_start_1
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const v2, -0x21656477

    .line 194
    const-string v4, "It\'s not a umd file!"

    if-ne p1, v2, :cond_19

    .line 198
    :try_start_2
    iget-object v2, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v2, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setHeader(I)V

    .line 201
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readByte()B

    move-result p1

    const/4 v2, 0x1

    :goto_0
    if-eqz v2, :cond_18

    const/16 v5, 0x23

    const/4 v6, 0x2

    if-eq p1, v5, :cond_4

    const/16 v5, 0x24

    if-eq p1, v5, :cond_0

    :goto_1
    const/4 v2, 0x0

    goto/16 :goto_10

    :cond_0
    if-eqz p2, :cond_1

    goto/16 :goto_10

    .line 405
    :cond_1
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    .line 406
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    add-int/lit8 p1, p1, -0x9

    .line 407
    new-array v5, p1, [B

    .line 408
    invoke-virtual {v3, v5}, Lcom/flyersoft/books/Umd$UMDInputStream;->read([B)I

    .line 419
    new-instance v7, Ljava/util/zip/Inflater;

    invoke-direct {v7}, Ljava/util/zip/Inflater;-><init>()V

    .line 420
    invoke-virtual {v7, v5, v0, p1}, Ljava/util/zip/Inflater;->setInput([BII)V

    mul-int/lit8 p1, p1, 0x2

    .line 421
    new-array p1, p1, [B

    .line 422
    invoke-virtual {v7, p1}, Ljava/util/zip/Inflater;->inflate([B)I
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 424
    :try_start_3
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string p1, "UTF-16LE"

    invoke-static {v5, p1}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 426
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v6

    :goto_2
    if-lez v5, :cond_3

    .line 427
    invoke-virtual {p1, v5}, Ljava/lang/String;->codePointAt(I)I

    move-result v6

    if-eqz v6, :cond_2

    if-lez v5, :cond_3

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_2
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    .line 432
    :cond_3
    :goto_3
    iget-object v6, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/EOFException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_4

    :catch_0
    move-exception p1

    .line 437
    :try_start_4
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_4

    .line 434
    :catch_1
    sput-boolean v1, Lcom/flyersoft/tools/T;->isOutOfMemoryError:Z

    .line 439
    :goto_4
    invoke-virtual {v7}, Ljava/util/zip/Inflater;->end()V

    goto/16 :goto_10

    .line 205
    :cond_4
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedShort()I

    move-result v5

    const/16 v7, 0x87

    const/4 v8, 0x4

    if-eq v5, v7, :cond_16

    const/16 v7, 0xf1

    if-eq v5, v7, :cond_15

    packed-switch v5, :pswitch_data_0

    packed-switch v5, :pswitch_data_1

    goto :goto_1

    .line 320
    :pswitch_0
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 321
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    .line 322
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 323
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v5

    if-ne p1, v5, :cond_7

    .line 329
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    .line 330
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    .line 331
    :goto_5
    iget-object v7, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v7}, Lcom/flyersoft/books/Umd$UMD_Info;->getChapterNumber()I

    move-result v7

    if-ge v5, v7, :cond_6

    .line 332
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v7

    div-int/2addr v7, v6

    .line 333
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v9, 0x0

    :goto_6
    if-ge v9, v7, :cond_5

    .line 335
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v10

    .line 336
    invoke-virtual {v8, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 338
    :cond_5
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 341
    :cond_6
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setChapterTitles(Ljava/util/ArrayList;)V

    goto/16 :goto_10

    .line 325
    :cond_7
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    .line 326
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 301
    :pswitch_1
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 302
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    .line 303
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 304
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v5

    if-ne p1, v5, :cond_9

    .line 309
    iget-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v5

    add-int/lit8 v5, v5, -0x9

    div-int/2addr v5, v8

    invoke-virtual {p1, v5}, Lcom/flyersoft/books/Umd$UMD_Info;->setChapterNumber(I)V

    .line 311
    iget-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Lcom/flyersoft/books/Umd$UMD_Info;->getChapterNumber()I

    move-result p1

    new-array v5, p1, [I

    const/4 v7, 0x0

    :goto_7
    if-ge v7, p1, :cond_8

    .line 313
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v8

    div-int/2addr v8, v6

    aput v8, v5, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    .line 316
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1, v5}, Lcom/flyersoft/books/Umd$UMD_Info;->setOffsets([I)V

    goto/16 :goto_10

    .line 306
    :cond_9
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    .line 307
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_2
    const/4 p1, 0x3

    .line 357
    invoke-virtual {v3, p1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 358
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    .line 359
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 360
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v5

    if-ne p1, v5, :cond_a

    .line 366
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    add-int/lit8 p1, p1, -0x9

    .line 367
    new-array p1, p1, [B

    .line 368
    invoke-virtual {v3, p1}, Lcom/flyersoft/books/Umd$UMDInputStream;->read([B)I

    .line 369
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setCovers([B)V

    goto/16 :goto_10

    .line 362
    :cond_a
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    .line 363
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 344
    :pswitch_3
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 345
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    .line 346
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 347
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v5

    if-ne p1, v5, :cond_b

    .line 352
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    add-int/lit8 p1, p1, -0x9

    div-int/2addr p1, v8

    mul-int/lit8 p1, p1, 0x4

    .line 353
    invoke-virtual {v3, p1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    goto/16 :goto_10

    .line 349
    :cond_b
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    .line 350
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 388
    :pswitch_4
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 389
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v2

    .line 390
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v5, v2}, Lcom/flyersoft/books/Umd$UMD_Info;->setFileSize(I)V

    const/4 v2, 0x0

    goto/16 :goto_0

    .line 297
    :pswitch_5
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 298
    iget-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v5

    div-int/2addr v5, v6

    invoke-virtual {p1, v5}, Lcom/flyersoft/books/Umd$UMD_Info;->setContentLength(I)V

    goto/16 :goto_10

    .line 384
    :pswitch_6
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 385
    iget-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v5

    invoke-virtual {p1, v5}, Lcom/flyersoft/books/Umd$UMD_Info;->setContentId(I)V

    goto/16 :goto_10

    .line 287
    :pswitch_7
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 288
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 289
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v5

    const/4 v7, 0x0

    :goto_8
    add-int/lit8 v8, v5, -0x5

    .line 290
    div-int/2addr v8, v6

    if-ge v7, v8, :cond_c

    .line 291
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v8

    .line 292
    invoke-virtual {p1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 294
    :cond_c
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setVendor(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 277
    :pswitch_8
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 278
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 279
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v5

    const/4 v7, 0x0

    :goto_9
    add-int/lit8 v8, v5, -0x5

    .line 280
    div-int/2addr v8, v6

    if-ge v7, v8, :cond_d

    .line 281
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v8

    .line 282
    invoke-virtual {p1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_9

    .line 284
    :cond_d
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setPublisher(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 267
    :pswitch_9
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 268
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 269
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v5

    const/4 v7, 0x0

    :goto_a
    add-int/lit8 v8, v5, -0x5

    .line 270
    div-int/2addr v8, v6

    if-ge v7, v8, :cond_e

    .line 271
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v8

    .line 272
    invoke-virtual {p1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_a

    .line 274
    :cond_e
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setGender(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 257
    :pswitch_a
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 258
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 259
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v5

    const/4 v7, 0x0

    :goto_b
    add-int/lit8 v8, v5, -0x5

    .line 260
    div-int/2addr v8, v6

    if-ge v7, v8, :cond_f

    .line 261
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v8

    .line 262
    invoke-virtual {p1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_b

    .line 264
    :cond_f
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setDay(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 247
    :pswitch_b
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 248
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 249
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v5

    const/4 v7, 0x0

    :goto_c
    add-int/lit8 v8, v5, -0x5

    .line 250
    div-int/2addr v8, v6

    if-ge v7, v8, :cond_10

    .line 251
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v8

    .line 252
    invoke-virtual {p1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_c

    .line 254
    :cond_10
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setMonth(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 237
    :pswitch_c
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 238
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 239
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v5

    const/4 v7, 0x0

    :goto_d
    add-int/lit8 v8, v5, -0x5

    .line 240
    div-int/2addr v8, v6

    if-ge v7, v8, :cond_11

    .line 241
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v8

    .line 242
    invoke-virtual {p1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_d

    .line 244
    :cond_11
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setYear(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 227
    :pswitch_d
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 228
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 229
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v5

    const/4 v7, 0x0

    :goto_e
    add-int/lit8 v8, v5, -0x5

    .line 230
    div-int/2addr v8, v6

    if-ge v7, v8, :cond_12

    .line 231
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v8

    .line 232
    invoke-virtual {p1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    .line 234
    :cond_12
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setAuthor(Ljava/lang/String;)V

    goto :goto_10

    .line 217
    :pswitch_e
    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    .line 218
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 219
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result v5

    const/4 v7, 0x0

    :goto_f
    add-int/lit8 v8, v5, -0x5

    .line 220
    div-int/2addr v8, v6

    if-ge v7, v8, :cond_13

    .line 221
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readChar()C

    move-result v8

    .line 222
    invoke-virtual {p1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_f

    .line 224
    :cond_13
    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Lcom/flyersoft/books/Umd$UMD_Info;->setTitle(Ljava/lang/String;)V

    goto :goto_10

    .line 208
    :pswitch_f
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 209
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readUnsignedByte()I

    move-result p1

    if-ne p1, v1, :cond_14

    .line 214
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    goto :goto_10

    .line 211
    :cond_14
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    .line 212
    new-instance p1, Ljava/lang/Exception;

    const-string v2, "It\'s not a text umd file!"

    invoke-direct {p1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 394
    :cond_15
    invoke-virtual {v3, v6}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    const/16 p1, 0x10

    .line 395
    invoke-virtual {v3, p1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    goto :goto_10

    .line 372
    :cond_16
    invoke-virtual {v3, v8}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 373
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    .line 374
    invoke-virtual {v3, v1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 375
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result v5

    if-ne p1, v5, :cond_17

    .line 380
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readInt()I

    move-result p1

    add-int/lit8 p1, p1, -0x9

    .line 381
    invoke-virtual {v3, p1}, Lcom/flyersoft/books/Umd$UMDInputStream;->skipBytes(I)I

    .line 447
    :goto_10
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->readByte()B

    move-result p1

    goto/16 :goto_0

    .line 377
    :cond_17
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    .line 378
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catch Ljava/io/EOFException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 455
    :cond_18
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    goto :goto_14

    .line 195
    :cond_19
    :try_start_5
    invoke-virtual {v3}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    .line 196
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catchall_0
    move-exception p1

    move-object v2, v3

    goto :goto_12

    :catch_2
    move-exception p1

    move-object v2, v3

    goto :goto_11

    :catch_3
    nop

    move-object v2, v3

    goto :goto_13

    :catchall_1
    move-exception p1

    goto :goto_12

    :catch_4
    move-exception p1

    .line 453
    :goto_11
    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :goto_12
    if-eqz v2, :cond_1a

    .line 455
    invoke-virtual {v2}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    .line 456
    :cond_1a
    throw p1

    :catch_5
    nop

    :goto_13
    if-eqz v2, :cond_1b

    .line 455
    invoke-virtual {v2}, Lcom/flyersoft/books/Umd$UMDInputStream;->close()V

    :cond_1b
    :goto_14
    if-eqz p2, :cond_1c

    .line 458
    iget-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    return-object p1

    .line 460
    :cond_1c
    iget-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    invoke-virtual {p1}, Lcom/flyersoft/books/Umd$UMD_Info;->getOffsets()[I

    move-result-object p1

    .line 461
    :goto_15
    array-length p2, p1

    if-ge v0, p2, :cond_20

    .line 462
    aget p2, p1, v0

    .line 463
    array-length v2, p1

    sub-int/2addr v2, v1

    const/4 v3, -0x1

    if-ne v0, v2, :cond_1e

    .line 464
    iget-object v2, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-le v2, p2, :cond_1d

    .line 465
    iget-object v2, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->chapterPositions:Ljava/util/ArrayList;

    new-instance v4, Lcom/flyersoft/books/Umd$ChapterPosition;

    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->this$0:Lcom/flyersoft/books/Umd;

    invoke-direct {v4, v5, p2, v3}, Lcom/flyersoft/books/Umd$ChapterPosition;-><init>(Lcom/flyersoft/books/Umd;II)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 467
    :cond_1d
    iget-object p2, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->chapterPositions:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/books/Umd$ChapterPosition;

    iget-object v4, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->this$0:Lcom/flyersoft/books/Umd;

    invoke-direct {v2, v4, v3, v3}, Lcom/flyersoft/books/Umd$ChapterPosition;-><init>(Lcom/flyersoft/books/Umd;II)V

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 469
    :cond_1e
    iget-object v2, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/lit8 v4, v0, 0x1

    aget v5, p1, v4

    if-le v2, v5, :cond_1f

    .line 470
    iget-object v2, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->chapterPositions:Ljava/util/ArrayList;

    new-instance v3, Lcom/flyersoft/books/Umd$ChapterPosition;

    iget-object v5, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->this$0:Lcom/flyersoft/books/Umd;

    aget v4, p1, v4

    invoke-direct {v3, v5, p2, v4}, Lcom/flyersoft/books/Umd$ChapterPosition;-><init>(Lcom/flyersoft/books/Umd;II)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 472
    :cond_1f
    iget-object p2, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->chapterPositions:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/books/Umd$ChapterPosition;

    iget-object v4, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->this$0:Lcom/flyersoft/books/Umd;

    invoke-direct {v2, v4, v3, v3}, Lcom/flyersoft/books/Umd$ChapterPosition;-><init>(Lcom/flyersoft/books/Umd;II)V

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 475
    :cond_20
    iget-object p1, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->umd_Info:Lcom/flyersoft/books/Umd$UMD_Info;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x81
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getChapterText(I)Ljava/lang/String;
    .locals 2

    .line 480
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->chapterPositions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/Umd$ChapterPosition;

    .line 481
    iget v0, p1, Lcom/flyersoft/books/Umd$ChapterPosition;->start:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 482
    const-string p1, ""

    return-object p1

    .line 483
    :cond_0
    iget v0, p1, Lcom/flyersoft/books/Umd$ChapterPosition;->end:I

    if-ne v0, v1, :cond_1

    .line 484
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->sb:Ljava/lang/StringBuilder;

    iget p1, p1, Lcom/flyersoft/books/Umd$ChapterPosition;->start:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 486
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/Umd$UMDDecoder;->sb:Ljava/lang/StringBuilder;

    iget v1, p1, Lcom/flyersoft/books/Umd$ChapterPosition;->start:I

    iget p1, p1, Lcom/flyersoft/books/Umd$ChapterPosition;->end:I

    invoke-virtual {v0, v1, p1}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
