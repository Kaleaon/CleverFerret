.class final Lcom/flyersoft/staticlayout/SHXMLParser;
.super Ljava/lang/Object;
.source "HyphenationXML.java"


# static fields
.field private static final ATTRIBUTE_NAME:B = 0x14t

.field private static final ATTRIBUTE_VALUE_APOS:B = 0x16t

.field private static final ATTRIBUTE_VALUE_QUOT:B = 0x15t

.field private static final CDATA:B = 0x18t

.field private static final COMMENT:B = 0x6t

.field private static final END_OF_CDATA1:B = 0x19t

.field private static final END_OF_CDATA2:B = 0x1at

.field private static final END_OF_COMMENT1:B = 0x7t

.field private static final END_OF_COMMENT2:B = 0x8t

.field private static final END_OF_Q_TAG:B = 0xct

.field private static final END_TAG:B = 0x2t

.field private static final ENTITY_REF:B = 0x17t

.field private static final EXCL_TAG:B = 0x9t

.field private static final EXCL_TAG_START:B = 0xat

.field private static final LANGLE:B = 0xdt

.field private static final Q_TAG:B = 0xbt

.field private static final SLASH:B = 0x13t

.field private static final START_DOCUMENT:B = 0x0t

.field private static final START_TAG:B = 0x1t

.field private static final TEXT:B = 0x3t

.field private static final WAIT_ATTRIBUTE_VALUE:B = 0x12t

.field private static final WAIT_EQUALS:B = 0x11t

.field private static final WS_AFTER_ATTRIBUTE_VALUE:B = 0xft

.field private static final WS_AFTER_START_TAG_NAME:B = 0xet

.field private static ourBufferPool:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/Queue<",
            "[C>;>;"
        }
    .end annotation
.end field

.field private static ourDTDMaps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[C>;>;"
        }
    .end annotation
.end field

.field private static ourStringPool:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/flyersoft/staticlayout/SHMutableString;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final myAttributeName:Lcom/flyersoft/staticlayout/SHMutableString;

.field private final myAttributeValue:Lcom/flyersoft/staticlayout/SHMutableString;

