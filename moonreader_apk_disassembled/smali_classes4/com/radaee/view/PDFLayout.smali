.class public abstract Lcom/radaee/view/PDFLayout;
.super Ljava/lang/Object;
.source "PDFLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/PDFLayout$LayoutListener;,
        Lcom/radaee/view/PDFLayout$PDFPos;
    }
.end annotation


# instance fields
.field public m_back_color:I

.field protected m_bmp:Landroid/graphics/Bitmap;

.field protected m_bmp_format:Landroid/graphics/Bitmap$Config;

.field protected m_cache_page1:I

.field protected m_cache_page2:I

.field private m_ctx:Landroid/content/Context;

.field private m_dbmp:Lcom/radaee/pdf/BMP;

.field protected m_disp_page1:I

.field protected m_disp_page2:I

.field protected m_doc:Lcom/radaee/pdf/Document;

.field protected m_finder:Lcom/radaee/view/VFinder;

.field public m_h:I

.field protected m_hand_ui:Landroid/os/Handler;

.field protected m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

.field public m_page_gap:I

.field public m_page_maxh:F

.field public m_page_maxw:F

.field protected m_pageno:I

.field public m_pages:[Lcom/radaee/view/VPage;

.field public m_scale:F

.field public m_scale_max:F

.field public m_scale_min:F

.field protected m_scales:[F

.field protected m_scales_min:[F

.field public m_scroller:Landroid/widget/Scroller;

.field public m_th:I

.field protected m_thread:Lcom/radaee/view/VThread;

.field public m_tw:I

.field public m_w:I

.field public m_zoom_level:F

.field public m_zoom_level_clip:F

.field protected m_zoom_page0:I

.field protected m_zoom_page1:I


# direct methods
.method protected constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    const/4 v0, 0x0

    .line 64
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    .line 65
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    .line 66
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    .line 67
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    .line 68
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    const/4 v1, 0x0

    .line 69
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    .line 70
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    .line 71
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_tw:I

    .line 72
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_th:I

    const/4 v2, 0x0

    .line 73
    iput v2, p0, Lcom/radaee/view/PDFLayout;->m_scale:F

    const/high16 v2, 0x3f800000    # 1.0f

    .line 74
    iput v2, p0, Lcom/radaee/view/PDFLayout;->m_scale_min:F

    .line 75
    iput v2, p0, Lcom/radaee/view/PDFLayout;->m_scale_max:F

    .line 76
    sget v2, Lcom/radaee/pdf/Global;->layoutZoomLevel:F

    iput v2, p0, Lcom/radaee/view/PDFLayout;->m_zoom_level:F

    .line 77
    sget v2, Lcom/radaee/pdf/Global;->layoutZoomLevelClip:F

    iput v2, p0, Lcom/radaee/view/PDFLayout;->m_zoom_level_clip:F

    .line 78
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    .line 79
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    .line 80
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_cache_page1:I

    .line 81
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_cache_page2:I

    const/4 v1, 0x4

    .line 82
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    .line 83
    sget v1, Lcom/radaee/pdf/Global;->readerViewBgColor:I

    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_back_color:I

    .line 86
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    .line 87
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    .line 88
    new-instance v1, Lcom/radaee/view/PDFLayout$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/radaee/view/PDFLayout$1;-><init>(Lcom/radaee/view/PDFLayout;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/radaee/view/PDFLayout;->m_hand_ui:Landroid/os/Handler;

    .line 122
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scales:[F

    .line 123
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scales_min:[F

    .line 177
    new-instance v0, Lcom/radaee/pdf/BMP;

    invoke-direct {v0}, Lcom/radaee/pdf/BMP;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    const/4 v0, -0x1

    .line 641
    iput v0, p0, Lcom/radaee/view/PDFLayout;->m_pageno:I

    .line 126
    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_ctx:Landroid/content/Context;

    .line 127
    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    return-void
.end method

.method private vDrawNormal(Landroid/graphics/Canvas;II)V
    .locals 8

    .line 203
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    goto/16 :goto_7

    .line 205
    :cond_0
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    .line 206
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    .line 207
    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_scale:F

    iget v4, p0, Lcom/radaee/view/PDFLayout;->m_zoom_level_clip:F

    iget v5, p0, Lcom/radaee/view/PDFLayout;->m_scale_min:F

    mul-float v4, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x1

    cmpl-float v3, v3, v4

    if-lez v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 209
    :goto_0
    iget v4, p0, Lcom/radaee/view/PDFLayout;->m_back_color:I

    invoke-virtual {v0, v4}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 210
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v4}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    :goto_1
    if-ge v1, v2, :cond_4

    .line 213
    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scales:[F

    aget v0, v0, v1

    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_scales_min:[F

    aget v4, v4, v1

    div-float/2addr v0, v4

    iget v4, p0, Lcom/radaee/view/PDFLayout;->m_zoom_level_clip:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    goto :goto_2

    :cond_3
    move v0, v3

    .line 214
    :goto_2
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    add-int/lit8 v7, v1, 0x1

    aget-object v1, v4, v1

    .line 215
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v1, v4, v0}, Lcom/radaee/view/VPage;->vClips(Lcom/radaee/pdf/VNPage$VNPageListener;Z)V

    .line 216
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v1, v0, v4, p2, p3}, Lcom/radaee/view/VPage;->vDraw(Lcom/radaee/pdf/VNPage$VNPageListener;Lcom/radaee/pdf/BMP;II)V

    move v1, v7

    goto :goto_1

    .line 218
    :cond_4
    sget-boolean p2, Lcom/radaee/pdf/Global;->dark_mode:Z

    const/4 p3, 0x0

    const/4 v0, 0x0

    if-eqz p2, :cond_8

    .line 220
    sget-boolean p2, Lcom/radaee/pdf/Global;->cacheEnabled:Z

    if-eqz p2, :cond_6

    .line 222
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, v1}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 223
    new-instance p2, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-direct {p2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 224
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    :goto_3
    if-ge v1, v2, :cond_5

    .line 226
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    add-int/lit8 v4, v1, 0x1

    aget-object v1, v3, v1

    .line 227
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v1, v3, p2}, Lcom/radaee/view/VPage;->vDrawStep1(Lcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;)Z

    .line 228
    invoke-virtual {v1}, Lcom/radaee/view/VPage;->vDrawEnd()V

    move v1, v4

    goto :goto_3

    .line 230
    :cond_5
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, v1}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    goto :goto_5

    .line 233
    :cond_6
    iget p2, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    :goto_4
    if-ge p2, v2, :cond_7

    .line 235
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    add-int/lit8 v3, p2, 0x1

    aget-object p2, v1, p2

    .line 236
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {p2, v1}, Lcom/radaee/view/VPage;->vDrawStep2(Lcom/radaee/pdf/BMP;)V

    .line 237
    invoke-virtual {p2}, Lcom/radaee/view/VPage;->vDrawEnd()V

    move p2, v3

    goto :goto_4

    .line 240
    :cond_7
    :goto_5
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {p2}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 241
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, v1}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 242
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2, v0, v0, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void

    .line 244
    :cond_8
    sget-boolean p2, Lcom/radaee/pdf/Global;->cacheEnabled:Z

    if-eqz p2, :cond_a

    .line 246
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, v1}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 247
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2, v0, v0, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 248
    iget p2, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    :goto_6
    if-ge p2, v2, :cond_9

    .line 250
    iget-object p3, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    add-int/lit8 v0, p2, 0x1

    aget-object p2, p3, p2

    .line 251
    iget-object p3, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p2, p3, p1}, Lcom/radaee/view/VPage;->vDrawStep1(Lcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;)Z

    .line 252
    invoke-virtual {p2}, Lcom/radaee/view/VPage;->vDrawEnd()V

    move p2, v0

    goto :goto_6

    :cond_9
    :goto_7
    return-void

    .line 256
    :cond_a
    iget p2, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    :goto_8
    if-ge p2, v2, :cond_b

    .line 258
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    add-int/lit8 v3, p2, 0x1

    aget-object p2, v1, p2

    .line 259
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {p2, v1}, Lcom/radaee/view/VPage;->vDrawStep2(Lcom/radaee/pdf/BMP;)V

    .line 260
    invoke-virtual {p2}, Lcom/radaee/view/VPage;->vDrawEnd()V

    move p2, v3

    goto :goto_8

    .line 263
    :cond_b
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, v1}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 264
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2, v0, v0, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private vDrawZoom(Landroid/graphics/Canvas;II)V
    .locals 5

    .line 180
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    .line 181
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    .line 182
    sget-boolean v2, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz v2, :cond_1

    .line 183
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_back_color:I

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 184
    new-instance v2, Landroid/graphics/Canvas;

    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-direct {v2, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    :goto_0
    if-ge v0, v1, :cond_0

    .line 186
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v3, v4, v2, p2, p3}, Lcom/radaee/view/VPage;->vDraw(Lcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 189
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    iget-object p3, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, p3}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 190
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {p2}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 191
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_dbmp:Lcom/radaee/pdf/BMP;

    iget-object p3, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, p3}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 192
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    const/4 p3, 0x0

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0, v0, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void

    .line 194
    :cond_1
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_back_color:I

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    :goto_1
    if-ge v0, v1, :cond_2

    .line 196
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v2, v3, p1, p2, p3}, Lcom/radaee/view/VPage;->vDraw(Lcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 835
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vClose()V

    .line 836
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public vClose()V
    .locals 5

    .line 480
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-nez v0, :cond_0

    goto :goto_1

    .line 481
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vScrollAbort()V

    .line 482
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 483
    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_end()V

    .line 484
    iput-object v1, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    .line 486
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    array-length v0, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 487
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v3, v3, v2

    if-eqz v3, :cond_2

    .line 488
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v3, v4}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 489
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v3, v3, v2

    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v3, v4}, Lcom/radaee/view/VPage;->vDestroy(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 491
    :cond_2
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v0}, Lcom/radaee/view/VThread;->destroy()V

    .line 492
    iput-object v1, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    .line 495
    iput-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    .line 496
    iput-object v1, p0, Lcom/radaee/view/PDFLayout;->m_scales:[F

    .line 497
    iput-object v1, p0, Lcom/radaee/view/PDFLayout;->m_scales_min:[F

    .line 498
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    .line 499
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 500
    iput-object v1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    :cond_3
    :goto_1
    return-void
.end method

.method public vDraw(Landroid/graphics/Canvas;Z)V
    .locals 5

    .line 277
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    goto :goto_2

    .line 278
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vFlushRange()V

    .line 279
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    .line 280
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    if-ltz v0, :cond_4

    if-ltz v1, :cond_4

    if-gt v1, v0, :cond_1

    goto :goto_2

    .line 282
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v0

    .line 283
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v2

    if-eqz p2, :cond_2

    .line 285
    invoke-direct {p0, p1, v0, v2}, Lcom/radaee/view/PDFLayout;->vDrawZoom(Landroid/graphics/Canvas;II)V

    goto :goto_0

    .line 286
    :cond_2
    invoke-direct {p0, p1, v0, v2}, Lcom/radaee/view/PDFLayout;->vDrawNormal(Landroid/graphics/Canvas;II)V

    .line 287
    :goto_0
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    if-eqz p2, :cond_3

    .line 288
    invoke-virtual {p2}, Lcom/radaee/view/VFinder;->find_get_page()I

    move-result p2

    .line 289
    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    if-lt p2, v3, :cond_3

    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    if-ge p2, v3, :cond_3

    .line 290
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object p2, v4, p2

    invoke-virtual {v3, p1, p2, v0, v2}, Lcom/radaee/view/VFinder;->find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/VPage;II)V

    .line 292
    :cond_3
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz p2, :cond_4

    .line 293
    iget p2, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    :goto_1
    if-ge p2, v1, :cond_4

    .line 295
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, p2

    invoke-interface {v0, p1, v2}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/VPage;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    return-void
.end method

.method public vFind(I)I
    .locals 3

    .line 584
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    .line 585
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0, p1}, Lcom/radaee/view/VFinder;->find_prepare(I)I

    move-result p1

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-ne p1, v2, :cond_2

    .line 587
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz p1, :cond_1

    .line 588
    invoke-interface {p1, v2}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnFound(Z)V

    .line 589
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vFindGoto()V

    return v0

    :cond_2
    if-nez p1, :cond_4

    .line 593
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz p1, :cond_3

    .line 594
    invoke-interface {p1, v0}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnFound(Z)V

    :cond_3
    return v1

    .line 597
    :cond_4
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {p1, v0}, Lcom/radaee/view/VThread;->start_find(Lcom/radaee/view/VFinder;)V

    return v2
