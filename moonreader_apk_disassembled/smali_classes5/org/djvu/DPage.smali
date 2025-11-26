.class public Lorg/djvu/DPage;
.super Ljava/lang/Object;
.source "DPage.java"


# instance fields
.field public _page:Lorg/mydroid/droids/djvu/codec/DjvuPage;


# direct methods
.method public constructor <init>(Lorg/djvu/DDocument;I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iget-object p1, p1, Lorg/djvu/DDocument;->_doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    invoke-virtual {p1, p2}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getPage(I)Lorg/mydroid/droids/djvu/codec/DjvuPage;

    move-result-object p1

    iput-object p1, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    return-void
.end method

.method public static fillRect([FLandroid/graphics/RectF;)V
    .locals 2

    const/4 v0, 0x0

    .line 67
    iget v1, p1, Landroid/graphics/RectF;->left:F

    aput v1, p0, v0

    const/4 v0, 0x1

    .line 68
    iget v1, p1, Landroid/graphics/RectF;->top:F

    aput v1, p0, v0

    const/4 v0, 0x2

    .line 69
    iget v1, p1, Landroid/graphics/RectF;->right:F

    aput v1, p0, v0

    const/4 v0, 0x3

    .line 70
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    aput p1, p0, v0

    return-void
.end method

.method private getAboutCharIndex([FF)I
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 91
    :goto_0
    iget-object v2, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v2, v2, Lorg/mydroid/droids/djvu/codec/DjvuPage;->rects:[Landroid/graphics/RectF;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 92
    iget-object v2, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v2, v2, Lorg/mydroid/droids/djvu/codec/DjvuPage;->rects:[Landroid/graphics/RectF;

    aget-object v2, v2, v1

    .line 93
    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, p2

    aget v4, p1, v0

    cmpg-float v3, v3, v4

    if-gez v3, :cond_0

    iget v3, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v3, p2

    aget v4, p1, v0

    cmpl-float v3, v3, v4

    if-lez v3, :cond_0

    iget v3, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, p2

    const/4 v4, 0x1

    aget v5, p1, v4

    cmpg-float v3, v3, v5

    if-gez v3, :cond_0

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v2, p2

    aget v3, p1, v4

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method


# virtual methods
.method public AddAnnotMarkup(III)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public Close()V
    .locals 0

    return-void
.end method

.method public ObjsGetCharCount()I
    .locals 2

    .line 29
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 30
    :cond_0
    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->loadText()V

    .line 31
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    if-nez v0, :cond_1

    return v1

    .line 33
    :cond_1
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public final ObjsGetCharIndex([FF)I
    .locals 2

    .line 77
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->loadText()V

    .line 78
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    .line 80
    invoke-direct {p0, p1, v0}, Lorg/djvu/DPage;->getAboutCharIndex([FF)I

    move-result v0

    if-ne v0, v1, :cond_1

    const/high16 v0, 0x40800000    # 4.0f

    .line 82
    invoke-virtual {p0, v0}, Lorg/djvu/DPage;->d(F)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, p2

    invoke-direct {p0, p1, v0}, Lorg/djvu/DPage;->getAboutCharIndex([FF)I

    move-result v0

    :cond_1
    if-ne v0, v1, :cond_2

    const/high16 v0, 0x41000000    # 8.0f

    .line 84
    invoke-virtual {p0, v0}, Lorg/djvu/DPage;->d(F)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, p2

    invoke-direct {p0, p1, v0}, Lorg/djvu/DPage;->getAboutCharIndex([FF)I

    move-result v0

    :cond_2
    if-ne v0, v1, :cond_3

    const/high16 v0, 0x41400000    # 12.0f

    .line 86
    invoke-virtual {p0, v0}, Lorg/djvu/DPage;->d(F)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, p2

    invoke-direct {p0, p1, v0}, Lorg/djvu/DPage;->getAboutCharIndex([FF)I

    move-result p1

    return p1

    :cond_3
    return v0
.end method

.method public final ObjsGetCharRect(I)Landroid/graphics/RectF;
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->loadText()V

    .line 54
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 56
    :cond_0
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->rects:[Landroid/graphics/RectF;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public final ObjsGetCharRect(I[F)V
    .locals 1

    .line 60
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->loadText()V

    .line 61
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    .line 63
    :cond_0
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->rects:[Landroid/graphics/RectF;

    aget-object p1, v0, p1

    invoke-static {p2, p1}, Lorg/djvu/DPage;->fillRect([FLandroid/graphics/RectF;)V

    return-void
.end method

.method public final ObjsGetString(II)Ljava/lang/String;
    .locals 2

    .line 45
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 46
    :cond_0
    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->loadText()V

    .line 47
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    if-nez v0, :cond_1

    return-object v1

    .line 49
    :cond_1
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final ObjsGetText()Ljava/lang/String;
    .locals 2

    .line 37
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 38
    :cond_0
    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->loadText()V

    .line 39
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    if-nez v0, :cond_1

    return-object v1

    .line 41
    :cond_1
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v0, v0, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    return-object v0
.end method

.method public final ObjsStart()V
    .locals 1

    .line 25
    iget-object v0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->loadText()V

    return-void
.end method

.method public d(F)I
    .locals 1

    .line 101
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    return p1
.end method
