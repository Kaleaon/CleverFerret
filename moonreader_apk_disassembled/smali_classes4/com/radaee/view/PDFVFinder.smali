.class public Lcom/radaee/view/PDFVFinder;
.super Ljava/lang/Object;
.source "PDFVFinder.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private is_cancel:Z

.field private is_notified:Z

.field private is_waitting:Z

.field private m_case:Z

.field private m_dir:I

.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_finder:Lcom/radaee/pdf/Page$Finder;

.field private m_page:Lcom/radaee/pdf/Page;

.field private m_page_find_cnt:I

.field private m_page_find_index:I

.field private m_page_no:I

.field private m_paint:Landroid/graphics/Paint;

.field private m_str:Ljava/lang/String;

.field private m_whole:Z


# direct methods
.method protected constructor <init>()V
    .locals 5

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    const/4 v1, 0x0

    .line 18
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->m_case:Z

    .line 19
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->m_whole:Z

    const/4 v2, -0x1

    .line 20
    iput v2, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    .line 21
    iput v2, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    .line 22
    iput v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    .line 23
    iput-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 24
    iput-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_doc:Lcom/radaee/pdf/Document;

    .line 26
    iput-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 28
    iput v1, p0, Lcom/radaee/view/PDFVFinder;->m_dir:I

    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    .line 30
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->is_notified:Z

    .line 31
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->is_waitting:Z

    .line 32
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_paint:Landroid/graphics/Paint;

    .line 35
    sget v1, Lcom/radaee/pdf/Global;->findPrimaryColor:I

    shr-int/lit8 v1, v1, 0x18

    and-int/lit16 v1, v1, 0xff

    sget v2, Lcom/radaee/pdf/Global;->findPrimaryColor:I

    shr-int/lit8 v2, v2, 0x10

    and-int/lit16 v2, v2, 0xff

    sget v3, Lcom/radaee/pdf/Global;->findPrimaryColor:I

    shr-int/lit8 v3, v3, 0x8

    and-int/lit16 v3, v3, 0xff

    sget v4, Lcom/radaee/pdf/Global;->findPrimaryColor:I

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 37
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method private declared-synchronized eve_notify()V
    .locals 1

    monitor-enter p0

    .line 63
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_waitting:Z

    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 66
    iput-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_notified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
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

    .line 41
    :try_start_0
    iput-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_notified:Z

    .line 42
    iput-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_waitting:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
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

    .line 48
    :try_start_0
    iget-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_notified:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 49
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->is_notified:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 52
    iput-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_waitting:Z

    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 54
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->is_waitting:Z
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

    .line 60
    :catch_0
    :goto_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method protected find()I
    .locals 8

    .line 140
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 141
    iget v1, p0, Lcom/radaee/view/PDFVFinder;->m_dir:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-gez v1, :cond_a

    .line 143
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v1, :cond_1

    iget v5, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    if-gez v5, :cond_6

    :cond_1
    iget v5, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    if-ltz v5, :cond_6

    iget-boolean v6, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    if-nez v6, :cond_6

    if-nez v1, :cond_4

    if-lt v5, v0, :cond_2

    add-int/lit8 v1, v0, -0x1

    .line 147
    iput v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    .line 148
    :cond_2
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_doc:Lcom/radaee/pdf/Document;

    iget v5, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    invoke-virtual {v1, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 149
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 150
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    iget-object v5, p0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/radaee/view/PDFVFinder;->m_case:Z

    iget-boolean v7, p0, Lcom/radaee/view/PDFVFinder;->m_whole:Z

    invoke-virtual {v1, v5, v6, v7}, Lcom/radaee/pdf/Page;->FindOpen(Ljava/lang/String;ZZ)Lcom/radaee/pdf/Page$Finder;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-nez v1, :cond_3

    .line 151
    iput v3, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    goto :goto_1

    .line 152
    :cond_3
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->GetCount()I

    move-result v1

    iput v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    .line 153
    :goto_1
    iget v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    .line 155
    :cond_4
    iget v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    if-gez v1, :cond_0

    .line 157
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v1, :cond_5

    .line 159
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 160
    iput-object v4, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 162
    :cond_5
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 163
    iput-object v4, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 164
    iput v3, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    .line 165
    iget v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    goto :goto_0

    .line 168
    :cond_6
    iget-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    if-nez v0, :cond_7

    iget v0, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    if-gez v0, :cond_13

    .line 170
    :cond_7
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v0, :cond_8

    .line 172
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 173
    iput-object v4, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 175
    :cond_8
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_9

    .line 177
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 178
    iput-object v4, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    :cond_9
    :goto_2
    const/4 v2, 0x0

    goto/16 :goto_5

    .line 187
    :cond_a
    :goto_3
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v1, :cond_b

    iget v5, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    iget v6, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    if-lt v5, v6, :cond_10

    :cond_b
    iget v5, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    if-ge v5, v0, :cond_10

    iget-boolean v6, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    if-nez v6, :cond_10

    if-nez v1, :cond_e

    if-gez v5, :cond_c

    .line 191
    iput v3, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    .line 192
    :cond_c
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_doc:Lcom/radaee/pdf/Document;

    iget v5, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    invoke-virtual {v1, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 193
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 194
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    iget-object v5, p0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/radaee/view/PDFVFinder;->m_case:Z

    iget-boolean v7, p0, Lcom/radaee/view/PDFVFinder;->m_whole:Z

    invoke-virtual {v1, v5, v6, v7}, Lcom/radaee/pdf/Page;->FindOpen(Ljava/lang/String;ZZ)Lcom/radaee/pdf/Page$Finder;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-nez v1, :cond_d

    .line 195
    iput v3, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    goto :goto_4

    .line 196
    :cond_d
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->GetCount()I

    move-result v1

    iput v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    .line 197
    :goto_4
    iput v3, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    .line 199
    :cond_e
    iget v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    iget v5, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    if-lt v1, v5, :cond_a

    .line 201
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v1, :cond_f

    .line 203
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 204
    iput-object v4, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 206
    :cond_f
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 207
    iput-object v4, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    .line 208
    iput v3, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    .line 209
    iget v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    goto :goto_3

    .line 212
    :cond_10
    iget-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    if-nez v1, :cond_11

    iget v1, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    if-lt v1, v0, :cond_13

    .line 214
    :cond_11
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v0, :cond_12

    .line 216
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 217
    iput-object v4, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 219
    :cond_12
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_9

    .line 221
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 222
    iput-object v4, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    goto :goto_2

    .line 229
    :cond_13
    :goto_5
    invoke-direct {p0}, Lcom/radaee/view/PDFVFinder;->eve_notify()V

    return v2
.end method

.method protected find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/PDFVPage;II)V
    .locals 28

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    .line 351
    iget-boolean v4, v0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    const/4 v5, 0x1

    if-nez v4, :cond_0

    .line 353
    invoke-direct {v0}, Lcom/radaee/view/PDFVFinder;->eve_wait()V

    .line 354
    iput-boolean v5, v0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    .line 356
    :cond_0
    iget-object v4, v0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    if-nez v4, :cond_1

    goto/16 :goto_2

    .line 357
    :cond_1
    iget-object v4, v0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v4, :cond_6

    iget v6, v0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    if-ltz v6, :cond_6

    iget v7, v0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    if-ge v6, v7, :cond_6

    .line 359
    invoke-virtual {v4, v6}, Lcom/radaee/pdf/Page$Finder;->GetFirstChar(I)I

    move-result v4

    .line 360
    iget-object v6, v0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v4

    const/4 v7, 0x4

    .line 361
    new-array v8, v7, [F

    .line 362
    new-array v9, v7, [F

    .line 363
    new-array v7, v7, [F

    .line 364
    iget-object v10, v0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v10, v4, v8}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v10, 0x0

    .line 365
    aget v11, v8, v10

    aput v11, v9, v10

    .line 366
    aget v11, v8, v5

    aput v11, v9, v5

    const/4 v11, 0x2

    .line 367
    aget v12, v8, v11

    aput v12, v9, v11

    const/4 v12, 0x3

    .line 368
    aget v13, v8, v12

    aput v13, v9, v12

    add-int/2addr v4, v5

    :goto_0
    if-ge v4, v6, :cond_5

    .line 372
    iget-object v13, v0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v13, v4, v8}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 373
    aget v13, v8, v12

    aget v14, v8, v5

    sub-float v15, v13, v14

    const/high16 v16, 0x40000000    # 2.0f

    div-float v15, v15, v16

    .line 374
    aget v16, v9, v5

    cmpl-float v14, v16, v14

    if-nez v14, :cond_4

    aget v14, v9, v12

    cmpl-float v13, v14, v13

    if-nez v13, :cond_4

    aget v13, v9, v11

    add-float v14, v13, v15

    aget v16, v8, v10

    cmpl-float v14, v14, v16

    if-lez v14, :cond_4

    aget v14, v9, v10

    sub-float v15, v14, v15

    aget v17, v8, v11

    cmpg-float v15, v15, v17

    if-gez v15, :cond_4

    cmpl-float v14, v14, v16

    if-lez v14, :cond_2

    .line 377
    aput v16, v9, v10

    :cond_2
    cmpg-float v13, v13, v17

    if-gez v13, :cond_3

    .line 378
    aput v17, v9, v11

    :cond_3
    const/16 v16, 0x1

    goto :goto_1

    .line 382
    :cond_4
    aget v13, v9, v10

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v13

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v14

    int-to-float v14, v14

    add-float/2addr v13, v14

    int-to-float v14, v2

    sub-float/2addr v13, v14

    aput v13, v7, v10

    .line 383
    aget v13, v9, v12

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v13

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v15

    int-to-float v15, v15

    add-float/2addr v13, v15

    int-to-float v15, v3

    sub-float/2addr v13, v15

    aput v13, v7, v5

    .line 384
    aget v13, v9, v11

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v13

    const/16 v16, 0x1

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v13, v5

    sub-float/2addr v13, v14

    aput v13, v7, v11

    .line 385
    aget v5, v9, v16

    invoke-virtual {v1, v5}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v5

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v13

    int-to-float v13, v13

    add-float/2addr v5, v13

    sub-float v21, v5, v15

    aput v21, v7, v12

    .line 386
    aget v18, v7, v10

    aget v19, v7, v16

    aget v20, v7, v11

    iget-object v5, v0, Lcom/radaee/view/PDFVFinder;->m_paint:Landroid/graphics/Paint;

    move-object/from16 v17, p1

    move-object/from16 v22, v5

    invoke-virtual/range {v17 .. v22}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 387
    aget v5, v8, v10

    aput v5, v9, v10

    .line 388
    aget v5, v8, v16

    aput v5, v9, v16

    .line 389
    aget v5, v8, v11

    aput v5, v9, v11

    .line 390
    aget v5, v8, v12

    aput v5, v9, v12

    :goto_1
    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x1

    goto/16 :goto_0

    :cond_5
    const/16 v16, 0x1

    .line 394
    aget v4, v9, v10

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    int-to-float v2, v2

    sub-float/2addr v4, v2

    aput v4, v7, v10

    .line 395
    aget v4, v9, v12

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    int-to-float v3, v3

    sub-float/2addr v4, v3

    aput v4, v7, v16

    .line 396
    aget v4, v9, v11

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    sub-float/2addr v4, v2

    aput v4, v7, v11

    .line 397
    aget v2, v9, v16

    invoke-virtual {v1, v2}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v2

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v2, v1

    sub-float v26, v2, v3

    aput v26, v7, v12

    .line 398
    aget v23, v7, v10

    aget v24, v7, v16

    aget v25, v7, v11

    iget-object v1, v0, Lcom/radaee/view/PDFVFinder;->m_paint:Landroid/graphics/Paint;

    move-object/from16 v22, p1

    move-object/from16 v27, v1

    invoke-virtual/range {v22 .. v27}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_6
    :goto_2
    return-void
.end method

.method protected find_draw(Lcom/radaee/pdf/BMP;Lcom/radaee/view/PDFVPage;II)V
    .locals 32

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    .line 247
    iget-boolean v4, v0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    const/4 v5, 0x1

    if-nez v4, :cond_0

    .line 249
    invoke-direct {v0}, Lcom/radaee/view/PDFVFinder;->eve_wait()V

    .line 250
    iput-boolean v5, v0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    .line 252
    :cond_0
    iget-object v4, v0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    if-nez v4, :cond_1

    goto/16 :goto_2

    .line 253
    :cond_1
    iget-object v4, v0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v4, :cond_6

    iget v6, v0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    if-ltz v6, :cond_6

    iget v7, v0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    if-ge v6, v7, :cond_6

    .line 255
    invoke-virtual {v4, v6}, Lcom/radaee/pdf/Page$Finder;->GetFirstChar(I)I

    move-result v4

    .line 256
    iget-object v6, v0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v4

    const/4 v7, 0x4

    .line 257
    new-array v8, v7, [F

    .line 258
    new-array v9, v7, [F

    .line 259
    new-array v7, v7, [F

    .line 260
    iget-object v10, v0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v10, v4, v8}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v10, 0x0

    .line 261
    aget v11, v8, v10

    aput v11, v9, v10

    .line 262
    aget v11, v8, v5

    aput v11, v9, v5

    const/4 v11, 0x2

    .line 263
    aget v12, v8, v11

    aput v12, v9, v11

    const/4 v12, 0x3

    .line 264
    aget v13, v8, v12

    aput v13, v9, v12

    add-int/2addr v4, v5

    :goto_0
    if-ge v4, v6, :cond_5

    .line 268
    iget-object v13, v0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v13, v4, v8}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 269
    aget v13, v8, v12

    aget v14, v8, v5

    sub-float v15, v13, v14

    const/high16 v16, 0x40000000    # 2.0f

    div-float v15, v15, v16

    .line 270
    aget v16, v9, v5

    cmpl-float v14, v16, v14

    if-nez v14, :cond_4

    aget v14, v9, v12

    cmpl-float v13, v14, v13

    if-nez v13, :cond_4

    aget v13, v9, v11

    add-float v14, v13, v15

    aget v16, v8, v10

    cmpl-float v14, v14, v16

    if-lez v14, :cond_4

    aget v14, v9, v10

    sub-float v15, v14, v15

    aget v17, v8, v11

    cmpg-float v15, v15, v17

    if-gez v15, :cond_4

    cmpl-float v14, v14, v16

    if-lez v14, :cond_2

    .line 273
    aput v16, v9, v10

    :cond_2
    cmpg-float v13, v13, v17

    if-gez v13, :cond_3

    .line 274
    aput v17, v9, v11

    :cond_3
    const/16 v16, 0x1

    const/16 v24, 0x0

    goto :goto_1

    .line 278
    :cond_4
    aget v13, v9, v10

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v13

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v14

    int-to-float v14, v14

    add-float/2addr v13, v14

    int-to-float v14, v2

    sub-float/2addr v13, v14

    aput v13, v7, v10

    .line 279
    aget v13, v9, v12

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v13

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v15

    int-to-float v15, v15

    add-float/2addr v13, v15

    int-to-float v15, v3

    sub-float/2addr v13, v15

    aput v13, v7, v5

    .line 280
    aget v13, v9, v11

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v13

    const/16 v16, 0x1

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v13, v5

    sub-float/2addr v13, v14

    aput v13, v7, v11

    .line 281
    aget v5, v9, v16

    invoke-virtual {v1, v5}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v5

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v13

    int-to-float v13, v13

    add-float/2addr v5, v13

    sub-float/2addr v5, v15

    aput v5, v7, v12

    .line 282
    aget v13, v7, v10

    float-to-int v14, v13

    aget v15, v7, v16

    const/16 v24, 0x0

    float-to-int v10, v15

    aget v17, v7, v11

    sub-float v13, v17, v13

    float-to-int v13, v13

    sub-float/2addr v5, v15

    float-to-int v5, v5

    const/16 v23, 0x0

    const v18, 0x400000ff    # 2.0000608f

    move-object/from16 v17, p1

    move/from16 v22, v5

    move/from16 v20, v10

    move/from16 v21, v13

    move/from16 v19, v14

    invoke-virtual/range {v17 .. v23}, Lcom/radaee/pdf/BMP;->DrawRect(IIIIII)V

    .line 283
    aget v5, v8, v24

    aput v5, v9, v24

    .line 284
    aget v5, v8, v16

    aput v5, v9, v16

    .line 285
    aget v5, v8, v11

    aput v5, v9, v11

    .line 286
    aget v5, v8, v12

    aput v5, v9, v12

    :goto_1
    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x1

    const/4 v10, 0x0

    goto/16 :goto_0

    :cond_5
    const/16 v16, 0x1

    const/16 v24, 0x0

    .line 290
    aget v4, v9, v24

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    int-to-float v2, v2

    sub-float/2addr v4, v2

    aput v4, v7, v24

    .line 291
    aget v4, v9, v12

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    int-to-float v3, v3

    sub-float/2addr v4, v3

    aput v4, v7, v16

    .line 292
    aget v4, v9, v11

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    sub-float/2addr v4, v2

    aput v4, v7, v11

    .line 293
    aget v2, v9, v16

    invoke-virtual {v1, v2}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v2

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v2, v1

    sub-float/2addr v2, v3

    aput v2, v7, v12

    .line 294
    aget v1, v7, v24

    float-to-int v3, v1

    aget v4, v7, v16

    float-to-int v5, v4

    aget v6, v7, v11

    sub-float/2addr v6, v1

    float-to-int v1, v6

    sub-float/2addr v2, v4

    float-to-int v2, v2

    const/16 v31, 0x0

    const v26, 0x400000ff    # 2.0000608f

    move-object/from16 v25, p1

    move/from16 v29, v1

    move/from16 v30, v2

    move/from16 v27, v3

    move/from16 v28, v5

    invoke-virtual/range {v25 .. v31}, Lcom/radaee/pdf/BMP;->DrawRect(IIIIII)V

    :cond_6
    :goto_2
    return-void
.end method

.method protected find_draw_to_dib(Lcom/radaee/pdf/DIB;Lcom/radaee/view/PDFVPage;II)V
    .locals 32

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    .line 299
    iget-boolean v4, v0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    const/4 v5, 0x1

    if-nez v4, :cond_0

    .line 301
    invoke-direct {v0}, Lcom/radaee/view/PDFVFinder;->eve_wait()V

    .line 302
    iput-boolean v5, v0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    .line 304
    :cond_0
    iget-object v4, v0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    if-nez v4, :cond_1

    goto/16 :goto_2

    .line 305
    :cond_1
    iget-object v4, v0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v4, :cond_6

    iget v6, v0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    if-ltz v6, :cond_6

    iget v7, v0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    if-ge v6, v7, :cond_6

    .line 307
    invoke-virtual {v4, v6}, Lcom/radaee/pdf/Page$Finder;->GetFirstChar(I)I

    move-result v4

    .line 308
    iget-object v6, v0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v4

    const/4 v7, 0x4

    .line 309
    new-array v8, v7, [F

    .line 310
    new-array v9, v7, [F

    .line 311
    new-array v7, v7, [F

    .line 312
    iget-object v10, v0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v10, v4, v8}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    const/4 v10, 0x0

    .line 313
    aget v11, v8, v10

    aput v11, v9, v10

    .line 314
    aget v11, v8, v5

    aput v11, v9, v5

    const/4 v11, 0x2

    .line 315
    aget v12, v8, v11

    aput v12, v9, v11

    const/4 v12, 0x3

    .line 316
    aget v13, v8, v12

    aput v13, v9, v12

    add-int/2addr v4, v5

    :goto_0
    if-ge v4, v6, :cond_5

    .line 320
    iget-object v13, v0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v13, v4, v8}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    .line 321
    aget v13, v8, v12

    aget v14, v8, v5

    sub-float v15, v13, v14

    const/high16 v16, 0x40000000    # 2.0f

    div-float v15, v15, v16

    .line 322
    aget v16, v9, v5

    cmpl-float v14, v16, v14

    if-nez v14, :cond_4

    aget v14, v9, v12

    cmpl-float v13, v14, v13

    if-nez v13, :cond_4

    aget v13, v9, v11

    add-float v14, v13, v15

    aget v16, v8, v10

    cmpl-float v14, v14, v16

    if-lez v14, :cond_4

    aget v14, v9, v10

    sub-float v15, v14, v15

    aget v17, v8, v11

    cmpg-float v15, v15, v17

    if-gez v15, :cond_4

    cmpl-float v14, v14, v16

    if-lez v14, :cond_2

    .line 325
    aput v16, v9, v10

    :cond_2
    cmpg-float v13, v13, v17

    if-gez v13, :cond_3

    .line 326
    aput v17, v9, v11

    :cond_3
    const/16 v16, 0x1

    const/16 v24, 0x0

    goto :goto_1

    .line 330
    :cond_4
    aget v13, v9, v10

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v13

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v14

    int-to-float v14, v14

    add-float/2addr v13, v14

    int-to-float v14, v2

    sub-float/2addr v13, v14

    aput v13, v7, v10

    .line 331
    aget v13, v9, v12

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v13

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v15

    int-to-float v15, v15

    add-float/2addr v13, v15

    int-to-float v15, v3

    sub-float/2addr v13, v15

    aput v13, v7, v5

    .line 332
    aget v13, v9, v11

    invoke-virtual {v1, v13}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v13

    const/16 v16, 0x1

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v13, v5

    sub-float/2addr v13, v14

    aput v13, v7, v11

    .line 333
    aget v5, v9, v16

    invoke-virtual {v1, v5}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v5

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v13

    int-to-float v13, v13

    add-float/2addr v5, v13

    sub-float/2addr v5, v15

    aput v5, v7, v12

    .line 334
    aget v13, v7, v10

    float-to-int v14, v13

    aget v15, v7, v16

    const/16 v24, 0x0

    float-to-int v10, v15

    aget v17, v7, v11

    sub-float v13, v17, v13

    float-to-int v13, v13

    sub-float/2addr v5, v15

    float-to-int v5, v5

    const/16 v23, 0x0

    const v18, 0x400000ff    # 2.0000608f

    move-object/from16 v17, p1

    move/from16 v22, v5

    move/from16 v20, v10

    move/from16 v21, v13

    move/from16 v19, v14

    invoke-virtual/range {v17 .. v23}, Lcom/radaee/pdf/DIB;->DrawRect(IIIIII)V

    .line 335
    aget v5, v8, v24

    aput v5, v9, v24

    .line 336
    aget v5, v8, v16

    aput v5, v9, v16

    .line 337
    aget v5, v8, v11

    aput v5, v9, v11

    .line 338
    aget v5, v8, v12

    aput v5, v9, v12

    :goto_1
    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x1

    const/4 v10, 0x0

    goto/16 :goto_0

    :cond_5
    const/16 v16, 0x1

    const/16 v24, 0x0

    .line 342
    aget v4, v9, v24

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    int-to-float v2, v2

    sub-float/2addr v4, v2

    aput v4, v7, v24

    .line 343
    aget v4, v9, v12

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    int-to-float v3, v3

    sub-float/2addr v4, v3

    aput v4, v7, v16

    .line 344
    aget v4, v9, v11

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v4

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v4, v5

    sub-float/2addr v4, v2

    aput v4, v7, v11

    .line 345
    aget v2, v9, v16

    invoke-virtual {v1, v2}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v2

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v2, v1

    sub-float/2addr v2, v3

    aput v2, v7, v12

    .line 346
    aget v1, v7, v24

    float-to-int v3, v1

    aget v4, v7, v16

    float-to-int v5, v4

    aget v6, v7, v11

    sub-float/2addr v6, v1

    float-to-int v1, v6

    sub-float/2addr v2, v4

    float-to-int v2, v2

    const/16 v31, 0x0

    const v26, 0x400000ff    # 2.0000608f

    move-object/from16 v25, p1

    move/from16 v29, v1

    move/from16 v30, v2

    move/from16 v27, v3

    move/from16 v28, v5

    invoke-virtual/range {v25 .. v31}, Lcom/radaee/pdf/DIB;->DrawRect(IIIIII)V

    :cond_6
    :goto_2
    return-void
.end method

.method protected find_end()V
    .locals 2

    .line 407
    iget-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 409
    iput-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    .line 410
    invoke-direct {p0}, Lcom/radaee/view/PDFVFinder;->eve_wait()V

    :cond_0
    const/4 v0, 0x0

    .line 412
    iput-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    .line 413
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v1, :cond_2

    .line 415
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    if-eqz v1, :cond_1

    .line 417
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 418
    iput-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 420
    :cond_1
    iget-object v1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 421
    iput-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    :cond_2
    return-void
.end method

.method protected find_get_page()I
    .locals 1

    .line 403
    iget v0, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    return v0
.end method

.method protected find_get_pos()[F
    .locals 3

    .line 234
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 236
    iget v2, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/Page$Finder;->GetFirstChar(I)I

    move-result v0

    if-gez v0, :cond_0

    return-object v1

    :cond_0
    const/4 v1, 0x4

    .line 238
    new-array v1, v1, [F

    .line 239
    iget-object v2, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0, v1}, Lcom/radaee/pdf/Page;->ObjsGetCharRect(I[F)V

    :cond_1
    return-object v1
.end method

.method protected find_prepare(I)I
    .locals 4

    .line 90
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 91
    :cond_0
    iget-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/radaee/view/PDFVFinder;->eve_wait()V

    .line 92
    :cond_1
    iput p1, p0, Lcom/radaee/view/PDFVFinder;->m_dir:I

    .line 93
    invoke-direct {p0}, Lcom/radaee/view/PDFVFinder;->eve_reset()V

    .line 94
    iget-object v0, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    const/4 v2, -0x1

    if-nez v0, :cond_2

    .line 96
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    return v2

    :cond_2
    const/4 v0, 0x1

    .line 99
    iput-boolean v0, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    if-gez p1, :cond_6

    .line 102
    iget p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    if-ltz p1, :cond_3

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    .line 103
    :cond_3
    iget p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    if-gez p1, :cond_5

    .line 105
    iget p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    if-gtz p1, :cond_4

    return v1

    .line 111
    :cond_4
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    return v2

    :cond_5
    return v0

    .line 120
    :cond_6
    iget p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    iget v3, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    if-ge p1, v3, :cond_7

    add-int/2addr p1, v0

    iput p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    .line 121
    :cond_7
    iget p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    if-lt p1, v3, :cond_9

    .line 123
    iget p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    iget-object v3, p0, Lcom/radaee/view/PDFVFinder;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v3}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v3

    sub-int/2addr v3, v0

    if-lt p1, v3, :cond_8

    return v1

    .line 129
    :cond_8
    iput-boolean v1, p0, Lcom/radaee/view/PDFVFinder;->is_cancel:Z

    return v2

    :cond_9
    return v0
.end method

.method protected find_start(Lcom/radaee/pdf/Document;ILjava/lang/String;ZZ)V
    .locals 0

    .line 70
    iput-object p3, p0, Lcom/radaee/view/PDFVFinder;->m_str:Ljava/lang/String;

    .line 71
    iput-boolean p4, p0, Lcom/radaee/view/PDFVFinder;->m_case:Z

    .line 72
    iput-boolean p5, p0, Lcom/radaee/view/PDFVFinder;->m_whole:Z

    .line 73
    iput-object p1, p0, Lcom/radaee/view/PDFVFinder;->m_doc:Lcom/radaee/pdf/Document;

    .line 74
    iput p2, p0, Lcom/radaee/view/PDFVFinder;->m_page_no:I

    .line 75
    iget-object p1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    if-eqz p1, :cond_1

    .line 77
    iget-object p1, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    .line 79
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Finder;->Close()V

    .line 80
    iput-object p2, p0, Lcom/radaee/view/PDFVFinder;->m_finder:Lcom/radaee/pdf/Page$Finder;

    .line 82
    :cond_0
    iget-object p1, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    .line 83
    iput-object p2, p0, Lcom/radaee/view/PDFVFinder;->m_page:Lcom/radaee/pdf/Page;

    :cond_1
    const/4 p1, -0x1

    .line 85
    iput p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_index:I

    const/4 p1, 0x0

    .line 86
    iput p1, p0, Lcom/radaee/view/PDFVFinder;->m_page_find_cnt:I

    return-void
.end method
