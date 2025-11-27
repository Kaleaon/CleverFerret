.class public Lcom/radaee/view/PDFViewCurl;
.super Lcom/radaee/view/PDFView;
.source "PDFViewCurl.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private mBackSideClr:I

.field private m_dib1:Lcom/radaee/pdf/DIB;

.field private m_dib2:Lcom/radaee/pdf/DIB;

.field private m_duals:[Z

.field private m_hold_dir:I

.field private m_hold_style:I

.field private m_pageno:I

.field private m_stepx:F

.field private m_stepy:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 21
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    .line 17
    iput-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    const/16 v0, -0x34

    .line 18
    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->mBackSideClr:I

    .line 189
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    const/4 v0, 0x0

    .line 190
    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    .line 191
    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_stepx:F

    .line 192
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_dir:I

    return-void
.end method


# virtual methods
.method protected motionNormal(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 196
    invoke-virtual {p0}, Lcom/radaee/view/PDFViewCurl;->vGetLock()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    return v1

    .line 197
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz v0, :cond_7

    if-eq v0, v1, :cond_2

    if-eq v0, v4, :cond_1

    if-eq v0, v2, :cond_2

    goto/16 :goto_6

    .line 238
    :cond_1
    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    if-ne v0, v1, :cond_f

    .line 240
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    .line 241
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    .line 242
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_f

    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v3}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    goto/16 :goto_6

    .line 247
    :cond_2
    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    if-ne v0, v1, :cond_f

    .line 249
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    .line 250
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    .line 251
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    div-int/2addr v0, v4

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_4

    .line 253
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    if-ne p1, v1, :cond_3

    .line 254
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float p1, p1

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v0, v0

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    sub-float/2addr v0, v2

    div-float/2addr p1, v0

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    goto :goto_0

    .line 256
    :cond_3
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    neg-float p1, p1

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v0, v0

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    sub-float/2addr v0, v2

    div-float/2addr p1, v0

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    .line 257
    :goto_0
    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_dir:I

    goto :goto_2

    .line 261
    :cond_4
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    const/high16 v0, 0x40400000    # 3.0f

    const/4 v2, 0x0

    if-ne p1, v1, :cond_5

    .line 263
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float p1, p1

    iget v4, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    sub-float/2addr p1, v4

    iget v4, p0, Lcom/radaee/view/PDFViewCurl;->m_stepx:F

    mul-float v4, v4, v0

    div-float/2addr p1, v4

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    cmpg-float p1, p1, v2

    if-gez p1, :cond_6

    .line 264
    iput v2, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    goto :goto_1

    .line 268
    :cond_5
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    sub-float p1, v2, p1

    iget v4, p0, Lcom/radaee/view/PDFViewCurl;->m_stepx:F

    mul-float v4, v4, v0

    div-float/2addr p1, v4

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    cmpl-float p1, p1, v2

    if-lez p1, :cond_6

    .line 269
    iput v2, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    :cond_6
    :goto_1
    const/4 p1, -0x1

    .line 271
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_dir:I

    :goto_2
    const/4 p1, 0x4

    .line 273
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    .line 274
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_f

    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v3}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    goto/16 :goto_6

    .line 200
    :cond_7
    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    if-nez v0, :cond_f

    .line 202
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    .line 203
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    .line 204
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    div-int/2addr v0, v4

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_8

    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    goto :goto_3

    .line 205
    :cond_8
    iput v4, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    .line 206
    :goto_3
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    div-int/2addr v0, v4

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_b

    .line 208
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    aget-boolean p1, p1, v0

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p1, p1

    sub-int/2addr p1, v4

    if-ge v0, p1, :cond_9

    .line 209
    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    goto :goto_5

    .line 210
    :cond_9
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    aget-boolean p1, p1, v0

    if-nez p1, :cond_a

    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p1, p1

    sub-int/2addr p1, v1

    if-ge v0, p1, :cond_a

    .line 211
    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    goto :goto_5

    .line 213
    :cond_a
    iput v3, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    goto :goto_5

    .line 217
    :cond_b
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    if-lez p1, :cond_d

    .line 219
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    add-int/lit8 v2, p1, -0x1

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_c

    sub-int/2addr p1, v4

    .line 221
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    goto :goto_4

    :cond_c
    sub-int/2addr p1, v1

    .line 225
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    .line 227
    :goto_4
    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    .line 228
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_e

    .line 229
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFPageChanged(I)V

    goto :goto_5

    .line 232
    :cond_d
    iput v3, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    .line 234
    :cond_e
    :goto_5
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_f

    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v3}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_f
    :goto_6
    return v1