.end method

.method public vFindEnd()V
    .locals 1

    .line 602
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-nez v0, :cond_0

    return-void

    .line 603
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_end()V

    return-void
.end method

.method protected vFindGoto()V
    .locals 12

    .line 558
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 559
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_get_page()I

    move-result v0

    if-ltz v0, :cond_b

    .line 560
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    goto/16 :goto_1

    .line 561
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v1

    .line 562
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v2

    .line 563
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v3}, Lcom/radaee/view/VFinder;->find_get_pos()[F

    move-result-object v3

    if-nez v3, :cond_2

    goto/16 :goto_1

    .line 565
    :cond_2
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v0

    const/4 v5, 0x0

    aget v6, v3, v5

    invoke-virtual {v4, v6}, Lcom/radaee/view/VPage;->ToDIBX(F)F

    move-result v4

    iget-object v6, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v6, v6, v0

    invoke-virtual {v6}, Lcom/radaee/view/VPage;->GetX()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v4, v6

    aput v4, v3, v5

    .line 566
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v0

    const/4 v6, 0x1

    aget v7, v3, v6

    invoke-virtual {v4, v7}, Lcom/radaee/view/VPage;->ToDIBY(F)F

    move-result v4

    iget-object v7, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v7, v7, v0

    invoke-virtual {v7}, Lcom/radaee/view/VPage;->GetY()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v4, v7

    aput v4, v3, v6

    .line 567
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v0

    const/4 v7, 0x2

    aget v8, v3, v7

    invoke-virtual {v4, v8}, Lcom/radaee/view/VPage;->ToDIBX(F)F

    move-result v4

    iget-object v8, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v8, v8, v0

    invoke-virtual {v8}, Lcom/radaee/view/VPage;->GetX()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v4, v8

    aput v4, v3, v7

    .line 568
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v0

    const/4 v8, 0x3

    aget v9, v3, v8

    invoke-virtual {v4, v9}, Lcom/radaee/view/VPage;->ToDIBY(F)F

    move-result v4

    iget-object v9, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v9, v9, v0

    invoke-virtual {v9}, Lcom/radaee/view/VPage;->GetY()I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v4, v9

    aput v4, v3, v8

    int-to-float v8, v1

    .line 569
    aget v9, v3, v5

    iget v10, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    div-int/lit8 v11, v10, 0x8

    int-to-float v11, v11

    sub-float v11, v9, v11

    cmpl-float v8, v8, v11

    if-lez v8, :cond_3

    float-to-int v1, v9

    div-int/lit8 v8, v10, 0x8

    sub-int/2addr v1, v8

    :cond_3
    int-to-float v8, v1

    .line 570
    aget v7, v3, v7

    mul-int/lit8 v9, v10, 0x7

    div-int/lit8 v9, v9, 0x8

    int-to-float v9, v9

    sub-float v9, v7, v9

    cmpg-float v8, v8, v9

    if-gez v8, :cond_4

    float-to-int v1, v7

    mul-int/lit8 v7, v10, 0x7

    div-int/lit8 v7, v7, 0x8

    sub-int/2addr v1, v7

    :cond_4
    int-to-float v7, v2

    .line 571
    aget v3, v3, v6

    iget v6, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    div-int/lit8 v8, v6, 0x8

    int-to-float v8, v8

    sub-float v8, v3, v8

    cmpl-float v7, v7, v8

    if-lez v7, :cond_5

    float-to-int v2, v3

    div-int/lit8 v3, v6, 0x8

    sub-int/2addr v2, v3

    :cond_5
    int-to-float v3, v2

    mul-int/lit8 v7, v6, 0x7

    .line 572
    div-int/lit8 v7, v7, 0x8

    int-to-float v7, v7

    sub-float v7, v4, v7

    cmpg-float v3, v3, v7

    if-gez v3, :cond_6

    float-to-int v2, v4

    mul-int/lit8 v3, v6, 0x7

    div-int/lit8 v3, v3, 0x8

    sub-int/2addr v2, v3

    .line 573
    :cond_6
    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_tw:I

    sub-int v4, v3, v10

    if-le v1, v4, :cond_7

    sub-int v1, v3, v10

    :cond_7
    if-gez v1, :cond_8

    const/4 v1, 0x0

    .line 575
    :cond_8
    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_th:I

    sub-int v4, v3, v6

    if-le v2, v4, :cond_9

    sub-int v2, v3, v6

    :cond_9
    if-gez v2, :cond_a

    goto :goto_0

    :cond_a
    move v5, v2

    .line 577
    :goto_0
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vScrollAbort()V

    .line 578
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2, v1}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 579
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1, v5}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 580
    instance-of v1, p0, Lcom/radaee/view/PDFLayoutDual;

    if-eqz v1, :cond_b

    invoke-virtual {p0, v0}, Lcom/radaee/view/PDFLayout;->vGotoPage(I)V

    :cond_b
    :goto_1
    return-void
