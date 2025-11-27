.class public Lorg/djvu/VDPage;
.super Ljava/lang/Object;
.source "VDPage.java"

# interfaces
.implements Lorg/djvu/IDLayoutView$IVPage;


# instance fields
.field bookx:I

.field booky:I

.field imgPaint:Landroid/graphics/Paint;

.field public m_doc:Lorg/djvu/DDocument;

.field public m_layout:Lorg/djvu/DLayout;

.field public mh:I

.field public mw:I

.field public pageno:I

.field public ph:I

.field public pw:I

.field public single:Z

.field public vert:Z


# direct methods
.method public constructor <init>(Lorg/djvu/DDocument;Lorg/djvu/DLayout;III)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 65
    iput v0, p0, Lorg/djvu/VDPage;->bookx:I

    iput v0, p0, Lorg/djvu/VDPage;->booky:I

    .line 27
    iput-object p1, p0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    .line 28
    iput-object p2, p0, Lorg/djvu/VDPage;->m_layout:Lorg/djvu/DLayout;

    .line 29
    iput p3, p0, Lorg/djvu/VDPage;->pageno:I

    .line 30
    iget-boolean p1, p2, Lorg/djvu/DLayout;->vert:Z

    iput-boolean p1, p0, Lorg/djvu/VDPage;->vert:Z

    .line 31
    instance-of p1, p2, Lorg/djvu/DLayoutSingle;

    iput-boolean p1, p0, Lorg/djvu/VDPage;->single:Z

    .line 32
    iget-object p1, p0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {p1, p3}, Lorg/djvu/DDocument;->GetPageWidth(I)I

    move-result p1

    iput p1, p0, Lorg/djvu/VDPage;->pw:I

    .line 33
    iget-object p1, p0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {p1, p3}, Lorg/djvu/DDocument;->GetPageHeight(I)I

    move-result p1

    iput p1, p0, Lorg/djvu/VDPage;->ph:I

    .line 34
    iput p4, p0, Lorg/djvu/VDPage;->mw:I

    .line 35
    iput p5, p0, Lorg/djvu/VDPage;->mh:I

    .line 36
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lorg/djvu/VDPage;->imgPaint:Landroid/graphics/Paint;

    const/4 p2, 0x1

    .line 37
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 38
    iget-object p1, p0, Lorg/djvu/VDPage;->imgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 39
    iget-object p1, p0, Lorg/djvu/VDPage;->imgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setDither(Z)V

    return-void
.end method

