.class public abstract Lcom/flyersoft/staticlayout/SHTextHyphenator;
.super Ljava/lang/Object;
.source "SHTextHyphenator.java"


# static fields
.field protected static ourInstance:Lcom/flyersoft/staticlayout/SHTextHyphenator;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 505
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Instance()Lcom/flyersoft/staticlayout/SHTextHyphenator;
    .locals 1

    .line 492
    sget-object v0, Lcom/flyersoft/staticlayout/SHTextHyphenator;->ourInstance:Lcom/flyersoft/staticlayout/SHTextHyphenator;

    if-nez v0, :cond_0

    .line 493
    new-instance v0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;

    invoke-direct {v0}, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/SHTextHyphenator;->ourInstance:Lcom/flyersoft/staticlayout/SHTextHyphenator;

    .line 495
    :cond_0
    sget-object v0, Lcom/flyersoft/staticlayout/SHTextHyphenator;->ourInstance:Lcom/flyersoft/staticlayout/SHTextHyphenator;

    return-object v0
.end method

.method public static deleteInstance()V
    .locals 1

    .line 499
    sget-object v0, Lcom/flyersoft/staticlayout/SHTextHyphenator;->ourInstance:Lcom/flyersoft/staticlayout/SHTextHyphenator;

    if-eqz v0, :cond_0

    .line 500
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/SHTextHyphenator;->unload()V

    const/4 v0, 0x0

    .line 501
    sput-object v0, Lcom/flyersoft/staticlayout/SHTextHyphenator;->ourInstance:Lcom/flyersoft/staticlayout/SHTextHyphenator;

    :cond_0
    return-void
.end method


# virtual methods
.method public getInfo(Lcom/flyersoft/staticlayout/SHTextWord;)Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;
    .locals 12

    .line 513
    iget v0, p1, Lcom/flyersoft/staticlayout/SHTextWord;->Length:I

    .line 514
    new-array v1, v0, [Z

    add-int/lit8 v2, v0, 0x2

    .line 515
    new-array v3, v2, [C

    .line 516
    iget-object v4, p1, Lcom/flyersoft/staticlayout/SHTextWord;->Data:[C

    const/4 v5, 0x0

    const/16 v6, 0x20

    .line 517
    aput-char v6, v3, v5

    .line 518
    iget v7, p1, Lcom/flyersoft/staticlayout/SHTextWord;->Offset:I

    const/4 v8, 0x0

    :goto_0
    const/4 v9, 0x1

    if-ge v8, v0, :cond_1

    .line 519
    aget-char v10, v4, v7

    .line 520
    invoke-static {v10}, Lcom/flyersoft/staticlayout/SHCharacterUtil;->isLetter(C)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 521
    aput-boolean v9, v1, v8

    add-int/lit8 v9, v8, 0x1

    .line 522
    invoke-static {v10}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v10

    aput-char v10, v3, v9

    goto :goto_1

    :cond_0
    add-int/lit8 v9, v8, 0x1

    .line 524
    aput-char v6, v3, v9

    :goto_1
    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_1
    add-int/lit8 v7, v0, 0x1

    .line 527
    aput-char v6, v3, v7

    .line 529
    new-instance v6, Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;

    invoke-direct {v6, v2}, Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;-><init>(I)V

    .line 530
    iget-object v7, v6, Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;->Mask:[Z

    .line 531
    invoke-virtual {p0, v3, v7, v2}, Lcom/flyersoft/staticlayout/SHTextHyphenator;->hyphenate([C[ZI)V

    .line 532
    iget p1, p1, Lcom/flyersoft/staticlayout/SHTextWord;->Offset:I

    sub-int/2addr p1, v9

    const/4 v2, 0x0

    :goto_2
    if-gt v2, v0, :cond_7

    const/4 v3, 0x2

    if-lt v2, v3, :cond_6

    add-int/lit8 v3, v0, -0x2

    if-le v2, v3, :cond_2

    goto :goto_5

    .line 535
    :cond_2
    aget-char v3, v4, p1

    const/16 v8, 0x2d

    if-ne v3, v8, :cond_4

    const/4 v3, 0x3

    if-lt v2, v3, :cond_3

    add-int/lit8 v3, v2, -0x3

    .line 536
    aget-boolean v3, v1, v3

    if-eqz v3, :cond_3

    add-int/lit8 v3, v2, -0x2

    aget-boolean v3, v1, v3

    if-eqz v3, :cond_3

    aget-boolean v3, v1, v2

    if-eqz v3, :cond_3

    add-int/lit8 v3, v2, 0x1

    aget-boolean v3, v1, v3

    if-eqz v3, :cond_3

    const/4 v3, 0x1

    goto :goto_3

    :cond_3
    const/4 v3, 0x0

    :goto_3
    aput-boolean v3, v7, v2

    goto :goto_6

    .line 542
    :cond_4
    aget-boolean v3, v7, v2

    if-eqz v3, :cond_5

    add-int/lit8 v3, v2, -0x2

    aget-boolean v3, v1, v3

    if-eqz v3, :cond_5

    add-int/lit8 v3, v2, -0x1

    aget-boolean v3, v1, v3

    if-eqz v3, :cond_5

    aget-boolean v3, v1, v2

    if-eqz v3, :cond_5

    add-int/lit8 v3, v2, 0x1

    aget-boolean v3, v1, v3

    if-eqz v3, :cond_5

    const/4 v3, 0x1

    goto :goto_4

    :cond_5
    const/4 v3, 0x0

    :goto_4
    aput-boolean v3, v7, v2

    goto :goto_6

    .line 534
    :cond_6
    :goto_5
    aput-boolean v5, v7, v2

    :goto_6
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    :cond_7
    return-object v6
.end method

.method protected abstract hyphenate([C[ZI)V
.end method

.method public abstract load(Ljava/lang/String;)V
.end method

.method public abstract load(Ljava/lang/String;Landroid/content/res/AssetManager;)V
.end method

.method public abstract unload()V
.end method