.field private final myBuffer:[C

.field private myBufferDescriptionLength:I

.field private final myCData:Lcom/flyersoft/staticlayout/SHMutableString;

.field private final myEntityName:Lcom/flyersoft/staticlayout/SHMutableString;

.field private final myProcessNamespaces:Z

.field private final myStreamReader:Ljava/io/InputStreamReader;

.field private final myTagName:Lcom/flyersoft/staticlayout/SHMutableString;

.field private final myXMLReader:Lcom/flyersoft/staticlayout/SHXMLReader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 427
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/SHXMLParser;->ourBufferPool:Ljava/util/HashMap;

    .line 428
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/SHXMLParser;->ourStringPool:Ljava/util/Queue;

    .line 533
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/SHXMLParser;->ourDTDMaps:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/io/InputStream;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 475
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 461
    invoke-static {}, Lcom/flyersoft/staticlayout/SHXMLParser;->getMutableString()Lcom/flyersoft/staticlayout/SHMutableString;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myTagName:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 462
    invoke-static {}, Lcom/flyersoft/staticlayout/SHXMLParser;->getMutableString()Lcom/flyersoft/staticlayout/SHMutableString;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myCData:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 463
    invoke-static {}, Lcom/flyersoft/staticlayout/SHXMLParser;->getMutableString()Lcom/flyersoft/staticlayout/SHMutableString;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myAttributeName:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 464
    invoke-static {}, Lcom/flyersoft/staticlayout/SHXMLParser;->getMutableString()Lcom/flyersoft/staticlayout/SHMutableString;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myAttributeValue:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 465
    invoke-static {}, Lcom/flyersoft/staticlayout/SHXMLParser;->getMutableString()Lcom/flyersoft/staticlayout/SHMutableString;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myEntityName:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 476
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myXMLReader:Lcom/flyersoft/staticlayout/SHXMLReader;

    .line 477
    invoke-interface {p1}, Lcom/flyersoft/staticlayout/SHXMLReader;->processNamespaces()Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myProcessNamespaces:Z

    .line 480
    invoke-static {p3}, Lcom/flyersoft/staticlayout/SHXMLParser;->getBuffer(I)[C

    move-result-object p1

    .line 481
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myBuffer:[C

    const/4 p3, 0x0

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x100

    const/4 v2, 0x1

    if-ge v0, v1, :cond_1

    .line 485
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    move-result v1

    int-to-char v1, v1

    add-int/lit8 v3, v0, 0x1

    .line 486
    aput-char v1, p1, v0

    const/16 v0, 0x3e

    if-ne v1, v0, :cond_0

    move v0, v3

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    move v0, v3

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 492
    :goto_1
    iput v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myBufferDescriptionLength:I

    if-eqz v1, :cond_2

    .line 494
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p3, v0}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 495
    const-string v0, "<?xml"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "?>"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 496
    iput p3, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myBufferDescriptionLength:I

    .line 497
    const-string p3, "encoding"

    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p3

    if-lez p3, :cond_2

    const/16 v0, 0x22

    .line 499
    invoke-virtual {p1, v0, p3}, Ljava/lang/String;->indexOf(II)I

    move-result p3

    if-lez p3, :cond_2

    add-int/2addr p3, v2

    .line 501
    invoke-virtual {p1, v0, p3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    if-lez v0, :cond_2

    .line 503
    invoke-virtual {p1, p3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .line 510
    :cond_2
    const-string p1, "utf-8"

    :goto_2
    new-instance p3, Ljava/io/InputStreamReader;

    invoke-direct {p3, p2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myStreamReader:Ljava/io/InputStreamReader;

    return-void
.end method

.method private static convertToString(Ljava/util/Map;Lcom/flyersoft/staticlayout/SHMutableString;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/flyersoft/staticlayout/SHMutableString;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/flyersoft/staticlayout/SHMutableString;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 414
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_0

    .line 416
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/SHMutableString;->toString()Ljava/lang/String;

    move-result-object v0

    .line 417
    new-instance v1, Lcom/flyersoft/staticlayout/SHMutableString;

    invoke-direct {v1, p1}, Lcom/flyersoft/staticlayout/SHMutableString;-><init>(Lcom/flyersoft/staticlayout/SHMutableString;)V

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/SHMutableString;->clear()V

    return-object v0
.end method

.method private static declared-synchronized getBuffer(I)[C
    .locals 3

    const-class v0, Lcom/flyersoft/staticlayout/SHXMLParser;

    monitor-enter v0

    .line 431
    :try_start_0
    sget-object v1, Lcom/flyersoft/staticlayout/SHXMLParser;->ourBufferPool:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Queue;

    if-eqz v1, :cond_0

    .line 433
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [C
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 435
    monitor-exit v0

    return-object v1

    .line 438
    :cond_0
    :try_start_1
    new-array p0, p0, [C
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method static declared-synchronized getDTDMap(Ljava/util/List;)Ljava/util/HashMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[C>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lcom/flyersoft/staticlayout/SHXMLParser;

    monitor-enter v0

    .line 537
    :try_start_0
    sget-object v1, Lcom/flyersoft/staticlayout/SHXMLParser;->ourDTDMaps:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    if-nez v1, :cond_2

    .line 539
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 540
    const-string v2, "amp"

    const/4 v3, 0x1

    new-array v4, v3, [C

    const/4 v5, 0x0

    const/16 v6, 0x26

    aput-char v6, v4, v5

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    const-string v2, "apos"

    new-array v4, v3, [C

    const/16 v6, 0x27

    aput-char v6, v4, v5

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 542
    const-string v2, "gt"

    new-array v4, v3, [C

    const/16 v6, 0x3e

    aput-char v6, v4, v5

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    const-string v2, "lt"

    new-array v4, v3, [C

    const/16 v6, 0x3c

    aput-char v6, v4, v5

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 544
    const-string v2, "quot"

    new-array v3, v3, [C

    const/16 v4, 0x22

    aput-char v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 546
    invoke-static {v3}, Lcom/flyersoft/staticlayout/SHResourceFile;->createResourceFile(Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/SHResourceFile;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 548
    new-instance v4, Lcom/flyersoft/staticlayout/SHDTDParser;

    invoke-direct {v4}, Lcom/flyersoft/staticlayout/SHDTDParser;-><init>()V

    invoke-virtual {v4, v3, v1}, Lcom/flyersoft/staticlayout/SHDTDParser;->doIt(Ljava/io/InputStream;Ljava/util/HashMap;)V

    goto :goto_0

    .line 551
    :cond_1
    sget-object v2, Lcom/flyersoft/staticlayout/SHXMLParser;->ourDTDMaps:Ljava/util/HashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 553
    :cond_2
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static getEntityValue(Ljava/util/HashMap;Ljava/lang/String;)[C
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[C>;",
            "Ljava/lang/String;",
            ")[C"
        }
    .end annotation

    .line 514
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    if-nez v0, :cond_1

    .line 516
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x23

    if-ne v2, v3, :cond_1

    const/4 v2, 0x1

    .line 519
    :try_start_0
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x78

    if-ne v3, v4, :cond_0

    const/4 v3, 0x2

    .line 520
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    goto :goto_0

    .line 522
    :cond_0
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    :goto_0
    int-to-char v3, v3

    .line 524
    new-array v2, v2, [C

    aput-char v3, v2, v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 525
    :try_start_1
    invoke-virtual {p0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v2

    :catch_0
    move-object v0, v2

    :catch_1
    :cond_1
    return-object v0
.end method

.method private static declared-synchronized getMutableString()Lcom/flyersoft/staticlayout/SHMutableString;
    .locals 2

    const-class v0, Lcom/flyersoft/staticlayout/SHXMLParser;

    monitor-enter v0

    .line 451
    :try_start_0
    sget-object v1, Lcom/flyersoft/staticlayout/SHXMLParser;->ourStringPool:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/SHMutableString;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 452
    :cond_0
    new-instance v1, Lcom/flyersoft/staticlayout/SHMutableString;

    invoke-direct {v1}, Lcom/flyersoft/staticlayout/SHMutableString;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static processEndTag(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/lang/String;Ljava/util/HashMap;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/staticlayout/SHXMLReader;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 1116
    invoke-interface {p0, p2}, Lcom/flyersoft/staticlayout/SHXMLReader;->namespaceMapChangedHandler(Ljava/util/Map;)V

    .line 1118
    :cond_0
    invoke-interface {p0, p1}, Lcom/flyersoft/staticlayout/SHXMLReader;->endElementHandler(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static processFullTag(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;)Z
    .locals 2

    .line 1093
    invoke-interface {p0, p1, p2}, Lcom/flyersoft/staticlayout/SHXMLReader;->startElementHandler(Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 1096
    :cond_0
    invoke-interface {p0, p1}, Lcom/flyersoft/staticlayout/SHXMLReader;->endElementHandler(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v1

    .line 1099
    :cond_1
    invoke-virtual {p2}, Lcom/flyersoft/staticlayout/SHStringMap;->clear()V

    const/4 p0, 0x0

    return p0
.end method

.method private static processStartTag(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;Ljava/util/HashMap;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/staticlayout/SHXMLReader;",
            "Ljava/lang/String;",
            "Lcom/flyersoft/staticlayout/SHStringMap;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1104
    invoke-interface {p0, p1, p2}, Lcom/flyersoft/staticlayout/SHXMLReader;->startElementHandler(Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    if-eqz p3, :cond_1

    .line 1108
    invoke-interface {p0, p3}, Lcom/flyersoft/staticlayout/SHXMLReader;->namespaceMapChangedHandler(Ljava/util/Map;)V

    .line 1110
    :cond_1
    invoke-virtual {p2}, Lcom/flyersoft/staticlayout/SHStringMap;->clear()V

    const/4 p0, 0x0

    return p0
.end method

.method private static declared-synchronized storeBuffer([C)V
    .locals 4

    const-class v0, Lcom/flyersoft/staticlayout/SHXMLParser;

    monitor-enter v0

    .line 442
    :try_start_0
    sget-object v1, Lcom/flyersoft/staticlayout/SHXMLParser;->ourBufferPool:Ljava/util/HashMap;

    array-length v2, p0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Queue;

    if-nez v1, :cond_0

    .line 444
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 445
    sget-object v2, Lcom/flyersoft/staticlayout/SHXMLParser;->ourBufferPool:Ljava/util/HashMap;

    array-length v3, p0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    :cond_0
    invoke-interface {v1, p0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 448
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static declared-synchronized storeString(Lcom/flyersoft/staticlayout/SHMutableString;)V
    .locals 2

    const-class v0, Lcom/flyersoft/staticlayout/SHXMLParser;

    monitor-enter v0

    .line 456
    :try_start_0
    sget-object v1, Lcom/flyersoft/staticlayout/SHXMLParser;->ourStringPool:Ljava/util/Queue;

    invoke-interface {v1, p0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method


# virtual methods
.method doIt()V
    .locals 33
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 557
    iget-object v1, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myXMLReader:Lcom/flyersoft/staticlayout/SHXMLReader;

    .line 558
    invoke-interface {v1}, Lcom/flyersoft/staticlayout/SHXMLReader;->externalDTDs()Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/staticlayout/SHXMLParser;->getDTDMap(Ljava/util/List;)Ljava/util/HashMap;

    move-result-object v2

    .line 559
    invoke-interface {v1, v2}, Lcom/flyersoft/staticlayout/SHXMLReader;->addExternalEntities(Ljava/util/HashMap;)V

    .line 560
    iget-object v3, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myStreamReader:Ljava/io/InputStreamReader;

    .line 561
    iget-boolean v4, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myProcessNamespaces:Z

    if-eqz v4, :cond_0

    .line 562
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    .line 564
    :goto_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 565
    iget-object v8, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myBuffer:[C

    .line 566
    iget-object v9, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myTagName:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 567
    iget-object v10, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myCData:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 568
    iget-object v11, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myAttributeName:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 569
    iget-object v12, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myAttributeValue:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 570
    invoke-interface {v1}, Lcom/flyersoft/staticlayout/SHXMLReader;->dontCacheAttributeValues()Z

    move-result v13

    .line 571
    iget-object v14, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myEntityName:Lcom/flyersoft/staticlayout/SHMutableString;

    .line 572
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 573
    new-instance v5, Lcom/flyersoft/staticlayout/SHStringMap;

    invoke-direct {v5}, Lcom/flyersoft/staticlayout/SHStringMap;-><init>()V

    move/from16 v16, v4

    const/16 v4, 0xa

    move-object/from16 v17, v6

    .line 574
    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    move-object/from16 v22, v6

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    .line 581
    :goto_1
    iget v6, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myBufferDescriptionLength:I

    if-lez v6, :cond_1

    .line 583
    iput v4, v0, Lcom/flyersoft/staticlayout/SHXMLParser;->myBufferDescriptionLength:I

    goto :goto_2

    .line 585
    :cond_1
    invoke-virtual {v3, v8}, Ljava/io/InputStreamReader;->read([C)I

    move-result v6

    :goto_2
    if-gtz v6, :cond_2

    .line 588
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    return-void

    .line 592
    :cond_2
    array-length v4, v8

    if-ge v6, v4, :cond_3

    .line 594
    array-length v4, v8

    sub-int/2addr v4, v6

    const/4 v0, 0x0

    .line 595
    invoke-static {v8, v0, v8, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 596
    array-length v6, v8

    goto :goto_3

    :cond_3
    const/4 v4, 0x0

    :goto_3
    add-int/lit8 v0, v4, -0x1

    move-object/from16 v23, v17

    move-object/from16 v17, v3

    move-object/from16 v3, v22

    move-object/from16 v22, v7

    move/from16 v7, v21

    move/from16 v21, v20

    move-object/from16 v20, v18

    move/from16 v18, v13

    move-object/from16 v13, v23

    move/from16 v23, v19

    move/from16 v19, v6

    :goto_4
    const/16 v26, 0x14

    const/16 v27, 0x18

    const/16 v29, 0x17

    packed-switch v21, :pswitch_data_0

    :pswitch_0
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v28, v10

    move/from16 v6, v19

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    move-object v3, v5

    move/from16 v23, v7

    move-object/from16 v5, v20

    move-object/from16 v20, v13

    move/from16 v20, v24

    goto/16 :goto_3e

    :pswitch_1
    add-int/lit8 v24, v0, 0x1

    const/16 v30, 0x1

    .line 668
    :try_start_0
    aget-char v6, v8, v24
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 v31, v3

    const/16 v3, 0x3e

    if-ne v6, v3, :cond_6

    sub-int v3, v24, v4

    .line 669
    :try_start_1
    invoke-virtual {v10, v8, v4, v3}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    .line 670
    iget v3, v10, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    const/16 v6, 0x8

    if-le v3, v6, :cond_4

    .line 672
    iget-object v6, v10, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    move/from16 v25, v3

    .line 673
    new-instance v3, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/4 v5, 0x0

    const/4 v10, 0x6

    :try_start_2
    invoke-direct {v3, v6, v5, v10}, Ljava/lang/String;-><init>([CII)V

    const-string v5, "CDATA["

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    add-int/lit8 v3, v25, -0x8

    .line 674
    invoke-interface {v1, v6, v10, v3}, Lcom/flyersoft/staticlayout/SHXMLReader;->characterDataHandler([CII)V

    goto :goto_5

    :cond_4
    move-object/from16 v32, v5

    move-object/from16 v28, v10

    .line 677
    :cond_5
    :goto_5
    invoke-virtual/range {v28 .. v28}, Lcom/flyersoft/staticlayout/SHMutableString;->clear()V

    add-int/lit8 v0, v0, 0x2

    move v4, v0

    move-object/from16 v25, v2

    move/from16 v6, v19

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move/from16 v20, v24

    move-object/from16 v10, v31

    move-object/from16 v3, v32

    :goto_6
    const/16 v21, 0x3

    goto :goto_7

    :cond_6
    move-object/from16 v25, v2

    move-object v3, v5

    move-object/from16 v28, v10

    move/from16 v6, v19

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move/from16 v20, v24

    move-object/from16 v10, v31

    const/16 v21, 0x18

    :goto_7
    move/from16 v23, v7

    goto/16 :goto_3e

    :catch_0
    move-object/from16 v31, v3

    :catch_1
    move-object/from16 v32, v5

    move-object/from16 v28, v10

    goto/16 :goto_18

    :pswitch_2
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/16 v30, 0x1

    add-int/lit8 v0, v0, 0x1

    .line 661
    aget-char v3, v8, v0

    const/16 v5, 0x5d

    if-ne v3, v5, :cond_7

    const/16 v3, 0x1a

    move-object/from16 v25, v2

    move/from16 v6, v19

    move-object/from16 v5, v20

    move/from16 v2, v23

    move-object/from16 v10, v31

    move-object/from16 v3, v32

    const/16 v21, 0x1a

    goto :goto_8

    :cond_7
    move-object/from16 v25, v2

    move/from16 v6, v19

    move-object/from16 v5, v20

    move/from16 v2, v23

    move-object/from16 v10, v31

    move-object/from16 v3, v32

    const/16 v21, 0x18

    :goto_8
    move/from16 v20, v0

    move/from16 v23, v7

    move-object/from16 v0, v22

    goto/16 :goto_3e

    :pswitch_3
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/16 v5, 0x5d

    const/16 v30, 0x1

    :goto_9
    add-int/lit8 v0, v0, 0x1

    .line 654
    aget-char v3, v8, v0
    :try_end_2
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_5

    if-eq v3, v5, :cond_8

    goto :goto_9

    :cond_8
    const/16 v21, 0x19

    goto/16 :goto_17

    :pswitch_4
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/16 v30, 0x1

    :goto_a
    add-int/lit8 v3, v0, 0x1

    .line 944
    :try_start_3
    aget-char v5, v8, v3

    const/16 v6, 0x3b

    if-eq v5, v6, :cond_9

    move v0, v3

    goto :goto_a

    :cond_9
    sub-int v5, v3, v4

    .line 946
    invoke-virtual {v14, v8, v4, v5}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V
    :try_end_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_4

    add-int/lit8 v4, v0, 0x2

    .line 949
    :try_start_4
    invoke-static {v15, v14}, Lcom/flyersoft/staticlayout/SHXMLParser;->convertToString(Ljava/util/Map;Lcom/flyersoft/staticlayout/SHMutableString;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flyersoft/staticlayout/SHXMLParser;->getEntityValue(Ljava/util/HashMap;Ljava/lang/String;)[C

    move-result-object v0

    if-eqz v0, :cond_c

    .line 950
    array-length v5, v0

    if-eqz v5, :cond_c

    const/4 v5, 0x1

    if-eq v7, v5, :cond_b

    const/4 v5, 0x3

    if-eq v7, v5, :cond_a

    packed-switch v7, :pswitch_data_1

    goto :goto_b

    .line 954
    :pswitch_5
    array-length v5, v0
    :try_end_4
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_2

    const/4 v10, 0x0

    :try_start_5
    invoke-virtual {v12, v0, v10, v5}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    goto :goto_c

    :pswitch_6
    const/4 v10, 0x0

    .line 957
    array-length v5, v0

    invoke-virtual {v11, v0, v10, v5}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    goto :goto_c

    :cond_a
    const/4 v10, 0x0

    .line 964
    array-length v5, v0

    invoke-interface {v1, v0, v10, v5}, Lcom/flyersoft/staticlayout/SHXMLReader;->characterDataHandler([CII)V

    goto :goto_c

    :cond_b
    const/4 v10, 0x0

    .line 961
    array-length v5, v0

    invoke-virtual {v9, v0, v10, v5}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V
    :try_end_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_c

    :cond_c
    :goto_b
    const/4 v10, 0x0

    :goto_c
    move v0, v3

    move/from16 v21, v7

    goto/16 :goto_17

    :catch_2
    const/4 v10, 0x0

    :catch_3
    nop

    move-object/from16 v25, v2

    move/from16 v21, v7

    goto/16 :goto_19

    :catch_4
    const/4 v10, 0x0

    goto/16 :goto_18

    :pswitch_7
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/4 v10, 0x0

    :goto_d
    add-int/lit8 v3, v0, 0x1

    .line 929
    :try_start_6
    aget-char v5, v8, v3

    const/16 v6, 0x26

    if-eq v5, v6, :cond_e

    const/16 v6, 0x27

    if-eq v5, v6, :cond_d

    move v0, v3

    goto :goto_d

    :cond_d
    sub-int v0, v3, v4

    .line 931
    invoke-virtual {v12, v8, v4, v0}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    goto :goto_10

    :cond_e
    sub-int v5, v3, v4

    .line 935
    invoke-virtual {v12, v8, v4, v5}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    add-int/lit8 v4, v0, 0x2

    const/16 v7, 0x16

    goto :goto_f

    :pswitch_8
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/4 v10, 0x0

    :goto_e
    add-int/lit8 v3, v0, 0x1

    .line 914
    aget-char v5, v8, v3

    const/16 v6, 0x22

    if-eq v5, v6, :cond_10

    const/16 v6, 0x26

    if-eq v5, v6, :cond_f

    move v0, v3

    goto :goto_e

    :cond_f
    sub-int v5, v3, v4

    .line 920
    invoke-virtual {v12, v8, v4, v5}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    add-int/lit8 v4, v0, 0x2

    const/16 v7, 0x15

    :goto_f
    move v0, v3

    move-object/from16 v10, v28

    move-object/from16 v3, v31

    move-object/from16 v5, v32

    goto :goto_12

    :cond_10
    sub-int v0, v3, v4

    .line 916
    invoke-virtual {v12, v8, v4, v0}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    :goto_10
    const/16 v21, 0xf

    goto/16 :goto_15

    :pswitch_9
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/4 v10, 0x0

    :goto_11
    add-int/lit8 v3, v0, 0x1

    .line 829
    aget-char v5, v8, v3

    const/16 v6, 0x20

    if-eq v5, v6, :cond_13

    const/16 v6, 0x26

    if-eq v5, v6, :cond_12

    const/16 v6, 0x3d

    if-eq v5, v6, :cond_11

    packed-switch v5, :pswitch_data_2

    move v0, v3

    goto :goto_11

    :cond_11
    sub-int v0, v3, v4

    .line 831
    invoke-virtual {v11, v8, v4, v0}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    const/16 v21, 0x12

    goto :goto_15

    :cond_12
    sub-int v5, v3, v4

    .line 835
    invoke-virtual {v11, v8, v4, v5}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    add-int/lit8 v4, v0, 0x2

    move v0, v3

    move-object/from16 v10, v28

    move-object/from16 v3, v31

    move-object/from16 v5, v32

    const/16 v7, 0x14

    :goto_12
    const/16 v21, 0x17

    goto/16 :goto_4

    :cond_13
    :pswitch_a
    sub-int v0, v3, v4

    .line 847
    invoke-virtual {v11, v8, v4, v0}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    const/16 v21, 0x11

    goto :goto_15

    :pswitch_b
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/4 v10, 0x0

    :goto_13
    add-int/lit8 v3, v0, 0x1

    .line 973
    aget-char v5, v8, v3

    const/16 v6, 0x3e

    if-eq v5, v6, :cond_14

    move v0, v3

    goto :goto_13

    :cond_14
    add-int/lit8 v4, v0, 0x2

    move v0, v3

    move-object/from16 v10, v28

    move-object/from16 v3, v31

    move-object/from16 v5, v32

    const/16 v21, 0x3

    goto/16 :goto_4

    :pswitch_c
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/4 v10, 0x0

    :goto_14
    add-int/lit8 v3, v0, 0x1

    .line 862
    aget-char v5, v8, v3

    const/16 v6, 0x22

    if-eq v5, v6, :cond_16

    const/16 v6, 0x27

    if-eq v5, v6, :cond_15

    move v0, v3

    goto :goto_14

    :cond_15
    add-int/lit8 v4, v0, 0x2

    const/16 v21, 0x16

    goto :goto_15

    :cond_16
    add-int/lit8 v4, v0, 0x2

    const/16 v21, 0x15

    :cond_17
    :goto_15
    move v0, v3

    goto :goto_17

    :pswitch_d
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/4 v10, 0x0

    :goto_16
    const/16 v30, 0x1

    add-int/lit8 v0, v0, 0x1

    .line 854
    aget-char v3, v8, v0
    :try_end_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_6 .. :try_end_6} :catch_5

    const/16 v6, 0x3d

    if-eq v3, v6, :cond_18

    goto :goto_16

    :cond_18
    const/16 v21, 0x12

    :goto_17
    move-object/from16 v10, v28

    move-object/from16 v3, v31

    goto/16 :goto_27

    :catch_5
    :goto_18
    nop

    move/from16 v0, v21

    move/from16 v21, v7

    move v7, v0

    move-object/from16 v25, v2

    :goto_19
    move/from16 v6, v19

    move-object/from16 v0, v22

    move/from16 v19, v23

    move-object/from16 v22, v31

    move-object/from16 v3, v32

    goto/16 :goto_3b

    :pswitch_e
    move-object/from16 v31, v3

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    const/4 v10, 0x0

    add-int/lit8 v3, v0, 0x1

    .line 874
    :try_start_7
    aget-char v5, v8, v3
    :try_end_7
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_7 .. :try_end_7} :catch_a

    const/16 v6, 0x20

    if-eq v5, v6, :cond_1a

    const/16 v6, 0x22

    if-eq v5, v6, :cond_19

    const/16 v6, 0x2f

    if-eq v5, v6, :cond_1b

    const/16 v6, 0x3e

    if-eq v5, v6, :cond_1b

    packed-switch v5, :pswitch_data_3

    move v0, v3

    move-object/from16 v10, v28

    move-object/from16 v3, v31

    move-object/from16 v5, v32

    const/16 v21, 0x14

    goto/16 :goto_4

    :cond_19
    if-eqz v3, :cond_17

    const/4 v5, 0x1

    .line 891
    :try_start_8
    invoke-virtual {v12, v8, v0, v5}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V
    :try_end_8
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_15

    :cond_1a
    :pswitch_f
    move v0, v3

    .line 898
    :cond_1b
    :try_start_9
    invoke-static {v15, v11}, Lcom/flyersoft/staticlayout/SHXMLParser;->convertToString(Ljava/util/Map;Lcom/flyersoft/staticlayout/SHMutableString;)Ljava/lang/String;

    move-result-object v5
    :try_end_9
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_9 .. :try_end_9} :catch_8

    if-eqz v16, :cond_1d

    .line 899
    :try_start_a
    const-string v6, "xmlns:"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1d

    if-nez v20, :cond_1c

    .line 901
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6, v13}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V
    :try_end_a
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_a .. :try_end_a} :catch_7

    goto :goto_1a

    :cond_1c
    move-object/from16 v6, v20

    :goto_1a
    const/4 v3, 0x6

    .line 903
    :try_start_b
    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12}, Lcom/flyersoft/staticlayout/SHMutableString;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 904
    invoke-virtual {v12}, Lcom/flyersoft/staticlayout/SHMutableString;->clear()V
    :try_end_b
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_b .. :try_end_b} :catch_6

    move/from16 v20, v0

    move-object/from16 v25, v2

    move-object v5, v6

    move/from16 v6, v19

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object/from16 v10, v31

    move-object/from16 v3, v32

    const/16 v21, 0xe

    goto/16 :goto_7

    :catch_6
    nop

    move-object/from16 v25, v2

    move-object/from16 v20, v6

    goto :goto_1b

    :catch_7
    nop

    move-object/from16 v25, v2

    :goto_1b
    move/from16 v21, v7

    move/from16 v6, v19

    move-object/from16 v0, v22

    move/from16 v19, v23

    move-object/from16 v22, v31

    move-object/from16 v3, v32

    goto :goto_1d

    :cond_1d
    if-eqz v18, :cond_1e

    .line 906
    :try_start_c
    invoke-virtual {v12}, Lcom/flyersoft/staticlayout/SHMutableString;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_c
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_c .. :try_end_c} :catch_8

    move-object/from16 v6, v32

    :try_start_d
    invoke-virtual {v6, v5, v3}, Lcom/flyersoft/staticlayout/SHStringMap;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 907
    invoke-virtual {v12}, Lcom/flyersoft/staticlayout/SHMutableString;->clear()V

    goto :goto_1c

    :cond_1e
    move-object/from16 v6, v32

    .line 909
    invoke-static {v15, v12}, Lcom/flyersoft/staticlayout/SHXMLParser;->convertToString(Ljava/util/Map;Lcom/flyersoft/staticlayout/SHMutableString;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v5, v3}, Lcom/flyersoft/staticlayout/SHStringMap;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_d .. :try_end_d} :catch_9

    :goto_1c
    move-object/from16 v25, v2

    move-object v3, v6

    move/from16 v6, v19

    move-object/from16 v5, v20

    move/from16 v2, v23

    move-object/from16 v10, v31

    const/16 v21, 0xe

    goto/16 :goto_8

    :catch_8
    move-object/from16 v6, v32

    :catch_9
    nop

    move-object/from16 v25, v2

    move-object v3, v6

    move/from16 v21, v7

    move/from16 v6, v19

    move-object/from16 v0, v22

    move/from16 v19, v23

    move-object/from16 v22, v31

    :goto_1d
    const/16 v7, 0xe

    goto/16 :goto_3b

    :catch_a
    move-object/from16 v6, v32

    nop

    move/from16 v0, v21

    move/from16 v21, v7

    move v7, v0

    move-object/from16 v25, v2

    move-object v3, v6

    move/from16 v6, v19

    move-object/from16 v0, v22

    move/from16 v19, v23

    move-object/from16 v22, v31

    goto/16 :goto_3b

    :pswitch_10
    move-object/from16 v31, v3

    move-object v6, v5

    move-object/from16 v28, v10

    const/4 v10, 0x0

    add-int/lit8 v3, v0, 0x1

    .line 782
    :try_start_e
    aget-char v5, v8, v3

    const/16 v10, 0x20

    if-eq v5, v10, :cond_1f

    const/16 v10, 0x2f

    if-eq v5, v10, :cond_25

    const/16 v10, 0x3e

    if-eq v5, v10, :cond_20

    packed-switch v5, :pswitch_data_4

    move-object/from16 v25, v2

    move v4, v3

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object/from16 v10, v31

    const/16 v21, 0x14

    move/from16 v20, v4

    move-object v3, v6

    move/from16 v23, v7

    move/from16 v6, v19

    goto/16 :goto_3e

    :cond_1f
    :pswitch_11
    move-object/from16 v25, v2

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object/from16 v10, v31

    move/from16 v22, v3

    goto/16 :goto_21

    .line 785
    :cond_20
    invoke-static {v15, v9}, Lcom/flyersoft/staticlayout/SHXMLParser;->convertToString(Ljava/util/Map;Lcom/flyersoft/staticlayout/SHMutableString;)Ljava/lang/String;

    move-result-object v5
    :try_end_e
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_e .. :try_end_e} :catch_10

    move/from16 v24, v0

    move-object/from16 v10, v31

    .line 786
    :try_start_f
    array-length v0, v10
    :try_end_f
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_f .. :try_end_f} :catch_e

    move-object/from16 v25, v2

    move/from16 v2, v23

    if-ne v2, v0, :cond_21

    shl-int/lit8 v0, v2, 0x1

    .line 787
    :try_start_10
    invoke-static {v10, v2, v0}, Lcom/flyersoft/staticlayout/SHArrayUtils;->createCopy([Ljava/lang/String;II)[Ljava/lang/String;

    move-result-object v0
    :try_end_10
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_10 .. :try_end_10} :catch_b

    goto :goto_1e

    :catch_b
    nop

    move/from16 v0, v21

    move/from16 v21, v7

    move v7, v0

    move-object v3, v6

    move/from16 v6, v19

    move-object/from16 v0, v22

    move/from16 v19, v2

    move-object/from16 v22, v10

    goto/16 :goto_3b

    :cond_21
    move-object v0, v10

    :goto_1e
    add-int/lit8 v23, v2, 0x1

    .line 789
    :try_start_11
    aput-object v5, v0, v2
    :try_end_11
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_11 .. :try_end_11} :catch_d

    move-object/from16 v10, v20

    if-eqz v16, :cond_23

    if-eqz v20, :cond_22

    move-object v13, v10

    :cond_22
    move-object/from16 v2, v22

    .line 794
    :try_start_12
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    :cond_23
    move-object/from16 v2, v22

    .line 796
    :goto_1f
    invoke-static {v1, v5, v6, v10}, Lcom/flyersoft/staticlayout/SHXMLParser;->processStartTag(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;Ljava/util/HashMap;)Z

    move-result v5

    if-eqz v5, :cond_24

    .line 797
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStreamReader;->close()V
    :try_end_12
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_12 .. :try_end_12} :catch_c

    goto/16 :goto_33

    :cond_24
    add-int/lit8 v4, v24, 0x2

    move-object v10, v0

    move-object v0, v2

    move/from16 v20, v3

    move-object v3, v6

    move/from16 v6, v19

    move/from16 v2, v23

    const/4 v5, 0x0

    goto/16 :goto_6

    :catch_c
    nop

    move/from16 v3, v21

    move/from16 v21, v7

    move v7, v3

    move-object/from16 v22, v0

    move-object v0, v2

    move-object v3, v6

    move-object/from16 v20, v10

    goto :goto_20

    :catch_d
    move-object/from16 v10, v20

    move-object/from16 v2, v22

    nop

    move/from16 v3, v21

    move/from16 v21, v7

    move v7, v3

    move-object/from16 v22, v0

    move-object v0, v2

    move-object v3, v6

    :goto_20
    move/from16 v6, v19

    move/from16 v19, v23

    goto/16 :goto_3b

    :catch_e
    move-object/from16 v25, v2

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    goto :goto_22

    :cond_25
    move-object/from16 v25, v2

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object/from16 v10, v31

    const/16 v20, 0x13

    move/from16 v22, v3

    .line 807
    :try_start_13
    invoke-static {v15, v9}, Lcom/flyersoft/staticlayout/SHXMLParser;->convertToString(Ljava/util/Map;Lcom/flyersoft/staticlayout/SHMutableString;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v6}, Lcom/flyersoft/staticlayout/SHXMLParser;->processFullTag(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 808
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStreamReader;->close()V
    :try_end_13
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_13 .. :try_end_13} :catch_f

    goto/16 :goto_33

    :cond_26
    move-object v3, v6

    move/from16 v23, v7

    move/from16 v6, v19

    move/from16 v20, v22

    const/4 v5, 0x0

    const/16 v21, 0x13

    goto/16 :goto_3e

    :catch_f
    nop

    move-object/from16 v20, v5

    move-object v3, v6

    move/from16 v21, v7

    move-object/from16 v22, v10

    move/from16 v6, v19

    const/16 v7, 0x13

    goto/16 :goto_2b

    :goto_21
    move-object v3, v6

    move/from16 v23, v7

    move/from16 v6, v19

    move/from16 v20, v22

    goto/16 :goto_3e

    :catch_10
    move-object/from16 v25, v2

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object/from16 v10, v31

    :goto_22
    nop

    move/from16 v3, v21

    move/from16 v21, v7

    move v7, v3

    move-object v3, v6

    move-object/from16 v22, v10

    move/from16 v6, v19

    goto/16 :goto_2b

    :pswitch_12
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object v6, v5

    move-object/from16 v28, v10

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    add-int/lit8 v3, v24, 0x1

    move/from16 v20, v3

    .line 612
    :try_start_14
    aget-char v3, v8, v20
    :try_end_14
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_14 .. :try_end_14} :catch_11

    move-object/from16 v32, v6

    const/16 v6, 0x21

    if-eq v3, v6, :cond_29

    const/16 v6, 0x2f

    if-eq v3, v6, :cond_28

    const/16 v6, 0x3f

    if-eq v3, v6, :cond_27

    move/from16 v23, v7

    move/from16 v6, v19

    move/from16 v4, v20

    move-object/from16 v3, v32

    const/16 v21, 0x1

    goto/16 :goto_3e

    :cond_27
    const/16 v3, 0xb

    move/from16 v23, v7

    move/from16 v6, v19

    move-object/from16 v3, v32

    const/16 v21, 0xb

    goto/16 :goto_3e

    :cond_28
    add-int/lit8 v3, v24, 0x2

    const/4 v4, 0x2

    move v4, v3

    move/from16 v23, v7

    move/from16 v6, v19

    move-object/from16 v3, v32

    const/16 v21, 0x2

    goto/16 :goto_3e

    :cond_29
    move/from16 v23, v7

    move/from16 v6, v19

    move-object/from16 v3, v32

    const/16 v21, 0xa

    goto/16 :goto_3e

    :catch_11
    move-object/from16 v32, v6

    goto/16 :goto_28

    :pswitch_13
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    add-int/lit8 v3, v24, 0x1

    .line 721
    :try_start_15
    aget-char v6, v8, v3

    move/from16 v20, v3

    const/16 v3, 0x3e

    if-ne v6, v3, :cond_2a

    goto/16 :goto_25

    :cond_2a
    const/16 v21, 0xb

    move-object/from16 v22, v0

    move/from16 v23, v2

    move-object v3, v10

    move/from16 v0, v20

    move-object/from16 v2, v25

    move-object/from16 v10, v28

    goto/16 :goto_26

    :pswitch_14
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    :goto_23
    const/16 v30, 0x1

    add-int/lit8 v24, v24, 0x1

    .line 714
    aget-char v3, v8, v24

    const/16 v6, 0x3f

    if-eq v3, v6, :cond_2b

    goto :goto_23

    :cond_2b
    const/16 v21, 0xc

    move-object/from16 v22, v0

    move/from16 v23, v2

    move-object/from16 v20, v5

    move-object v3, v10

    move/from16 v0, v24

    move-object/from16 v2, v25

    move-object/from16 v10, v28

    goto/16 :goto_27

    :pswitch_15
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    const/4 v3, 0x6

    add-int/lit8 v6, v24, 0x1

    .line 630
    aget-char v3, v8, v6

    move/from16 v20, v6

    const/16 v6, 0x2d

    if-eq v3, v6, :cond_2e

    const/16 v6, 0x5b

    if-eq v3, v6, :cond_2c

    const/16 v3, 0x9

    move/from16 v23, v7

    move/from16 v6, v19

    move-object/from16 v3, v32

    const/16 v21, 0x9

    goto/16 :goto_3e

    :cond_2c
    add-int/lit8 v3, v24, 0x2

    move v4, v3

    move/from16 v23, v7

    move/from16 v6, v19

    move-object/from16 v3, v32

    const/16 v21, 0x18

    goto/16 :goto_3e

    :pswitch_16
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    :goto_24
    add-int/lit8 v3, v24, 0x1

    .line 645
    aget-char v6, v8, v3

    move/from16 v20, v3

    const/16 v3, 0x3e

    if-eq v6, v3, :cond_2d

    move/from16 v24, v20

    goto :goto_24

    :cond_2d
    :goto_25
    add-int/lit8 v4, v24, 0x2

    move-object/from16 v22, v0

    move/from16 v23, v2

    move-object v3, v10

    move/from16 v0, v20

    move-object/from16 v2, v25

    move-object/from16 v10, v28

    const/16 v21, 0x3

    :goto_26
    move-object/from16 v20, v5

    :goto_27
    move-object/from16 v5, v32

    goto/16 :goto_4

    :catch_12
    :goto_28
    nop

    move/from16 v3, v21

    move/from16 v21, v7

    move v7, v3

    move-object/from16 v20, v5

    move-object/from16 v22, v10

    move/from16 v6, v19

    move-object/from16 v3, v32

    goto/16 :goto_2b

    :pswitch_17
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v32, v5

    move-object/from16 v28, v10

    move-object/from16 v5, v20

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    add-int/lit8 v3, v24, 0x1

    .line 700
    aget-char v6, v8, v3
    :try_end_15
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_15 .. :try_end_15} :catch_12

    move/from16 v20, v3

    const/16 v3, 0x2d

    if-eq v6, v3, :cond_30

    const/16 v3, 0x3e

    if-eq v6, v3, :cond_2f

    :cond_2e
    move/from16 v23, v7

    move/from16 v6, v19

    move-object/from16 v3, v32

    const/16 v21, 0x6

    goto/16 :goto_3e

    :cond_2f
    add-int/lit8 v3, v24, 0x2

    move v4, v3

    move/from16 v23, v7

    move/from16 v6, v19

    move-object/from16 v3, v32

    const/16 v21, 0x3

    goto/16 :goto_3e

    :cond_30
    move/from16 v23, v7

    move/from16 v6, v19

    move-object/from16 v3, v32

    goto/16 :goto_3e

    :pswitch_18
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v28, v10

    move-object/from16 v0, v22

    move/from16 v2, v23

    const/16 v6, 0x8

    move-object v10, v3

    move-object v3, v5

    move-object/from16 v5, v20

    add-int/lit8 v20, v24, 0x1

    .line 693
    :try_start_16
    aget-char v6, v8, v20
    :try_end_16
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_16 .. :try_end_16} :catch_13

    move/from16 v23, v7

    const/16 v7, 0x2d

    if-ne v6, v7, :cond_31

    move-object/from16 v22, v0

    move/from16 v0, v20

    move/from16 v7, v23

    const/16 v21, 0x8

    goto/16 :goto_40

    :cond_31
    move-object/from16 v22, v0

    move/from16 v0, v20

    move/from16 v7, v23

    const/16 v21, 0x6

    goto/16 :goto_40

    :catch_13
    move/from16 v23, v7

    goto :goto_2a

    :pswitch_19
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v28, v10

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    move-object v3, v5

    move/from16 v23, v7

    move-object/from16 v5, v20

    const/16 v7, 0x2d

    :goto_29
    const/16 v30, 0x1

    add-int/lit8 v24, v24, 0x1

    .line 686
    :try_start_17
    aget-char v6, v8, v24
    :try_end_17
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_17 .. :try_end_17} :catch_14

    if-eq v6, v7, :cond_32

    goto :goto_29

    :cond_32
    const/16 v21, 0x7

    move-object/from16 v22, v0

    move-object/from16 v20, v5

    move/from16 v7, v23

    move/from16 v0, v24

    move/from16 v23, v2

    move-object v5, v3

    move-object v3, v10

    move-object/from16 v2, v25

    goto/16 :goto_42

    :catch_14
    :goto_2a
    nop

    move-object/from16 v20, v5

    move-object/from16 v22, v10

    move/from16 v6, v19

    move/from16 v7, v21

    move/from16 v21, v23

    :goto_2b
    move/from16 v19, v2

    goto/16 :goto_3b

    :pswitch_1a
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v28, v10

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    move-object v3, v5

    move/from16 v23, v7

    move-object/from16 v5, v20

    :goto_2c
    add-int/lit8 v6, v24, 0x1

    .line 1042
    :try_start_18
    aget-char v7, v8, v6
    :try_end_18
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_18 .. :try_end_18} :catch_15

    move-object/from16 v20, v13

    const/16 v13, 0x26

    if-eq v7, v13, :cond_34

    const/16 v13, 0x3c

    if-eq v7, v13, :cond_33

    move/from16 v24, v6

    move-object/from16 v13, v20

    goto :goto_2c

    :cond_33
    if-le v6, v4, :cond_45

    sub-int v7, v6, v4

    .line 1045
    :try_start_19
    invoke-interface {v1, v8, v4, v7}, Lcom/flyersoft/staticlayout/SHXMLReader;->characterDataHandlerFinal([CII)V

    goto/16 :goto_36

    :cond_34
    if-le v6, v4, :cond_35

    sub-int v7, v6, v4

    .line 1051
    invoke-interface {v1, v8, v4, v7}, Lcom/flyersoft/staticlayout/SHXMLReader;->characterDataHandler([CII)V

    :cond_35
    add-int/lit8 v4, v24, 0x2

    move-object/from16 v22, v0

    move/from16 v23, v2

    move v0, v6

    move-object/from16 v13, v20

    move-object/from16 v2, v25

    const/4 v7, 0x3

    goto/16 :goto_34

    :catch_15
    move-object/from16 v20, v13

    nop

    move-object/from16 v22, v10

    move/from16 v6, v19

    goto/16 :goto_38

    :pswitch_1b
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v28, v10

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    move-object v3, v5

    move/from16 v23, v7

    move-object/from16 v5, v20

    move-object/from16 v20, v13

    :goto_2d
    add-int/lit8 v6, v24, 0x1

    .line 982
    aget-char v7, v8, v6

    const/16 v13, 0x3e

    if-eq v7, v13, :cond_36

    move/from16 v24, v6

    goto :goto_2d

    :cond_36
    if-lez v2, :cond_3a

    if-eqz v16, :cond_38

    add-int/lit8 v7, v2, -0x1

    .line 987
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_38

    .line 988
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/16 v30, 0x1

    add-int/lit8 v7, v7, -0x1

    :goto_2e
    if-ltz v7, :cond_38

    .line 989
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/HashMap;
    :try_end_19
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_19 .. :try_end_19} :catch_1b

    if-eqz v13, :cond_37

    move-object v5, v13

    goto :goto_2f

    :cond_37
    add-int/lit8 v7, v7, -0x1

    goto :goto_2e

    :cond_38
    move-object/from16 v13, v20

    :goto_2f
    add-int/lit8 v2, v2, -0x1

    .line 997
    :try_start_1a
    aget-object v7, v10, v2

    invoke-static {v1, v7, v5}, Lcom/flyersoft/staticlayout/SHXMLParser;->processEndTag(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v7

    if-eqz v7, :cond_39

    .line 998
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStreamReader;->close()V
    :try_end_1a
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1a .. :try_end_1a} :catch_14

    goto/16 :goto_33

    :cond_39
    const/16 v20, 0x0

    goto :goto_30

    :cond_3a
    move-object/from16 v13, v20

    move-object/from16 v20, v5

    :goto_30
    add-int/lit8 v4, v24, 0x2

    move-object/from16 v22, v0

    move-object v5, v3

    move v0, v6

    move-object v3, v10

    move/from16 v7, v23

    move-object/from16 v10, v28

    const/16 v21, 0x3

    :goto_31
    move/from16 v23, v2

    move-object/from16 v2, v25

    goto/16 :goto_4

    :pswitch_1c
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v28, v10

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    move-object v3, v5

    move/from16 v23, v7

    move-object/from16 v5, v20

    move-object/from16 v20, v13

    :goto_32
    add-int/lit8 v6, v24, 0x1

    .line 730
    :try_start_1b
    aget-char v7, v8, v6
    :try_end_1b
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1b .. :try_end_1b} :catch_1b

    const/16 v13, 0x20

    if-eq v7, v13, :cond_43

    const/16 v13, 0x26

    if-eq v7, v13, :cond_42

    const/16 v13, 0x2f

    if-eq v7, v13, :cond_40

    const/16 v13, 0x3e

    if-eq v7, v13, :cond_3b

    packed-switch v7, :pswitch_data_5

    move/from16 v24, v6

    goto :goto_32

    :cond_3b
    sub-int v7, v6, v4

    .line 743
    :try_start_1c
    invoke-virtual {v9, v8, v4, v7}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    .line 745
    invoke-static {v15, v9}, Lcom/flyersoft/staticlayout/SHXMLParser;->convertToString(Ljava/util/Map;Lcom/flyersoft/staticlayout/SHMutableString;)Ljava/lang/String;

    move-result-object v7

    .line 746
    array-length v13, v10

    if-ne v2, v13, :cond_3c

    shl-int/lit8 v13, v2, 0x1

    .line 747
    invoke-static {v10, v2, v13}, Lcom/flyersoft/staticlayout/SHArrayUtils;->createCopy([Ljava/lang/String;II)[Ljava/lang/String;

    move-result-object v10
    :try_end_1c
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1c .. :try_end_1c} :catch_17

    :cond_3c
    add-int/lit8 v13, v2, 0x1

    .line 749
    :try_start_1d
    aput-object v7, v10, v2

    if-eqz v16, :cond_3e

    if-eqz v5, :cond_3d

    move-object/from16 v20, v5

    .line 754
    :cond_3d
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 756
    :cond_3e
    invoke-static {v1, v7, v3, v5}, Lcom/flyersoft/staticlayout/SHXMLParser;->processStartTag(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;Ljava/util/HashMap;)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 757
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStreamReader;->close()V
    :try_end_1d
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1d .. :try_end_1d} :catch_16

    goto :goto_33

    :cond_3f
    add-int/lit8 v4, v24, 0x2

    move-object/from16 v22, v0

    move-object v5, v3

    move v0, v6

    move-object v3, v10

    move/from16 v7, v23

    move-object/from16 v2, v25

    move-object/from16 v10, v28

    const/16 v21, 0x3

    move/from16 v23, v13

    move-object/from16 v13, v20

    const/16 v20, 0x0

    goto/16 :goto_4

    :catch_16
    nop

    move-object/from16 v22, v10

    move/from16 v6, v19

    move/from16 v21, v23

    const/4 v7, 0x3

    move/from16 v19, v13

    move-object/from16 v13, v20

    goto/16 :goto_3a

    :catch_17
    nop

    move-object/from16 v22, v10

    move/from16 v6, v19

    move-object/from16 v13, v20

    move/from16 v21, v23

    const/4 v7, 0x3

    goto/16 :goto_39

    :cond_40
    sub-int v7, v6, v4

    const/16 v21, 0x13

    .line 766
    :try_start_1e
    invoke-virtual {v9, v8, v4, v7}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    .line 767
    invoke-static {v15, v9}, Lcom/flyersoft/staticlayout/SHXMLParser;->convertToString(Ljava/util/Map;Lcom/flyersoft/staticlayout/SHMutableString;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7, v3}, Lcom/flyersoft/staticlayout/SHXMLParser;->processFullTag(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;)Z

    move-result v7

    if-eqz v7, :cond_41

    .line 768
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStreamReader;->close()V
    :try_end_1e
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1e .. :try_end_1e} :catch_18

    :goto_33
    return-void

    :cond_41
    move-object/from16 v22, v0

    move-object v5, v3

    move v0, v6

    move-object v3, v10

    move-object/from16 v13, v20

    move/from16 v7, v23

    move-object/from16 v10, v28

    const/16 v20, 0x0

    goto/16 :goto_31

    :catch_18
    nop

    move-object/from16 v22, v10

    move/from16 v6, v19

    move-object/from16 v13, v20

    move/from16 v21, v23

    const/16 v7, 0x13

    goto/16 :goto_39

    :cond_42
    sub-int v7, v6, v4

    .line 775
    :try_start_1f
    invoke-virtual {v9, v8, v4, v7}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V
    :try_end_1f
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1f .. :try_end_1f} :catch_19

    add-int/lit8 v4, v24, 0x2

    move-object/from16 v22, v0

    move/from16 v23, v2

    move v0, v6

    move-object/from16 v13, v20

    move-object/from16 v2, v25

    const/4 v7, 0x1

    :goto_34
    const/16 v21, 0x17

    move-object/from16 v20, v5

    goto/16 :goto_41

    :catch_19
    nop

    move-object/from16 v22, v10

    move/from16 v6, v19

    move-object/from16 v13, v20

    move/from16 v7, v21

    const/16 v21, 0x1

    goto :goto_39

    :cond_43
    :pswitch_1d
    sub-int v7, v6, v4

    const/16 v21, 0xe

    .line 739
    :try_start_20
    invoke-virtual {v9, v8, v4, v7}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V
    :try_end_20
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_20 .. :try_end_20} :catch_1a

    goto :goto_37

    :catch_1a
    nop

    move-object/from16 v22, v10

    move/from16 v6, v19

    move-object/from16 v13, v20

    move/from16 v21, v23

    const/16 v7, 0xe

    goto :goto_39

    :pswitch_1e
    move/from16 v24, v0

    move-object/from16 v25, v2

    move-object/from16 v28, v10

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object v10, v3

    move-object v3, v5

    move/from16 v23, v7

    move-object/from16 v5, v20

    move-object/from16 v20, v13

    :goto_35
    add-int/lit8 v6, v24, 0x1

    .line 604
    :try_start_21
    aget-char v7, v8, v6
    :try_end_21
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_21 .. :try_end_21} :catch_1b

    const/16 v13, 0x3c

    if-eq v7, v13, :cond_44

    move/from16 v24, v6

    goto :goto_35

    :cond_44
    add-int/lit8 v4, v24, 0x2

    :cond_45
    :goto_36
    const/16 v21, 0xd

    :goto_37
    move-object/from16 v22, v0

    move v0, v6

    move-object/from16 v13, v20

    goto/16 :goto_3f

    :catch_1b
    nop

    move-object/from16 v22, v10

    move/from16 v6, v19

    move-object/from16 v13, v20

    :goto_38
    move/from16 v7, v21

    move/from16 v21, v23

    :goto_39
    move/from16 v19, v2

    :goto_3a
    move-object/from16 v20, v5

    :goto_3b
    if-le v6, v4, :cond_48

    const/4 v5, 0x1

    if-eq v7, v5, :cond_47

    const/4 v5, 0x3

    if-eq v7, v5, :cond_46

    packed-switch v7, :pswitch_data_6

    goto :goto_3c

    :pswitch_1f
    sub-int/2addr v6, v4

    move-object/from16 v2, v28

    .line 1081
    invoke-virtual {v2, v8, v4, v6}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    goto :goto_3d

    :pswitch_20
    move-object/from16 v2, v28

    sub-int/2addr v6, v4

    .line 1076
    invoke-virtual {v14, v8, v4, v6}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    goto :goto_3d

    :pswitch_21
    move-object/from16 v2, v28

    sub-int/2addr v6, v4

    .line 1073
    invoke-virtual {v12, v8, v4, v6}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    goto :goto_3d

    :pswitch_22
    move-object/from16 v2, v28

    sub-int/2addr v6, v4

    .line 1069
    invoke-virtual {v11, v8, v4, v6}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    goto :goto_3d

    :cond_46
    move-object/from16 v2, v28

    sub-int/2addr v6, v4

    .line 1084
    invoke-interface {v1, v8, v4, v6}, Lcom/flyersoft/staticlayout/SHXMLReader;->characterDataHandler([CII)V

    goto :goto_3d

    :cond_47
    move-object/from16 v2, v28

    sub-int/2addr v6, v4

    .line 1066
    invoke-virtual {v9, v8, v4, v6}, Lcom/flyersoft/staticlayout/SHMutableString;->append([CII)V

    goto :goto_3d

    :cond_48
    :goto_3c
    move-object/from16 v2, v28

    :goto_3d
    move-object v10, v2

    move-object v5, v3

    move-object/from16 v3, v17

    move-object/from16 v2, v25

    const/4 v4, 0x0

    move-object/from16 v17, v13

    move/from16 v13, v18

    move-object/from16 v18, v20

    move/from16 v20, v7

    move-object v7, v0

    move-object/from16 v0, p0

    goto/16 :goto_1

    :goto_3e
    move-object/from16 v22, v0

    move/from16 v19, v6

    move/from16 v0, v20

    :goto_3f
    move/from16 v7, v23

    :goto_40
    move/from16 v23, v2

    move-object/from16 v20, v5

    move-object/from16 v2, v25

    :goto_41
    move-object v5, v3

    move-object v3, v10

    :goto_42
    move-object/from16 v10, v28

    goto/16 :goto_4

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_0
        :pswitch_0
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_10
        :pswitch_e
        :pswitch_0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x14
        :pswitch_6
        :pswitch_5
        :pswitch_5
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x8
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x8
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_f
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x8
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x8
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x14
        :pswitch_22
        :pswitch_21
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
    .end packed-switch
.end method

.method finish()V
    .locals 1

    .line 468
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myBuffer:[C

    invoke-static {v0}, Lcom/flyersoft/staticlayout/SHXMLParser;->storeBuffer([C)V

    .line 469
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myTagName:Lcom/flyersoft/staticlayout/SHMutableString;

    invoke-static {v0}, Lcom/flyersoft/staticlayout/SHXMLParser;->storeString(Lcom/flyersoft/staticlayout/SHMutableString;)V

    .line 470
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myAttributeName:Lcom/flyersoft/staticlayout/SHMutableString;

    invoke-static {v0}, Lcom/flyersoft/staticlayout/SHXMLParser;->storeString(Lcom/flyersoft/staticlayout/SHMutableString;)V

    .line 471
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myAttributeValue:Lcom/flyersoft/staticlayout/SHMutableString;

    invoke-static {v0}, Lcom/flyersoft/staticlayout/SHXMLParser;->storeString(Lcom/flyersoft/staticlayout/SHMutableString;)V

    .line 472
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHXMLParser;->myEntityName:Lcom/flyersoft/staticlayout/SHMutableString;

    invoke-static {v0}, Lcom/flyersoft/staticlayout/SHXMLParser;->storeString(Lcom/flyersoft/staticlayout/SHMutableString;)V

    return-void
.end method
