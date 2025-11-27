.class public Lcom/radaee/view/VFinder;
.super Ljava/lang/Object;
.source "VFinder.java"


# instance fields
.field private is_cancel:Z

.field private is_notified:Z

.field private is_waitting:Z

.field private mSkipBlank:Z

.field private m_case:Z

.field private m_dir:I

.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_finder:Lcom/radaee/pdf/Page$Finder;

.field private m_page:Lcom/radaee/pdf/Page;

.field private m_page_find_cnt:I

.field private m_page_find_index:I

.field private m_page_no:I

.field private m_paint:Landroid/graphics/Paint;

.field private m_paint_gray:Landroid/graphics/Paint;

.field private m_str:Ljava/lang/String;

.field private m_whole:Z


# direct methods
.method protected constructor <init>()V
    .locals 3

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    const/4 v1, 0x0

    .line 17
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->m_case:Z

    .line 18
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->m_whole:Z

    .line 19
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->mSkipBlank:Z

    const/4 v2, -0x1

    .line 20
    iput v2, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    .line 21
    iput v2, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    .line 22
    iput v1, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    .line 23
    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 24
    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_doc:Lcom/radaee/pdf/Document;

    .line 26
    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 28
    iput v1, p0, Lcom/radaee/view/VFinder;->m_dir:I

    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    .line 30
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->is_notified:Z

    .line 31
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->is_waitting:Z

    .line 32
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_paint:Landroid/graphics/Paint;

    .line 33
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_paint_gray:Landroid/graphics/Paint;

    .line 39
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_paint:Landroid/graphics/Paint;

    const v1, -0x66000100

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 45
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_paint_gray:Landroid/graphics/Paint;

    const v1, 0x30404040

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_paint_gray:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method private doesArabicSpecialCharsExist(Ljava/lang/String;)Z
    .locals 1

    .line 418
    const-string v0, "\ufef7"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\ufef8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\ufefc"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\ufefb"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\ufef9"

    .line 419
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\ufefa"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\ufef5"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\ufef6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u064e"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u0650"

    .line 420
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u064f"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u064b"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u064d"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u064c"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u0652"

    .line 421
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u0651"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private declared-synchronized eve_notify()V
    .locals 1

    monitor-enter p0

    .line 72
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/VFinder;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 75
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private declared-synchronized eve_reset()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 50
    :try_start_0
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_notified:Z

    .line 51
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_waitting:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private declared-synchronized eve_wait()V
    .locals 2

    monitor-enter p0

    .line 57
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/VFinder;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 58
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 61
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_waitting:Z

    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 63
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->is_waitting:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 69
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method private find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/GLPage;ILandroid/graphics/Paint;II)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    .line 333
    iget-object v2, v0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    move/from16 v3, p3

    invoke-virtual {v2, v3}, Lcom/radaee/pdf/Page$Finder;->GetFirstChar(I)I

    move-result v2

    .line 334
    iget-object v3, v0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v2

    const/4 v4, 0x4

    .line 335
    new-array v5, v4, [F

    .line 336
    new-array v6, v4, [F

    .line 337
    new-array v4, v4, [F

    .line 338
    iget-object v7, v0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v7, v2, v5}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v7, 0x0

    .line 339
    aget v8, v5, v7

    aput v8, v6, v7

    const/4 v8, 0x1

    .line 340
    aget v9, v5, v8

    aput v9, v6, v8

    const/4 v9, 0x2

    .line 341
    aget v10, v5, v9

    aput v10, v6, v9

    const/4 v10, 0x3

    .line 342
    aget v11, v5, v10

    aput v11, v6, v10

    add-int/2addr v2, v8

    :goto_0
    if-ge v2, v3, :cond_3

    .line 346
    iget-object v11, v0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v11, v2, v5}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 347
    aget v11, v5, v10

    aget v12, v5, v8

    sub-float v13, v11, v12

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    .line 348
    aget v14, v6, v8

    cmpl-float v12, v14, v12

    if-nez v12, :cond_1

    aget v12, v6, v10

    cmpl-float v11, v12, v11

    if-nez v11, :cond_1

    aget v11, v6, v9

    add-float v12, v11, v13

    aget v14, v5, v7

    cmpl-float v12, v12, v14

    if-lez v12, :cond_1

    aget v12, v6, v7

    sub-float v13, v12, v13

    aget v15, v5, v9

    cmpg-float v13, v13, v15

    if-gez v13, :cond_1

    cmpl-float v12, v12, v14

    if-lez v12, :cond_0

    .line 351
    aput v14, v6, v7

    :cond_0
    cmpg-float v11, v11, v15

    if-gez v11, :cond_2

    .line 352
    aput v15, v6, v9

    goto :goto_1

    .line 356
    :cond_1
    aget v11, v6, v7

    invoke-virtual {v1, v11}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v11

    sub-int v11, v11, p5

    int-to-float v11, v11

    aput v11, v4, v7

    .line 357
    aget v11, v6, v10

    invoke-virtual {v1, v11}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v11

    sub-int v11, v11, p6

    int-to-float v11, v11

    aput v11, v4, v8

    .line 358
    aget v11, v6, v9

    invoke-virtual {v1, v11}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v11

    sub-int v11, v11, p5

    int-to-float v11, v11

    aput v11, v4, v9

    .line 359
    aget v11, v6, v8

    invoke-virtual {v1, v11}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v11

    sub-int v11, v11, p6

    int-to-float v11, v11

    aput v11, v4, v10

    .line 360
    aget v13, v4, v7

    aget v14, v4, v8

    aget v15, v4, v9

    move-object/from16 v12, p1

    move-object/from16 v17, p4

    move/from16 v16, v11

    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 361
    aget v11, v5, v7

    aput v11, v6, v7

    .line 362
    aget v11, v5, v8

    aput v11, v6, v8

    .line 363
    aget v11, v5, v9

    aput v11, v6, v9

    .line 364
    aget v11, v5, v10

    aput v11, v6, v10

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 368
    :cond_3
    aget v2, v6, v7

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v2

    sub-int v2, v2, p5

    int-to-float v2, v2

    aput v2, v4, v7

    .line 369
    aget v2, v6, v10

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v2

    sub-int v2, v2, p6

    int-to-float v2, v2

    aput v2, v4, v8

    .line 370
    aget v2, v6, v9

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v2

    sub-int v2, v2, p5

    int-to-float v2, v2

    aput v2, v4, v9

    .line 371
    aget v2, v6, v8

    invoke-virtual {v1, v2}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v1

    sub-int v1, v1, p6

    int-to-float v1, v1

    aput v1, v4, v10

    .line 372
    aget v17, v4, v7

    aget v18, v4, v8

    aget v19, v4, v9

    move-object/from16 v16, p1

    move-object/from16 v21, p4

    move/from16 v20, v1

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/VPage;ILandroid/graphics/Paint;II)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    .line 269
    iget-object v3, v0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    invoke-virtual {v3, v2}, Lcom/radaee/pdf/Page$Finder;->GetFirstChar(I)I

    move-result v3

    .line 270
    iget-object v4, v0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    invoke-virtual {v4, v2}, Lcom/radaee/pdf/Page$Finder;->GetEndChar(I)I

    move-result v2

    .line 271
    iget-object v4, v0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v4, v3, v2}, Lcom/radaee/pdf/Page;->ObjsGetString(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/radaee/view/VFinder;->doesArabicSpecialCharsExist(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    add-int/lit8 v2, v2, -0x1

    :cond_0
    const/4 v4, 0x4

    .line 273
    new-array v5, v4, [F

    .line 274
    new-array v6, v4, [F

    .line 275
    new-array v4, v4, [F

    .line 276
    iget-object v7, v0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v7, v3, v5}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v7, 0x0

    .line 277
    aget v8, v5, v7

    aput v8, v6, v7

    const/4 v8, 0x1

    .line 278
    aget v9, v5, v8

    aput v9, v6, v8

    const/4 v9, 0x2

    .line 279
    aget v10, v5, v9

    aput v10, v6, v9

    const/4 v10, 0x3

    .line 280
    aget v11, v5, v10

    aput v11, v6, v10

    add-int/2addr v3, v8

    :goto_0
    if-ge v3, v2, :cond_4

    .line 284
    iget-object v11, v0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v11, v3, v5}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 285
    aget v11, v5, v10

    aget v12, v5, v8

    sub-float v13, v11, v12

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    .line 286
    aget v14, v6, v8

    cmpl-float v12, v14, v12

    if-nez v12, :cond_2

    aget v12, v6, v10

    cmpl-float v11, v12, v11

    if-nez v11, :cond_2

    aget v11, v6, v9

    add-float v12, v11, v13

    aget v14, v5, v7

    cmpl-float v12, v12, v14

    if-lez v12, :cond_2

    aget v12, v6, v7

    sub-float v13, v12, v13

    aget v15, v5, v9

    cmpg-float v13, v13, v15

    if-gez v13, :cond_2

    cmpl-float v12, v12, v14

    if-lez v12, :cond_1

    .line 289
    aput v14, v6, v7

    :cond_1
    cmpg-float v11, v11, v15

    if-gez v11, :cond_3

    .line 290
    aput v15, v6, v9

    goto :goto_1

    .line 294
    :cond_2
    aget v11, v6, v7

    invoke-virtual {v1, v11}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result v11

    sub-int v11, v11, p5

    int-to-float v11, v11

    aput v11, v4, v7

    .line 295
    aget v11, v6, v10

    invoke-virtual {v1, v11}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result v11

    sub-int v11, v11, p6

    int-to-float v11, v11

    aput v11, v4, v8

    .line 296
    aget v11, v6, v9

    invoke-virtual {v1, v11}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result v11

    sub-int v11, v11, p5

    int-to-float v11, v11

    aput v11, v4, v9

    .line 297
    aget v11, v6, v8

    invoke-virtual {v1, v11}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result v11

    sub-int v11, v11, p6

    int-to-float v11, v11

    aput v11, v4, v10

    .line 298
    aget v13, v4, v7

    aget v14, v4, v8

    aget v15, v4, v9

    move-object/from16 v12, p1

    move-object/from16 v17, p4

    move/from16 v16, v11

    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 299
    aget v11, v5, v7

    aput v11, v6, v7

    .line 300
    aget v11, v5, v8

    aput v11, v6, v8

    .line 301
    aget v11, v5, v9

    aput v11, v6, v9

    .line 302
    aget v11, v5, v10

    aput v11, v6, v10

    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 306
    :cond_4
    aget v2, v6, v7

    invoke-virtual {v1, v2}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result v2

    sub-int v2, v2, p5

    int-to-float v2, v2

    aput v2, v4, v7

    .line 307
    aget v2, v6, v10

    invoke-virtual {v1, v2}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result v2

    sub-int v2, v2, p6

    int-to-float v2, v2

    aput v2, v4, v8

    .line 308
    aget v2, v6, v9

    invoke-virtual {v1, v2}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result v2

    sub-int v2, v2, p5

    int-to-float v2, v2

    aput v2, v4, v9

    .line 309
    aget v2, v6, v8

    invoke-virtual {v1, v2}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result v1

    sub-int v1, v1, p6

    int-to-float v1, v1

    aput v1, v4, v10

    .line 310
    aget v17, v4, v7

    aget v18, v4, v8

    aget v19, v4, v9

    move-object/from16 v16, p1

    move-object/from16 v21, p4

    move/from16 v20, v1

    invoke-virtual/range {v16 .. v21}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method protected find()I
    .locals 9

    .line 156
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 157
    iget v1, p0, Lcom/radaee/view/VFinder;->m_dir:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-gez v1, :cond_b

    .line 159
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v1, :cond_1

    iget v5, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-gez v5, :cond_7

    :cond_1
    iget v5, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    if-ltz v5, :cond_7

    iget-boolean v6, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-nez v6, :cond_7

    if-nez v1, :cond_5

    if-lt v5, v0, :cond_2

    add-int/lit8 v1, v0, -0x1

    .line 163
    iput v1, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    .line 164
    :cond_2
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_doc:Lcom/radaee/pdf/Document;

    iget v5, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    invoke-virtual {v1, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 165
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 166
    iget-boolean v1, p0, Lcom/radaee/view/VFinder;->mSkipBlank:Z

    if-eqz v1, :cond_3

    .line 167
    iget-object v5, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    iget-object v6, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    iget-boolean v7, p0, Lcom/radaee/view/VFinder;->m_case:Z

    iget-boolean v8, p0, Lcom/radaee/view/VFinder;->m_whole:Z

    invoke-virtual {v5, v6, v7, v8, v1}, Lcom/radaee/pdf/Page;->FindOpen(Ljava/lang/String;ZZZ)Lcom/radaee/pdf/Page$Finder;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    goto :goto_1

    .line 169
    :cond_3
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    iget-object v5, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/radaee/view/VFinder;->m_case:Z

    iget-boolean v7, p0, Lcom/radaee/view/VFinder;->m_whole:Z

    invoke-virtual {v1, v5, v6, v7}, Lcom/radaee/pdf/Page;->FindOpen(Ljava/lang/String;ZZ)Lcom/radaee/pdf/Page$Finder;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 170
    :goto_1
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-nez v1, :cond_4

    iput v3, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    goto :goto_2

    .line 171
    :cond_4
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->GetCount()I

    move-result v1

    iput v1, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    .line 172
    :goto_2
    iget v1, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    .line 174
    :cond_5
    iget v1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-gez v1, :cond_0

    .line 176
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v1, :cond_6

    .line 178
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 179
    iput-object v4, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 181
    :cond_6
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 182
    iput-object v4, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 183
    iput v3, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    .line 184
    iget v1, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    goto :goto_0

    .line 187
    :cond_7
    iget-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-nez v0, :cond_8

    iget v0, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    if-gez v0, :cond_15

    .line 189
    :cond_8
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v0, :cond_9

    .line 191
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 192
    iput-object v4, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 194
    :cond_9
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_a

    .line 196
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 197
    iput-object v4, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    :cond_a
    :goto_3
    const/4 v2, 0x0

    goto/16 :goto_7

    .line 206
    :cond_b
    :goto_4
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v1, :cond_c

    iget v5, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    iget v6, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    if-lt v5, v6, :cond_12

    :cond_c
    iget v5, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    if-ge v5, v0, :cond_12

    iget-boolean v6, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-nez v6, :cond_12

    if-nez v1, :cond_10

    if-gez v5, :cond_d

    .line 210
    iput v3, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    .line 211
    :cond_d
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_doc:Lcom/radaee/pdf/Document;

    iget v5, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    invoke-virtual {v1, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 212
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 213
    iget-boolean v1, p0, Lcom/radaee/view/VFinder;->mSkipBlank:Z

    if-eqz v1, :cond_e

    .line 214
    iget-object v5, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    iget-object v6, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    iget-boolean v7, p0, Lcom/radaee/view/VFinder;->m_case:Z

    iget-boolean v8, p0, Lcom/radaee/view/VFinder;->m_whole:Z

    invoke-virtual {v5, v6, v7, v8, v1}, Lcom/radaee/pdf/Page;->FindOpen(Ljava/lang/String;ZZZ)Lcom/radaee/pdf/Page$Finder;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    goto :goto_5

    .line 216
    :cond_e
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    iget-object v5, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/radaee/view/VFinder;->m_case:Z

    iget-boolean v7, p0, Lcom/radaee/view/VFinder;->m_whole:Z

    invoke-virtual {v1, v5, v6, v7}, Lcom/radaee/pdf/Page;->FindOpen(Ljava/lang/String;ZZ)Lcom/radaee/pdf/Page$Finder;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 217
    :goto_5
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-nez v1, :cond_f

    iput v3, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    goto :goto_6

    .line 218
    :cond_f
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->GetCount()I

    move-result v1

    iput v1, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    .line 219
    :goto_6
    iput v3, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    .line 221
    :cond_10
    iget v1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    iget v5, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    if-lt v1, v5, :cond_b

    .line 223
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v1, :cond_11

    .line 225
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 226
    iput-object v4, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 228
    :cond_11
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 229
    iput-object v4, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 230
    iput v3, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    .line 231
    iget v1, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    goto :goto_4

    .line 234
    :cond_12
    iget-boolean v1, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-nez v1, :cond_13

    iget v1, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    if-lt v1, v0, :cond_15

    .line 236
    :cond_13
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v0, :cond_14

    .line 238
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 239
    iput-object v4, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 241
    :cond_14
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_a

    .line 243
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 244
    iput-object v4, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    goto/16 :goto_3

    .line 251
    :cond_15
    :goto_7
    invoke-direct {p0}, Lcom/radaee/view/VFinder;->eve_notify()V

    return v2
.end method

.method protected find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/GLPage;II)V
    .locals 8

    .line 376
    iget-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-nez v0, :cond_0

    .line 378
    invoke-direct {p0}, Lcom/radaee/view/VFinder;->eve_wait()V

    const/4 v0, 0x1

    .line 379
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    .line 381
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    if-nez v0, :cond_1

    goto :goto_2

    .line 382
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-ltz v0, :cond_3

    iget v1, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    if-ge v0, v1, :cond_3

    const/4 v0, 0x0

    const/4 v4, 0x0

    .line 384
    :goto_0
    iget v0, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    if-ge v4, v0, :cond_3

    .line 386
    iget v0, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-ne v4, v0, :cond_2

    .line 387
    iget-object v5, p0, Lcom/radaee/view/VFinder;->m_paint:Landroid/graphics/Paint;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v1 .. v7}, Lcom/radaee/view/VFinder;->find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/GLPage;ILandroid/graphics/Paint;II)V

    goto :goto_1

    :cond_2
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v6, p3

    move v7, p4

    .line 389
    iget-object v5, v1, Lcom/radaee/view/VFinder;->m_paint_gray:Landroid/graphics/Paint;

    invoke-direct/range {v1 .. v7}, Lcom/radaee/view/VFinder;->find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/GLPage;ILandroid/graphics/Paint;II)V

    :goto_1
    add-int/lit8 v4, v4, 0x1

    move-object p1, v2

    move-object p2, v3

    move p3, v6

    move p4, v7

    goto :goto_0

    :cond_3
    :goto_2
    return-void
.end method

.method protected find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/VPage;II)V
    .locals 8

    .line 314
    iget-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-nez v0, :cond_0

    .line 316
    invoke-direct {p0}, Lcom/radaee/view/VFinder;->eve_wait()V

    const/4 v0, 0x1

    .line 317
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    .line 319
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    if-nez v0, :cond_1

    goto :goto_2

    .line 320
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-ltz v0, :cond_3

    iget v1, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    if-ge v0, v1, :cond_3

    const/4 v0, 0x0

    const/4 v4, 0x0

    .line 322
    :goto_0
    iget v0, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    if-ge v4, v0, :cond_3

    .line 324
    iget v0, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-ne v4, v0, :cond_2

    .line 325
    iget-object v5, p0, Lcom/radaee/view/VFinder;->m_paint:Landroid/graphics/Paint;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v1 .. v7}, Lcom/radaee/view/VFinder;->find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/VPage;ILandroid/graphics/Paint;II)V

    goto :goto_1

    :cond_2
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v6, p3

    move v7, p4

    .line 327
    iget-object v5, v1, Lcom/radaee/view/VFinder;->m_paint_gray:Landroid/graphics/Paint;

    invoke-direct/range {v1 .. v7}, Lcom/radaee/view/VFinder;->find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/VPage;ILandroid/graphics/Paint;II)V

    :goto_1
    add-int/lit8 v4, v4, 0x1

    move-object p1, v2

    move-object p2, v3

    move p3, v6

    move p4, v7

    goto :goto_0

    :cond_3
    :goto_2
    return-void
