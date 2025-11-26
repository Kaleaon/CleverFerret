.class final Lcom/flyersoft/staticlayout/SHTextHyphenationReader;
.super Lcom/flyersoft/staticlayout/SHXMLReaderAdapter;
.source "SHTextHyphenator.java"


# static fields
.field private static final PATTERN:Ljava/lang/String; = "pattern"


# instance fields
.field private myBuffer:[C

.field private myBufferLength:I

.field private final myHyphenator:Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;

.field private myReadPattern:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;)V
    .locals 1

    .line 450
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/SHXMLReaderAdapter;-><init>()V

    const/16 v0, 0xa

    .line 447
    new-array v0, v0, [C

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myBuffer:[C

    .line 451
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myHyphenator:Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;

    return-void
.end method


# virtual methods
.method public characterDataHandler([CII)V
    .locals 4

    .line 474
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myReadPattern:Z

    if-eqz v0, :cond_1

    .line 475
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myBuffer:[C

    .line 476
    iget v1, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myBufferLength:I

    add-int v2, v1, p3

    .line 478
    array-length v3, v0

    if-le v2, v3, :cond_0

    add-int/lit8 v3, v2, 0xa

    .line 479
    invoke-static {v0, v1, v3}, Lcom/flyersoft/staticlayout/SHArrayUtils;->createCopy([CII)[C

    move-result-object v0

    .line 480
    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myBuffer:[C

    .line 482
    :cond_0
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 483
    iput v2, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myBufferLength:I

    :cond_1
    return-void
.end method

.method public endElementHandler(Ljava/lang/String;)Z
    .locals 5

    .line 462
    const-string v0, "pattern"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 463
    iput-boolean v0, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myReadPattern:Z

    .line 464
    iget p1, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myBufferLength:I

    if-eqz p1, :cond_0

    .line 466
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myHyphenator:Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;

    new-instance v2, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;

    iget-object v3, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myBuffer:[C

    const/4 v4, 0x1

    invoke-direct {v2, v3, v0, p1, v4}, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;-><init>([CIIZ)V

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->addPattern(Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;)V

    .line 468
    :cond_0
    iput v0, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myBufferLength:I

    :cond_1
    return v0
.end method

.method public startElementHandler(Ljava/lang/String;Lcom/flyersoft/staticlayout/SHStringMap;)Z
    .locals 0

    .line 455
    const-string p2, "pattern"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 456
    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->myReadPattern:Z

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
