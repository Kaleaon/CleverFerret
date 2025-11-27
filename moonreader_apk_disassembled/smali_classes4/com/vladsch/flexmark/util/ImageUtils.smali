.class public Lcom/vladsch/flexmark/util/ImageUtils;
.super Ljava/lang/Object;
.source "ImageUtils.java"


# static fields
.field private static final BASE64_ENCODING_PATTERN:Ljava/util/regex/Pattern;

.field public static TRANSPARENT:Ljava/awt/Color;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 61
    new-instance v0, Ljava/awt/Color;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Ljava/awt/Color;-><init>(IIII)V

    sput-object v0, Lcom/vladsch/flexmark/util/ImageUtils;->TRANSPARENT:Ljava/awt/Color;

    .line 232
    const-string v0, "^data:image/[a-z0-9_-]+;base64,"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/ImageUtils;->BASE64_ENCODING_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addBorder(Ljava/awt/image/BufferedImage;Ljava/awt/Color;II)Ljava/awt/image/BufferedImage;
    .locals 11

    .line 327
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v0

    mul-int/lit8 v1, p2, 0x2

    add-int/2addr v0, v1

    .line 328
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v2

    add-int/2addr v2, v1

    .line 329
    new-instance v1, Ljava/awt/image/BufferedImage;

    const/4 v3, 0x2

    invoke-direct {v1, v0, v2, v3}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 332
    invoke-virtual {v1}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v4

    .line 333
    invoke-virtual {v4, p1}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 334
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v8

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v9

    const/4 v10, 0x0

    move v7, p2

    move-object v5, p0

    move v6, p2

    invoke-virtual/range {v4 .. v10}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IIIILjava/awt/image/ImageObserver;)Z

    .line 336
    new-instance p0, Ljava/awt/BasicStroke;

    int-to-float p1, v6

    const/4 p2, 0x0

    invoke-direct {p0, p1, v3, p2, p1}, Ljava/awt/BasicStroke;-><init>(FIIF)V

    invoke-virtual {v4, p0}, Ljava/awt/Graphics2D;->setStroke(Ljava/awt/Stroke;)V

    .line 337
    sget-object p0, Ljava/awt/RenderingHints;->KEY_ANTIALIASING:Ljava/awt/RenderingHints$Key;

    sget-object p1, Ljava/awt/RenderingHints;->VALUE_ANTIALIAS_ON:Ljava/lang/Object;

    invoke-virtual {v4, p0, p1}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    sub-int/2addr v0, v6

    add-int/lit8 v7, v0, -0x1

    sub-int/2addr v2, v6

    add-int/lit8 v8, v2, -0x1

    .line 343
    div-int/lit8 v5, v6, 0x2

    if-lez p3, :cond_0

    add-int v9, p3, v6

    move v6, v5

    move v10, v9

    .line 346
    invoke-virtual/range {v4 .. v10}, Ljava/awt/Graphics2D;->drawRoundRect(IIIIII)V

    goto :goto_0

    .line 348
    :cond_0
    invoke-virtual {v4, v5, v5, v7, v8}, Ljava/awt/Graphics2D;->drawRect(IIII)V

    .line 350
    :goto_0
    invoke-virtual {v4}, Ljava/awt/Graphics2D;->dispose()V

    return-object v1
.end method

