.class final Lcom/flyersoft/staticlayout/SHStringMap;
.super Ljava/lang/Object;
.source "HyphenationXML.java"


# instance fields
.field private myKeys:[Ljava/lang/String;

.field private mySize:I

.field private myValues:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 334
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x8

    .line 335
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myKeys:[Ljava/lang/String;

    .line 336
    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myValues:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 380
    iput v0, p0, Lcom/flyersoft/staticlayout/SHStringMap;->mySize:I

    return-void
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myKeys:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getSize()I
    .locals 1

    .line 368
    iget v0, p0, Lcom/flyersoft/staticlayout/SHStringMap;->mySize:I

    return v0
.end method

.method getValue(I)Ljava/lang/String;
    .locals 1

    .line 376
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myValues:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 355
    iget v0, p0, Lcom/flyersoft/staticlayout/SHStringMap;->mySize:I

    if-lez v0, :cond_1

    .line 357
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myKeys:[Ljava/lang/String;

    :cond_0
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_1

    .line 359
    aget-object v2, v1, v0

    if-ne v2, p1, :cond_0

    .line 360
    iget-object p1, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myValues:[Ljava/lang/String;

    aget-object p1, p1, v0

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 340
    iget v0, p0, Lcom/flyersoft/staticlayout/SHStringMap;->mySize:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/flyersoft/staticlayout/SHStringMap;->mySize:I

    .line 341
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myKeys:[Ljava/lang/String;

    .line 342
    array-length v2, v1

    if-ne v2, v0, :cond_0

    shl-int/lit8 v2, v0, 0x1

    .line 343
    invoke-static {v1, v0, v2}, Lcom/flyersoft/staticlayout/SHArrayUtils;->createCopy([Ljava/lang/String;II)[Ljava/lang/String;

    move-result-object v1

    .line 344
    iput-object v1, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myKeys:[Ljava/lang/String;

    .line 345
    iget-object v3, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myValues:[Ljava/lang/String;

    invoke-static {v3, v0, v2}, Lcom/flyersoft/staticlayout/SHArrayUtils;->createCopy([Ljava/lang/String;II)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myValues:[Ljava/lang/String;

    .line 347
    :cond_0
    aput-object p1, v1, v0

    .line 348
    iget-object p1, p0, Lcom/flyersoft/staticlayout/SHStringMap;->myValues:[Ljava/lang/String;

    aput-object p2, p1, v0

    return-void
.end method
