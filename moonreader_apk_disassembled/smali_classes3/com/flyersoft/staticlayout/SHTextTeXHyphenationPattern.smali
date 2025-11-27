.class final Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;
.super Ljava/lang/Object;
.source "SHTextHyphenator.java"


# instance fields
.field myHashCode:I

.field myLength:I

.field final mySymbols:[C

.field private final myValues:[B


# direct methods
.method public constructor <init>([CIIZ)V
    .locals 7

    .line 571
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    if-eqz p4, :cond_5

    const/4 p4, 0x0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x39

    const/16 v3, 0x30

    if-ge p4, p3, :cond_2

    add-int v4, p2, p4

    .line 575
    aget-char v4, p1, v4

    if-gt v4, v2, :cond_0

    if-ge v4, v3, :cond_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    :cond_1
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    .line 580
    :cond_2
    new-array p4, v1, [C

    add-int/lit8 v4, v1, 0x1

    .line 581
    new-array v4, v4, [B

    const/4 v5, 0x0

    :goto_1
    if-ge v0, p3, :cond_4

    add-int v6, p2, v0

    .line 584
    aget-char v6, p1, v6

    if-gt v6, v2, :cond_3

    if-lt v6, v3, :cond_3

    add-int/lit8 v6, v6, -0x30

    int-to-byte v6, v6

    .line 586
    aput-byte v6, v4, v5

    goto :goto_2

    .line 588
    :cond_3
    aput-char v6, p4, v5

    add-int/lit8 v5, v5, 0x1

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 593
    :cond_4
    iput v1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    .line 594
    iput-object p4, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->mySymbols:[C

    .line 595
    iput-object v4, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myValues:[B

    return-void

    .line 597
    :cond_5
    new-array p4, p3, [C

    .line 598
    invoke-static {p1, p2, p4, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 599
    iput p3, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    .line 600
    iput-object p4, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->mySymbols:[C

    const/4 p1, 0x0

    .line 601
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myValues:[B

    return-void
.end method


# virtual methods
.method apply([BI)V
    .locals 5

    .line 606
    iget v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    .line 607
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myValues:[B

    const/4 v2, 0x0

    :goto_0
    if-gt v2, v0, :cond_1

    .line 609
    aget-byte v3, v1, v2

    .line 610
    aget-byte v4, p1, p2

    if-ge v4, v3, :cond_0

    .line 611
    aput-byte v3, p1, p2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 617
    check-cast p1, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;

    .line 618
    iget v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    .line 619
    iget v1, p1, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 622
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->mySymbols:[C

    .line 623
    iget-object p1, p1, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->mySymbols:[C

    :goto_0
    add-int/lit8 v3, v0, -0x1

    if-eqz v0, :cond_2

    .line 625
    aget-char v0, v1, v3

    aget-char v4, p1, v3

    if-eq v0, v4, :cond_1

    return v2

    :cond_1
    move v0, v3

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public getLength()I
    .locals 1

    .line 648
    iget v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    return v0
.end method

.method public getSymbols()[C
    .locals 1

    .line 652
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->mySymbols:[C

    return-object v0
.end method

.method public getValues()[B
    .locals 1

    .line 656
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myValues:[B

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 633
    iget v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myHashCode:I

    if-nez v0, :cond_1

    .line 635
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->mySymbols:[C

    .line 637
    iget v1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    const/4 v2, 0x0

    :goto_0
    add-int/lit8 v3, v1, -0x1

    if-eqz v1, :cond_0

    mul-int/lit8 v2, v2, 0x1f

    .line 640
    aget-char v1, v0, v3

    add-int/2addr v2, v1

    move v1, v3

    goto :goto_0

    .line 642
    :cond_0
    iput v2, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myHashCode:I

    return v2

    :cond_1
    return v0
.end method

.method update([CII)V
    .locals 2

    .line 566
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->mySymbols:[C

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 567
    iput p3, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    .line 568
    iput v1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myHashCode:I

    return-void
.end method