.method public static base64Decode(Ljava/io/File;)Ljava/awt/image/BufferedImage;
    .locals 4

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 206
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 211
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 212
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int p0, v2

    new-array p0, p0, [B

    .line 213
    invoke-virtual {v1, p0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 214
    new-instance v1, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const/16 p0, 0x2c

    .line 215
    invoke-virtual {v1, p0}, Ljava/lang/String;->indexOf(I)I

    move-result p0

    if-ltz p0, :cond_1

    add-int/lit8 p0, p0, 0x1

    .line 217
    invoke-virtual {v1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 218
    new-instance v1, Lsun/misc/BASE64Decoder;

    invoke-direct {v1}, Lsun/misc/BASE64Decoder;-><init>()V

    invoke-virtual {v1, p0}, Lsun/misc/BASE64Decoder;->decodeBuffer(Ljava/lang/String;)[B

    move-result-object p0

    .line 220
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 221
    invoke-static {v1}, Ljavax/imageio/ImageIO;->read(Ljava/io/InputStream;)Ljava/awt/image/BufferedImage;

    move-result-object p0

    .line 222
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static base64Decode(Ljava/lang/String;)Ljava/awt/image/BufferedImage;
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 243
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x2c

    .line 248
    :try_start_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 250
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 251
    new-instance v1, Lsun/misc/BASE64Decoder;

    invoke-direct {v1}, Lsun/misc/BASE64Decoder;-><init>()V

    invoke-virtual {v1, p0}, Lsun/misc/BASE64Decoder;->decodeBuffer(Ljava/lang/String;)[B

    move-result-object p0

    .line 253
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 254
    invoke-static {v1}, Ljavax/imageio/ImageIO;->read(Ljava/io/InputStream;)Ljava/awt/image/BufferedImage;

    move-result-object p0

    .line 255
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static base64Encode(Ljava/awt/image/BufferedImage;)Ljava/lang/String;
    .locals 4

    .line 172
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v1, 0x0

    .line 175
    :try_start_0
    const-string v2, "PNG"

    invoke-static {p0, v2, v0}, Ljavax/imageio/ImageIO;->write(Ljava/awt/image/RenderedImage;Ljava/lang/String;Ljava/io/OutputStream;)Z

    .line 176
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 177
    new-instance v2, Ljava/lang/String;

    new-instance v3, Lsun/misc/BASE64Encoder;

    invoke-direct {v3}, Lsun/misc/BASE64Encoder;-><init>()V

    invoke-virtual {v3, p0}, Lsun/misc/BASE64Encoder;->encode([B)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    const-string p0, "\n"

    const-string v3, ""

    invoke-virtual {v2, p0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 179
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 181
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 184
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "data:image/png;base64,"

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static base64Encode(Ljava/io/File;)Ljava/lang/String;
    .locals 5

    const-string v0, "data:image/png;base64,"

    const/4 v1, 0x0

    if-eqz p0, :cond_1

    .line 188
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 193
    :cond_0
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 194
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v3

    long-to-int p0, v3

    new-array p0, p0, [B

    .line 195
    invoke-virtual {v2, p0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 196
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/String;

    new-instance v3, Lsun/misc/BASE64Encoder;

    invoke-direct {v3}, Lsun/misc/BASE64Encoder;-><init>()V

    invoke-virtual {v3, p0}, Lsun/misc/BASE64Encoder;->encode([B)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    const-string p0, "\n"

    const-string v3, ""

    invoke-virtual {v0, p0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    :cond_1
    :goto_0
    return-object v1
.end method

.method public static cropImage(Ljava/awt/image/BufferedImage;IIII)Ljava/awt/image/BufferedImage;
    .locals 1

    .line 640
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v0

    sub-int/2addr v0, p1

    sub-int/2addr v0, p2

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result p2

    sub-int/2addr p2, p3

    sub-int/2addr p2, p4

    invoke-virtual {p0, p1, p3, v0, p2}, Ljava/awt/image/BufferedImage;->getSubimage(IIII)Ljava/awt/image/BufferedImage;

    move-result-object p0

    return-object p0
.end method

.method public static drawHighlightOval(Ljava/awt/image/BufferedImage;IIIILjava/awt/Color;ILjava/awt/Color;)Ljava/awt/image/BufferedImage;
    .locals 6

    .line 496
    new-instance v0, Ljava/awt/image/BufferedImage;

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v2

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 497
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    .line 498
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    .line 500
    invoke-virtual {v0}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v1

    .line 502
    sget-object v2, Ljava/awt/RenderingHints;->KEY_ANTIALIASING:Ljava/awt/RenderingHints$Key;

    sget-object v4, Ljava/awt/RenderingHints;->VALUE_ANTIALIAS_ON:Ljava/lang/Object;

    invoke-virtual {v1, v2, v4}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    .line 507
    invoke-virtual {p7}, Ljava/awt/Color;->getAlpha()I

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const/4 v5, 0x0

    .line 509
    invoke-virtual {v1, p0, v4, v4, v5}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    if-eqz v2, :cond_1

    .line 512
    invoke-virtual {v1, p7}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 513
    invoke-virtual {v1, p1, p2, p3, p4}, Ljava/awt/Graphics2D;->fillOval(IIII)V

    :cond_1
    if-lez p6, :cond_2

    .line 517
    invoke-virtual {v1, p5}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 518
    new-instance p0, Ljava/awt/BasicStroke;

    int-to-float p5, p6

    invoke-direct {p0, p5, v3, v4, p5}, Ljava/awt/BasicStroke;-><init>(FIIF)V

    invoke-virtual {v1, p0}, Ljava/awt/Graphics2D;->setStroke(Ljava/awt/Stroke;)V

    .line 519
    invoke-virtual {v1, p1, p2, p3, p4}, Ljava/awt/Graphics2D;->drawOval(IIII)V

    .line 522
    :cond_2
    invoke-virtual {v1}, Ljava/awt/Graphics2D;->dispose()V

    return-object v0
.end method

.method public static drawHighlightRectangle(Ljava/awt/image/BufferedImage;IIIILjava/awt/Color;IILjava/awt/Color;)Ljava/awt/image/BufferedImage;
    .locals 12

    move-object/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v0, p8

    .line 445
    new-instance v9, Ljava/awt/image/BufferedImage;

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v2

    const/4 v10, 0x2

    invoke-direct {v9, v1, v2, v10}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 446
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    .line 447
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    .line 449
    invoke-virtual {v9}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v1

    .line 451
    sget-object v2, Ljava/awt/RenderingHints;->KEY_ANTIALIASING:Ljava/awt/RenderingHints$Key;

    sget-object v3, Ljava/awt/RenderingHints;->VALUE_ANTIALIAS_ON:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    .line 456
    invoke-virtual {v0}, Ljava/awt/Color;->getAlpha()I

    move-result v2

    const/4 v11, 0x0

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x0

    .line 458
    invoke-virtual {v1, p0, v11, v11, v3}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    if-lez p7, :cond_3

    if-eqz v2, :cond_1

    .line 462
    invoke-virtual {v1, v0}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    move/from16 v6, p7

    move v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p7

    move-object v0, v1

    move v1, p1

    .line 463
    invoke-virtual/range {v0 .. v6}, Ljava/awt/Graphics2D;->fillRoundRect(IIIIII)V

    goto :goto_1

    :cond_1
    move-object v0, v1

    :goto_1
    if-lez v8, :cond_2

    .line 467
    invoke-virtual {v0, v7}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 468
    new-instance p0, Ljava/awt/BasicStroke;

    int-to-float v1, v8

    invoke-direct {p0, v1, v10, v11, v1}, Ljava/awt/BasicStroke;-><init>(FIIF)V

    invoke-virtual {v0, p0}, Ljava/awt/Graphics2D;->setStroke(Ljava/awt/Stroke;)V

    move/from16 v6, p7

    move v1, p1

    move v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p7

    .line 469
    invoke-virtual/range {v0 .. v6}, Ljava/awt/Graphics2D;->drawRoundRect(IIIIII)V

    :cond_2
    move-object p0, v0

    goto :goto_2

    :cond_3
    move/from16 v5, p4

    move-object p0, v1

    if-eqz v2, :cond_4

    .line 473
    invoke-virtual {p0, v0}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 474
    invoke-virtual {p0, p1, p2, p3, v5}, Ljava/awt/Graphics2D;->fillRect(IIII)V

    :cond_4
    if-lez v8, :cond_5

    .line 478
    invoke-virtual {p0, v7}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 479
    new-instance v0, Ljava/awt/BasicStroke;

    int-to-float v2, v8

    invoke-direct {v0, v2, v10, v11, v2}, Ljava/awt/BasicStroke;-><init>(FIIF)V

    invoke-virtual {p0, v0}, Ljava/awt/Graphics2D;->setStroke(Ljava/awt/Stroke;)V

    .line 480
    invoke-virtual {p0, p1, p2, p3, v5}, Ljava/awt/Graphics2D;->drawRect(IIII)V

    .line 484
    :cond_5
    :goto_2
    invoke-virtual {p0}, Ljava/awt/Graphics2D;->dispose()V

    return-object v9
.end method

.method public static drawOval(Ljava/awt/image/BufferedImage;IIIILjava/awt/Color;I[FF)Ljava/awt/image/BufferedImage;
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p6

    .line 402
    new-instance v6, Ljava/awt/image/BufferedImage;

    invoke-virtual {v0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v7

    invoke-virtual {v0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v8

    const/4 v9, 0x2

    invoke-direct {v6, v7, v8, v9}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 405
    invoke-virtual {v6}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v7

    if-nez p5, :cond_0

    .line 410
    div-int/lit8 v8, v3, 0x2

    add-int/2addr v8, v1

    div-int/lit8 v10, v4, 0x2

    add-int/2addr v10, v2

    invoke-virtual {v0, v8, v10}, Ljava/awt/image/BufferedImage;->getRGB(II)I

    move-result v8

    const v10, 0xffffff

    and-int/2addr v8, v10

    not-int v8, v8

    .line 411
    const-string v10, ""

    invoke-static {v10, v8}, Ljava/awt/Color;->getColor(Ljava/lang/String;I)Ljava/awt/Color;

    move-result-object v8

    goto :goto_0

    :cond_0
    move-object/from16 v8, p5

    :goto_0
    const/4 v10, 0x0

    const/4 v11, 0x0

    .line 414
    invoke-virtual {v7, v0, v11, v11, v10}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    if-eqz p7, :cond_1

    .line 417
    new-instance v12, Ljava/awt/BasicStroke;

    int-to-float v13, v5

    const/4 v14, 0x2

    const/4 v15, 0x0

    move/from16 v16, v13

    move-object/from16 v17, p7

    move/from16 v18, p8

    invoke-direct/range {v12 .. v18}, Ljava/awt/BasicStroke;-><init>(FIIF[FF)V

    invoke-virtual {v7, v12}, Ljava/awt/Graphics2D;->setStroke(Ljava/awt/Stroke;)V

    goto :goto_1

    .line 419
    :cond_1
    new-instance v0, Ljava/awt/BasicStroke;

    int-to-float v5, v5

    invoke-direct {v0, v5, v9, v11, v5}, Ljava/awt/BasicStroke;-><init>(FIIF)V

    invoke-virtual {v7, v0}, Ljava/awt/Graphics2D;->setStroke(Ljava/awt/Stroke;)V

    .line 422
    :goto_1
    sget-object v0, Ljava/awt/RenderingHints;->KEY_ANTIALIASING:Ljava/awt/RenderingHints$Key;

    sget-object v5, Ljava/awt/RenderingHints;->VALUE_ANTIALIAS_ON:Ljava/lang/Object;

    invoke-virtual {v7, v0, v5}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    .line 431
    invoke-virtual {v7, v8}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 432
    invoke-virtual {v7, v1, v2, v3, v4}, Ljava/awt/Graphics2D;->drawOval(IIII)V

    .line 433
    invoke-virtual {v7}, Ljava/awt/Graphics2D;->dispose()V

    return-object v6
.end method

.method public static drawRectangle(Ljava/awt/image/BufferedImage;IIIILjava/awt/Color;II)Ljava/awt/image/BufferedImage;
    .locals 10

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    .line 357
    invoke-static/range {v0 .. v9}, Lcom/vladsch/flexmark/util/ImageUtils;->drawRectangle(Ljava/awt/image/BufferedImage;IIIILjava/awt/Color;II[FF)Ljava/awt/image/BufferedImage;

    move-result-object p0

    return-object p0
.end method

.method public static drawRectangle(Ljava/awt/image/BufferedImage;IIIILjava/awt/Color;II[FF)Ljava/awt/image/BufferedImage;
    .locals 15

    move/from16 v0, p6

    .line 361
    new-instance v7, Ljava/awt/image/BufferedImage;

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v2

    const/4 v3, 0x2

    invoke-direct {v7, v1, v2, v3}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 364
    invoke-virtual {v7}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v1

    if-nez p5, :cond_0

    .line 369
    div-int/lit8 v2, p3, 0x2

    add-int v2, p1, v2

    div-int/lit8 v4, p4, 0x2

    add-int v4, p2, v4

    invoke-virtual {p0, v2, v4}, Ljava/awt/image/BufferedImage;->getRGB(II)I

    move-result v2

    const v4, 0xffffff

    and-int/2addr v2, v4

    not-int v2, v2

    .line 370
    const-string v4, ""

    invoke-static {v4, v2}, Ljava/awt/Color;->getColor(Ljava/lang/String;I)Ljava/awt/Color;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object/from16 v2, p5

    :goto_0
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 373
    invoke-virtual {v1, p0, v5, v5, v4}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    if-eqz p8, :cond_1

    .line 376
    new-instance v8, Ljava/awt/BasicStroke;

    int-to-float v9, v0

    const/4 v10, 0x2

    const/4 v11, 0x0

    move v12, v9

    move-object/from16 v13, p8

    move/from16 v14, p9

    invoke-direct/range {v8 .. v14}, Ljava/awt/BasicStroke;-><init>(FIIF[FF)V

    invoke-virtual {v1, v8}, Ljava/awt/Graphics2D;->setStroke(Ljava/awt/Stroke;)V

    goto :goto_1

    .line 378
    :cond_1
    new-instance p0, Ljava/awt/BasicStroke;

    int-to-float v0, v0

    invoke-direct {p0, v0, v3, v5, v0}, Ljava/awt/BasicStroke;-><init>(FIIF)V

    invoke-virtual {v1, p0}, Ljava/awt/Graphics2D;->setStroke(Ljava/awt/Stroke;)V

    .line 381
    :goto_1
    sget-object p0, Ljava/awt/RenderingHints;->KEY_ANTIALIASING:Ljava/awt/RenderingHints$Key;

    sget-object v0, Ljava/awt/RenderingHints;->VALUE_ANTIALIAS_ON:Ljava/lang/Object;

    invoke-virtual {v1, p0, v0}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    .line 390
    invoke-virtual {v1, v2}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    if-lez p7, :cond_2

    move/from16 v6, p7

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p7

    move-object v0, v1

    move/from16 v1, p1

    .line 392
    invoke-virtual/range {v0 .. v6}, Ljava/awt/Graphics2D;->drawRoundRect(IIIIII)V

    goto :goto_2

    :cond_2
    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object v0, v1

    move/from16 v1, p1

    .line 394
    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/awt/Graphics2D;->drawRect(IIII)V

    .line 396
    :goto_2
    invoke-virtual {v0}, Ljava/awt/Graphics2D;->dispose()V

    return-object v7
.end method

.method public static getImageBytes(Ljava/awt/image/BufferedImage;)[B
    .locals 2

    .line 704
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 707
    :try_start_0
    const-string v1, "PNG"

    invoke-static {p0, v1, v0}, Ljavax/imageio/ImageIO;->write(Ljava/awt/image/RenderedImage;Ljava/lang/String;Ljava/io/OutputStream;)Z

    .line 708
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 710
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 713
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static getImageFromClipboard()Ljava/awt/Image;
    .locals 2

    .line 64
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v0

    invoke-virtual {v0}, Ljava/awt/Toolkit;->getSystemClipboard()Ljava/awt/datatransfer/Clipboard;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/awt/datatransfer/Clipboard;->getContents(Ljava/lang/Object;)Ljava/awt/datatransfer/Transferable;

    move-result-object v0

    .line 65
    invoke-static {v0}, Lcom/vladsch/flexmark/util/ImageUtils;->getImageFromTransferable(Ljava/awt/datatransfer/Transferable;)Ljava/awt/Image;

    move-result-object v0

    return-object v0
.end method

.method public static getImageFromTransferable(Ljava/awt/datatransfer/Transferable;)Ljava/awt/Image;
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 70
    :try_start_0
    sget-object v1, Ljava/awt/datatransfer/DataFlavor;->imageFlavor:Ljava/awt/datatransfer/DataFlavor;

    invoke-interface {p0, v1}, Ljava/awt/datatransfer/Transferable;->isDataFlavorSupported(Ljava/awt/datatransfer/DataFlavor;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    sget-object v1, Ljava/awt/datatransfer/DataFlavor;->imageFlavor:Ljava/awt/datatransfer/DataFlavor;

    invoke-interface {p0, v1}, Ljava/awt/datatransfer/Transferable;->getTransferData(Ljava/awt/datatransfer/DataFlavor;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/awt/Image;
    :try_end_0
    .catch Ljava/awt/datatransfer/UnsupportedFlavorException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 78
    :catch_0
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0

    :catch_1
    move-exception p0

    .line 76
    invoke-virtual {p0}, Ljava/awt/datatransfer/UnsupportedFlavorException;->printStackTrace()V

    :cond_0
    return-object v0
.end method

.method public static isEncodedImage(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    .line 235
    const-string v0, "data:image/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vladsch/flexmark/util/ImageUtils;->BASE64_ENCODING_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isPossiblyEncodedImage(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    .line 239
    const-string v0, "data:image/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static loadImageFromFile(Ljava/io/File;)Ljava/awt/image/BufferedImage;
    .locals 5

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    .line 141
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_2

    .line 150
    :try_start_0
    invoke-static {p0}, Ljavax/imageio/ImageIO;->read(Ljava/io/File;)Ljava/awt/image/BufferedImage;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez v1, :cond_1

    .line 157
    :try_start_1
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_1
    return-object p0

    .line 152
    :catch_0
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "*"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 153
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "could not read"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catchall_0
    :cond_2
    :goto_1
    return-object v0
.end method

.method public static loadImageFromURL(Ljava/lang/String;)Ljava/awt/image/BufferedImage;
    .locals 1

    const/4 v0, 0x0

    .line 265
    invoke-static {p0, v0}, Lcom/vladsch/flexmark/util/ImageUtils;->loadImageFromURL(Ljava/lang/String;Z)Ljava/awt/image/BufferedImage;

    move-result-object p0

    return-object p0
.end method

.method public static loadImageFromURL(Ljava/lang/String;Z)Ljava/awt/image/BufferedImage;
    .locals 1

    if-eqz p0, :cond_0

    .line 280
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljavax/imageio/ImageIO;->read(Ljava/net/URL;)Ljava/awt/image/BufferedImage;

    move-result-object p0

    .line 281
    invoke-static {p0}, Lcom/vladsch/flexmark/util/ImageUtils;->toBufferedImage(Ljava/awt/Image;)Ljava/awt/image/BufferedImage;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    if-eqz p1, :cond_0

    .line 284
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static makeRoundedCorner(Ljava/awt/image/BufferedImage;II)Ljava/awt/image/BufferedImage;
    .locals 9

    int-to-float v5, p1

    const/4 p1, 0x0

    cmpl-float p1, v5, p1

    if-nez p1, :cond_0

    return-object p0

    .line 298
    :cond_0
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result p1

    .line 299
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result p2

    .line 300
    new-instance v7, Ljava/awt/image/BufferedImage;

    const/4 v0, 0x2

    invoke-direct {v7, p1, p2, v0}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 303
    invoke-virtual {v7}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v8

    .line 310
    sget-object v0, Ljava/awt/AlphaComposite;->Src:Ljava/awt/AlphaComposite;

    invoke-virtual {v8, v0}, Ljava/awt/Graphics2D;->setComposite(Ljava/awt/Composite;)V

    .line 311
    sget-object v0, Ljava/awt/RenderingHints;->KEY_ANTIALIASING:Ljava/awt/RenderingHints$Key;

    sget-object v1, Ljava/awt/RenderingHints;->VALUE_ANTIALIAS_ON:Ljava/lang/Object;

    invoke-virtual {v8, v0, v1}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    .line 312
    sget-object v0, Ljava/awt/Color;->WHITE:Ljava/awt/Color;

    invoke-virtual {v8, v0}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 314
    new-instance v0, Ljava/awt/geom/RoundRectangle2D$Float;

    int-to-float v3, p1

    int-to-float v4, p2

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v6, v5

    invoke-direct/range {v0 .. v6}, Ljava/awt/geom/RoundRectangle2D$Float;-><init>(FFFFFF)V

    invoke-virtual {v8, v0}, Ljava/awt/Graphics2D;->fill(Ljava/awt/Shape;)V

    .line 318
    sget-object p1, Ljava/awt/AlphaComposite;->SrcAtop:Ljava/awt/AlphaComposite;

    invoke-virtual {v8, p1}, Ljava/awt/Graphics2D;->setComposite(Ljava/awt/Composite;)V

    const/4 p1, 0x0

    const/4 p2, 0x0

    .line 319
    invoke-virtual {v8, p0, p2, p2, p1}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    .line 321
    invoke-virtual {v8}, Ljava/awt/Graphics2D;->dispose()V

    return-object v7
.end method

.method public static punchOuterHighlightOval(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;IIIIILjava/awt/Color;IIZ)Ljava/awt/image/BufferedImage;
    .locals 8

    .line 595
    invoke-virtual {p7}, Ljava/awt/Color;->getAlpha()I

    move-result v0

    if-eqz v0, :cond_4

    if-eqz p1, :cond_0

    move-object v7, p1

    goto :goto_0

    .line 601
    :cond_0
    new-instance v0, Ljava/awt/image/BufferedImage;

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v2

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Ljava/awt/image/BufferedImage;-><init>(III)V

    move-object v7, v0

    .line 602
    :goto_0
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v0

    .line 603
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v1

    move v2, v0

    .line 605
    invoke-virtual {v7}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v0

    .line 607
    sget-object v3, Ljava/awt/RenderingHints;->KEY_ANTIALIASING:Ljava/awt/RenderingHints$Key;

    sget-object v4, Ljava/awt/RenderingHints;->VALUE_ANTIALIAS_ON:Ljava/lang/Object;

    invoke-virtual {v0, v3, v4}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    if-nez p1, :cond_2

    .line 614
    invoke-virtual {v0, p7}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    if-lez p9, :cond_1

    mul-int/lit8 p1, p8, 0x2

    sub-int v3, v2, p1

    sub-int v4, v1, p1

    move/from16 v2, p8

    move/from16 v6, p9

    move/from16 v1, p8

    move/from16 v5, p9

    .line 616
    invoke-virtual/range {v0 .. v6}, Ljava/awt/Graphics2D;->fillRoundRect(IIIIII)V

    goto :goto_1

    :cond_1
    move/from16 p1, p8

    mul-int/lit8 p7, p1, 0x2

    sub-int/2addr v2, p7

    sub-int/2addr v1, p7

    .line 618
    invoke-virtual {v0, p1, p1, v2, v1}, Ljava/awt/Graphics2D;->fillRect(IIII)V

    .line 622
    :cond_2
    :goto_1
    sget-object p1, Lcom/vladsch/flexmark/util/ImageUtils;->TRANSPARENT:Ljava/awt/Color;

    invoke-virtual {v0, p1}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 623
    sget-object p1, Ljava/awt/AlphaComposite;->Src:Ljava/awt/AlphaComposite;

    invoke-virtual {v0, p1}, Ljava/awt/Graphics2D;->setComposite(Ljava/awt/Composite;)V

    .line 624
    div-int/lit8 p1, p6, 0x2

    sub-int/2addr p2, p1

    filled-new-array {p2}, [I

    move-result-object p2

    const/4 p7, 0x0

    invoke-static {p7, p2}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p2

    sub-int/2addr p3, p1

    filled-new-array {p3}, [I

    move-result-object p1

    invoke-static {p7, p1}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p1

    add-int/2addr p4, p6

    add-int/2addr p5, p6

    invoke-virtual {v0, p2, p1, p4, p5}, Ljava/awt/Graphics2D;->fillOval(IIII)V

    if-eqz p10, :cond_3

    .line 628
    sget-object p1, Ljava/awt/AlphaComposite;->DstOver:Ljava/awt/AlphaComposite;

    invoke-virtual {v0, p1}, Ljava/awt/Graphics2D;->setComposite(Ljava/awt/Composite;)V

    const/4 p1, 0x0

    .line 629
    invoke-virtual {v0, p0, p7, p7, p1}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    .line 632
    :cond_3
    invoke-virtual {v0}, Ljava/awt/Graphics2D;->dispose()V

    return-object v7

    :cond_4
    return-object p1
.end method

.method public static punchOuterHighlightRectangle(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;IIIIIILjava/awt/Color;IIZ)Ljava/awt/image/BufferedImage;
    .locals 8

    .line 537
    invoke-virtual/range {p8 .. p8}, Ljava/awt/Color;->getAlpha()I

    move-result v0

    if-eqz v0, :cond_5

    if-eqz p1, :cond_0

    move-object v7, p1

    goto :goto_0

    .line 543
    :cond_0
    new-instance v0, Ljava/awt/image/BufferedImage;

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v2

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Ljava/awt/image/BufferedImage;-><init>(III)V

    move-object v7, v0

    .line 544
    :goto_0
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v0

    .line 545
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v1

    move v2, v0

    .line 547
    invoke-virtual {v7}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v0

    .line 549
    sget-object v3, Ljava/awt/RenderingHints;->KEY_ANTIALIASING:Ljava/awt/RenderingHints$Key;

    sget-object v4, Ljava/awt/RenderingHints;->VALUE_ANTIALIAS_ON:Ljava/lang/Object;

    invoke-virtual {v0, v3, v4}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    if-nez p1, :cond_2

    move-object/from16 p1, p8

    .line 556
    invoke-virtual {v0, p1}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    if-lez p10, :cond_1

    mul-int/lit8 p1, p9, 0x2

    sub-int v3, v2, p1

    sub-int v4, v1, p1

    move/from16 v2, p9

    move/from16 v6, p10

    move/from16 v1, p9

    move/from16 v5, p10

    .line 558
    invoke-virtual/range {v0 .. v6}, Ljava/awt/Graphics2D;->fillRoundRect(IIIIII)V

    goto :goto_1

    :cond_1
    move-object p1, v0

    move/from16 v0, p9

    mul-int/lit8 v3, v0, 0x2

    sub-int/2addr v2, v3

    sub-int/2addr v1, v3

    .line 560
    invoke-virtual {p1, v0, v0, v2, v1}, Ljava/awt/Graphics2D;->fillRect(IIII)V

    goto :goto_2

    :cond_2
    :goto_1
    move-object p1, v0

    :goto_2
    const/4 v0, 0x0

    if-lez p7, :cond_3

    .line 565
    sget-object v1, Lcom/vladsch/flexmark/util/ImageUtils;->TRANSPARENT:Ljava/awt/Color;

    invoke-virtual {p1, v1}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 566
    sget-object v1, Ljava/awt/AlphaComposite;->Src:Ljava/awt/AlphaComposite;

    invoke-virtual {p1, v1}, Ljava/awt/Graphics2D;->setComposite(Ljava/awt/Composite;)V

    .line 567
    div-int/lit8 v1, p6, 0x2

    sub-int/2addr p2, v1

    filled-new-array {p2}, [I

    move-result-object p2

    invoke-static {v0, p2}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p2

    sub-int/2addr p3, v1

    filled-new-array {p3}, [I

    move-result-object p3

    invoke-static {v0, p3}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p3

    add-int/2addr p4, p6

    add-int/2addr p5, p6

    add-int/2addr p6, p7

    move v1, p6

    move p7, v1

    invoke-virtual/range {p1 .. p7}, Ljava/awt/Graphics2D;->fillRoundRect(IIIIII)V

    goto :goto_3

    .line 569
    :cond_3
    sget-object v1, Lcom/vladsch/flexmark/util/ImageUtils;->TRANSPARENT:Ljava/awt/Color;

    invoke-virtual {p1, v1}, Ljava/awt/Graphics2D;->setColor(Ljava/awt/Color;)V

    .line 570
    sget-object v1, Ljava/awt/AlphaComposite;->Src:Ljava/awt/AlphaComposite;

    invoke-virtual {p1, v1}, Ljava/awt/Graphics2D;->setComposite(Ljava/awt/Composite;)V

    .line 571
    div-int/lit8 v1, p6, 0x2

    sub-int/2addr p2, v1

    filled-new-array {p2}, [I

    move-result-object p2

    invoke-static {v0, p2}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p2

    sub-int/2addr p3, v1

    filled-new-array {p3}, [I

    move-result-object p3

    invoke-static {v0, p3}, Lcom/vladsch/flexmark/util/Utils;->minLimit(I[I)I

    move-result p3

    add-int/2addr p4, p6

    add-int/2addr p5, p6

    invoke-virtual {p1, p2, p3, p4, p5}, Ljava/awt/Graphics2D;->fillRect(IIII)V

    :goto_3
    if-eqz p11, :cond_4

    .line 576
    sget-object p2, Ljava/awt/AlphaComposite;->DstOver:Ljava/awt/AlphaComposite;

    invoke-virtual {p1, p2}, Ljava/awt/Graphics2D;->setComposite(Ljava/awt/Composite;)V

    const/4 p2, 0x0

    .line 577
    invoke-virtual {p1, p0, v0, v0, p2}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    .line 580
    :cond_4
    invoke-virtual {p1}, Ljava/awt/Graphics2D;->dispose()V

    return-object v7

    :cond_5
    return-object p1
.end method

.method public static removeAlpha(Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;
    .locals 12

    .line 648
    new-instance v0, Ljava/awt/image/BufferedImage;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/awt/image/BufferedImage;->getWidth(Ljava/awt/image/ImageObserver;)I

    move-result v2

    invoke-virtual {p0, v1}, Ljava/awt/image/BufferedImage;->getHeight(Ljava/awt/image/ImageObserver;)I

    move-result v1

    const/4 v3, 0x1

    invoke-direct {v0, v2, v1, v3}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 650
    invoke-virtual {v0}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v4

    .line 652
    invoke-virtual {v0}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v8

    invoke-virtual {v0}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v9

    sget-object v10, Ljava/awt/Color;->WHITE:Ljava/awt/Color;

    const/4 v11, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v5, p0

    invoke-virtual/range {v4 .. v11}, Ljava/awt/Graphics;->drawImage(Ljava/awt/Image;IIIILjava/awt/Color;Ljava/awt/image/ImageObserver;)Z

    .line 653
    invoke-virtual {v4}, Ljava/awt/Graphics;->dispose()V

    return-object v0
.end method

.method public static save(Ljava/awt/image/BufferedImage;Ljava/io/File;Ljava/lang/String;)V
    .locals 2

    .line 129
    :try_start_0
    invoke-static {p0, p2, p1}, Ljavax/imageio/ImageIO;->write(Ljava/awt/image/RenderedImage;Ljava/lang/String;Ljava/io/File;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 131
    sget-object p2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Write error for "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public static scaleImage(Ljava/awt/image/BufferedImage;III)Ljava/awt/image/BufferedImage;
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    if-eqz p1, :cond_3

    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    int-to-double v1, p1

    .line 94
    invoke-virtual {p0, v0}, Ljava/awt/image/BufferedImage;->getWidth(Ljava/awt/image/ImageObserver;)I

    move-result p1

    int-to-double v3, p1

    div-double/2addr v1, v3

    int-to-double p1, p2

    .line 95
    invoke-virtual {p0, v0}, Ljava/awt/image/BufferedImage;->getHeight(Ljava/awt/image/ImageObserver;)I

    move-result v3

    int-to-double v3, v3

    div-double/2addr p1, v3

    .line 93
    invoke-static {v1, v2, p1, p2}, Ljava/awt/geom/AffineTransform;->getScaleInstance(DD)Ljava/awt/geom/AffineTransform;

    move-result-object p1

    .line 99
    new-instance p2, Ljava/awt/image/AffineTransformOp;

    if-eqz p3, :cond_2

    goto :goto_0

    :cond_2
    const/4 p3, 0x2

    :goto_0
    invoke-direct {p2, p1, p3}, Ljava/awt/image/AffineTransformOp;-><init>(Ljava/awt/geom/AffineTransform;I)V

    .line 100
    invoke-virtual {p2, p0, v0}, Ljava/awt/image/AffineTransformOp;->filter(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_1
    return-object v0
.end method

.method public static toBufferedImage(Ljava/awt/Image;)Ljava/awt/image/BufferedImage;
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 106
    :cond_0
    instance-of v1, p0, Ljava/awt/image/BufferedImage;

    if-eqz v1, :cond_1

    .line 107
    check-cast p0, Ljava/awt/image/BufferedImage;

    return-object p0

    .line 110
    :cond_1
    invoke-virtual {p0, v0}, Ljava/awt/Image;->getWidth(Ljava/awt/image/ImageObserver;)I

    move-result v1

    .line 111
    invoke-virtual {p0, v0}, Ljava/awt/Image;->getHeight(Ljava/awt/image/ImageObserver;)I

    move-result v2

    if-ltz v1, :cond_3

    if-gez v2, :cond_2

    goto :goto_0

    .line 117
    :cond_2
    new-instance v3, Ljava/awt/image/BufferedImage;

    const/4 v4, 0x2

    invoke-direct {v3, v1, v2, v4}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 119
    invoke-virtual {v3}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    move-result-object v1

    const/4 v2, 0x0

    .line 120
    invoke-virtual {v1, p0, v2, v2, v0}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    .line 122
    invoke-virtual {v1}, Ljava/awt/Graphics2D;->dispose()V

    return-object v3

    :cond_3
    :goto_0
    return-object v0
.end method

.method public static toTransparent(Ljava/awt/image/BufferedImage;Ljava/awt/Color;I)Ljava/awt/Image;
    .locals 1

    .line 670
    new-instance v0, Lcom/vladsch/flexmark/util/ImageUtils$1;

    invoke-direct {v0, p1, p2}, Lcom/vladsch/flexmark/util/ImageUtils$1;-><init>(Ljava/awt/Color;I)V

    .line 698
    new-instance p1, Ljava/awt/image/FilteredImageSource;

    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getSource()Ljava/awt/image/ImageProducer;

    move-result-object p0

    invoke-direct {p1, p0, v0}, Ljava/awt/image/FilteredImageSource;-><init>(Ljava/awt/image/ImageProducer;Ljava/awt/image/ImageFilter;)V

    .line 699
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/awt/Toolkit;->createImage(Ljava/awt/image/ImageProducer;)Ljava/awt/Image;

    move-result-object p0

    return-object p0
.end method
