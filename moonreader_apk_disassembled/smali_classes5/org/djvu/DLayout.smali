.class public abstract Lorg/djvu/DLayout;
.super Ljava/lang/Object;
.source "DLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/djvu/DLayout$LayoutListener;,
        Lorg/djvu/DLayout$DjvuPos;
    }
.end annotation


# static fields
.field public static fling_dis:F = 1.0f

.field public static fling_speed:F = 0.2f


# instance fields
.field public def_view:I

.field lockedImages:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public m_back_color:I

.field private m_ctx:Landroid/content/Context;

.field protected m_disp_page1:I

.field protected m_disp_page2:I

.field protected m_doc:Lorg/djvu/DDocument;

.field public m_h:I

.field protected m_listener:Lorg/djvu/DLayout$LayoutListener;

.field public m_page_gap:I

.field public m_page_maxh:F

.field public m_page_maxw:F

.field public m_pageno:I

.field public m_pages:[Lorg/djvu/VDPage;

.field public m_scale:F

.field public m_scale_max:F

.field public m_scale_min:F

.field public m_scroller:Landroid/widget/Scroller;

.field public m_th:I

.field public m_tw:I

.field public m_w:I

.field public m_zoom_level:F

.field public m_zoom_level_clip:F

.field protected m_zoom_page0:I

.field protected m_zoom_page1:I

.field public vert:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    .line 36
    iput-object v0, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    const/4 v1, 0x0

    .line 37
    iput v1, p0, Lorg/djvu/DLayout;->m_w:I

    .line 38
    iput v1, p0, Lorg/djvu/DLayout;->m_h:I

    .line 39
    iput v1, p0, Lorg/djvu/DLayout;->m_tw:I

    .line 40
    iput v1, p0, Lorg/djvu/DLayout;->m_th:I

    const/4 v2, 0x0

    .line 41
    iput v2, p0, Lorg/djvu/DLayout;->m_scale:F

    const/high16 v2, 0x3f800000    # 1.0f

    .line 42
    iput v2, p0, Lorg/djvu/DLayout;->m_scale_min:F

    .line 43
    iput v2, p0, Lorg/djvu/DLayout;->m_scale_max:F

    const/high16 v2, 0x41000000    # 8.0f

    .line 44
    iput v2, p0, Lorg/djvu/DLayout;->m_zoom_level:F

    const/high16 v2, 0x40200000    # 2.5f

    .line 45
    iput v2, p0, Lorg/djvu/DLayout;->m_zoom_level_clip:F

    .line 46
    iput v1, p0, Lorg/djvu/DLayout;->m_disp_page1:I

    .line 47
    iput v1, p0, Lorg/djvu/DLayout;->m_disp_page2:I

    .line 48
    iput v1, p0, Lorg/djvu/DLayout;->m_page_gap:I

    const v2, -0x333334

    .line 49
    iput v2, p0, Lorg/djvu/DLayout;->m_back_color:I

    .line 52
    iput-object v0, p0, Lorg/djvu/DLayout;->m_listener:Lorg/djvu/DLayout$LayoutListener;

    .line 53
    iput-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/djvu/DLayout;->lockedImages:Ljava/util/HashMap;

    .line 292
    iput v1, p0, Lorg/djvu/DLayout;->m_pageno:I

    .line 57
    iput-object p1, p0, Lorg/djvu/DLayout;->m_ctx:Landroid/content/Context;

    .line 58
    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    return-void
.end method

.method private lockPageBitmap(ILandroid/graphics/Bitmap;)V
    .locals 2

    .line 136
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 138
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayout;->lockedImages:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq p2, v0, :cond_1

    .line 139
    iget-object v0, p0, Lorg/djvu/DLayout;->lockedImages:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    :goto_0
    return-void
.end method

.method private releaseLockedBitmaps()V
    .locals 3

    .line 124
    iget-object v0, p0, Lorg/djvu/DLayout;->lockedImages:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 125
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 126
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 127
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 128
    iget v2, p0, Lorg/djvu/DLayout;->m_disp_page1:I

    if-lt v1, v2, :cond_1

    iget v2, p0, Lorg/djvu/DLayout;->m_disp_page2:I

    if-lt v1, v2, :cond_0

    .line 130
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

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

    .line 347
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vClose()V

    .line 348
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public scrollerComputeScrollOffset()Z
    .locals 1

    .line 93
    iget-object v0, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public vClose()V
    .locals 1

    .line 227
    iget-object v0, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    if-nez v0, :cond_0

    return-void

    .line 228
    :cond_0
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vScrollAbort()V

    const/4 v0, 0x0

    .line 229
    iput-object v0, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    return-void
.end method

.method public vDraw(Landroid/view/View;Landroid/graphics/Canvas;ZII)V
    .locals 10

    .line 103
    iget-object v0, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    if-nez v0, :cond_0

    goto :goto_1

    .line 104
    :cond_0
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vFlushRange()V

    .line 105
    iget v0, p0, Lorg/djvu/DLayout;->m_disp_page1:I

    .line 106
    iget v1, p0, Lorg/djvu/DLayout;->m_disp_page2:I

    if-ltz v0, :cond_2

    if-ltz v1, :cond_2

    if-gt v1, v0, :cond_1

    goto :goto_1

    .line 108
    :cond_1
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vGetX()I

    move-result v6

    .line 109
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vGetY()I

    move-result v7

    .line 111
    invoke-direct {p0}, Lorg/djvu/DLayout;->releaseLockedBitmaps()V

    :goto_0
    if-ge v0, v1, :cond_2

    .line 114
    iget-object v2, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    aget-object v2, v2, v0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v8, p4

    move v9, p5

    .line 115
    invoke-virtual/range {v2 .. v9}, Lorg/djvu/VDPage;->vDraw(Landroid/view/View;Landroid/graphics/Canvas;ZIIII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 116
    invoke-direct {p0, v0, p1}, Lorg/djvu/DLayout;->lockPageBitmap(ILandroid/graphics/Bitmap;)V

    add-int/lit8 v0, v0, 0x1

    move-object p1, v3

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public vFling(IIFFFF)Z
    .locals 9

    .line 283
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vGetX()I

    move-result v1

    .line 284
    iget-object p1, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->abortAnimation()V

    .line 285
    iget-object p1, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 286
    iget p1, p0, Lorg/djvu/DLayout;->def_view:I

    if-ne p1, p2, :cond_0

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr p5, p1

    .line 288
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Lorg/djvu/DLayout;->vGetY()I

    move-result v2

    neg-float p1, p5

    float-to-int v3, p1

    neg-float p1, p6

    float-to-int v4, p1

    iget p1, p0, Lorg/djvu/DLayout;->m_w:I

    neg-int v5, p1

    iget v6, p0, Lorg/djvu/DLayout;->m_tw:I

    iget p1, p0, Lorg/djvu/DLayout;->m_h:I

    neg-int v7, p1

    iget v8, p0, Lorg/djvu/DLayout;->m_th:I

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    return p2
.end method

.method protected vFlushRange()V
    .locals 4

    const/4 v0, 0x0

    .line 295
    invoke-virtual {p0, v0, v0}, Lorg/djvu/DLayout;->vGetPage(II)I

    move-result v0

    .line 296
    iget v1, p0, Lorg/djvu/DLayout;->m_w:I

    iget v2, p0, Lorg/djvu/DLayout;->m_h:I

    invoke-virtual {p0, v1, v2}, Lorg/djvu/DLayout;->vGetPage(II)I

    move-result v1

    if-ltz v0, :cond_1

    if-ltz v1, :cond_1

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v3, v1

    move v1, v0

    move v0, v3

    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 304
    iput v1, p0, Lorg/djvu/DLayout;->m_disp_page1:I

    .line 305
    iput v0, p0, Lorg/djvu/DLayout;->m_disp_page2:I

    .line 306
    iget-object v0, p0, Lorg/djvu/DLayout;->m_listener:Lorg/djvu/DLayout$LayoutListener;

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/djvu/DLayout;->m_w:I

    div-int/lit8 v0, v0, 0x4

    iget v1, p0, Lorg/djvu/DLayout;->m_h:I

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v0, v1}, Lorg/djvu/DLayout;->vGetPage(II)I

    move-result v0

    iget v1, p0, Lorg/djvu/DLayout;->m_pageno:I

    if-eq v0, v1, :cond_1

    .line 307
    iget-object v1, p0, Lorg/djvu/DLayout;->m_listener:Lorg/djvu/DLayout$LayoutListener;

    iput v0, p0, Lorg/djvu/DLayout;->m_pageno:I

    invoke-interface {v1, v0}, Lorg/djvu/DLayout$LayoutListener;->OnPageChanged(I)V

    :cond_1
    return-void
.end method

.method public final vGetHeight()I
    .locals 1

    .line 316
    iget v0, p0, Lorg/djvu/DLayout;->m_h:I

    return v0
.end method

.method public final vGetMaxScale()F
    .locals 1

    .line 342
    iget v0, p0, Lorg/djvu/DLayout;->m_scale_max:F

    return v0
.end method

.method public final vGetMinScale()F
    .locals 1

    .line 334
    iget v0, p0, Lorg/djvu/DLayout;->m_scale_min:F

    return v0
.end method

.method public abstract vGetPage(II)I
.end method

.method public final vGetPage(I)Lorg/djvu/VDPage;
    .locals 2

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 150
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-le p1, v1, :cond_1

    array-length p1, v0

    add-int/lit8 p1, p1, -0x1

    .line 151
    :cond_1
    aget-object p1, v0, p1

    return-object p1
.end method

.method public vGetPos(II)Lorg/djvu/DLayout$DjvuPos;
    .locals 3

    .line 155
    iget v0, p0, Lorg/djvu/DLayout;->m_w:I

    const/4 v1, 0x0

    if-lez v0, :cond_2

    iget v0, p0, Lorg/djvu/DLayout;->m_h:I

    if-gtz v0, :cond_0

    goto :goto_0

    .line 156
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/djvu/DLayout;->vGetPage(II)I

    move-result v0

    if-gez v0, :cond_1

    return-object v1

    .line 158
    :cond_1
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vGetX()I

    move-result v1

    add-int/2addr p1, v1

    .line 159
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vGetY()I

    move-result v1

    add-int/2addr p2, v1

    .line 160
    iget-object v1, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    aget-object v1, v1, v0

    .line 161
    new-instance v2, Lorg/djvu/DLayout$DjvuPos;

    invoke-direct {v2}, Lorg/djvu/DLayout$DjvuPos;-><init>()V

    int-to-float p1, p1

    .line 162
    invoke-virtual {v1, p1}, Lorg/djvu/VDPage;->GetDjvuX(F)F

    move-result p1

    iput p1, v2, Lorg/djvu/DLayout$DjvuPos;->x:F

    int-to-float p1, p2

    .line 163
    invoke-virtual {v1, p1}, Lorg/djvu/VDPage;->GetDjvuY(F)F

    move-result p1

    iput p1, v2, Lorg/djvu/DLayout$DjvuPos;->y:F

    .line 164
    iput v0, v2, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    return-object v2

    :cond_2
    :goto_0
    return-object v1
.end method

.method public final vGetScale()F
    .locals 1

    .line 338
    iget v0, p0, Lorg/djvu/DLayout;->m_scale:F

    return v0
.end method

.method public final vGetTHeight()I
    .locals 1

    .line 330
    iget v0, p0, Lorg/djvu/DLayout;->m_th:I

    return v0
.end method

.method public final vGetTWidth()I
    .locals 1

    .line 323
    iget v0, p0, Lorg/djvu/DLayout;->m_tw:I

    return v0
.end method

.method public final vGetWidth()I
    .locals 1

    .line 312
    iget v0, p0, Lorg/djvu/DLayout;->m_w:I

    return v0
.end method

.method public final vGetX()I
    .locals 4

    .line 248
    iget-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    .line 249
    iget v1, p0, Lorg/djvu/DLayout;->m_tw:I

    iget v2, p0, Lorg/djvu/DLayout;->m_w:I

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

    .line 262
    iget-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    .line 263
    iget-boolean v1, p0, Lorg/djvu/DLayout;->vert:Z

    if-nez v1, :cond_0

    .line 264
    iget-object v1, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    iget v2, p0, Lorg/djvu/DLayout;->m_pageno:I

    invoke-virtual {v1, v2}, Lorg/djvu/DDocument;->GetPageHeight(I)I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lorg/djvu/DLayout;->m_scale:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    .line 265
    iget v2, p0, Lorg/djvu/DLayout;->m_h:I

    sub-int v3, v1, v2

    if-le v0, v3, :cond_1

    sub-int/2addr v1, v2

    move v0, v1

    goto :goto_0

    .line 267
    :cond_0
    iget v1, p0, Lorg/djvu/DLayout;->m_th:I

    iget v2, p0, Lorg/djvu/DLayout;->m_h:I

    sub-int v3, v1, v2

    if-le v0, v3, :cond_1

    sub-int v0, v1, v2

    :cond_1
    :goto_0
    if-gez v0, :cond_2

    const/4 v0, 0x0

    :cond_2
    return v0
.end method

.method public final vGetZoom()F
    .locals 2

    .line 237
    iget v0, p0, Lorg/djvu/DLayout;->m_scale:F

    iget v1, p0, Lorg/djvu/DLayout;->m_scale_min:F

    div-float/2addr v0, v1

    return v0
.end method

.method public vGotoPage(I)V
    .locals 7

    .line 178
    iget-object v0, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    if-eqz v0, :cond_5

    if-ltz p1, :cond_5

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_1

    .line 179
    :cond_0
    iget v1, p0, Lorg/djvu/DLayout;->m_page_gap:I

    div-int/lit8 v2, v1, 0x2

    int-to-float v2, v2

    iget v3, p0, Lorg/djvu/DLayout;->m_scale:F

    div-float/2addr v2, v3

    .line 180
    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    div-float/2addr v1, v3

    .line 181
    iget v3, p0, Lorg/djvu/DLayout;->m_tw:I

    iget v4, p0, Lorg/djvu/DLayout;->m_w:I

    sub-int v5, v3, v4

    int-to-float v5, v5

    cmpl-float v5, v2, v5

    if-lez v5, :cond_1

    sub-int/2addr v3, v4

    int-to-float v2, v3

    :cond_1
    const/4 v3, 0x0

    cmpg-float v4, v2, v3

    if-gez v4, :cond_2

    const/4 v2, 0x0

    .line 183
    :cond_2
    iget v4, p0, Lorg/djvu/DLayout;->m_th:I

    iget v5, p0, Lorg/djvu/DLayout;->m_h:I

    sub-int v6, v4, v5

    int-to-float v6, v6

    cmpl-float v6, v1, v6

    if-lez v6, :cond_3

    sub-int/2addr v4, v5

    int-to-float v1, v4

    :cond_3
    cmpg-float v4, v1, v3

    if-gez v4, :cond_4

    goto :goto_0

    :cond_4
    move v3, v1

    .line 186
    :goto_0
    iget-object v1, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    aget-object v0, v0, p1

    invoke-virtual {v0, v2}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 187
    iget-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    iget-object v1, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    aget-object p1, v1, p1

    invoke-virtual {p1, v3}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 188
    invoke-virtual {p0}, Lorg/djvu/DLayout;->scrollerComputeScrollOffset()Z

    :cond_5
    :goto_1
    return-void
.end method

.method public abstract vLayout()V
.end method

.method public abstract vMoveEnd()V
.end method

.method public vOpen(Lorg/djvu/DDocument;Lorg/djvu/DLayout$LayoutListener;)V
    .locals 7

    if-nez p1, :cond_0

    goto :goto_1

    .line 207
    :cond_0
    invoke-virtual {p1}, Lorg/djvu/DDocument;->GetPageCount()I

    move-result v0

    if-gtz v0, :cond_1

    goto :goto_1

    .line 209
    :cond_1
    iput-object p2, p0, Lorg/djvu/DLayout;->m_listener:Lorg/djvu/DLayout$LayoutListener;

    .line 210
    iput-object p1, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    .line 211
    iget p2, p0, Lorg/djvu/DLayout;->def_view:I

    invoke-virtual {p1, p2}, Lorg/djvu/DDocument;->GetPagesMaxSize(I)[F

    move-result-object p1

    const/4 p2, 0x0

    .line 212
    aget v1, p1, p2

    iput v1, p0, Lorg/djvu/DLayout;->m_page_maxw:F

    const/4 v1, 0x1

    .line 213
    aget p1, p1, v1

    iput p1, p0, Lorg/djvu/DLayout;->m_page_maxh:F

    .line 214
    new-array p1, v0, [Lorg/djvu/VDPage;

    iput-object p1, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    .line 215
    iget-object p1, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 216
    iget-object p1, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 217
    iget p1, p0, Lorg/djvu/DLayout;->m_w:I

    if-lez p1, :cond_3

    iget p1, p0, Lorg/djvu/DLayout;->m_h:I

    if-lez p1, :cond_3

    const/4 p1, 0x0

    .line 218
    iput p1, p0, Lorg/djvu/DLayout;->m_scale:F

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v0, :cond_2

    .line 220
    iget-object p1, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    new-instance v1, Lorg/djvu/VDPage;

    iget-object v2, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    iget v5, p0, Lorg/djvu/DLayout;->m_w:I

    iget v6, p0, Lorg/djvu/DLayout;->m_h:I

    move-object v3, p0

    invoke-direct/range {v1 .. v6}, Lorg/djvu/VDPage;-><init>(Lorg/djvu/DDocument;Lorg/djvu/DLayout;III)V

    aput-object v1, p1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 222
    :cond_2
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vLayout()V

    :cond_3
    :goto_1
    return-void
.end method

.method public vResize(II)V
    .locals 9

    if-lez p1, :cond_4

    if-gtz p2, :cond_0

    goto :goto_1

    .line 63
    :cond_0
    iget v0, p0, Lorg/djvu/DLayout;->m_w:I

    if-ne p1, v0, :cond_1

    iget v0, p0, Lorg/djvu/DLayout;->m_h:I

    if-ne p2, v0, :cond_1

    goto :goto_1

    .line 64
    :cond_1
    iget-object v0, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    if-nez v0, :cond_2

    goto :goto_1

    .line 65
    :cond_2
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vScrollAbort()V

    .line 66
    iget v0, p0, Lorg/djvu/DLayout;->m_w:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lorg/djvu/DLayout;->m_h:I

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, v0, v1}, Lorg/djvu/DLayout;->vGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object v0

    .line 67
    iput p1, p0, Lorg/djvu/DLayout;->m_w:I

    .line 68
    iput p2, p0, Lorg/djvu/DLayout;->m_h:I

    .line 69
    iget-object v1, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    array-length v1, v1

    .line 70
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    const/4 v2, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v1, :cond_3

    .line 72
    iget-object v2, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    new-instance v3, Lorg/djvu/VDPage;

    iget-object v4, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    move-object v5, p0

    move v7, p1

    move v8, p2

    invoke-direct/range {v3 .. v8}, Lorg/djvu/VDPage;-><init>(Lorg/djvu/DDocument;Lorg/djvu/DLayout;III)V

    aput-object v3, v2, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_3
    move-object v5, p0

    .line 76
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vLayout()V

    .line 77
    iget p1, v5, Lorg/djvu/DLayout;->m_w:I

    div-int/lit8 p1, p1, 0x2

    iget p2, v5, Lorg/djvu/DLayout;->m_h:I

    div-int/lit8 p2, p2, 0x2

    invoke-virtual {p0, p1, p2, v0}, Lorg/djvu/DLayout;->vSetPos(IILorg/djvu/DLayout$DjvuPos;)V

    return-void

    :cond_4
    :goto_1
    move-object v5, p0

    return-void
.end method

.method public final vScrollAbort()V
    .locals 2

    .line 81
    iget-object v0, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/djvu/DLayout;->m_listener:Lorg/djvu/DLayout$LayoutListener;

    if-eqz v0, :cond_0

    .line 83
    new-instance v0, Landroid/widget/Scroller;

    iget-object v1, p0, Lorg/djvu/DLayout;->m_ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 84
    iget-object v1, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalX(I)V

    .line 85
    iget-object v1, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 86
    iput-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    .line 87
    invoke-virtual {p0}, Lorg/djvu/DLayout;->scrollerComputeScrollOffset()Z

    :cond_0
    return-void
.end method

.method public final vScrollCompute()Z
    .locals 1

    .line 99
    iget-object v0, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/djvu/DLayout;->scrollerComputeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public vSetBackColor(I)V
    .locals 0

    .line 233
    iput p1, p0, Lorg/djvu/DLayout;->m_back_color:I

    return-void
.end method

.method public vSetPos(IILorg/djvu/DLayout$DjvuPos;)V
    .locals 2

    if-nez p3, :cond_0

    return-void

    .line 171
    :cond_0
    iget-object v0, p0, Lorg/djvu/DLayout;->m_pages:[Lorg/djvu/VDPage;

    iget v1, p3, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    aget-object v0, v0, v1

    .line 172
    iget v1, p3, Lorg/djvu/DLayout$DjvuPos;->x:F

    invoke-virtual {v0, v1}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v1

    sub-int/2addr v1, p1

    invoke-virtual {p0, v1}, Lorg/djvu/DLayout;->vSetX(I)V

    .line 173
    iget p1, p3, Lorg/djvu/DLayout$DjvuPos;->y:F

    invoke-virtual {v0, p1}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result p1

    sub-int/2addr p1, p2

    invoke-virtual {p0, p1}, Lorg/djvu/DLayout;->vSetY(I)V

    .line 174
    invoke-virtual {p0}, Lorg/djvu/DLayout;->scrollerComputeScrollOffset()Z

    return-void
.end method

.method public vSetX(I)V
    .locals 3

    .line 255
    iget v0, p0, Lorg/djvu/DLayout;->m_tw:I

    iget v1, p0, Lorg/djvu/DLayout;->m_w:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int p1, v0, v1

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 258
    :cond_1
    iget-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalX(I)V

    return-void
.end method

.method public vSetY(I)V
    .locals 3

    .line 273
    iget-boolean v0, p0, Lorg/djvu/DLayout;->vert:Z

    if-nez v0, :cond_0

    .line 274
    iget-object v0, p0, Lorg/djvu/DLayout;->m_doc:Lorg/djvu/DDocument;

    iget v1, p0, Lorg/djvu/DLayout;->m_pageno:I

    invoke-virtual {v0, v1}, Lorg/djvu/DDocument;->GetPageHeight(I)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lorg/djvu/DLayout;->m_scale:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    .line 275
    iget v1, p0, Lorg/djvu/DLayout;->m_h:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_1

    sub-int/2addr v0, v1

    move p1, v0

    goto :goto_0

    .line 277
    :cond_0
    iget v0, p0, Lorg/djvu/DLayout;->m_th:I

    iget v1, p0, Lorg/djvu/DLayout;->m_h:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_1

    sub-int p1, v0, v1

    :cond_1
    :goto_0
    if-gez p1, :cond_2

    const/4 p1, 0x0

    .line 279
    :cond_2
    iget-object v0, p0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalY(I)V

    return-void
.end method

.method public vZoomSet(IILorg/djvu/DLayout$DjvuPos;F)V
    .locals 1

    .line 241
    iget v0, p0, Lorg/djvu/DLayout;->m_scale_min:F

    mul-float p4, p4, v0

    iput p4, p0, Lorg/djvu/DLayout;->m_scale:F

    .line 242
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vLayout()V

    .line 244
    invoke-virtual {p0, p1, p2, p3}, Lorg/djvu/DLayout;->vSetPos(IILorg/djvu/DLayout$DjvuPos;)V

    return-void
.end method

.method public vZoomStart()V
    .locals 1

    .line 195
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vFlushRange()V

    .line 196
    iget v0, p0, Lorg/djvu/DLayout;->m_disp_page1:I

    if-ltz v0, :cond_1

    iget v0, p0, Lorg/djvu/DLayout;->m_disp_page2:I

    if-gez v0, :cond_0

    goto :goto_0

    .line 199
    :cond_0
    invoke-virtual {p0}, Lorg/djvu/DLayout;->vScrollAbort()V

    .line 200
    iget v0, p0, Lorg/djvu/DLayout;->m_disp_page1:I

    iput v0, p0, Lorg/djvu/DLayout;->m_zoom_page0:I

    .line 201
    iget v0, p0, Lorg/djvu/DLayout;->m_disp_page2:I

    iput v0, p0, Lorg/djvu/DLayout;->m_zoom_page1:I

    :cond_1
    :goto_0
    return-void
.end method
