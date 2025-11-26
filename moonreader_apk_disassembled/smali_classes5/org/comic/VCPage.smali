.class public Lorg/comic/VCPage;
.super Ljava/lang/Object;
.source "VCPage.java"

# interfaces
.implements Lorg/comic/ICLayoutView$IVPage;


# instance fields
.field public bookx:I

.field public booky:I

.field public m_doc:Lorg/comic/CDocument;

.field public m_layout:Lorg/comic/CLayout;

.field public mh:I

.field public mw:I

.field public pageno:I

.field public single:Z

.field public vert:Z


# direct methods
.method public constructor <init>(Lorg/comic/CDocument;Lorg/comic/CLayout;III)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 53
    iput v0, p0, Lorg/comic/VCPage;->bookx:I

    iput v0, p0, Lorg/comic/VCPage;->booky:I

    .line 21
    iput-object p1, p0, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    .line 22
    iput-object p2, p0, Lorg/comic/VCPage;->m_layout:Lorg/comic/CLayout;

    .line 23
    iput p3, p0, Lorg/comic/VCPage;->pageno:I

    .line 24
    iget-boolean p1, p2, Lorg/comic/CLayout;->vert:Z

    iput-boolean p1, p0, Lorg/comic/VCPage;->vert:Z

    .line 25
    instance-of p1, p2, Lorg/comic/CLayoutSingle;

    iput-boolean p1, p0, Lorg/comic/VCPage;->single:Z

    .line 26
    iput p4, p0, Lorg/comic/VCPage;->mw:I

    .line 27
    iput p5, p0, Lorg/comic/VCPage;->mh:I

    return-void
.end method

.method private drawPageGap(Landroid/graphics/Canvas;FFFF)V
    .locals 0

    return-void
.end method


# virtual methods
.method public final GetCX(F)F
    .locals 1

    .line 61
    invoke-virtual {p0}, Lorg/comic/VCPage;->getScale()F

    move-result v0

    div-float/2addr p1, v0

    invoke-virtual {p0}, Lorg/comic/VCPage;->GetX()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    return p1
.end method

.method public final GetCY(F)F
    .locals 1

    .line 65
    invoke-virtual {p0}, Lorg/comic/VCPage;->getScale()F

    move-result v0

    div-float/2addr p1, v0

    invoke-virtual {p0}, Lorg/comic/VCPage;->GetY()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    return p1
.end method

.method public final GetHeight()I
    .locals 2

    .line 81
    iget-object v0, p0, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget v1, p0, Lorg/comic/VCPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/comic/CDocument;->GetPageHeight(I)I

    move-result v0

    return v0
.end method

.method public final GetPageNo()I
    .locals 1

    .line 85
    iget v0, p0, Lorg/comic/VCPage;->pageno:I

    return v0
.end method

.method public final GetVX(F)I
    .locals 1

    .line 35
    invoke-virtual {p0}, Lorg/comic/VCPage;->GetX()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p1

    invoke-virtual {p0}, Lorg/comic/VCPage;->getScale()F

    move-result p1

    mul-float v0, v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method public final GetVY(F)I
    .locals 1

    .line 39
    invoke-virtual {p0}, Lorg/comic/VCPage;->GetY()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p1

    invoke-virtual {p0}, Lorg/comic/VCPage;->getScale()F

    move-result p1

    mul-float v0, v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method public final GetWidth()I
    .locals 2

    .line 77
    iget-object v0, p0, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget v1, p0, Lorg/comic/VCPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/comic/CDocument;->GetPageWidth(I)I

    move-result v0

    return v0
.end method

.method public final GetX()I
    .locals 2

    .line 43
    iget v0, p0, Lorg/comic/VCPage;->bookx:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 44
    iget-boolean v0, p0, Lorg/comic/VCPage;->vert:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 45
    iput v0, p0, Lorg/comic/VCPage;->bookx:I

    goto :goto_1

    .line 47
    :cond_0
    sget-boolean v0, Lcom/radaee/pdf/Global;->cbzRtol:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget v1, p0, Lorg/comic/VCPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/comic/CDocument;->getPageXRtl(I)I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget v1, p0, Lorg/comic/VCPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/comic/CDocument;->getPageX(I)I

    move-result v0

    :goto_0
    iput v0, p0, Lorg/comic/VCPage;->bookx:I

    .line 50
    :cond_2
    :goto_1
    iget v0, p0, Lorg/comic/VCPage;->bookx:I

    return v0