.end method

.method public vFindStart(Ljava/lang/String;ZZ)V
    .locals 1

    const/4 v0, 0x0

    .line 547
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/radaee/view/PDFLayout;->vFindStart(Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public vFindStart(Ljava/lang/String;ZZZ)V
    .locals 9

    .line 551
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-nez v0, :cond_0

    return-void

    .line 552
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    div-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPage(II)I

    move-result v4

    .line 553
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    invoke-virtual {v0}, Lcom/radaee/view/VFinder;->find_end()V

    .line 554
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    move-object v5, p1

    move v6, p2

    move v7, p3

    move v8, p4

    invoke-virtual/range {v2 .. v8}, Lcom/radaee/view/VFinder;->find_start(Lcom/radaee/pdf/Document;ILjava/lang/String;ZZZ)V

    return-void
.end method

.method public vFling(IIFFFF)Z
    .locals 9

    .line 633
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v1

    .line 634
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v2

    .line 635
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 636
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 637
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    neg-float p1, p5

    float-to-int v3, p1

    neg-float p1, p6

    float-to-int v4, p1

    iget p1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    neg-int v5, p1

    iget v6, p0, Lcom/radaee/view/PDFLayout;->m_tw:I

    iget p1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    neg-int v7, p1

    iget v8, p0, Lcom/radaee/view/PDFLayout;->m_th:I

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    return p2
.end method

.method protected vFlushCacheRange()V
    .locals 11

    .line 645
    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scales:[F

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_pageno:I

    aget v0, v0, v1

    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_scales_min:[F

    aget v1, v2, v1

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_scale:F

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_scale_min:F

    :goto_0
    div-float/2addr v0, v1

    .line 646
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    neg-int v1, v1

    int-to-float v1, v1

    mul-float v1, v1, v0

    float-to-int v1, v1

    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    neg-int v2, v2

    int-to-float v2, v2

    mul-float v2, v2, v0

    float-to-int v2, v2

    invoke-virtual {p0, v1, v2}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v1

    .line 647
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    int-to-float v3, v2

    mul-float v3, v3, v0

    float-to-int v3, v3

    add-int/2addr v2, v3

    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    int-to-float v4, v3

    mul-float v4, v4, v0

    float-to-int v0, v4

    add-int/2addr v3, v0

    invoke-virtual {p0, v2, v3}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v0

    if-eqz v1, :cond_e

    if-nez v0, :cond_1

    goto/16 :goto_b

    .line 649
    :cond_1
    iget v2, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    .line 650
    iget v3, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-ltz v2, :cond_7

    if-ltz v3, :cond_7

    if-le v2, v3, :cond_2

    goto :goto_1

    :cond_2
    move v10, v3

    move v3, v2

    move v2, v10

    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 658
    iget v4, p0, Lcom/radaee/view/PDFLayout;->m_cache_page1:I

    if-ge v4, v3, :cond_4

    .line 661
    iget v5, p0, Lcom/radaee/view/PDFLayout;->m_cache_page2:I

    if-le v3, v5, :cond_3

    goto :goto_2

    :cond_3
    move v5, v3

    :goto_2
    if-ge v4, v5, :cond_4

    .line 663
    iget-object v6, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v6, v6, v4

    .line 665
    iget-object v7, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v6, v7}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 669
    :cond_4
    iget v4, p0, Lcom/radaee/view/PDFLayout;->m_cache_page2:I

    if-le v4, v2, :cond_6

    .line 672
    iget v5, p0, Lcom/radaee/view/PDFLayout;->m_cache_page1:I

    if-ge v2, v5, :cond_5

    goto :goto_3

    :cond_5
    move v5, v2

    :goto_3
    if-ge v5, v4, :cond_6

    .line 674
    iget-object v6, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v6, v6, v5

    .line 676
    iget-object v7, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v6, v7}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_6
    move v10, v3

    move v3, v2

    move v2, v10

    goto :goto_5

    .line 681
    :cond_7
    iget v4, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    .line 682
    iget v5, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    :goto_4
    if-ge v4, v5, :cond_8

    .line 684
    iget-object v6, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v6, v6, v4

    .line 686
    iget-object v7, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v6, v7}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 690
    :cond_8
    :goto_5
    iput v2, p0, Lcom/radaee/view/PDFLayout;->m_cache_page1:I

    .line 691
    iput v3, p0, Lcom/radaee/view/PDFLayout;->m_cache_page2:I

    .line 692
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_pageno:I

    add-int/lit8 v3, v2, 0x1

    .line 695
    :goto_6
    iget v4, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-le v2, v4, :cond_9

    iget v4, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-ge v3, v4, :cond_9

    .line 696
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v5, v4, v2

    .line 697
    aget-object v4, v4, v3

    .line 700
    iget-object v6, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v5, v6}, Lcom/radaee/view/VPage;->vCacheStart1(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 701
    iget-object v5, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v4, v5}, Lcom/radaee/view/VPage;->vCacheStart1(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 705
    :cond_9
    :goto_7
    iget v4, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-lt v2, v4, :cond_a

    .line 706
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v2

    .line 708
    iget-object v5, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v4, v5}, Lcom/radaee/view/VPage;->vCacheStart1(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_7

    .line 711
    :cond_a
    :goto_8
    iget v2, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-ge v3, v2, :cond_b

    .line 712
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, v3

    .line 714
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v2, v4}, Lcom/radaee/view/VPage;->vCacheStart1(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 718
    :cond_b
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    iget v3, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    aget-object v4, v2, v3

    .line 719
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    iget v3, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    aget-object v2, v2, v3

    if-ne v4, v2, :cond_c

    .line 721
    iget-object v5, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    iget v6, v1, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    iget v7, v1, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    iget v8, v0, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    iget v9, v0, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    invoke-virtual/range {v4 .. v9}, Lcom/radaee/view/VPage;->vCacheStart(Lcom/radaee/pdf/VNPage$VNPageListener;FFFF)V

    return-void

    .line 723
    :cond_c
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    iget v5, v0, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    iget v6, v0, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    invoke-virtual {v2, v3, v5, v6}, Lcom/radaee/view/VPage;->vCacheStart2(Lcom/radaee/pdf/VNPage$VNPageListener;FF)V

    .line 724
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    iget v3, v1, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    iget v5, v1, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    invoke-virtual {v4, v2, v3, v5}, Lcom/radaee/view/VPage;->vCacheStart0(Lcom/radaee/pdf/VNPage$VNPageListener;FF)V

    .line 725
    iget v2, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    iget v3, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-le v2, v3, :cond_d

    .line 726
    iget v1, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    :goto_9
    add-int/lit8 v1, v1, 0x1

    iget v2, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-ge v1, v2, :cond_e

    .line 727
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, v1

    .line 728
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v2, v3}, Lcom/radaee/view/VPage;->vCacheStart1(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    goto :goto_9

    .line 731
    :cond_d
    iget v0, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    :goto_a
    add-int/lit8 v0, v0, 0x1

    iget v2, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-ge v0, v2, :cond_e

    .line 732
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, v0

    .line 733
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v2, v3}, Lcom/radaee/view/VPage;->vCacheStart1(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    goto :goto_a

    :cond_e
    :goto_b
    return-void
.end method

.method protected vFlushRange()V
    .locals 7

    const/4 v0, 0x0

    .line 741
    :try_start_0
    invoke-virtual {p0, v0, v0}, Lcom/radaee/view/PDFLayout;->vGetPage(II)I

    move-result v0

    .line 742
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    invoke-virtual {p0, v1, v2}, Lcom/radaee/view/PDFLayout;->vGetPage(II)I

    move-result v1

    if-ltz v0, :cond_5

    if-ltz v1, :cond_5

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v6, v1

    move v1, v0

    move v0, v6

    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 750
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    if-ge v2, v1, :cond_2

    .line 753
    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    if-le v1, v3, :cond_1

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    if-ge v2, v3, :cond_2

    .line 755
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v2

    .line 756
    iget-object v5, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v4, v5}, Lcom/radaee/view/VPage;->vEndPage(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 760
    :cond_2
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    if-le v2, v0, :cond_4

    .line 763
    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    if-ge v0, v3, :cond_3

    goto :goto_2

    :cond_3
    move v3, v0

    :goto_2
    if-ge v3, v2, :cond_4

    .line 765
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v3

    .line 766
    iget-object v5, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v4, v5}, Lcom/radaee/view/VPage;->vEndPage(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_4
    move v6, v1

    move v1, v0

    move v0, v6

    goto :goto_4

    .line 771
    :cond_5
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    .line 772
    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    :goto_3
    if-ge v2, v3, :cond_6

    .line 774
    iget-object v4, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v2

    .line 775
    iget-object v5, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v4, v5}, Lcom/radaee/view/VPage;->vEndPage(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 779
    :cond_6
    :goto_4
    iput v0, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    .line 780
    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    .line 781
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    div-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPage(II)I

    move-result v0

    if-ltz v0, :cond_7

    .line 782
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz v1, :cond_7

    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_pageno:I

    if-eq v0, v2, :cond_7

    .line 783
    iput v0, p0, Lcom/radaee/view/PDFLayout;->m_pageno:I

    .line 784
    invoke-interface {v1, v0}, Lcom/radaee/view/PDFLayout$LayoutListener;->OnPageChanged(I)V

    .line 786
    :cond_7
    sget-boolean v0, Lcom/radaee/pdf/Global;->cacheEnabled:Z

    if-eqz v0, :cond_8

    .line 787
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vFlushCacheRange()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 789
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_8
    return-void
.end method

.method public final vGetHeight()I
    .locals 1

    .line 804
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    return v0
.end method

.method public final vGetMaxScale()F
    .locals 1

    .line 830
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_scale_max:F

    return v0
.end method

.method public final vGetMinScale()F
    .locals 3

    .line 822
    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scales_min:[F

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_pageno:I

    const/4 v2, -0x1

    if-le v1, v2, :cond_0

    aget v0, v0, v1

    return v0

    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_scale_min:F

    return v0
.end method

.method public abstract vGetPage(II)I
.end method

.method public final vGetPage(I)Lcom/radaee/view/VPage;
    .locals 2

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 338
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-le p1, v1, :cond_1

    array-length p1, v0

    add-int/lit8 p1, p1, -0x1

    .line 339
    :cond_1
    aget-object p1, v0, p1

    return-object p1
.end method

.method public vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;
    .locals 3

    .line 343
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    const/4 v1, 0x0

    if-lez v0, :cond_2

    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    if-gtz v0, :cond_0

    goto :goto_0

    .line 344
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/radaee/view/PDFLayout;->vGetPage(II)I

    move-result v0

    if-gez v0, :cond_1

    return-object v1

    .line 346
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v1

    add-int/2addr p1, v1

    .line 347
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v1

    add-int/2addr p2, v1

    .line 348
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v1, v1, v0

    .line 349
    new-instance v2, Lcom/radaee/view/PDFLayout$PDFPos;

    invoke-direct {v2}, Lcom/radaee/view/PDFLayout$PDFPos;-><init>()V

    .line 350
    invoke-virtual {v1, p1}, Lcom/radaee/view/VPage;->GetPDFX(I)F

    move-result p1

    iput p1, v2, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    .line 351
    invoke-virtual {v1, p2}, Lcom/radaee/view/VPage;->GetPDFY(I)F

    move-result p1

    iput p1, v2, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    .line 352
    iput v0, v2, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    return-object v2

    :cond_2
    :goto_0
    return-object v1
.end method

.method public final vGetScale()F
    .locals 3

    .line 826
    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scales:[F

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_pageno:I

    const/4 v2, -0x1

    if-le v1, v2, :cond_0

    aget v0, v0, v1

    return v0

    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_scale:F

    return v0
.end method

.method public final vGetTHeight()I
    .locals 1

    .line 818
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_th:I

    return v0
.end method

.method public final vGetTWidth()I
    .locals 1

    .line 811
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_tw:I

    return v0
.end method

.method public final vGetWidth()I
    .locals 1

    .line 797
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    return v0
.end method

.method public final vGetX()I
    .locals 4

    .line 607
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    .line 608
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_tw:I

    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    sub-int v3, v1, v2

    if-le v0, v3, :cond_0

    sub-int v0, v1, v2

    :cond_0
    if-gez v0, :cond_1

    const/4 v0, 0x0

    :cond_1
    return v0
.end method

.method public final vGetY()I
    .locals 4

    .line 620
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    .line 621
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_th:I

    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    sub-int v3, v1, v2

    if-le v0, v3, :cond_0

    sub-int v0, v1, v2

    :cond_0
    if-gez v0, :cond_1

    const/4 v0, 0x0

    :cond_1
    return v0
.end method

.method public final vGetZoom()F
    .locals 3

    .line 525
    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_pageno:I

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_scales:[F

    array-length v2, v1

    if-ge v0, v2, :cond_0

    aget v1, v1, v0

    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_scales_min:[F

    aget v0, v2, v0

    div-float/2addr v1, v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_scale:F

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_scale_min:F

    div-float v1, v0, v1

    .line 526
    :goto_0
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    return v0

    :cond_1
    return v1
.end method

.method public vGotoPage(I)V
    .locals 5

    .line 365
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-eqz v0, :cond_5

    if-ltz p1, :cond_5

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_1

    .line 366
    :cond_0
    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetX()I

    move-result v0

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    int-to-float v0, v0

    .line 367
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object p1, v1, p1

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetY()I

    move-result p1

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr p1, v1

    int-to-float p1, p1

    .line 368
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_tw:I

    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    sub-int v3, v1, v2

    int-to-float v3, v3

    cmpl-float v3, v0, v3

    if-lez v3, :cond_1

    sub-int/2addr v1, v2

    int-to-float v0, v1

    :cond_1
    const/4 v1, 0x0

    cmpg-float v2, v0, v1

    if-gez v2, :cond_2

    const/4 v0, 0x0

    .line 370
    :cond_2
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_th:I

    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    sub-int v4, v2, v3

    int-to-float v4, v4

    cmpl-float v4, p1, v4

    if-lez v4, :cond_3

    sub-int/2addr v2, v3

    int-to-float p1, v2

    :cond_3
    cmpg-float v2, p1, v1

    if-gez v2, :cond_4

    goto :goto_0

    :cond_4
    move v1, p1

    .line 372
    :goto_0
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 373
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    float-to-int v0, v1

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 374
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_5
    :goto_1
    return-void
.end method

.method public abstract vLayout()V
.end method

.method public vMoveEnd()V
    .locals 0

    return-void
.end method

.method public vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFLayout$LayoutListener;)V
    .locals 8

    if-nez p1, :cond_0

    goto/16 :goto_2

    .line 449
    :cond_0
    invoke-virtual {p1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    if-gtz v0, :cond_1

    goto/16 :goto_2

    .line 451
    :cond_1
    iput-object p2, p0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    .line 452
    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    .line 453
    invoke-virtual {p1}, Lcom/radaee/pdf/Document;->GetPagesMaxSize()[F

    move-result-object p1

    const/4 p2, 0x0

    .line 454
    aget v1, p1, p2

    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_page_maxw:F

    const/4 v1, 0x1

    .line 455
    aget p1, p1, v1

    iput p1, p0, Lcom/radaee/view/PDFLayout;->m_page_maxh:F

    .line 456
    new-instance p1, Lcom/radaee/view/VFinder;

    invoke-direct {p1}, Lcom/radaee/view/VFinder;-><init>()V

    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_finder:Lcom/radaee/view/VFinder;

    .line 457
    new-array p1, v0, [Lcom/radaee/view/VPage;

    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    .line 458
    new-instance p1, Lcom/radaee/view/VThread;

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_hand_ui:Landroid/os/Handler;

    invoke-direct {p1, v1}, Lcom/radaee/view/VThread;-><init>(Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    .line 459
    invoke-virtual {p1}, Lcom/radaee/view/VThread;->start()V

    .line 462
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 463
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 464
    iget p1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    if-lez p1, :cond_5

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    if-lez v1, :cond_5

    .line 465
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    const/4 p1, 0x0

    .line 466
    iput p1, p0, Lcom/radaee/view/PDFLayout;->m_scale:F

    .line 467
    iget p1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    if-le p1, v1, :cond_2

    goto :goto_0

    :cond_2
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    sub-int v1, p1, v1

    :goto_0
    move v5, v1

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v0, :cond_4

    .line 469
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object p1, p1, v4

    if-eqz p1, :cond_3

    .line 470
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p1, p2}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 471
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object p1, p1, v4

    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p1, p2}, Lcom/radaee/view/VPage;->vDestroy(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 473
    :cond_3
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    new-instance v2, Lcom/radaee/view/VPage;

    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v7, p0, Lcom/radaee/view/PDFLayout;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    move v6, v5

    invoke-direct/range {v2 .. v7}, Lcom/radaee/view/VPage;-><init>(Lcom/radaee/pdf/Document;IIILandroid/graphics/Bitmap$Config;)V

    aput-object v2, p1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 475
    :cond_4
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vLayout()V

    :cond_5
    :goto_2
    return-void
.end method

.method public vRenderAsync(Lcom/radaee/view/VPage;)V
    .locals 7

    .line 326
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 327
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p1, v0}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 328
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vFlushCacheRange()V

    .line 329
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetX()I

    move-result v0

    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v1

    sub-int v3, v0, v1

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetY()I

    move-result v0

    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v1

    sub-int v4, v0, v1

    iget v5, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    iget v6, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/view/VPage;->vRenderAsync(Lcom/radaee/pdf/VNPage$VNPageListener;IIII)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final vRenderFinished()Z
    .locals 4

    .line 302
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    .line 303
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    const/4 v2, 0x1

    if-ltz v0, :cond_2

    if-gez v1, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    if-ge v0, v1, :cond_2

    .line 306
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/radaee/view/VPage;->vFinished()Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v2
.end method

.method public vRenderSync(Lcom/radaee/view/VPage;)V
    .locals 7

    .line 313
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 314
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p1, v0}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 315
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vFlushCacheRange()V

    .line 316
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v0}, Lcom/radaee/view/VThread;->wait_pending()V

    .line 317
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetX()I

    move-result v0

    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v1

    sub-int v3, v0, v1

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetY()I

    move-result v0

    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v1

    sub-int v4, v0, v1

    iget v5, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    iget v6, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/view/VPage;->vRenderSync(Lcom/radaee/pdf/VNPage$VNPageListener;IIII)V

    :cond_1
    :goto_0
    return-void
.end method

.method public vResize(II)V
    .locals 8

    if-lez p1, :cond_7

    if-gtz p2, :cond_0

    goto/16 :goto_2

    .line 138
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    if-ne p1, v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    if-ne p2, v0, :cond_1

    goto/16 :goto_2

    .line 139
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-nez v0, :cond_2

    goto/16 :goto_2

    .line 140
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vScrollAbort()V

    .line 141
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v0

    .line 142
    iput p1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    .line 143
    iput p2, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    .line 144
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 145
    :cond_3
    iget p1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    iget p2, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    .line 146
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    array-length p1, p1

    .line 147
    iget p2, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    if-le p2, v1, :cond_4

    goto :goto_0

    :cond_4
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    sub-int v1, p2, v1

    :goto_0
    move v5, v1

    const/4 p2, 0x0

    const/4 v4, 0x0

    :goto_1
    if-ge v4, p1, :cond_6

    .line 149
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object p2, p2, v4

    if-eqz p2, :cond_5

    .line 150
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p2, v1}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 151
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object p2, p2, v4

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p2, v1}, Lcom/radaee/view/VPage;->vDestroy(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 153
    :cond_5
    iget-object p2, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    new-instance v2, Lcom/radaee/view/VPage;

    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v7, p0, Lcom/radaee/view/PDFLayout;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    move v6, v5

    invoke-direct/range {v2 .. v7}, Lcom/radaee/view/VPage;-><init>(Lcom/radaee/pdf/Document;IIILandroid/graphics/Bitmap$Config;)V

    aput-object v2, p2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_6
    const/4 p1, 0x0

    .line 155
    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scales:[F

    .line 156
    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scales_min:[F

    .line 157
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vLayout()V

    .line 158
    iget p1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    div-int/lit8 p1, p1, 0x2

    iget p2, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    div-int/lit8 p2, p2, 0x2

    invoke-virtual {p0, p1, p2, v0}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    :cond_7
    :goto_2
    return-void
.end method

.method public final vScrollAbort()V
    .locals 2

    .line 162
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_listener:Lcom/radaee/view/PDFLayout$LayoutListener;

    if-eqz v0, :cond_0

    .line 164
    new-instance v0, Landroid/widget/Scroller;

    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 165
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 166
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 167
    iput-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    .line 168
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_0
    return-void
.end method

.method public final vScrollCompute()Z
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public vScrolltoPage(I)V
    .locals 6

    .line 378
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    if-eqz v0, :cond_5

    if-ltz p1, :cond_5

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_1

    .line 379
    :cond_0
    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetX()I

    move-result v0

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    int-to-float v0, v0

    .line 380
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object p1, v1, p1

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetY()I

    move-result p1

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr p1, v1

    int-to-float p1, p1

    .line 381
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_tw:I

    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    sub-int v3, v1, v2

    int-to-float v3, v3

    cmpl-float v3, v0, v3

    if-lez v3, :cond_1

    sub-int/2addr v1, v2

    int-to-float v0, v1

    :cond_1
    const/4 v1, 0x0

    cmpg-float v2, v0, v1

    if-gez v2, :cond_2

    const/4 v0, 0x0

    .line 383
    :cond_2
    iget v2, p0, Lcom/radaee/view/PDFLayout;->m_th:I

    iget v3, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    sub-int v4, v2, v3

    int-to-float v4, v4

    cmpl-float v4, p1, v4

    if-lez v4, :cond_3

    sub-int/2addr v2, v3

    int-to-float p1, v2

    :cond_3
    cmpg-float v2, p1, v1

    if-gez v2, :cond_4

    goto :goto_0

    :cond_4
    move v1, p1

    .line 385
    :goto_0
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->getCurrX()I

    move-result p1

    int-to-float p1, p1

    .line 386
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    int-to-float v2, v2

    .line 387
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    float-to-int v4, p1

    float-to-int v5, v2

    sub-float/2addr v0, p1

    float-to-int p1, v0

    sub-float/2addr v1, v2

    float-to-int v0, v1

    invoke-virtual {v3, v4, v5, p1, v0}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 388
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    :cond_5
    :goto_1
    return-void
.end method

.method public vSetBackColor(I)V
    .locals 0

    .line 505
    iput p1, p0, Lcom/radaee/view/PDFLayout;->m_back_color:I

    return-void
.end method

.method public vSetBmpFormat(Landroid/graphics/Bitmap$Config;)V
    .locals 2

    .line 516
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    if-eq v0, p1, :cond_1

    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 517
    :cond_0
    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    .line 518
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 519
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 520
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    invoke-static {v0, v1, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/PDFLayout;->m_bmp:Landroid/graphics/Bitmap;

    :cond_1
    :goto_0
    return-void
.end method

.method public vSetPageGap(I)V
    .locals 0

    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    shr-int/lit8 p1, p1, 0x1

    shl-int/lit8 p1, p1, 0x1

    .line 511
    iput p1, p0, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    .line 512
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vLayout()V

    return-void
.end method

.method public vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V
    .locals 2

    if-nez p3, :cond_0

    return-void

    .line 358
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    iget v1, p3, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    aget-object v0, v0, v1

    .line 359
    iget v1, p3, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    invoke-virtual {v0, v1}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result v1

    sub-int/2addr v1, p1

    invoke-virtual {p0, v1}, Lcom/radaee/view/PDFLayout;->vSetX(I)V

    .line 360
    iget p1, p3, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    invoke-virtual {v0, p1}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result p1

    sub-int/2addr p1, p2

    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFLayout;->vSetY(I)V

    .line 361
    iget-object p1, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    return-void
.end method

.method public vSetX(I)V
    .locals 3

    .line 614
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_tw:I

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int p1, v0, v1

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 616
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalX(I)V

    return-void
.end method

.method public vSetY(I)V
    .locals 3

    .line 627
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_th:I

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int p1, v0, v1

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 629
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalY(I)V

    return-void
.end method

.method public vZoomConfirmed()V
    .locals 7

    .line 435
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page0:I

    .line 436
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v3

    .line 437
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v4

    .line 438
    :goto_0
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page1:I

    if-ge v0, v1, :cond_0

    .line 439
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_thread:Lcom/radaee/view/VThread;

    iget v5, p0, Lcom/radaee/view/PDFLayout;->m_w:I

    iget v6, p0, Lcom/radaee/view/PDFLayout;->m_h:I

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/view/VPage;->vZoomConfirmed(Lcom/radaee/pdf/VNPage$VNPageListener;IIII)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public vZoomEnd()Z
    .locals 5

    .line 413
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page0:I

    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page1:I

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lt v0, v1, :cond_0

    .line 414
    iput v3, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page0:I

    .line 415
    iput v2, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page1:I

    return v4

    .line 419
    :cond_0
    :goto_0
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page1:I

    if-ge v0, v1, :cond_2

    .line 420
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->vFinished()Z

    move-result v1

    if-nez v1, :cond_1

    return v3

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 424
    :cond_2
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page0:I

    .line 425
    :goto_1
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page1:I

    if-ge v0, v1, :cond_3

    .line 426
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->vZoomEnd()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 429
    :cond_3
    iput v3, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page0:I

    .line 430
    iput v2, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page1:I

    return v4
.end method

.method public vZoomSet(IILcom/radaee/view/PDFLayout$PDFPos;F)V
    .locals 5

    .line 532
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_scale_min:F

    mul-float v0, v0, p4

    iput v0, p0, Lcom/radaee/view/PDFLayout;->m_scale:F

    .line 533
    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v0, :cond_2

    .line 534
    iget-object v0, p0, Lcom/radaee/view/PDFLayout;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 536
    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_scales_min:[F

    aget v2, v2, v1

    mul-float v3, p4, v2

    cmpg-float v4, v3, v2

    if-gez v4, :cond_0

    goto :goto_1

    :cond_0
    move v2, v3

    .line 538
    :goto_1
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetMaxScale()F

    move-result v3

    cmpl-float v3, v2, v3

    if-lez v3, :cond_1

    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vGetMaxScale()F

    move-result v2

    .line 539
    :cond_1
    iget-object v3, p0, Lcom/radaee/view/PDFLayout;->m_scales:[F

    aput v2, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 542
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vLayout()V

    .line 543
    invoke-virtual {p0, p1, p2, p3}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    return-void
.end method

.method public vZoomStart()V
    .locals 3

    .line 398
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vFlushRange()V

    .line 399
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    if-ltz v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    if-gez v0, :cond_0

    goto :goto_1

    .line 402
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/PDFLayout;->vScrollAbort()V

    .line 403
    iget v0, p0, Lcom/radaee/view/PDFLayout;->m_disp_page1:I

    iput v0, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page0:I

    .line 404
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_disp_page2:I

    iput v1, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page1:I

    .line 406
    :goto_0
    iget v1, p0, Lcom/radaee/view/PDFLayout;->m_zoom_page1:I

    if-ge v0, v1, :cond_1

    .line 407
    iget-object v1, p0, Lcom/radaee/view/PDFLayout;->m_pages:[Lcom/radaee/view/VPage;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/radaee/view/PDFLayout;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v1, v2}, Lcom/radaee/view/VPage;->vZoomStart(Landroid/graphics/Bitmap$Config;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method
