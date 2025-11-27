.class public Lcom/flyersoft/books/mhtml/IMhtmlParas;
.super Ljava/lang/Object;
.source "IMhtmlParas.java"

# interfaces
.implements Lcom/flyersoft/books/mhtml/IMhtmlConstants;


# static fields
.field private static ESCAPE_CHAR:B

.field private static final boundary:Ljava/util/regex/Pattern;

.field private static final contentId:Ljava/util/regex/Pattern;

.field private static final contentLocation:Ljava/util/regex/Pattern;

.field private static final contentTransferEncodingPattern:Ljava/util/regex/Pattern;

.field private static final contentType:Ljava/util/regex/Pattern;

.field private static final contentTypeImage:Ljava/util/regex/Pattern;

.field private static final p:Ljava/util/regex/Pattern;

.field private static final partSign:Ljava/util/regex/Pattern;


# instance fields
.field public boundaryParts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public isinit:Z

.field private mhtFile:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    const-string v0, "(\\w|_|-)+\\.\\w+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->p:Ljava/util/regex/Pattern;

    .line 40
    const-string v0, "\\bb(\\s)*o(\\s)*u(\\s)*n(\\s)*d(\\s)*a(\\s)*r(\\s)*y(\\s)*\\=(\\s)*\"(\\S)*\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->boundary:Ljava/util/regex/Pattern;

    .line 45
    const-string v0, "\\bContent-Transfer-Encoding(\\s)*:(\\s)*(\\w|\\-)+\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentTransferEncodingPattern:Ljava/util/regex/Pattern;

    .line 50
    const-string v0, "\\bContent-Location(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s)+\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentLocation:Ljava/util/regex/Pattern;

    .line 56
    const-string v0, "\\b(Content-Location|Content-ID){1}(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s|\\>|\\<)+\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->partSign:Ljava/util/regex/Pattern;

    .line 62
    const-string v0, "\\bContent-ID(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s|\\>|\\<)+\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentId:Ljava/util/regex/Pattern;

    .line 66
    const-string v0, "\\bContent-Type(\\s)*:(\\s)*(image/png|image/jpeg|image/gif|image/\\*){1}\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentTypeImage:Ljava/util/regex/Pattern;

    .line 68
    const-string v0, "\\bContent-Type(\\s)*:(\\s)*(\\w|/|\\*)*\\b"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentType:Ljava/util/regex/Pattern;

    const/16 v0, 0x3d

    .line 644
    sput-byte v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->ESCAPE_CHAR:B

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->boundaryParts:Ljava/util/List;

    .line 76
    iput-boolean v1, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->isinit:Z

    .line 84
    iput-object p1, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->mhtFile:Ljava/lang/String;

    return-void
.end method