.end method

.method protected find_end()V
    .locals 2

    .line 399
    iget-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 401
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    .line 402
    invoke-direct {p0}, Lcom/radaee/view/VFinder;->eve_wait()V

    :cond_0
    const/4 v0, 0x0

    .line 404
    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    .line 405
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v1, :cond_2

    .line 407
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v1, :cond_1

    .line 409
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 410
    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 412
    :cond_1
    iget-object v1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 413
    iput-object v0, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    :cond_2
    return-void
.end method

.method protected find_get_page()I
    .locals 1

    .line 395
    iget v0, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    return v0
.end method

.method protected find_get_pos()[F
    .locals 3

    .line 256
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 258
    iget v2, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/Page$Finder;->GetFirstChar(I)I

    move-result v0

    if-gez v0, :cond_0

    return-object v1

    :cond_0
    const/4 v1, 0x4

    .line 260
    new-array v1, v1, [F

    .line 261
    iget-object v2, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0, v1}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    :cond_1
    return-object v1
.end method

.method protected find_prepare(I)I
    .locals 4

    .line 106
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 107
    :cond_0
    iget-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/radaee/view/VFinder;->eve_wait()V

    .line 108
    :cond_1
    iput p1, p0, Lcom/radaee/view/VFinder;->m_dir:I

    .line 109
    invoke-direct {p0}, Lcom/radaee/view/VFinder;->eve_reset()V

    .line 110
    iget-object v0, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    const/4 v2, -0x1

    if-nez v0, :cond_2

    .line 112
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    return v2

    :cond_2
    const/4 v0, 0x1

    .line 115
    iput-boolean v0, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    if-gez p1, :cond_6

    .line 118
    iget p1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-ltz p1, :cond_3

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    .line 119
    :cond_3
    iget p1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-gez p1, :cond_5

    .line 121
    iget p1, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    if-gtz p1, :cond_4

    return v1

    .line 127
    :cond_4
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    return v2

    :cond_5
    return v0

    .line 136
    :cond_6
    iget p1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    iget v3, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    if-ge p1, v3, :cond_7

    add-int/2addr p1, v0

    iput p1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    .line 137
    :cond_7
    iget p1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    if-lt p1, v3, :cond_9

    .line 139
    iget p1, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    iget-object v3, p0, Lcom/radaee/view/VFinder;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v3}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v3

    sub-int/2addr v3, v0

    if-lt p1, v3, :cond_8

    return v1

    .line 145
    :cond_8
    iput-boolean v1, p0, Lcom/radaee/view/VFinder;->is_cancel:Z

    return v2

    :cond_9
    return v0