.end method

.method public setCurlBackSideClr(I)V
    .locals 0

    .line 517
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->mBackSideClr:I

    return-void
.end method

.method public vClose()V
    .locals 2

    .line 35
    invoke-super {p0}, Lcom/radaee/view/PDFView;->vClose()V

    .line 36
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    :cond_1
    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    .line 39
    iput-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    const/4 v1, 0x0

    .line 40
    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    .line 41
    iput-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    return-void
.end method

.method public vDraw(Landroid/graphics/Canvas;)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 340
    iget-object v2, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v2, :cond_0

    goto/16 :goto_7

    .line 345
    :cond_0
    iget v2, v0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v2, v3, :cond_8

    iget v2, v0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    const/4 v3, 0x4

    if-eq v2, v3, :cond_8

    const/4 v2, 0x0

    .line 348
    :goto_0
    iget v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    if-ge v2, v3, :cond_1

    .line 350
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v2

    invoke-virtual {v3, v5}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 353
    :cond_1
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_bmp:Landroid/graphics/Bitmap;

    iget v5, v0, Lcom/radaee/view/PDFViewCurl;->m_back:I

    invoke-virtual {v3, v5}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 355
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v5}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 356
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v2

    invoke-virtual {v3, v5}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    .line 357
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v3, v5, v4, v4}, Lcom/radaee/view/PDFVPage;->Draw(Lcom/radaee/pdf/BMP;II)V

    .line 360
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    invoke-virtual {v3, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v3

    .line 361
    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v2

    invoke-virtual {v5, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v5

    .line 363
    iget-object v6, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v6}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v6

    if-ne v6, v2, :cond_2

    .line 364
    iget-object v6, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v2

    invoke-virtual {v6, v7, v8, v4, v4}, Lcom/radaee/view/PDFVFinder;->find_draw(Lcom/radaee/pdf/BMP;Lcom/radaee/view/PDFVPage;II)V

    :cond_2
    add-int/lit8 v6, v2, 0x1

    .line 366
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aget-boolean v7, v7, v2

    if-eqz v7, :cond_6

    .line 368
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v6

    invoke-virtual {v7, v8}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    .line 369
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v7, v7, v6

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v7, v8, v4, v4}, Lcom/radaee/view/PDFVPage;->Draw(Lcom/radaee/pdf/BMP;II)V

    if-eqz v3, :cond_3

    if-nez v5, :cond_4

    .line 372
    :cond_3
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v6

    invoke-virtual {v3, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v3

    .line 373
    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v6

    invoke-virtual {v5, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v5

    .line 375
    :cond_4
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v7}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v7

    if-ne v7, v6, :cond_5

    .line 376
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v6, v9, v6

    invoke-virtual {v7, v8, v6, v4, v4}, Lcom/radaee/view/PDFVFinder;->find_draw(Lcom/radaee/pdf/BMP;Lcom/radaee/view/PDFVPage;II)V

    :cond_5
    add-int/lit8 v6, v2, 0x2

    .line 379
    :cond_6
    sget-boolean v4, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz v4, :cond_7

    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v4}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 380
    :cond_7
    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v7}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 382
    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v4, v4

    move v7, v6

    :goto_1
    if-ge v7, v4, :cond_19

    .line 385
    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v9, v9, v7

    invoke-virtual {v8, v9}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_8
    const/4 v2, 0x0

    .line 392
    :goto_2
    iget v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    if-ge v2, v3, :cond_9

    .line 394
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v2

    invoke-virtual {v3, v5}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 398
    :cond_9
    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    iget v6, v0, Lcom/radaee/view/PDFViewCurl;->m_back:I

    iget v9, v0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    iget v10, v0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    const/4 v11, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v5 .. v11}, Lcom/radaee/pdf/DIB;->DrawRect(IIIIII)V

    .line 399
    iget-object v12, v0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    iget v13, v0, Lcom/radaee/view/PDFViewCurl;->m_back:I

    iget v3, v0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    iget v5, v0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    const/16 v18, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    move/from16 v16, v3

    move/from16 v17, v5

    invoke-virtual/range {v12 .. v18}, Lcom/radaee/pdf/DIB;->DrawRect(IIIIII)V

    .line 400
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v2

    invoke-virtual {v3, v5}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    .line 401
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    invoke-virtual {v3, v5, v4, v4}, Lcom/radaee/view/PDFVPage;->DrawDIB(Lcom/radaee/pdf/DIB;II)V

    .line 404
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    invoke-virtual {v3, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v3

    .line 405
    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v2

    invoke-virtual {v5, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v5

    .line 407
    iget-object v6, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v6}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v6

    if-ne v6, v2, :cond_a

    .line 408
    iget-object v6, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v2

    invoke-virtual {v6, v7, v8, v4, v4}, Lcom/radaee/view/PDFVFinder;->find_draw_to_dib(Lcom/radaee/pdf/DIB;Lcom/radaee/view/PDFVPage;II)V

    :cond_a
    add-int/lit8 v6, v2, 0x1

    .line 410
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aget-boolean v7, v7, v2

    if-eqz v7, :cond_e

    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v7, v7

    if-ge v6, v7, :cond_e

    .line 412
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v6

    invoke-virtual {v7, v8}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    .line 413
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v7, v7, v6

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    invoke-virtual {v7, v8, v4, v4}, Lcom/radaee/view/PDFVPage;->DrawDIB(Lcom/radaee/pdf/DIB;II)V

    if-eqz v3, :cond_b

    if-nez v5, :cond_c

    .line 416
    :cond_b
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v6

    invoke-virtual {v3, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v3

    .line 417
    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v6

    invoke-virtual {v5, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v5

    .line 419
    :cond_c
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v7}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v7

    if-ne v7, v6, :cond_d

    .line 420
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v6, v9, v6

    invoke-virtual {v7, v8, v6, v4, v4}, Lcom/radaee/view/PDFVFinder;->find_draw_to_dib(Lcom/radaee/pdf/DIB;Lcom/radaee/view/PDFVPage;II)V

    :cond_d
    add-int/lit8 v6, v2, 0x2

    .line 423
    :cond_e
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v7, v7

    if-ge v6, v7, :cond_17

    .line 425
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v6

    invoke-virtual {v7, v8}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    .line 426
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v7, v7, v6

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    invoke-virtual {v7, v8, v4, v4}, Lcom/radaee/view/PDFVPage;->DrawDIB(Lcom/radaee/pdf/DIB;II)V

    if-eqz v3, :cond_f

    if-nez v5, :cond_10

    .line 429
    :cond_f
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v6

    invoke-virtual {v3, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v3

    .line 430
    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v6

    invoke-virtual {v5, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v5

    .line 432
    :cond_10
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v7}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v7

    if-ne v7, v6, :cond_11

    .line 433
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v9, v9, v6

    invoke-virtual {v7, v8, v9, v4, v4}, Lcom/radaee/view/PDFVFinder;->find_draw_to_dib(Lcom/radaee/pdf/DIB;Lcom/radaee/view/PDFVPage;II)V

    :cond_11
    add-int/lit8 v7, v6, 0x1

    .line 435
    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aget-boolean v8, v8, v6

    if-eqz v8, :cond_15

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v8, v8

    if-ge v7, v8, :cond_15

    .line 437
    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v9, v9, v7

    invoke-virtual {v8, v9}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    .line 438
    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v7

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    invoke-virtual {v8, v9, v4, v4}, Lcom/radaee/view/PDFVPage;->DrawDIB(Lcom/radaee/pdf/DIB;II)V

    if-eqz v3, :cond_12

    if-nez v5, :cond_13

    .line 441
    :cond_12
    iget-object v3, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v7

    invoke-virtual {v3, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v3

    .line 442
    iget-object v5, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v7

    invoke-virtual {v5, v4, v4}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v5

    .line 444
    :cond_13
    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v8}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v8

    if-ne v8, v7, :cond_14

    .line 445
    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    iget-object v10, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v7, v10, v7

    invoke-virtual {v8, v9, v7, v4, v4}, Lcom/radaee/view/PDFVFinder;->find_draw_to_dib(Lcom/radaee/pdf/DIB;Lcom/radaee/view/PDFVPage;II)V

    :cond_14
    add-int/lit8 v7, v6, 0x2

    .line 448
    :cond_15
    sget-boolean v4, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz v4, :cond_16

    .line 449
    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_bmp:Landroid/graphics/Bitmap;

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    iget-object v10, v0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    iget v4, v0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    float-to-int v11, v4

    iget v4, v0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    float-to-int v12, v4

    iget v4, v0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    neg-int v13, v4

    iget v14, v0, Lcom/radaee/view/PDFViewCurl;->mBackSideClr:I

    invoke-static/range {v8 .. v14}, Lcom/radaee/pdf/Global;->DrawScroll(Landroid/graphics/Bitmap;Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/DIB;IIII)V

    goto :goto_3

    .line 451
    :cond_16
    iget-object v15, v0, Lcom/radaee/view/PDFViewCurl;->m_bmp:Landroid/graphics/Bitmap;

    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    iget-object v6, v0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    iget v8, v0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    float-to-int v8, v8

    iget v9, v0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    float-to-int v9, v9

    iget v10, v0, Lcom/radaee/view/PDFViewCurl;->m_hold_style:I

    iget v11, v0, Lcom/radaee/view/PDFViewCurl;->mBackSideClr:I

    move-object/from16 v16, v4

    move-object/from16 v17, v6

    move/from16 v18, v8

    move/from16 v19, v9

    move/from16 v20, v10

    move/from16 v21, v11

    invoke-static/range {v15 .. v21}, Lcom/radaee/pdf/Global;->DrawScroll(Landroid/graphics/Bitmap;Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/DIB;IIII)V

    :goto_3
    move v6, v7

    goto :goto_4

    .line 455
    :cond_17
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v7, v8}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 456
    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v7, v8, v4, v4}, Lcom/radaee/pdf/DIB;->DrawToBmp(Lcom/radaee/pdf/BMP;II)V

    .line 457
    sget-boolean v4, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz v4, :cond_18

    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v4}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 458
    :cond_18
    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v7}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 461
    :goto_4
    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v4, v4

    move v7, v6

    :goto_5
    if-ge v7, v4, :cond_19

    .line 464
    iget-object v8, v0, Lcom/radaee/view/PDFViewCurl;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v9, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v9, v9, v7

    invoke-virtual {v8, v9}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 468
    :cond_19
    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_bmp:Landroid/graphics/Bitmap;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v1, v4, v8, v8, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 469
    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v4, :cond_1c

    if-ltz v2, :cond_1c

    if-gez v6, :cond_1a

    .line 471
    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v6, v4

    :cond_1a
    :goto_6
    if-ge v2, v6, :cond_1b

    .line 474
    iget-object v4, v0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    iget-object v7, v0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v7, v7, v2

    invoke-interface {v4, v1, v7}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/PDFVPage;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_1b
    if-eqz v3, :cond_1c

    if-eqz v5, :cond_1c

    .line 478
    iget-object v2, v0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {v2, v1, v3, v5}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFSelecting(Landroid/graphics/Canvas;[I[I)V

    :cond_1c
    :goto_7
    return-void
.end method

.method protected vFindGoto()V
    .locals 1

    .line 512
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    return-void

    .line 513
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/radaee/view/PDFViewCurl;->vGotoPage(I)V

    return-void
.end method

.method protected vGetPage(II)I
    .locals 2

    .line 166
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    if-lez v0, :cond_5

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    if-gtz v0, :cond_0

    goto :goto_1

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_4

    .line 169
    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    if-le v0, v1, :cond_2

    .line 171
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    add-int/lit8 v0, v0, 0x1

    aget-object p1, p1, v0

    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result p1

    if-lt p2, p1, :cond_1

    .line 172
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    :goto_0
    add-int/lit8 p1, p1, 0x1

    return p1

    .line 174
    :cond_1
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    return p1

    .line 178
    :cond_2
    iget-object p2, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    add-int/lit8 v0, v0, 0x1

    aget-object p2, p2, v0

    invoke-virtual {p2}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result p2

    if-lt p1, p2, :cond_3

    .line 179
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    goto :goto_0

    .line 181
    :cond_3
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    return p1

    :cond_4
    return v1

    :cond_5
    :goto_1
    const/4 p1, -0x1

    return p1
.end method

.method public vGotoPage(I)V
    .locals 3

    .line 490
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz v0, :cond_4

    if-ltz p1, :cond_4

    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v0, v0

    if-lt p1, v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_3

    .line 495
    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_2

    add-int/lit8 v2, p1, -0x1

    if-ne v1, v2, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 502
    :cond_3
    :goto_1
    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    .line 503
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_4

    .line 505
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    .line 506
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFPageChanged(I)V

    :cond_4
    :goto_2
    return-void
.end method

.method protected vLayout()V
    .locals 15

    .line 46
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_16

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_page_gap:I

    if-le v0, v1, :cond_16

    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_page_gap:I

    if-gt v0, v1, :cond_0

    goto/16 :goto_8

    .line 47
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_docw:I

    .line 48
    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_doch:I

    .line 49
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/DIB;->CreateOrResize(II)V

    .line 50
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/DIB;->CreateOrResize(II)V

    .line 52
    iget-object v0, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 53
    iget-object v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v1, :cond_1

    .line 55
    new-array v1, v0, [Lcom/radaee/view/PDFVPage;

    iput-object v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    .line 56
    new-array v1, v0, [Z

    iput-object v1, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    .line 58
    :cond_1
    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v6, 0x1

    if-le v1, v2, :cond_b

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_15

    .line 62
    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v1

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v7, Lcom/radaee/view/PDFVPage;

    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v7, v8, v1}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v7, v2, v1

    .line 63
    :cond_2
    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v2

    .line 64
    iget-object v7, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    .line 67
    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aput-boolean v3, v8, v1

    cmpl-float v8, v2, v7

    if-lez v8, :cond_3

    add-int/lit8 v8, v0, -0x1

    if-ge v1, v8, :cond_3

    .line 70
    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v9, v1, 0x1

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    .line 71
    iget-object v10, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v10, v9}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    cmpl-float v10, v8, v9

    if-lez v10, :cond_4

    .line 72
    iget-object v10, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aput-boolean v6, v10, v1

    goto :goto_1

    :cond_3
    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 78
    :cond_4
    :goto_1
    iget v10, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v10, v10

    div-float/2addr v10, v2

    .line 79
    iget v11, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float v11, v11

    div-float/2addr v11, v7

    cmpl-float v12, v10, v11

    if-lez v12, :cond_5

    move v10, v11

    .line 81
    :cond_5
    iget-object v11, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aget-boolean v11, v11, v1

    if-eqz v11, :cond_a

    .line 83
    iget v11, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    add-int/lit8 v12, v1, 0x1

    if-ne v11, v12, :cond_6

    .line 84
    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    .line 85
    :cond_6
    iget v11, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v11, v11

    div-float/2addr v11, v8

    .line 86
    iget v13, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v13, v13

    div-float/2addr v13, v9

    cmpl-float v14, v10, v11

    if-lez v14, :cond_7

    move v10, v11

    :cond_7
    cmpl-float v11, v10, v13

    if-lez v11, :cond_8

    goto :goto_2

    :cond_8
    move v13, v10

    .line 90
    :goto_2
    iget v10, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v10, v10

    mul-float v2, v2, v13

    sub-float/2addr v10, v2

    div-float/2addr v10, v5

    float-to-int v2, v10

    .line 91
    iget v10, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float v10, v10

    add-float/2addr v7, v9

    mul-float v7, v7, v13

    sub-float/2addr v10, v7

    div-float/2addr v10, v5

    float-to-int v7, v10

    .line 92
    iget-object v9, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v9, v9, v1

    invoke-virtual {v9, v2, v7, v13}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 93
    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v2, v1

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetHeight()I

    move-result v1

    add-int/2addr v7, v1

    .line 96
    iget-object v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v12

    if-nez v1, :cond_9

    iget-object v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v2, Lcom/radaee/view/PDFVPage;

    iget-object v9, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v2, v9, v12}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v2, v1, v12

    .line 97
    :cond_9
    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v1, v1

    mul-float v8, v8, v13

    sub-float/2addr v1, v8

    div-float/2addr v1, v5

    float-to-int v1, v1

    .line 98
    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aput-boolean v6, v2, v12

    .line 99
    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v12

    invoke-virtual {v2, v1, v7, v13}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    move v1, v12

    goto :goto_3

    .line 103
    :cond_a
    iget v8, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v8, v8

    mul-float v2, v2, v10

    sub-float/2addr v8, v2

    div-float/2addr v8, v5

    float-to-int v2, v8

    .line 104
    iget v8, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float v8, v8

    mul-float v7, v7, v10

    sub-float/2addr v8, v7

    div-float/2addr v8, v5

    float-to-int v7, v8

    .line 105
    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v1

    invoke-virtual {v8, v2, v7, v10}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    :goto_3
    add-int/2addr v1, v6

    goto/16 :goto_0

    :cond_b
    const/4 v1, 0x0

    :goto_4
    if-ge v1, v0, :cond_15

    .line 113
    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v1

    if-nez v2, :cond_c

    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v7, Lcom/radaee/view/PDFVPage;

    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v7, v8, v1}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v7, v2, v1

    .line 114
    :cond_c
    iget-object v2, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v2

    .line 115
    iget-object v7, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v7

    .line 118
    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aput-boolean v3, v8, v1

    cmpl-float v8, v7, v2

    if-lez v8, :cond_d

    add-int/lit8 v8, v0, -0x1

    if-ge v1, v8, :cond_d

    .line 121
    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v9, v1, 0x1

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    .line 122
    iget-object v10, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v10, v9}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    cmpl-float v10, v9, v8

    if-lez v10, :cond_e

    .line 123
    iget-object v10, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aput-boolean v6, v10, v1

    goto :goto_5

    :cond_d
    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 129
    :cond_e
    :goto_5
    iget v10, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v10, v10

    div-float/2addr v10, v2

    .line 130
    iget v11, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float v11, v11

    div-float/2addr v11, v7

    cmpl-float v12, v10, v11

    if-lez v12, :cond_f

    move v10, v11

    .line 132
    :cond_f
    iget-object v11, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aget-boolean v11, v11, v1

    if-eqz v11, :cond_14

    .line 134
    iget v11, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    add-int/lit8 v12, v1, 0x1

    if-ne v11, v12, :cond_10

    .line 135
    iput v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    .line 136
    :cond_10
    iget v11, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v11, v11

    div-float/2addr v11, v8

    .line 137
    iget v13, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v13, v13

    div-float/2addr v13, v9

    cmpl-float v14, v10, v11

    if-lez v14, :cond_11

    move v10, v11

    :cond_11
    cmpl-float v11, v10, v13

    if-lez v11, :cond_12

    goto :goto_6

    :cond_12
    move v13, v10

    .line 141
    :goto_6
    iget v10, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v10, v10

    add-float/2addr v2, v8

    mul-float v2, v2, v13

    sub-float/2addr v10, v2

    div-float/2addr v10, v5

    float-to-int v2, v10

    .line 142
    iget v8, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float v8, v8

    mul-float v7, v7, v13

    sub-float/2addr v8, v7

    div-float/2addr v8, v5

    float-to-int v7, v8

    .line 143
    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v1

    invoke-virtual {v8, v2, v7, v13}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    .line 144
    iget-object v7, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v7, v1

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->GetWidth()I

    move-result v1

    add-int/2addr v2, v1

    .line 147
    iget-object v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, v12

    if-nez v1, :cond_13

    iget-object v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    new-instance v7, Lcom/radaee/view/PDFVPage;

    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {v7, v8, v12}, Lcom/radaee/view/PDFVPage;-><init>(Lcom/radaee/pdf/Document;I)V

    aput-object v7, v1, v12

    .line 148
    :cond_13
    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float v1, v1

    mul-float v9, v9, v13

    sub-float/2addr v1, v9

    div-float/2addr v1, v5

    float-to-int v1, v1

    .line 149
    iget-object v7, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    aput-boolean v6, v7, v12

    .line 150
    iget-object v7, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v7, v7, v12

    invoke-virtual {v7, v2, v1, v13}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    move v1, v12

    goto :goto_7

    .line 154
    :cond_14
    iget v8, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v8, v8

    mul-float v2, v2, v10

    sub-float/2addr v8, v2

    div-float/2addr v8, v5

    float-to-int v2, v8

    .line 155
    iget v8, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float v8, v8

    mul-float v7, v7, v10

    sub-float/2addr v8, v7

    div-float/2addr v8, v5

    float-to-int v7, v8

    .line 156
    iget-object v8, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v8, v8, v1

    invoke-virtual {v8, v2, v7, v10}, Lcom/radaee/view/PDFVPage;->SetRect(IIF)Z

    :goto_7
    add-int/2addr v1, v6

    goto/16 :goto_4

    .line 160
    :cond_15
    iget v0, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    div-int/lit8 v0, v0, 0x8

    int-to-float v0, v0

    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_stepx:F

    .line 161
    iput v4, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    :cond_16
    :goto_8
    return-void