.method private convertBoundary2Map(Ljava/util/List;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 525
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 527
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->doDealContentId(Ljava/util/List;Ljava/util/Map;)V

    .line 528
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->doDealContentLocation(Ljava/util/List;Ljava/util/Map;)V

    return-object v0
.end method

.method private decodeContent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 265
    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 267
    const-string v0, "quoted-printable"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 268
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->decodeQuotedPrintable([B)[B

    move-result-object p1

    return-object p1

    .line 269
    :cond_0
    const-string v0, "base64"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 270
    invoke-static {p2}, Lcom/flyersoft/opds/MyBase64;->decode(Ljava/lang/String;)[B

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static final decodeQuotedPrintable([B)[B
    .locals 7

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 649
    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v2, 0x0

    .line 650
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_5

    .line 651
    aget-byte v3, p0, v2

    .line 652
    sget-byte v4, Lcom/flyersoft/books/mhtml/IMhtmlParas;->ESCAPE_CHAR:B

    if-ne v3, v4, :cond_4

    add-int/lit8 v3, v2, 0x1

    .line 654
    :try_start_0
    aget-byte v3, p0, v3

    int-to-char v4, v3

    const/16 v5, 0xd

    if-ne v5, v4, :cond_1

    add-int/lit8 v4, v2, 0x2

    aget-byte v5, p0, v4

    int-to-char v5, v5

    const/16 v6, 0xa

    if-ne v6, v5, :cond_1

    move v2, v4

    goto :goto_2

    :cond_1
    int-to-char v3, v3

    const/16 v4, 0x10

    .line 659
    invoke-static {v3, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    add-int/lit8 v2, v2, 0x2

    .line 660
    aget-byte v5, p0, v2

    int-to-char v5, v5

    invoke-static {v5, v4}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    const/4 v5, -0x1

    if-eq v3, v5, :cond_3

    if-ne v4, v5, :cond_2

    goto :goto_1

    :cond_2
    shl-int/lit8 v3, v3, 0x4

    add-int/2addr v3, v4

    int-to-char v3, v3

    .line 664
    invoke-virtual {v1, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    :cond_3
    :goto_1
    return-object v0

    .line 669
    :cond_4
    invoke-virtual {v1, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 672
    :cond_5
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method private doDealContentId(Ljava/util/List;Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 574
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 575
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 576
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 577
    const-string v1, "\\bContent-ID(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s|\\>|\\<)+\\b"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 578
    array-length v1, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    .line 579
    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "{}\u4e0d\u5b58\u5728Content-ID,\u5c06\u4e0d\u653e\u5165boundaryMaps\u96c6\u5408"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_0

    .line 583
    :cond_0
    :try_start_0
    invoke-direct {p0, v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->getContentID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 584
    invoke-direct {p0, v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->reductionContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 585
    invoke-interface {p2, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 588
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "{}\u83b7\u53d6Content-ID\u5f02\u5e38,\u5c06\u4e0d\u653e\u5165boundaryMaps\u96c6\u5408\u3002\u5f02\u5e38\u4e3a\uff1a{}"

    aput-object v5, v4, v2

    aput-object v0, v4, v3

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 589
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private doDealContentLocation(Ljava/util/List;Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 541
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 542
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 543
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 544
    const-string v1, "\\bContent-Location(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s)+\\b"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 545
    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2

    array-length v1, v1

    if-ne v1, v4, :cond_1

    goto :goto_1

    .line 550
    :cond_1
    :try_start_0
    invoke-direct {p0, v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->getLocation(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 551
    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 552
    const-string v5, "http://"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "https://"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 553
    invoke-direct {p0, v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->reductionContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 554
    invoke-interface {p2, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 555
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 558
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v5, "{}\u83b7\u53d6Content-Location\u5f02\u5e38,\u5c06\u4e0d\u653e\u5165boundaryMaps\u96c6\u5408\u3002\u5f02\u5e38\u4e3a\uff1a{}"

    aput-object v5, v2, v3

    aput-object v0, v2, v4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 559
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 546
    :cond_2
    :goto_1
    new-array v0, v4, [Ljava/lang/Object;

    const-string v1, "{}\u4e0d\u5b58\u5728Content-Location,\u5c06\u4e0d\u653e\u5165boundaryMaps\u96c6\u5408"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method private doDealContentTypePng(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 305
    const-string v0, "\\bContent-Type(\\s)*:(\\s)*(image/png|image/jpeg|image/gif|image/\\*){1}\\b"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 306
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ne v1, v5, :cond_0

    .line 307
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-array v0, v4, [Ljava/lang/Object;

    const-string v1, "{}\u4e0d\u662fimage/*\u7c7b\u578b"

    aput-object v1, v0, v3

    aput-object p1, v0, v5

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_0

    .line 308
    :cond_0
    array-length v0, v0

    if-eq v0, v4, :cond_1

    .line 309
    new-array p1, v5, [Ljava/lang/Object;

    const-string v0, "{}\u4e0d\u662f\u89c4\u8303\u7684image/*\u5185\u5bb9\uff0c\u56e0\u4e3a\u5305\u542b\u591a\u4e2aimage/*"

    aput-object v0, p1, v3

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :goto_0
    return-object v2

    .line 313
    :cond_1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->getContentTransferEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 314
    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 317
    const-string v1, "base64"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 318
    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->getContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 319
    const-string v1, "data:%s;base64,"

    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->getPartContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v3

    aput-object p1, v4, v5

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    :cond_2
    return-object v2
.end method

.method private doDealCssOrHtml(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 231
    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->getContentTransferEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 233
    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->getPartContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 237
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->decodeContent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    return-object p1

    .line 241
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 242
    new-instance v1, Ljava/lang/String;

    check-cast v0, [B

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    return-object v1

    .line 243
    :cond_1
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 244
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception v0

    .line 250
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    .line 252
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "###################\u6267\u884c\u52a0\u5bc6\u8fd4\u56de\u5f02\u5e38###################"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-object p1
.end method

.method private findType(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 181
    iget-object v0, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->boundaryParts:Ljava/util/List;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 185
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 186
    iget-object v1, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->boundaryParts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 188
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 190
    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 192
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 193
    invoke-direct {p0, v2}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->reductionContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0

    .line 183
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Invalidated mhtml file, no content found."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getBoundary(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 419
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->boundary:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    const/4 v0, 0x0

    .line 421
    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez v0, :cond_0

    .line 423
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 426
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Invalidated mhtml file, Multiple delimiter content found."

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 430
    :cond_1
    const-string p1, "\""

    invoke-virtual {v0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    aget-object p1, p1, v0

    return-object p1
.end method

.method private getContentID(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 609
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentId:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    const/4 v0, 0x0

    .line 613
    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 615
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 616
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 619
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "%s is invalidated mhtml\uff0cMultiple eligible Content-IDs found"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 624
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 630
    const-string p1, "\\:"

    invoke-virtual {v0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    aget-object p1, p1, v0

    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 632
    const-string v1, "<"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, ">"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 634
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_2
    return-object p1

    .line 626
    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "%s is invalidated mhtml\uff0cNo eligible Content-IDs found"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getContentTransferEncoding(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 396
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentTransferEncodingPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    const/4 v0, 0x0

    .line 398
    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x0

    const-string v3, "%s is invalidated mhtml content\uff0cit contains multiple Content-Transfer-Encoding"

    if-eqz v1, :cond_1

    .line 399
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 400
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 403
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 406
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 411
    const-string p1, "\\:"

    invoke-virtual {v0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    aget-object p1, p1, v0

    return-object p1

    .line 408
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getContentType(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 276
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentType:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    const/4 v0, 0x0

    .line 279
    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x0

    const-string v3, "%s is invalidated mhtml content\uff0cit contains multiple Content-Type:xxxx/xxx"

    if-eqz v1, :cond_1

    .line 280
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 281
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 284
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 288
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 293
    const-string p1, ":"

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 290
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getLocation(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 365
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->contentLocation:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    const/4 v0, 0x0

    .line 368
    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 369
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 370
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 373
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "%s is invalidated mhtml content"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 376
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 381
    const-string p1, ":"

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    .line 383
    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 378
    :cond_2
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "No Validated Content-Location"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getPartContent(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 343
    const-string v0, "\\bContent-Location(\\s)*:(\\s)*(\\w|@|\\.|-|/|\\?|\\&|\\=|\\:|%|\\s)+\\b"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 345
    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 346
    const-string v0, "\\bContent-Transfer-Encoding(\\s)*:(\\s)*(\\w|\\-)+\\b"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 348
    :cond_0
    array-length p1, v0

    if-eq p1, v2, :cond_1

    .line 354
    aget-object p1, v0, v2

    return-object p1

    .line 350
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "%s is invalidated mhtml content"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private isPart(Ljava/lang/String;)Z
    .locals 1

    .line 133
    :try_start_0
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->partSign:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 135
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    .line 140
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private reductionContent(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 211
    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->doDealContentTypePng(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 213
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 214
    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->doDealCssOrHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method


# virtual methods
.method public convet2Html()Ljava/lang/String;
    .locals 12

    .line 444
    iget-boolean v0, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->isinit:Z

    if-eqz v0, :cond_8

    .line 449
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->boundaryParts:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 450
    invoke-direct {p0, v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->convertBoundary2Map(Ljava/util/List;)Ljava/util/Map;

    move-result-object v0

    .line 452
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 454
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 455
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 456
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    if-eqz v4, :cond_1

    .line 457
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 459
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "cid:"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string v8, "fram"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 460
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 462
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 463
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 464
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "<style type=\"text/css\">"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 465
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    const-string v8, "</style>"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 468
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v4, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    const/4 v11, 0x0

    invoke-virtual {v4, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v4, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    .line 470
    const-string v11, ">"

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    .line 471
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v11, v11, 0x1

    .line 472
    invoke-virtual {v8, v11, v9}, Ljava/lang/StringBuilder;->insert(ILjava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 473
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 474
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 484
    :cond_2
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 485
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 486
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    if-eqz v4, :cond_4

    .line 487
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 488
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "frame"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 489
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 490
    const-string v8, "</iframe>"

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    .line 491
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 492
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v9, v8, v7}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 493
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 502
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 503
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_6

    .line 505
    const-string v3, "<!DOCTYPE html"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 506
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 510
    :cond_7
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 446
    :cond_8
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Get exception, please initialize data first"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getParts(Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 153
    iget-boolean v0, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->isinit:Z

    if-eqz v0, :cond_3

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 158
    sget-object v2, Lcom/flyersoft/books/mhtml/IMhtmlParas$1;->$SwitchMap$com$flyersoft$books$mhtml$IMhtmlPartEnum:[I

    invoke-virtual {p1}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->ordinal()I

    move-result p1

    aget p1, v2, p1

    const/4 v2, 0x1

    if-eq p1, v2, :cond_2

    const/4 v3, 0x2

    if-eq p1, v3, :cond_1

    const/4 v3, 0x3

    if-eq p1, v3, :cond_1

    const/4 v3, 0x4

    if-eq p1, v3, :cond_1

    const/4 v3, 0x5

    if-eq p1, v3, :cond_0

    .line 171
    new-array p1, v2, [Ljava/lang/Object;

    const-string v2, "\u65e0\u77e5\u7c7b\u578b"

    aput-object v2, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-object v0

    .line 168
    :cond_0
    const-string p1, "(\\s)*Content-Type(\\s)*:(\\s)*text/html"

    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->findType(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object v0

    .line 165
    :cond_1
    const-string p1, "\\bContent-Type(\\s)*:(\\s)*(image/png|image/jpeg|image/gif|image/\\*){1}\\b"

    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->findType(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object v0

    .line 160
    :cond_2
    const-string p1, "\\bContent-Type(\\s)*:(\\s)*text/css\\b"

    invoke-direct {p0, p1}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->findType(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object v0

    .line 155
    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Get exception, please initialize data first"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public init()Lcom/flyersoft/books/mhtml/IMhtmlParas;
    .locals 8

    .line 95
    iget-object v0, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->mhtFile:Ljava/lang/String;

    .line 97
    invoke-direct {p0, v0}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->getBoundary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    const/4 v2, 0x1

    .line 103
    iput-boolean v2, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->isinit:Z

    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 105
    new-instance v1, Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v4, 0x0

    .line 106
    :goto_0
    array-length v5, v0

    if-ge v4, v5, :cond_2

    const/4 v5, 0x2

    if-nez v4, :cond_0

    .line 108
    array-length v6, v0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v5, v5, [Ljava/lang/Object;

    const-string v7, "  {}  \u662f\u6587\u4ef6\u5934\u90e8,\u5c06\u88ab\u5ffd\u7565"

    aput-object v7, v5, v3

    aput-object v6, v5, v2

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_1

    .line 111
    :cond_0
    aget-object v6, v0, v4

    .line 112
    invoke-direct {p0, v6}, Lcom/flyersoft/books/mhtml/IMhtmlParas;->isPart(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 113
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 115
    :cond_1
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v5, v5, [Ljava/lang/Object;

    const-string v7, " {}  \u4e0d\u7b26\u5408mhtml\u7684\u5185\u5bb9\u89c4\u8303\uff0c\u5c06\u5ffd\u7565"

    aput-object v7, v5, v3

    aput-object v6, v5, v2

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 119
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/mhtml/IMhtmlParas;->boundaryParts:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object p0

    .line 100
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Invalidated mhtml file."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