.end method

.method protected find_start(Lcom/radaee/pdf/Document;ILjava/lang/String;ZZ)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    .line 80
    invoke-virtual/range {v0 .. v6}, Lcom/radaee/view/VFinder;->find_start(Lcom/radaee/pdf/Document;ILjava/lang/String;ZZZ)V

    return-void
.end method

.method protected find_start(Lcom/radaee/pdf/Document;ILjava/lang/String;ZZZ)V
    .locals 0

    .line 85
    iput-object p3, p0, Lcom/radaee/view/VFinder;->m_str:Ljava/lang/String;

    .line 86
    iput-boolean p4, p0, Lcom/radaee/view/VFinder;->m_case:Z

    .line 87
    iput-boolean p5, p0, Lcom/radaee/view/VFinder;->m_whole:Z

    .line 88
    iput-boolean p6, p0, Lcom/radaee/view/VFinder;->mSkipBlank:Z

    .line 89
    iput-object p1, p0, Lcom/radaee/view/VFinder;->m_doc:Lcom/radaee/pdf/Document;

    .line 90
    iput p2, p0, Lcom/radaee/view/VFinder;->m_page_no:I

    .line 91
    iget-object p1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz p1, :cond_1

    .line 93
    iget-object p1, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    .line 95
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 96
    iput-object p2, p0, Lcom/radaee/view/VFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 98
    :cond_0
    iget-object p1, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    .line 99
    iput-object p2, p0, Lcom/radaee/view/VFinder;->m_page:Lcom/radaee/pdf/Page;

    :cond_1
    const/4 p1, -0x1

    .line 101
    iput p1, p0, Lcom/radaee/view/VFinder;->m_page_find_index:I

    const/4 p1, 0x0

    .line 102
    iput p1, p0, Lcom/radaee/view/VFinder;->m_page_find_cnt:I

    return-void
.end method