.end method

.method public final GetY()I
    .locals 2

    .line 55
    iget v0, p0, Lorg/comic/VCPage;->booky:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 56
    iget-boolean v0, p0, Lorg/comic/VCPage;->vert:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget v1, p0, Lorg/comic/VCPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/comic/CDocument;->getPageY(I)I

    move-result v0

    :goto_0
    iput v0, p0, Lorg/comic/VCPage;->booky:I

    .line 57
    :cond_1
    iget v0, p0, Lorg/comic/VCPage;->booky:I

    return v0
.end method

.method public LocHorz(I)I
    .locals 2

    int-to-float p1, p1

    .line 218
    invoke-virtual {p0, p1}, Lorg/comic/VCPage;->toCxy(F)F

    move-result p1

    .line 219
    invoke-virtual {p0}, Lorg/comic/VCPage;->GetX()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 221
    :cond_0
    invoke-virtual {p0}, Lorg/comic/VCPage;->GetX()I

    move-result v0

    invoke-virtual {p0}, Lorg/comic/VCPage;->GetWidth()I

    move-result v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public LocVert(I)I
    .locals 2

    int-to-float p1, p1

    .line 209
    invoke-virtual {p0, p1}, Lorg/comic/VCPage;->toCxy(F)F

    move-result p1

    .line 210
    invoke-virtual {p0}, Lorg/comic/VCPage;->GetY()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 212
    :cond_0
    invoke-virtual {p0}, Lorg/comic/VCPage;->GetY()I

    move-result v0

    invoke-virtual {p0}, Lorg/comic/VCPage;->GetHeight()I

    move-result v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getScale()F
    .locals 1

    .line 31
    iget-object v0, p0, Lorg/comic/VCPage;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {v0}, Lorg/comic/CLayout;->vGetScale()F

    move-result v0

    return v0
.end method

.method public getVyOff()F
    .locals 4

    .line 176
    iget-boolean v0, p0, Lorg/comic/VCPage;->single:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 177
    :cond_0
    invoke-virtual {p0}, Lorg/comic/VCPage;->GetHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lorg/comic/VCPage;->getScale()F

    move-result v2

    mul-float v0, v0, v2

    .line 178
    iget v2, p0, Lorg/comic/VCPage;->mh:I

    int-to-float v3, v2

    cmpl-float v3, v0, v3

    if-lez v3, :cond_1

    return v1

    :cond_1
    int-to-float v1, v2

    sub-float/2addr v1, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v1, v0

    return v1
.end method

.method public final toCxy(F)F
    .locals 1

    .line 69
    invoke-virtual {p0}, Lorg/comic/VCPage;->getScale()F

    move-result v0

    div-float/2addr p1, v0

    return p1
.end method

.method public final toVxy(F)F
    .locals 1

    .line 73
    invoke-virtual {p0}, Lorg/comic/VCPage;->getScale()F

    move-result v0

    mul-float p1, p1, v0

    return p1
.end method