.end method

.method protected vOnTimer(Ljava/lang/Object;)V
    .locals 7

    .line 283
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 285
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_8

    .line 286
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    return-void

    .line 289
    :cond_0
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    const/4 v2, 0x4

    if-ne p1, v2, :cond_6

    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_hold_dir:I

    if-eqz p1, :cond_6

    if-gez p1, :cond_4

    .line 293
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    cmpg-float p1, p1, v2

    if-gtz p1, :cond_2

    .line 295
    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    .line 296
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    aget-boolean p1, p1, v2

    if-eqz p1, :cond_1

    add-int/lit8 v2, v2, 0x2

    .line 297
    iput v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    goto :goto_0

    :cond_1
    add-int/2addr v2, v1

    .line 299
    iput v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    .line 300
    :goto_0
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_5

    .line 301
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    invoke-interface {p1, v1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFPageChanged(I)V

    goto :goto_1

    .line 305
    :cond_2
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_stepx:F

    sub-float/2addr p1, v1

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    .line 306
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_stepx:F

    mul-float v1, v1, v2

    add-float/2addr p1, v1

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    .line 307
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    float-to-double v1, p1

    const-wide v3, 0x3f1a36e2eb1c432dL    # 1.0E-4

    cmpg-double p1, v1, v3

    if-gez p1, :cond_3

    const/4 p1, 0x0

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    .line 308
    :cond_3
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    float-to-double v1, p1

    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-double v5, p1

    sub-double/2addr v5, v3

    cmpl-double p1, v1, v5

    if-lez p1, :cond_5

    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_h:I

    int-to-float p1, p1

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    goto :goto_1

    .line 313
    :cond_4
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_stepx:F

    add-float/2addr p1, v1

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    .line 314
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_stepy:F

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_stepx:F

    mul-float v1, v1, v2

    add-float/2addr p1, v1

    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdy:F

    .line 315
    iget p1, p0, Lcom/radaee/view/PDFViewCurl;->m_holdx:F

    iget v1, p0, Lcom/radaee/view/PDFViewCurl;->m_w:I

    int-to-float v1, v1

    cmpl-float p1, p1, v1

    if-ltz p1, :cond_5

    .line 316
    iput v0, p0, Lcom/radaee/view/PDFViewCurl;->m_status:I

    .line 318
    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_8

    .line 319
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    return-void

    .line 323
    :cond_6
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    aget-object p1, p1, v2

    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->IsFinished()Z

    move-result p1

    if-nez p1, :cond_7

    .line 325
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_8

    .line 326
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    return-void

    .line 329
    :cond_7
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    aget-boolean p1, p1, v2

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length p1, p1

    sub-int/2addr p1, v1

    if-ge v2, p1, :cond_8

    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget v2, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    add-int/2addr v2, v1

    aget-object p1, p1, v2

    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->IsFinished()Z

    move-result p1

    if-nez p1, :cond_8

    .line 331
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_8

    .line 332
    iget-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_8
    return-void
.end method

.method public vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V
    .locals 0

    .line 26
    invoke-super {p0, p1, p2, p3, p4}, Lcom/radaee/view/PDFView;->vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V

    const/4 p1, 0x0

    .line 27
    iput p1, p0, Lcom/radaee/view/PDFViewCurl;->m_pageno:I

    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_duals:[Z

    .line 29
    new-instance p1, Lcom/radaee/pdf/DIB;

    invoke-direct {p1}, Lcom/radaee/pdf/DIB;-><init>()V

    iput-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_dib1:Lcom/radaee/pdf/DIB;

    .line 30
    new-instance p1, Lcom/radaee/pdf/DIB;

    invoke-direct {p1}, Lcom/radaee/pdf/DIB;-><init>()V

    iput-object p1, p0, Lcom/radaee/view/PDFViewCurl;->m_dib2:Lcom/radaee/pdf/DIB;

    return-void
.end method

.method public vSetPos(Lcom/radaee/view/PDFView$PDFPos;II)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    .line 485
    :cond_0
    iget p1, p1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFViewCurl;->vGotoPage(I)V

    return-void
.end method
