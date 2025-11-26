.class final Lcom/flyersoft/staticlayout/SHMutableString;
.super Ljava/lang/Object;
.source "HyphenationXML.java"


# instance fields
.field myData:[C

.field myLength:I


# direct methods
.method constructor <init>()V
    .locals 1

    const/16 v0, 0x14

    .line 260
    invoke-direct {p0, v0}, Lcom/flyersoft/staticlayout/SHMutableString;-><init>(I)V

    return-void
.end method

.method constructor <init>(I)V
    .locals 0

    .line 255
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 256
    new-array p1, p1, [C

    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/staticlayout/SHMutableString;)V
    .locals 1

    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 264
    iget v0, p1, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    .line 265
    iget-object p1, p1, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    invoke-static {p1, v0, v0}, Lcom/flyersoft/staticlayout/SHArrayUtils;->createCopy([CII)[C

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    .line 266
    iput v0, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    return-void
.end method


# virtual methods
.method public append([CII)V
    .locals 4

    .line 270
    iget v0, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    .line 271
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    add-int v2, v0, p3

    .line 273
    array-length v3, v1

    if-ge v3, v2, :cond_0

    .line 274
    invoke-static {v1, v0, v2}, Lcom/flyersoft/staticlayout/SHArrayUtils;->createCopy([CII)[C

    move-result-object v1

    .line 275
    iput-object v1, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    .line 277
    :cond_0
    invoke-static {p1, p2, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 278
    iput v2, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 282
    iput v0, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 286
    check-cast p1, Lcom/flyersoft/staticlayout/SHMutableString;

    .line 287
    iget v0, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    .line 288
    iget v1, p1, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 291
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    .line 292
    iget-object p1, p1, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    :cond_1
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_2

    .line 294
    aget-char v3, v1, v0

    aget-char v4, p1, v0

    if-eq v3, v4, :cond_1

    return v2

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public hashCode()I
    .locals 5

    .line 302
    iget v0, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    .line 303
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    mul-int/lit8 v2, v0, 0x1f

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-le v0, v4, :cond_1

    .line 306
    aget-char v3, v1, v3

    add-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x1f

    .line 308
    aget-char v3, v1, v4

    add-int/2addr v2, v3

    const/4 v3, 0x2

    if-le v0, v3, :cond_0

    mul-int/lit8 v2, v2, 0x1f

    .line 311
    aget-char v0, v1, v3

    :goto_0
    add-int/2addr v2, v0

    :cond_0
    return v2

    :cond_1
    if-lez v0, :cond_2

    .line 314
    aget-char v0, v1, v3

    goto :goto_0

    :cond_2
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 320
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myData:[C

    const/4 v2, 0x0

    iget v3, p0, Lcom/flyersoft/staticlayout/SHMutableString;->myLength:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