.method public vDraw(Landroid/view/View;Landroid/graphics/Canvas;ZIIII)Landroid/graphics/Bitmap;
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move/from16 v7, p3

    move/from16 v0, p4

    int-to-float v0, v0

    .line 90
    invoke-virtual {v1, v0}, Lorg/comic/VCPage;->toCxy(F)F

    move-result v0

    move/from16 v3, p5

    int-to-float v3, v3

    .line 91
    invoke-virtual {v1, v3}, Lorg/comic/VCPage;->toCxy(F)F

    move-result v3

    .line 92
    invoke-virtual {v1}, Lorg/comic/VCPage;->GetX()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v0

    invoke-virtual {v1}, Lorg/comic/VCPage;->getScale()F

    move-result v0

    mul-float v4, v4, v0

    .line 93
    invoke-virtual {v1}, Lorg/comic/VCPage;->GetY()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, v3

    invoke-virtual {v1}, Lorg/comic/VCPage;->getScale()F

    move-result v3

    mul-float v0, v0, v3

    invoke-virtual {v1}, Lorg/comic/VCPage;->getVyOff()F

    move-result v3

    add-float/2addr v0, v3

    .line 94
    invoke-virtual {v1}, Lorg/comic/VCPage;->GetWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1}, Lorg/comic/VCPage;->getScale()F

    move-result v5

    mul-float v3, v3, v5

    add-float v5, v4, v3

    .line 95
    invoke-virtual {v1}, Lorg/comic/VCPage;->GetHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1}, Lorg/comic/VCPage;->getScale()F

    move-result v6

    mul-float v3, v3, v6

    add-float v6, v0, v3

    .line 96
    new-instance v3, Landroid/graphics/Rect;

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v10

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v11

    invoke-direct {v3, v8, v9, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 98
    iget-object v8, v1, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget v9, v1, Lorg/comic/VCPage;->pageno:I

    invoke-virtual {v8, v9}, Lorg/comic/CDocument;->GetPage(I)Lorg/comic/CPage;

    move-result-object v8

    sub-float v9, v5, v4

    .line 99
    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 100
    invoke-virtual {v8, v9, v7}, Lorg/comic/CPage;->renderBitmap(IZ)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 103
    invoke-static {v10}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v11

    const/4 v12, 0x1

    if-nez v11, :cond_7

    .line 105
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v0

    .line 106
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v4

    .line 107
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 108
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    mul-int v11, v0, v6

    .line 110
    div-int/2addr v11, v5

    if-ge v11, v4, :cond_0

    .line 112
    new-instance v0, Landroid/graphics/Rect;

    iget v14, v3, Landroid/graphics/Rect;->left:I

    iget v15, v3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v11

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v15, v4

    iget v13, v3, Landroid/graphics/Rect;->right:I

    iget v3, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v3, v4

    add-int/2addr v3, v11

    invoke-direct {v0, v14, v15, v13, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    :cond_0
    mul-int v4, v4, v5

    .line 114
    div-int/2addr v4, v6

    .line 115
    new-instance v11, Landroid/graphics/Rect;

    iget v13, v3, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v4

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v13, v0

    iget v14, v3, Landroid/graphics/Rect;->top:I

    iget v15, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v15, v0

    add-int/2addr v15, v4

    iget v0, v3, Landroid/graphics/Rect;->bottom:I

    invoke-direct {v11, v13, v14, v15, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v0, v11

    .line 118
    :goto_0
    sget-boolean v3, Lcom/flyersoft/tools/A;->cbz_smooth:Z

    if-eqz v3, :cond_1

    iget-object v3, v1, Lorg/comic/VCPage;->m_layout:Lorg/comic/CLayout;

    iget-object v13, v3, Lorg/comic/CLayout;->antiPaint:Landroid/graphics/Paint;

    goto :goto_1

    :cond_1
    const/4 v13, 0x0

    .line 120
    :goto_1
    iget-object v3, v1, Lorg/comic/VCPage;->m_layout:Lorg/comic/CLayout;

    iget v3, v3, Lorg/comic/CLayout;->def_view:I

    const/4 v4, 0x3

    const/16 v11, 0xff

    if-eq v3, v4, :cond_4

    if-nez v13, :cond_2

    .line 122
    iget-object v3, v1, Lorg/comic/VCPage;->m_layout:Lorg/comic/CLayout;

    iget-object v13, v3, Lorg/comic/CLayout;->alphPaint:Landroid/graphics/Paint;

    .line 123
    :cond_2
    iget-object v3, v1, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget-boolean v3, v3, Lorg/comic/CDocument;->outOfMemoryError:Z

    if-nez v3, :cond_3

    const/16 v3, 0xfa

    .line 124
    invoke-virtual {v8, v3}, Lorg/comic/CPage;->getAlpha(I)I

    move-result v3

    goto :goto_2

    :cond_3
    const/16 v3, 0xff

    .line 125
    :goto_2
    invoke-virtual {v13, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_3

    :cond_4
    const/16 v3, 0xff

    .line 127
    :goto_3
    invoke-static {v10}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v4

    if-nez v4, :cond_5

    const/4 v4, 0x0

    .line 151
    :try_start_0
    new-instance v14, Landroid/graphics/Rect;

    invoke-direct {v14, v4, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 152
    invoke-virtual {v2, v10, v14, v0, v13}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception v0

    .line 154
    invoke-static {v0, v4}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 156
    :cond_5
    :goto_4
    iget-object v0, v1, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget-boolean v0, v0, Lorg/comic/CDocument;->outOfMemoryError:Z

    if-nez v0, :cond_8

    if-lt v3, v11, :cond_6

    .line 157
    iget-boolean v0, v8, Lorg/comic/CPage;->inGettingBitmap:Z

    if-eqz v0, :cond_8

    .line 158
    :cond_6
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->postInvalidate()V

    goto :goto_5

    .line 160
    :cond_7
    iget-object v8, v1, Lorg/comic/VCPage;->m_layout:Lorg/comic/CLayout;

    iget-object v8, v8, Lorg/comic/CLayout;->pagePaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v8}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 161
    iget v8, v3, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    add-int/2addr v8, v10

    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    sub-int/2addr v8, v11

    int-to-float v8, v8

    .line 162
    iget v11, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v11, v3

    invoke-static {v10}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    add-int/2addr v11, v3

    .line 163
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v10, ""

    invoke-direct {v3, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v10, v1, Lorg/comic/VCPage;->pageno:I

    add-int/2addr v10, v12

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    int-to-float v10, v11

    iget-object v11, v1, Lorg/comic/VCPage;->m_layout:Lorg/comic/CLayout;

    iget-object v11, v11, Lorg/comic/CLayout;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v2, v3, v8, v10, v11}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    move v3, v4

    move v4, v0

    .line 164
    invoke-direct/range {v1 .. v6}, Lorg/comic/VCPage;->drawPageGap(Landroid/graphics/Canvas;FFFF)V

    .line 165
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->postInvalidate()V

    const/4 v10, 0x0

    :cond_8
    :goto_5
    if-nez v7, :cond_9

    .line 168
    iget v0, v1, Lorg/comic/VCPage;->pageno:I

    iget-object v2, v1, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v2}, Lorg/comic/CDocument;->GetPageCount()I

    move-result v2

    sub-int/2addr v2, v12

    if-ge v0, v2, :cond_9

    .line 169
    iget-object v0, v1, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget v2, v1, Lorg/comic/VCPage;->pageno:I

    add-int/2addr v2, v12

    invoke-virtual {v0, v2}, Lorg/comic/CDocument;->GetPage(I)Lorg/comic/CPage;

    move-result-object v0

    invoke-virtual {v0, v9, v7}, Lorg/comic/CPage;->renderBitmap(IZ)Landroid/graphics/Bitmap;

    :cond_9
    if-nez v7, :cond_a

    .line 170
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-ne v0, v12, :cond_a

    iget v0, v1, Lorg/comic/VCPage;->pageno:I

    iget-object v2, v1, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v2}, Lorg/comic/CDocument;->GetPageCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    if-ge v0, v2, :cond_a

    .line 171
    iget-object v0, v1, Lorg/comic/VCPage;->m_doc:Lorg/comic/CDocument;

    iget v2, v1, Lorg/comic/VCPage;->pageno:I

    add-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v2}, Lorg/comic/CDocument;->GetPage(I)Lorg/comic/CPage;

    move-result-object v0

    invoke-virtual {v0, v9, v7}, Lorg/comic/CPage;->renderBitmap(IZ)Landroid/graphics/Bitmap;

    :cond_a
    return-object v10
.end method