.method private drawHighlight(Landroid/graphics/Canvas;Lcom/flyersoft/tools/BookDb$NoteInfo;)V
    .locals 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 202
    iget-object v3, v0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    iget v4, v0, Lorg/djvu/VDPage;->pageno:I

    invoke-virtual {v3, v4}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object v3

    .line 203
    invoke-virtual {v3}, Lorg/djvu/DPage;->ObjsStart()V

    .line 204
    iget-wide v4, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    long-to-int v5, v4

    .line 205
    iget v4, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    add-int/2addr v4, v5

    const/4 v6, 0x1

    sub-int/2addr v4, v6

    if-ltz v5, :cond_6

    if-ltz v4, :cond_6

    if-le v5, v4, :cond_0

    goto/16 :goto_2

    .line 207
    :cond_0
    iget-object v7, v3, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v7, v7, Lorg/mydroid/droids/djvu/codec/DjvuPage;->text:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lt v4, v7, :cond_1

    goto/16 :goto_2

    .line 209
    :cond_1
    invoke-virtual {v0}, Lorg/djvu/VDPage;->getScale()F

    move-result v7

    const/4 v8, 0x0

    .line 210
    invoke-virtual {v0, v8}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v9

    iget-object v10, v0, Lorg/djvu/VDPage;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v10}, Lorg/djvu/DLayout;->vGetX()I

    move-result v10

    sub-int/2addr v9, v10

    .line 211
    invoke-virtual {v0, v8}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result v8

    iget-object v10, v0, Lorg/djvu/VDPage;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v10}, Lorg/djvu/DLayout;->vGetY()I

    move-result v10

    sub-int/2addr v8, v10

    .line 213
    invoke-virtual {v0}, Lorg/djvu/VDPage;->getVyOff()F

    move-result v10

    const/4 v11, 0x4

    .line 214
    new-array v12, v11, [F

    .line 215
    new-array v13, v11, [F

    .line 216
    new-array v11, v11, [F

    .line 217
    invoke-virtual {v3, v5, v12}, Lorg/djvu/DPage;->ObjsGetCharRect(I[F)V

    const/4 v14, 0x0

    .line 218
    aget v15, v12, v14

    aput v15, v13, v14

    .line 219
    aget v15, v12, v6

    aput v15, v13, v6

    const/4 v15, 0x2

    .line 220
    aget v16, v12, v15

    aput v16, v13, v15

    const/16 v16, 0x3

    .line 221
    aget v17, v12, v16

    aput v17, v13, v16

    add-int/2addr v5, v6

    const/16 v17, 0x1

    :goto_0
    if-gt v5, v4, :cond_5

    .line 225
    invoke-virtual {v3, v5, v12}, Lorg/djvu/DPage;->ObjsGetCharRect(I[F)V

    .line 226
    aget v18, v12, v16

    aget v19, v12, v17

    sub-float v20, v18, v19

    const/high16 v21, 0x40000000    # 2.0f

    div-float v20, v20, v21

    .line 227
    aget v21, v13, v17

    cmpl-float v19, v21, v19

    if-nez v19, :cond_4

    aget v19, v13, v16

    cmpl-float v18, v19, v18

    if-nez v18, :cond_4

    aget v18, v13, v15

    add-float v19, v18, v20

    aget v22, v12, v14

    cmpl-float v19, v19, v22

    if-lez v19, :cond_4

    aget v19, v13, v14

    sub-float v20, v19, v20

    aget v23, v12, v15

    cmpg-float v20, v20, v23

    if-gez v20, :cond_4

    cmpl-float v19, v19, v22

    if-lez v19, :cond_2

    .line 229
    aput v22, v13, v14

    :cond_2
    cmpg-float v18, v18, v23

    if-gez v18, :cond_3

    .line 230
    aput v23, v13, v15

    :cond_3
    move-object/from16 v21, v3

    move/from16 v20, v4

    move/from16 v23, v5

    const/16 v18, 0x0

    const/16 v19, 0x2

    goto :goto_1

    .line 232
    :cond_4
    aget v18, v13, v14

    mul-float v18, v18, v7

    aput v18, v11, v14

    mul-float v21, v21, v7

    .line 233
    aput v21, v11, v17

    .line 234
    aget v18, v13, v15

    mul-float v18, v18, v7

    aput v18, v11, v15

    .line 235
    aget v18, v13, v16

    mul-float v18, v18, v7

    aput v18, v11, v16

    const/16 v18, 0x0

    .line 236
    new-instance v14, Landroid/graphics/RectF;

    const/16 v19, 0x2

    int-to-float v15, v9

    aget v20, v11, v18

    move-object/from16 v21, v3

    add-float v3, v15, v20

    move/from16 v20, v4

    int-to-float v4, v8

    aget v22, v11, v17

    add-float v22, v4, v22

    move/from16 v23, v4

    add-float v4, v22, v10

    aget v22, v11, v19

    add-float v15, v15, v22

    aget v22, v11, v16

    add-float v22, v23, v22

    add-float v22, v22, v10

    move/from16 v23, v5

    .line 237
    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v5, v5

    invoke-direct {v14, v3, v4, v15, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 238
    invoke-direct {v0, v1, v14, v2, v6}, Lorg/djvu/VDPage;->drawHighlightFinal(Landroid/graphics/Canvas;Landroid/graphics/RectF;Lcom/flyersoft/tools/BookDb$NoteInfo;Z)V

    .line 240
    aget v3, v12, v18

    aput v3, v13, v18

    .line 241
    aget v3, v12, v17

    aput v3, v13, v17

    .line 242
    aget v3, v12, v19

    aput v3, v13, v19

    .line 243
    aget v3, v12, v16

    aput v3, v13, v16

    const/4 v6, 0x0

    :goto_1
    add-int/lit8 v5, v23, 0x1

    move/from16 v4, v20

    move-object/from16 v3, v21

    const/4 v14, 0x0

    const/4 v15, 0x2

    goto/16 :goto_0

    :cond_5
    const/16 v18, 0x0

    const/16 v19, 0x2

    .line 247
    aget v3, v13, v18

    mul-float v3, v3, v7

    aput v3, v11, v18

    .line 248
    aget v3, v13, v17

    mul-float v3, v3, v7

    aput v3, v11, v17

    .line 249
    aget v3, v13, v19

    mul-float v3, v3, v7

    aput v3, v11, v19

    .line 250
    aget v3, v13, v16

    mul-float v3, v3, v7

    aput v3, v11, v16

    .line 251
    new-instance v3, Landroid/graphics/RectF;

    int-to-float v4, v9

    aget v5, v11, v18

    add-float/2addr v5, v4

    int-to-float v7, v8

    aget v8, v11, v17

    add-float/2addr v8, v7

    add-float/2addr v8, v10

    aget v9, v11, v19

    add-float/2addr v4, v9

    aget v9, v11, v16

    add-float/2addr v7, v9

    add-float/2addr v7, v10

    .line 252
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    int-to-float v7, v7

    invoke-direct {v3, v5, v8, v4, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 253
    invoke-direct {v0, v1, v3, v2, v6}, Lorg/djvu/VDPage;->drawHighlightFinal(Landroid/graphics/Canvas;Landroid/graphics/RectF;Lcom/flyersoft/tools/BookDb$NoteInfo;Z)V

    :cond_6
    :goto_2
    return-void
.end method

.method private drawHighlightFinal(Landroid/graphics/Canvas;Landroid/graphics/RectF;Lcom/flyersoft/tools/BookDb$NoteInfo;Z)V
    .locals 20

    move-object/from16 v0, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    .line 257
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 258
    iget v1, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    .line 260
    iget-boolean v2, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    const/high16 v9, 0x40a00000    # 5.0f

    const/4 v10, 0x1

    const/high16 v11, 0x42c80000    # 100.0f

    const/high16 v12, 0x40400000    # 3.0f

    const/high16 v13, 0x40000000    # 2.0f

    const/high16 v14, 0x3f800000    # 1.0f

    if-nez v2, :cond_2

    iget-boolean v2, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-nez v2, :cond_2

    iget-boolean v2, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_9

    .line 280
    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    const/16 v3, 0x96

    if-le v2, v3, :cond_1

    .line 282
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    invoke-static {v3, v2, v4, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    .line 283
    :cond_1
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 284
    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 285
    new-instance v1, Landroid/graphics/RectF;

    iget v2, v7, Landroid/graphics/RectF;->left:F

    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    iget v3, v7, Landroid/graphics/RectF;->top:F

    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iget v4, v7, Landroid/graphics/RectF;->right:F

    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v4, v6

    iget v6, v7, Landroid/graphics/RectF;->bottom:F

    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v15

    int-to-float v15, v15

    add-float/2addr v6, v15

    invoke-direct {v1, v2, v3, v4, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 286
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v2, v12

    invoke-virtual {v0, v1, v2, v11, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto/16 :goto_1

    .line 261
    :cond_2
    :goto_0
    sget v2, Lcom/flyersoft/tools/A;->fontSize:F

    const/high16 v3, 0x41100000    # 9.0f

    div-float/2addr v2, v3

    invoke-static {}, Lcom/flyersoft/tools/A;->getDensity()F

    move-result v3

    mul-float v2, v2, v3

    .line 262
    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    int-to-float v3, v3

    cmpg-float v3, v2, v3

    if-gez v3, :cond_3

    .line 263
    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    int-to-float v2, v2

    .line 264
    :cond_3
    invoke-virtual {v5, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 265
    iget-boolean v2, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    const v3, -0xaaaaab

    if-eqz v2, :cond_5

    if-nez v1, :cond_4

    const v1, -0xaaaaab

    .line 266
    :cond_4
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 267
    iget v1, v7, Landroid/graphics/RectF;->bottom:F

    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v1

    .line 268
    iget v1, v7, Landroid/graphics/RectF;->left:F

    iget v3, v7, Landroid/graphics/RectF;->right:F

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v0, p1

    goto :goto_1

    .line 269
    :cond_5
    iget-boolean v0, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-eqz v0, :cond_7

    if-nez v1, :cond_6

    const v1, -0xaaaaab

    .line 270
    :cond_6
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 271
    iget v0, v7, Landroid/graphics/RectF;->top:F

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v1, v13

    add-float v2, v0, v1

    .line 272
    iget v1, v7, Landroid/graphics/RectF;->left:F

    iget v3, v7, Landroid/graphics/RectF;->right:F

    move v4, v2

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    :cond_7
    if-nez v1, :cond_8

    const v1, -0xff0100

    .line 274
    :cond_8
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 275
    sget v0, Lcom/flyersoft/tools/A;->fontSize:F

    div-float/2addr v0, v9

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    .line 276
    iget v1, v7, Landroid/graphics/RectF;->bottom:F

    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v1

    .line 277
    iget v1, v7, Landroid/graphics/RectF;->left:F

    iget v3, v7, Landroid/graphics/RectF;->right:F

    int-to-float v6, v0

    move v4, v2

    move-object/from16 v0, p1

    invoke-static/range {v0 .. v6}, Lcom/flyersoft/tools/A;->drawSquiggly(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;F)V

    :cond_9
    :goto_1
    if-eqz p4, :cond_a

    .line 289
    iget-object v1, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_a

    .line 290
    invoke-static {}, Lcom/flyersoft/staticlayout/MRTextView;->getNoteBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 291
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v2

    const/16 v3, 0xa0

    .line 292
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 293
    new-instance v4, Landroid/graphics/Rect;

    .line 294
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    const/high16 v16, 0x40a00000    # 5.0f

    const/4 v9, 0x0

    invoke-direct {v4, v9, v9, v6, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v6, Landroid/graphics/RectF;

    iget v9, v7, Landroid/graphics/RectF;->left:F

    .line 295
    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v15

    int-to-float v15, v15

    sub-float/2addr v9, v15

    iget v15, v7, Landroid/graphics/RectF;->top:F

    const/high16 v17, 0x42c80000    # 100.0f

    invoke-static {v12}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    int-to-float v11, v11

    sub-float/2addr v15, v11

    iget v11, v7, Landroid/graphics/RectF;->left:F

    const/high16 v18, 0x40400000    # 3.0f

    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v12

    int-to-float v12, v12

    add-float/2addr v11, v12

    const/high16 v12, 0x42d20000    # 105.0f

    mul-float v12, v12, v2

    div-float v12, v12, v17

    add-float/2addr v11, v12

    const/high16 v19, 0x40000000    # 2.0f

    iget v13, v7, Landroid/graphics/RectF;->top:F

    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v14

    int-to-float v14, v14

    add-float/2addr v13, v14

    mul-float v2, v2, v17

    div-float v2, v2, v17

    add-float/2addr v13, v2

    invoke-direct {v6, v9, v15, v11, v13}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 293
    invoke-virtual {v0, v1, v4, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 297
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 298
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->preNoteInfo:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-ne v8, v2, :cond_a

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hBarVisible()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 299
    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 300
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 301
    invoke-static/range {v19 .. v19}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v1

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 302
    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 303
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    div-float v12, v12, v19

    .line 304
    invoke-static/range {v19 .. v19}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v12, v1

    .line 305
    iget v1, v7, Landroid/graphics/RectF;->left:F

    invoke-static/range {v18 .. v18}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    add-float/2addr v1, v12

    iget v2, v7, Landroid/graphics/RectF;->top:F

    invoke-static/range {v18 .. v18}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    add-float/2addr v2, v12

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v12, v3

    invoke-virtual {v0, v1, v2, v12, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_a
    return-void
.end method

.method private drawHighlights(Landroid/graphics/Canvas;)V
    .locals 4

    .line 194
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 195
    iget v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 196
    iget v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v3, p0, Lorg/djvu/VDPage;->pageno:I

    if-ne v2, v3, :cond_0

    .line 197
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 198
    invoke-direct {p0, p1, v1}, Lorg/djvu/VDPage;->drawHighlight(Landroid/graphics/Canvas;Lcom/flyersoft/tools/BookDb$NoteInfo;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private drawPageGap(Landroid/graphics/Canvas;FFFF)V
    .locals 7

    .line 148
    sget v0, Lcom/flyersoft/tools/A;->djvu_page_gap:I

    if-nez v0, :cond_0

    return-void

    .line 150
    :cond_0
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 151
    iget-object v0, p0, Lorg/djvu/VDPage;->m_layout:Lorg/djvu/DLayout;

    iget v0, v0, Lorg/djvu/DLayout;->m_back_color:I

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 153
    sget v0, Lcom/flyersoft/tools/A;->djvu_page_gap:I

    int-to-float v0, v0

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 154
    iget-boolean v0, p0, Lorg/djvu/VDPage;->vert:Z

    if-eqz v0, :cond_1

    move v5, p3

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 155
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move p1, v3

    move v5, p5

    move v3, p5

    .line 156
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v5, v3

    move p2, v4

    move v4, v2

    move v3, p1

    .line 158
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v4, p2

    move v2, p2

    .line 159
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    :cond_1
    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move p1, p5

    .line 160
    iget-boolean p2, p0, Lorg/djvu/VDPage;->single:Z

    if-eqz p2, :cond_2

    move v5, v3

    .line 161
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move p2, v3

    move v5, p1

    move v3, p1

    .line 162
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v5, v3

    move p1, v4

    move v4, v2

    move v3, p2

    .line 164
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v4, p1

    move v2, p1

    .line 165
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    :cond_2
    move v5, v3

    .line 167
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move p2, v3

    move v5, p1

    move v3, p1

    .line 168
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v5, v3

    move p1, v4

    move v4, v2

    move v3, p2

    .line 170
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v4, p1

    move v2, p1

    .line 171
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method public final GetDjvuX(F)F
    .locals 1

    .line 73
    invoke-virtual {p0}, Lorg/djvu/VDPage;->getScale()F

    move-result v0

    div-float/2addr p1, v0

    invoke-virtual {p0}, Lorg/djvu/VDPage;->GetX()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    return p1
.end method

.method public final GetDjvuY(F)F
    .locals 1

    .line 77
    invoke-virtual {p0}, Lorg/djvu/VDPage;->getScale()F

    move-result v0

    div-float/2addr p1, v0

    invoke-virtual {p0}, Lorg/djvu/VDPage;->GetY()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    return p1
.end method

.method public final GetHeight()I
    .locals 1

    .line 93
    iget v0, p0, Lorg/djvu/VDPage;->ph:I

    return v0
.end method

.method public final GetPageNo()I
    .locals 1

    .line 97
    iget v0, p0, Lorg/djvu/VDPage;->pageno:I

    return v0
.end method

.method public final GetVX(F)I
    .locals 1

    .line 47
    invoke-virtual {p0}, Lorg/djvu/VDPage;->GetX()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p1

    invoke-virtual {p0}, Lorg/djvu/VDPage;->getScale()F

    move-result p1

    mul-float v0, v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method public final GetVY(F)I
    .locals 1

    .line 51
    invoke-virtual {p0}, Lorg/djvu/VDPage;->GetY()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p1

    invoke-virtual {p0}, Lorg/djvu/VDPage;->getScale()F

    move-result p1

    mul-float v0, v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method public final GetWidth()I
    .locals 1

    .line 89
    iget v0, p0, Lorg/djvu/VDPage;->pw:I

    return v0
.end method

.method public final GetX()I
    .locals 2

    .line 55
    iget v0, p0, Lorg/djvu/VDPage;->bookx:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 56
    iget-boolean v0, p0, Lorg/djvu/VDPage;->vert:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 57
    iput v0, p0, Lorg/djvu/VDPage;->bookx:I

    goto :goto_1

    .line 59
    :cond_0
    sget-boolean v0, Lcom/radaee/pdf/Global;->djvuRtol:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    iget v1, p0, Lorg/djvu/VDPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/djvu/DDocument;->getPageXRtl(I)I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    iget v1, p0, Lorg/djvu/VDPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/djvu/DDocument;->getPageX(I)I

    move-result v0

    :goto_0
    iput v0, p0, Lorg/djvu/VDPage;->bookx:I

    .line 62
    :cond_2
    :goto_1
    iget v0, p0, Lorg/djvu/VDPage;->bookx:I

    return v0
.end method

.method public final GetY()I
    .locals 2

    .line 67
    iget v0, p0, Lorg/djvu/VDPage;->booky:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 68
    iget-boolean v0, p0, Lorg/djvu/VDPage;->vert:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    iget v1, p0, Lorg/djvu/VDPage;->pageno:I

    invoke-virtual {v0, v1}, Lorg/djvu/DDocument;->getPageY(I)I

    move-result v0

    :goto_0
    iput v0, p0, Lorg/djvu/VDPage;->booky:I

    .line 69
    :cond_1
    iget v0, p0, Lorg/djvu/VDPage;->booky:I

    return v0
.end method

.method public LocHorz(I)I
    .locals 2

    int-to-float p1, p1

    .line 185
    invoke-virtual {p0, p1}, Lorg/djvu/VDPage;->toDjvuxy(F)F

    move-result p1

    .line 186
    invoke-virtual {p0}, Lorg/djvu/VDPage;->GetX()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 188
    :cond_0
    invoke-virtual {p0}, Lorg/djvu/VDPage;->GetX()I

    move-result v0

    iget v1, p0, Lorg/djvu/VDPage;->pw:I

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

    .line 176
    invoke-virtual {p0, p1}, Lorg/djvu/VDPage;->toDjvuxy(F)F

    move-result p1

    .line 177
    invoke-virtual {p0}, Lorg/djvu/VDPage;->GetY()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 179
    :cond_0
    invoke-virtual {p0}, Lorg/djvu/VDPage;->GetY()I

    move-result v0

    iget v1, p0, Lorg/djvu/VDPage;->ph:I

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

    .line 43
    iget-object v0, p0, Lorg/djvu/VDPage;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetScale()F

    move-result v0

    return v0
.end method

.method public getVyOff()F
    .locals 4

    .line 142
    iget-boolean v0, p0, Lorg/djvu/VDPage;->single:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 143
    :cond_0
    iget v0, p0, Lorg/djvu/VDPage;->ph:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lorg/djvu/VDPage;->getScale()F

    move-result v2

    mul-float v0, v0, v2

    .line 144
    iget v2, p0, Lorg/djvu/VDPage;->mh:I

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

.method public final toDjvuxy(F)F
    .locals 1

    .line 81
    invoke-virtual {p0}, Lorg/djvu/VDPage;->getScale()F

    move-result v0

    div-float/2addr p1, v0

    return p1
.end method

.method public final toVxy(F)F
    .locals 1

    .line 85
    invoke-virtual {p0}, Lorg/djvu/VDPage;->getScale()F

    move-result v0

    mul-float p1, p1, v0

    return p1
.end method

.method public vDraw(Landroid/view/View;Landroid/graphics/Canvas;ZIIII)Landroid/graphics/Bitmap;
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v6, p3

    move/from16 v2, p4

    int-to-float v2, v2

    .line 103
    invoke-virtual {v0, v2}, Lorg/djvu/VDPage;->toDjvuxy(F)F

    move-result v2

    move/from16 v3, p5

    int-to-float v3, v3

    .line 104
    invoke-virtual {v0, v3}, Lorg/djvu/VDPage;->toDjvuxy(F)F

    move-result v3

    .line 105
    invoke-virtual {v0}, Lorg/djvu/VDPage;->GetX()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v2

    invoke-virtual {v0}, Lorg/djvu/VDPage;->getScale()F

    move-result v2

    mul-float v2, v2, v4

    .line 106
    invoke-virtual {v0}, Lorg/djvu/VDPage;->GetY()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v3

    invoke-virtual {v0}, Lorg/djvu/VDPage;->getScale()F

    move-result v3

    mul-float v4, v4, v3

    invoke-virtual {v0}, Lorg/djvu/VDPage;->getVyOff()F

    move-result v3

    add-float/2addr v3, v4

    .line 107
    iget v4, v0, Lorg/djvu/VDPage;->pw:I

    int-to-float v4, v4

    invoke-virtual {v0}, Lorg/djvu/VDPage;->getScale()F

    move-result v5

    mul-float v4, v4, v5

    add-float/2addr v4, v2

    .line 108
    iget v5, v0, Lorg/djvu/VDPage;->ph:I

    int-to-float v5, v5

    invoke-virtual {v0}, Lorg/djvu/VDPage;->getScale()F

    move-result v7

    mul-float v5, v5, v7

    add-float/2addr v5, v3

    .line 109
    new-instance v7, Landroid/graphics/Rect;

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v10

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v11

    invoke-direct {v7, v8, v9, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 111
    iget-object v8, v0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    iget v9, v0, Lorg/djvu/VDPage;->pageno:I

    invoke-virtual {v8, v9}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object v8

    sub-float v9, v4, v2

    .line 112
    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 113
    iget-object v10, v8, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    const/4 v11, 0x1

    invoke-virtual {v10, v9, v6, v11}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmap(IZZ)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 116
    invoke-static {v10}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 118
    new-instance v12, Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v14

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    const/4 v13, 0x0

    invoke-direct {v12, v13, v13, v14, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 119
    sget-boolean v13, Lcom/flyersoft/tools/A;->djvu_smooth:Z

    if-eqz v13, :cond_0

    iget-object v13, v0, Lorg/djvu/VDPage;->imgPaint:Landroid/graphics/Paint;

    goto :goto_0

    :cond_0
    const/4 v13, 0x0

    .line 118
    :goto_0
    invoke-virtual {v1, v10, v12, v7, v13}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 120
    iget-object v7, v8, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-boolean v7, v7, Lorg/mydroid/droids/djvu/codec/DjvuPage;->inGettingBitmap:Z

    if-eqz v7, :cond_3

    .line 121
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->postInvalidate()V

    goto :goto_2

    .line 123
    :cond_1
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    .line 124
    sget-boolean v10, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz v10, :cond_2

    const/high16 v10, -0x1000000

    goto :goto_1

    :cond_2
    const/4 v10, -0x1

    :goto_1
    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    invoke-virtual {v1, v7, v8}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 126
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->postInvalidate()V

    const/4 v10, 0x0

    .line 129
    :cond_3
    :goto_2
    invoke-direct/range {v0 .. v5}, Lorg/djvu/VDPage;->drawPageGap(Landroid/graphics/Canvas;FFFF)V

    .line 130
    invoke-direct {v0, v1}, Lorg/djvu/VDPage;->drawHighlights(Landroid/graphics/Canvas;)V

    if-nez v6, :cond_5

    .line 132
    sget-boolean v1, Lorg/djvu/DDocument;->outOfMemory:Z

    if-nez v1, :cond_5

    .line 133
    iget v1, v0, Lorg/djvu/VDPage;->pageno:I

    iget-object v2, v0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v2}, Lorg/djvu/DDocument;->GetPageCount()I

    move-result v2

    sub-int/2addr v2, v11

    if-ge v1, v2, :cond_4

    .line 134
    iget-object v1, v0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    iget v2, v0, Lorg/djvu/VDPage;->pageno:I

    add-int/2addr v2, v11

    invoke-virtual {v1, v2}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object v1

    iget-object v1, v1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    invoke-virtual {v1, v9, v6, v11}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmap(IZZ)Landroid/graphics/Bitmap;

    .line 135
    :cond_4
    sget-boolean v1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-nez v1, :cond_5

    sget v1, Lcom/radaee/pdf/Global;->def_view:I

    if-ne v1, v11, :cond_5

    iget v1, v0, Lorg/djvu/VDPage;->pageno:I

    iget-object v2, v0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v2}, Lorg/djvu/DDocument;->GetPageCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    if-ge v1, v2, :cond_5

    .line 136
    iget-object v1, v0, Lorg/djvu/VDPage;->m_doc:Lorg/djvu/DDocument;

    iget v2, v0, Lorg/djvu/VDPage;->pageno:I

    add-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object v1

    iget-object v1, v1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    invoke-virtual {v1, v9, v6, v11}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmap(IZZ)Landroid/graphics/Bitmap;

    :cond_5
    return-object v10
.end method
