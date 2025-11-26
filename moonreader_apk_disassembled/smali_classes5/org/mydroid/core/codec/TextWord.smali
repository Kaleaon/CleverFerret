.class public Lorg/mydroid/core/codec/TextWord;
.super Landroid/graphics/RectF;
.source "TextWord.java"


# instance fields
.field public number:I

.field private original:Landroid/graphics/RectF;

.field public w:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 12
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/graphics/RectF;)V
    .locals 0

    .line 32
    invoke-direct {p0, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 33
    iput-object p1, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/mydroid/core/codec/TextChar;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 16
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    .line 17
    invoke-virtual {p0, p1}, Lorg/mydroid/core/codec/TextWord;->Add(Lorg/mydroid/core/codec/TextChar;)V

    return-void
.end method

.method private asString([[Lorg/mydroid/core/codec/TextWord;Z)Ljava/lang/String;
    .locals 10
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 51
    const-string v0, ""

    if-nez p1, :cond_0

    return-object v0

    .line 54
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    array-length v2, p1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_3

    aget-object v5, p1, v4

    const/4 v6, 0x0

    .line 57
    :goto_1
    array-length v7, v5

    if-ge v6, v7, :cond_2

    .line 58
    aget-object v7, v5, v6

    .line 60
    array-length v8, v5

    add-int/lit8 v8, v8, -0x1

    if-ne v6, v8, :cond_1

    iget-object v8, v7, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    const-string v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 61
    iget-object v7, v7, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    const-string v8, "-$"

    invoke-virtual {v7, v8, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 63
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Lorg/mydroid/core/codec/TextWord;->getWord()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " "

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 68
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p2, :cond_4

    invoke-static {p1}, Lorg/mydroid/core/codec/TxtUtils;->filterString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_4
    return-object p1
.end method


# virtual methods
.method public Add(Lorg/mydroid/core/codec/TextChar;)V
    .locals 4

    .line 27
    invoke-super {p0, p1}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    .line 28
    iget-object v0, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    new-instance v1, Ljava/lang/String;

    iget-char p1, p1, Lorg/mydroid/core/codec/TextChar;->c:C

    const/4 v2, 0x1

    new-array v2, v2, [C

    const/4 v3, 0x0

    aput-char p1, v2, v3

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    return-void
.end method

.method public addChar(Landroid/graphics/RectF;C)V
    .locals 0

    .line 37
    invoke-super {p0, p1}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    .line 38
    iget-object p1, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    return-void
.end method

.method public getOriginal()Landroid/graphics/RectF;
    .locals 1

    .line 42
    iget-object v0, p0, Lorg/mydroid/core/codec/TextWord;->original:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getWord()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    return-object v0
.end method

.method public setOriginal(Landroid/graphics/RectF;)V
    .locals 1

    .line 46
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v0, p0, Lorg/mydroid/core/codec/TextWord;->original:Landroid/graphics/RectF;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/mydroid/core/codec/TextWord;->w:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lorg/mydroid/core/codec/TextWord;->left:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lorg/mydroid/core/codec/TextWord;->top:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lorg/mydroid/core/codec/TextWord;->right:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/mydroid/core/codec/TextWord;->bottom:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
