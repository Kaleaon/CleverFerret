.class public Lcom/radaee/view/PDFView;
.super Ljava/lang/Object;
.source "PDFView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/PDFView$PDFViewListener;,
        Lcom/radaee/view/PDFView$PDFGestureListener;,
        Lcom/radaee/view/PDFView$PDFPos;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field protected static final STA_CURLING:I = 0x4

.field protected static final STA_MOVING:I = 0x1

.field protected static final STA_NONE:I = 0x0

.field protected static final STA_SELECT:I = 0x3

.field protected static final STA_ZOOM:I = 0x2


# instance fields
.field protected m_back:I

.field protected m_bmp:Landroid/graphics/Bitmap;

.field protected m_bmp_format:Landroid/graphics/Bitmap$Config;

.field protected m_doc:Lcom/radaee/pdf/Document;

.field protected m_doch:I

.field protected m_docw:I

.field protected m_draw_bmp:Lcom/radaee/pdf/BMP;

.field protected m_drawbmp:Z

.field protected m_finder:Lcom/radaee/view/PDFVFinder;

.field private m_gesture:Landroid/view/GestureDetector;

.field protected m_h:I

.field protected m_hand_ui:Landroid/os/Handler;

.field protected m_holdsx:F

.field protected m_holdsy:F

.field protected m_holdx:F

.field protected m_holdy:F

.field protected m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

.field protected m_lock:I

.field private m_movex:F

.field private m_movey:F

.field protected m_page_gap:I

.field protected m_pageno:I

.field protected m_pages:[Lcom/radaee/view/PDFVPage;

.field protected m_prange_end:I

.field protected m_prange_start:I

.field protected m_scale:F

.field protected m_scale_max:F

.field protected m_scale_min:F

.field protected m_scroller:Landroid/widget/Scroller;

.field protected m_selx1:I

.field protected m_selx2:I

.field protected m_sely1:I

.field protected m_sely2:I

.field protected m_status:I

.field protected m_thread:Lcom/radaee/view/PDFVThread;

.field protected m_w:I

.field private m_zoom_dis1:F

.field private m_zoom_dis2:F

.field private m_zoom_pos:Lcom/radaee/view/PDFView$PDFPos;

.field private m_zoom_scale:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_doc:Lcom/radaee/pdf/Document;

    .line 27
    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    const/4 v1, 0x0

    .line 32
    iput v1, p0, Lcom/radaee/view/PDFView;->m_lock:I

    const/4 v2, 0x4

    .line 39
    iput v2, p0, Lcom/radaee/view/PDFView;->m_page_gap:I

    .line 40
    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    const v2, -0x333334

    .line 41
    iput v2, p0, Lcom/radaee/view/PDFView;->m_back:I

    .line 42
    iput v1, p0, Lcom/radaee/view/PDFView;->m_status:I

    .line 43
    iput-boolean v1, p0, Lcom/radaee/view/PDFView;->m_drawbmp:Z

    .line 44
    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_gesture:Landroid/view/GestureDetector;

    .line 45
    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    .line 123
    new-instance v0, Lcom/radaee/view/PDFView$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/radaee/view/PDFView$1;-><init>(Lcom/radaee/view/PDFView;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_hand_ui:Landroid/os/Handler;

    .line 238
    iput v1, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    .line 239
    iput v1, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    const/4 v0, -0x1

    .line 240
    iput v0, p0, Lcom/radaee/view/PDFView;->m_pageno:I

    .line 302
    new-instance v0, Lcom/radaee/pdf/BMP;

    invoke-direct {v0}, Lcom/radaee/pdf/BMP;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    .line 198
    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    .line 199
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/radaee/view/PDFView$PDFGestureListener;

    invoke-direct {v1, p0}, Lcom/radaee/view/PDFView$PDFGestureListener;-><init>(Lcom/radaee/view/PDFView;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_gesture:Landroid/view/GestureDetector;

    return-void
.end method

.method private motionSelect(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 701
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    goto :goto_0

    .line 709
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFView;->m_movex:F

    .line 710
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_movey:F

    .line 711
    iget v0, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    iget v2, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    iget v3, p0, Lcom/radaee/view/PDFView;->m_movex:F

    invoke-virtual {p0, v0, v2, v3, p1}, Lcom/radaee/view/PDFView;->vSetSel(FFFF)V

    goto :goto_0

    .line 715
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFView;->m_movex:F

    .line 716
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_movey:F

    .line 717
    iget v0, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    iget v2, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    iget v3, p0, Lcom/radaee/view/PDFView;->m_movex:F

    invoke-virtual {p0, v0, v2, v3, p1}, Lcom/radaee/view/PDFView;->vSetSel(FFFF)V

    .line 718
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_3

    invoke-interface {p1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFSelectEnd()V

    goto :goto_0

    .line 704
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    .line 705
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    .line 706
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vClearSel()V

    :cond_3
    :goto_0
    return v1
.end method

.method private motionZoom(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 577
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const-wide v1, 0x3feff7ced916872bL    # 0.999

    const-wide v3, 0x3ff00068db8bac71L    # 1.0001

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eq v0, v7, :cond_2

    if-eq v0, v5, :cond_0

    const/4 v8, 0x3

    if-eq v0, v8, :cond_2

    const/4 v8, 0x6

    if-eq v0, v8, :cond_2

    goto/16 :goto_0

    .line 580
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-ne v0, v5, :cond_6

    .line 582
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    sub-float/2addr v0, v5

    .line 583
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v5, p1

    mul-float v0, v0, v0

    mul-float v5, v5, v5

    add-float/2addr v0, v5

    .line 584
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_zoom_dis2:F

    .line 585
    iget v0, p0, Lcom/radaee/view/PDFView;->m_zoom_scale:F

    mul-float v0, v0, p1

    iget p1, p0, Lcom/radaee/view/PDFView;->m_zoom_dis1:F

    div-float/2addr v0, p1

    .line 586
    iget p1, p0, Lcom/radaee/view/PDFView;->m_scale:F

    div-float v5, p1, v0

    float-to-double v5, v5

    cmpl-double v8, v5, v3

    if-gtz v8, :cond_1

    div-float/2addr p1, v0

    float-to-double v3, p1

    cmpg-double p1, v3, v1

    if-gez p1, :cond_6

    .line 588
    :cond_1
    iput v0, p0, Lcom/radaee/view/PDFView;->m_scale:F

    .line 589
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vLayout()V

    .line 590
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_zoom_pos:Lcom/radaee/view/PDFView$PDFPos;

    iget v0, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    float-to-int v0, v0

    iget v1, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    float-to-int v1, v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/radaee/view/PDFView;->vSetPos(Lcom/radaee/view/PDFView$PDFPos;II)V

    goto :goto_0

    .line 597
    :cond_2
    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-ne v0, v5, :cond_6

    .line 599
    iput v6, p0, Lcom/radaee/view/PDFView;->m_status:I

    .line 600
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    sub-float/2addr v0, v5

    .line 601
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v5, p1

    mul-float v0, v0, v0

    mul-float v5, v5, v5

    add-float/2addr v0, v5

    .line 602
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_zoom_dis2:F

    .line 603
    iget v0, p0, Lcom/radaee/view/PDFView;->m_zoom_scale:F

    mul-float v0, v0, p1

    iget p1, p0, Lcom/radaee/view/PDFView;->m_zoom_dis1:F

    div-float/2addr v0, p1

    .line 604
    iget p1, p0, Lcom/radaee/view/PDFView;->m_scale:F

    div-float v5, p1, v0

    float-to-double v8, v5

    cmpl-double v5, v8, v3

    if-gtz v5, :cond_3

    div-float/2addr p1, v0

    float-to-double v3, p1

    cmpg-double p1, v3, v1

    if-gez p1, :cond_4

    .line 606
    :cond_3
    iput v0, p0, Lcom/radaee/view/PDFView;->m_scale:F

    .line 607
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vLayout()V

    .line 608
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_zoom_pos:Lcom/radaee/view/PDFView$PDFPos;

    iget v0, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    float-to-int v0, v0

    iget v1, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    float-to-int v1, v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/radaee/view/PDFView;->vSetPos(Lcom/radaee/view/PDFView$PDFPos;II)V

    .line 610
    :cond_4
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_5

    .line 612
    invoke-interface {p1, v6}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    .line 613
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {p1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFZoomEnd()V

    .line 615
    :cond_5
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vOnZoomEnd()V

    :cond_6
    :goto_0
    return v7
.end method


# virtual methods
.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1081
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vClose()V

    .line 1082
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method protected motionNormal(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 623
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_gesture:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 624
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_d

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eq v0, v1, :cond_8

    if-eq v0, v3, :cond_3

    if-eq v0, v2, :cond_8

    const/4 v2, 0x5

    if-eq v0, v2, :cond_1

    goto/16 :goto_1

    .line 670
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v3, :cond_e

    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-ne v0, v1, :cond_e

    iget v0, p0, Lcom/radaee/view/PDFView;->m_lock:I

    if-eq v0, v2, :cond_e

    .line 672
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 673
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 674
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    add-float/2addr v0, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    iput v0, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    .line 675
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    add-float/2addr v0, v5

    div-float/2addr v0, v2

    iput v0, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    .line 676
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    sub-float/2addr v0, v2

    .line 677
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v2, p1

    .line 678
    iget p1, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    float-to-int p1, p1

    iget v4, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    float-to-int v4, v4

    invoke-virtual {p0, p1, v4}, Lcom/radaee/view/PDFView;->vGetPos(II)Lcom/radaee/view/PDFView$PDFPos;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/PDFView;->m_zoom_pos:Lcom/radaee/view/PDFView$PDFPos;

    mul-float v0, v0, v0

    mul-float v2, v2, v2

    add-float/2addr v0, v2

    .line 679
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_zoom_dis1:F

    .line 680
    iput p1, p0, Lcom/radaee/view/PDFView;->m_zoom_dis2:F

    .line 681
    iget p1, p0, Lcom/radaee/view/PDFView;->m_scale:F

    iput p1, p0, Lcom/radaee/view/PDFView;->m_zoom_scale:F

    .line 682
    iget p1, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    .line 683
    iget v0, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    :goto_0
    if-ge p1, v0, :cond_2

    .line 686
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, p1

    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v2, v4}, Lcom/radaee/view/PDFVPage;->CreateBmp(Landroid/graphics/Bitmap$Config;)V

    .line 687
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, p1

    invoke-virtual {v2, v4}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 690
    :cond_2
    iput-boolean v1, p0, Lcom/radaee/view/PDFView;->m_drawbmp:Z

    .line 691
    iput v3, p0, Lcom/radaee/view/PDFView;->m_status:I

    .line 692
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_e

    .line 693
    invoke-interface {p1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFZoomStart()V

    goto/16 :goto_1

    .line 639
    :cond_3
    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-ne v0, v1, :cond_e

    .line 641
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFView;->m_movex:F

    .line 642
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_movey:F

    .line 643
    iget v0, p0, Lcom/radaee/view/PDFView;->m_holdsx:F

    iget v5, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    add-float/2addr v5, v0

    iget v6, p0, Lcom/radaee/view/PDFView;->m_movex:F

    sub-float/2addr v5, v6

    float-to-int v5, v5

    .line 644
    iget v6, p0, Lcom/radaee/view/PDFView;->m_holdsy:F

    iget v7, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    add-float/2addr v7, v6

    sub-float/2addr v7, p1

    float-to-int p1, v7

    .line 645
    iget v7, p0, Lcom/radaee/view/PDFView;->m_lock:I

    if-eq v7, v1, :cond_4

    if-ne v7, v2, :cond_5

    :cond_4
    float-to-int v5, v0

    :cond_5
    if-eq v7, v3, :cond_6

    if-ne v7, v2, :cond_7

    :cond_6
    float-to-int p1, v6

    .line 647
    :cond_7
    invoke-virtual {p0, v5}, Lcom/radaee/view/PDFView;->vSetX(I)V

    .line 648
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFView;->vSetY(I)V

    .line 649
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_e

    invoke-interface {p1, v4}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    goto :goto_1

    .line 654
    :cond_8
    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-ne v0, v1, :cond_e

    .line 656
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFView;->m_movex:F

    .line 657
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_movey:F

    .line 658
    iget v0, p0, Lcom/radaee/view/PDFView;->m_holdsx:F

    iget v5, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    add-float/2addr v5, v0

    iget v6, p0, Lcom/radaee/view/PDFView;->m_movex:F

    sub-float/2addr v5, v6

    float-to-int v5, v5

    .line 659
    iget v6, p0, Lcom/radaee/view/PDFView;->m_holdsy:F

    iget v7, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    add-float/2addr v7, v6

    sub-float/2addr v7, p1

    float-to-int p1, v7

    .line 660
    iget v7, p0, Lcom/radaee/view/PDFView;->m_lock:I

    if-eq v7, v1, :cond_9

    if-ne v7, v2, :cond_a

    :cond_9
    float-to-int v5, v0

    :cond_a
    if-eq v7, v3, :cond_b

    if-ne v7, v2, :cond_c

    :cond_b
    float-to-int p1, v6

    .line 662
    :cond_c
    invoke-virtual {p0, v5}, Lcom/radaee/view/PDFView;->vSetX(I)V

    .line 663
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFView;->vSetY(I)V

    .line 664
    iput v4, p0, Lcom/radaee/view/PDFView;->m_status:I

    .line 665
    invoke-virtual {p0, v5, p1}, Lcom/radaee/view/PDFView;->vOnMoveEnd(II)V

    .line 666
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_e

    invoke-interface {p1, v4}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    goto :goto_1

    .line 627
    :cond_d
    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-nez v0, :cond_e

    .line 629
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 630
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 631
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/radaee/view/PDFView;->m_holdsx:F

    .line 632
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/radaee/view/PDFView;->m_holdsy:F

    .line 633
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFView;->m_holdx:F

    .line 634
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFView;->m_holdy:F

    .line 635
    iput v1, p0, Lcom/radaee/view/PDFView;->m_status:I

    :cond_e
    :goto_1
    return v1
.end method

.method public vCenterPage(I)V
    .locals 4

    .line 1041
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFView;->m_w:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/radaee/view/PDFView;->m_h:I

    if-gtz v0, :cond_0

    goto :goto_0

    .line 1042
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 1043
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1044
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/radaee/view/PDFVPage;->m_x:I

    iget v1, p0, Lcom/radaee/view/PDFView;->m_page_gap:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    .line 1045
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, p1

    iget v1, v1, Lcom/radaee/view/PDFVPage;->m_y:I

    iget v2, p0, Lcom/radaee/view/PDFView;->m_page_gap:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    .line 1046
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, p1

    iget v2, v2, Lcom/radaee/view/PDFVPage;->m_w:I

    iget v3, p0, Lcom/radaee/view/PDFView;->m_page_gap:I

    add-int/2addr v2, v3

    .line 1047
    iget-object v3, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object p1, v3, p1

    iget p1, p1, Lcom/radaee/view/PDFVPage;->m_h:I

    iget v3, p0, Lcom/radaee/view/PDFView;->m_page_gap:I

    add-int/2addr p1, v3

    .line 1048
    iget v3, p0, Lcom/radaee/view/PDFView;->m_w:I

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v2

    .line 1049
    iget v2, p0, Lcom/radaee/view/PDFView;->m_h:I

    sub-int/2addr p1, v2

    div-int/lit8 p1, p1, 0x2

    add-int/2addr v1, p1

    .line 1050
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->getCurrX()I

    move-result p1

    .line 1051
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    .line 1052
    iget-object v3, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    sub-int/2addr v0, p1

    sub-int/2addr v1, v2

    invoke-virtual {v3, p1, v2, v0, v1}, Landroid/widget/Scroller;->startScroll(IIII)V

    :cond_1
    :goto_0
    return-void
.end method

.method public vClearSel()V
    .locals 4

    .line 941
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    goto :goto_1

    .line 943
    :cond_0
    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 946
    iget-object v3, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/radaee/view/PDFVPage;->ClearSel()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 949
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v0, :cond_2

    invoke-interface {v0, v1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_2
    :goto_1
    return-void
.end method

.method public vClose()V
    .locals 6

    .line 443
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 445
    invoke-virtual {v0}, Lcom/radaee/view/PDFVFinder;->find_end()V

    .line 446
    iput-object v1, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    .line 448
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 451
    array-length v0, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_2

    .line 454
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v3

    if-eqz v4, :cond_1

    .line 456
    iget-object v5, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v5, v4}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 460
    :cond_2
    iput-object v1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    .line 462
    :cond_3
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    if-eqz v0, :cond_4

    .line 464
    invoke-virtual {v0}, Lcom/radaee/view/PDFVThread;->destroy()V

    .line 465
    iput-object v1, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    .line 467
    :cond_4
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_5

    .line 469
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 470
    iput-object v1, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    .line 472
    :cond_5
    invoke-virtual {p0, v2}, Lcom/radaee/view/PDFView;->vSetX(I)V

    .line 473
    invoke-virtual {p0, v2}, Lcom/radaee/view/PDFView;->vSetY(I)V

    .line 474
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 475
    iput v2, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    .line 476
    iput v2, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    const/4 v0, -0x1

    .line 477
    iput v0, p0, Lcom/radaee/view/PDFView;->m_pageno:I

    .line 478
    iput-boolean v2, p0, Lcom/radaee/view/PDFView;->m_drawbmp:Z

    return-void
.end method

.method public vComputeScroll()V
    .locals 2

    .line 233
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_0
    return-void
.end method

.method public vDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 305
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    goto/16 :goto_8

    .line 307
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    .line 308
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    .line 311
    iget v2, p0, Lcom/radaee/view/PDFView;->m_docw:I

    iget v3, p0, Lcom/radaee/view/PDFView;->m_w:I

    sub-int v4, v2, v3

    if-le v0, v4, :cond_1

    sub-int/2addr v2, v3

    goto :goto_0

    :cond_1
    move v2, v0

    :goto_0
    const/4 v3, 0x0

    if-gez v2, :cond_2

    const/4 v2, 0x0

    .line 313
    :cond_2
    iget v4, p0, Lcom/radaee/view/PDFView;->m_doch:I

    iget v5, p0, Lcom/radaee/view/PDFView;->m_h:I

    sub-int v6, v4, v5

    if-le v1, v6, :cond_3

    sub-int/2addr v4, v5

    goto :goto_1

    :cond_3
    move v4, v1

    :goto_1
    if-gez v4, :cond_4

    goto :goto_2

    :cond_4
    move v3, v4

    :goto_2
    if-eq v2, v0, :cond_5

    .line 317
    invoke-virtual {p0, v2}, Lcom/radaee/view/PDFView;->vSetX(I)V

    move v0, v2

    :cond_5
    if-eq v3, v1, :cond_6

    .line 322
    invoke-virtual {p0, v3}, Lcom/radaee/view/PDFView;->vSetY(I)V

    move v1, v3

    .line 325
    :cond_6
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vFlushRange()V

    .line 326
    iget v2, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    .line 327
    iget v3, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    .line 330
    iget-boolean v4, p0, Lcom/radaee/view/PDFView;->m_drawbmp:Z

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-eqz v4, :cond_12

    .line 332
    sget-boolean v4, Lcom/radaee/pdf/Global;->dark_mode:Z

    const/4 v7, 0x2

    if-eqz v4, :cond_c

    .line 334
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    iget v8, p0, Lcom/radaee/view/PDFView;->m_back:I

    invoke-virtual {v4, v8}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 335
    new-instance v4, Landroid/graphics/Canvas;

    iget-object v8, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-direct {v4, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    move-object v8, v6

    move-object v9, v8

    :goto_3
    if-ge v2, v3, :cond_b

    .line 338
    iget-object v10, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v10, v10, v2

    .line 339
    iget v11, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-eq v11, v7, :cond_7

    iget-object v11, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v11, v10}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    .line 340
    :cond_7
    invoke-virtual {v10, v4, v0, v1}, Lcom/radaee/view/PDFVPage;->Draw(Landroid/graphics/Canvas;II)V

    if-eqz v8, :cond_8

    if-nez v9, :cond_9

    .line 343
    :cond_8
    invoke-virtual {v10, v0, v1}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v8

    .line 344
    invoke-virtual {v10, v0, v1}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v9

    .line 346
    :cond_9
    iget-object v11, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v11}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v11

    if-ne v11, v2, :cond_a

    .line 347
    iget-object v11, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v11, v4, v10, v0, v1}, Lcom/radaee/view/PDFVFinder;->find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/PDFVPage;II)V

    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 350
    :cond_b
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 351
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v0}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 352
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 354
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, v5, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto/16 :goto_6

    .line 359
    :cond_c
    iget v4, p0, Lcom/radaee/view/PDFView;->m_back:I

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    move-object v4, v6

    :goto_4
    if-ge v2, v3, :cond_11

    .line 362
    iget-object v5, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v2

    .line 363
    iget v8, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-eq v8, v7, :cond_d

    iget-object v8, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v8, v5}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    :cond_d
    if-eqz v6, :cond_e

    if-nez v4, :cond_f

    .line 366
    :cond_e
    invoke-virtual {v5, v0, v1}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v4

    .line 367
    invoke-virtual {v5, v0, v1}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v6

    move-object v12, v6

    move-object v6, v4

    move-object v4, v12

    .line 369
    :cond_f
    invoke-virtual {v5, p1, v0, v1}, Lcom/radaee/view/PDFVPage;->Draw(Landroid/graphics/Canvas;II)V

    .line 370
    iget-object v8, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v8}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v8

    if-ne v8, v2, :cond_10

    .line 371
    iget-object v8, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v8, p1, v5, v0, v1}, Lcom/radaee/view/PDFVFinder;->find_draw(Landroid/graphics/Canvas;Lcom/radaee/view/PDFVPage;II)V

    :cond_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_11
    move-object v9, v4

    move-object v8, v6

    goto :goto_6

    .line 378
    :cond_12
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    iget v7, p0, Lcom/radaee/view/PDFView;->m_back:I

    invoke-virtual {v4, v7}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 380
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v7, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v7}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    move-object v8, v6

    move-object v9, v8

    :goto_5
    if-ge v2, v3, :cond_16

    .line 383
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v2

    .line 384
    iget-object v7, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v7, v4}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    if-eqz v8, :cond_13

    if-nez v9, :cond_14

    .line 387
    :cond_13
    invoke-virtual {v4, v0, v1}, Lcom/radaee/view/PDFVPage;->GetSelRect1(II)[I

    move-result-object v8

    .line 388
    invoke-virtual {v4, v0, v1}, Lcom/radaee/view/PDFVPage;->GetSelRect2(II)[I

    move-result-object v9

    .line 390
    :cond_14
    iget-object v7, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v4, v7, v0, v1}, Lcom/radaee/view/PDFVPage;->Draw(Lcom/radaee/pdf/BMP;II)V

    .line 391
    iget-object v7, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v7}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v7

    if-ne v7, v2, :cond_15

    .line 392
    iget-object v7, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    iget-object v10, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v7, v10, v4, v0, v1}, Lcom/radaee/view/PDFVFinder;->find_draw(Lcom/radaee/pdf/BMP;Lcom/radaee/view/PDFVPage;II)V

    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 395
    :cond_16
    sget-boolean v0, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz v0, :cond_17

    .line 396
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    invoke-virtual {v0}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 398
    :cond_17
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_draw_bmp:Lcom/radaee/pdf/BMP;

    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 400
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, v5, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 403
    :goto_6
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v0, :cond_19

    .line 405
    iget v0, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    .line 406
    iget v1, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    :goto_7
    if-ge v0, v1, :cond_18

    .line 409
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    iget-object v3, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v0

    invoke-interface {v2, p1, v3}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/PDFVPage;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_18
    if-eqz v8, :cond_19

    if-eqz v9, :cond_19

    .line 413
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    invoke-interface {v0, p1, v8, v9}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFSelecting(Landroid/graphics/Canvas;[I[I)V

    :cond_19
    :goto_8
    return-void
.end method

.method public vFind(I)I
    .locals 3

    .line 1012
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    .line 1013
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFVFinder;->find_prepare(I)I

    move-result p1

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-ne p1, v2, :cond_2

    .line 1016
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_1

    .line 1017
    invoke-interface {p1, v2}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFFound(Z)V

    .line 1018
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vFindGoto()V

    return v0

    :cond_2
    if-nez p1, :cond_4

    .line 1023
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_3

    .line 1024
    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFFound(Z)V

    :cond_3
    return v1

    .line 1027
    :cond_4
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {p1, v0}, Lcom/radaee/view/PDFVThread;->start_find(Lcom/radaee/view/PDFVFinder;)V

    return v2
.end method

.method public vFindEnd()V
    .locals 1

    .line 1032
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    return-void

    .line 1033
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVFinder;->find_end()V

    return-void
.end method

.method protected vFindGoto()V
    .locals 10

    .line 988
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 989
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVFinder;->find_get_page()I

    move-result v0

    if-ltz v0, :cond_7

    .line 990
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    goto/16 :goto_0

    .line 991
    :cond_1
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v1}, Lcom/radaee/view/PDFVFinder;->find_get_pos()[F

    move-result-object v1

    if-nez v1, :cond_2

    goto/16 :goto_0

    .line 993
    :cond_2
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    const/4 v3, 0x0

    aget v4, v1, v3

    invoke-virtual {v2, v4}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v2

    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v0

    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v2, v4

    aput v2, v1, v3

    .line 994
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    const/4 v4, 0x1

    aget v5, v1, v4

    invoke-virtual {v2, v5}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v2

    iget-object v5, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v0

    invoke-virtual {v5}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v2, v5

    aput v2, v1, v4

    .line 995
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    const/4 v5, 0x2

    aget v6, v1, v5

    invoke-virtual {v2, v6}, Lcom/radaee/view/PDFVPage;->ToDIBX(F)F

    move-result v2

    iget-object v6, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v6, v6, v0

    invoke-virtual {v6}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v2, v6

    aput v2, v1, v5

    .line 996
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    const/4 v6, 0x3

    aget v7, v1, v6

    invoke-virtual {v2, v7}, Lcom/radaee/view/PDFVPage;->ToDIBY(F)F

    move-result v2

    iget-object v7, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v0, v7, v0

    invoke-virtual {v0}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v2, v0

    aput v2, v1, v6

    .line 997
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    int-to-float v0, v0

    .line 998
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    int-to-float v2, v2

    .line 999
    aget v7, v1, v3

    iget v8, p0, Lcom/radaee/view/PDFView;->m_w:I

    div-int/lit8 v9, v8, 0x8

    int-to-float v9, v9

    sub-float v9, v7, v9

    cmpl-float v9, v0, v9

    if-lez v9, :cond_3

    div-int/lit8 v0, v8, 0x8

    int-to-float v0, v0

    sub-float v0, v7, v0

    .line 1000
    :cond_3
    aget v5, v1, v5

    mul-int/lit8 v7, v8, 0x7

    div-int/lit8 v7, v7, 0x8

    int-to-float v7, v7

    sub-float v7, v5, v7

    cmpg-float v7, v0, v7

    if-gez v7, :cond_4

    mul-int/lit8 v8, v8, 0x7

    div-int/lit8 v8, v8, 0x8

    int-to-float v0, v8

    sub-float v0, v5, v0

    .line 1001
    :cond_4
    aget v5, v1, v4

    iget v7, p0, Lcom/radaee/view/PDFView;->m_h:I

    div-int/lit8 v8, v7, 0x8

    int-to-float v8, v8

    sub-float v8, v5, v8

    cmpl-float v8, v2, v8

    if-lez v8, :cond_5

    div-int/lit8 v2, v7, 0x8

    int-to-float v2, v2

    sub-float v2, v5, v2

    .line 1002
    :cond_5
    aget v1, v1, v6

    mul-int/lit8 v5, v7, 0x7

    div-int/lit8 v5, v5, 0x8

    int-to-float v5, v5

    sub-float v5, v1, v5

    cmpg-float v5, v2, v5

    if-gez v5, :cond_6

    mul-int/lit8 v7, v7, 0x7

    div-int/lit8 v7, v7, 0x8

    int-to-float v2, v7

    sub-float v2, v1, v2

    .line 1003
    :cond_6
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1, v4}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 1004
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    float-to-int v0, v0

    .line 1005
    invoke-virtual {p0, v0}, Lcom/radaee/view/PDFView;->vSetX(I)V

    float-to-int v0, v2

    .line 1006
    invoke-virtual {p0, v0}, Lcom/radaee/view/PDFView;->vSetY(I)V

    .line 1007
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 1008
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v0, :cond_7

    invoke-interface {v0, v3}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_7
    :goto_0
    return-void
.end method

.method public vFindStart(Ljava/lang/String;ZZ)V
    .locals 7

    .line 981
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 982
    invoke-virtual {p0, v0, v0}, Lcom/radaee/view/PDFView;->vGetPage(II)I

    move-result v3

    .line 983
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    invoke-virtual {v0}, Lcom/radaee/view/PDFVFinder;->find_end()V

    .line 984
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_doc:Lcom/radaee/pdf/Document;

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/view/PDFVFinder;->find_start(Lcom/radaee/pdf/Document;ILjava/lang/String;ZZ)V

    return-void
.end method

.method protected vFlushRange()V
    .locals 7

    .line 243
    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto/16 :goto_5

    :cond_0
    const/4 v0, 0x0

    .line 244
    invoke-virtual {p0, v0, v0}, Lcom/radaee/view/PDFView;->vGetPage(II)I

    move-result v0

    .line 245
    iget v1, p0, Lcom/radaee/view/PDFView;->m_w:I

    iget v2, p0, Lcom/radaee/view/PDFView;->m_h:I

    invoke-virtual {p0, v1, v2}, Lcom/radaee/view/PDFView;->vGetPage(II)I

    move-result v1

    if-ltz v0, :cond_6

    if-ltz v1, :cond_6

    if-le v0, v1, :cond_1

    goto :goto_0

    :cond_1
    move v6, v1

    move v1, v0

    move v0, v6

    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 255
    iget v2, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    if-ge v2, v1, :cond_3

    .line 259
    iget v3, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    if-le v1, v3, :cond_2

    goto :goto_1

    :cond_2
    move v3, v1

    :goto_1
    if-ge v2, v3, :cond_3

    .line 262
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v2

    .line 263
    iget-object v5, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v5, v4}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    .line 264
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->DeleteBmp()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 268
    :cond_3
    iget v2, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    if-le v2, v0, :cond_5

    .line 272
    iget v3, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    if-ge v0, v3, :cond_4

    goto :goto_2

    :cond_4
    move v3, v0

    :goto_2
    if-ge v3, v2, :cond_5

    .line 275
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v3

    .line 276
    iget-object v5, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v5, v4}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    .line 277
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->DeleteBmp()V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_5
    move v6, v1

    move v1, v0

    move v0, v6

    goto :goto_4

    .line 284
    :cond_6
    iget v2, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    .line 285
    iget v3, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    :goto_3
    if-ge v2, v3, :cond_7

    .line 288
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v2

    .line 289
    iget-object v5, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v5, v4}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    .line 290
    invoke-virtual {v4}, Lcom/radaee/view/PDFVPage;->DeleteBmp()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 294
    :cond_7
    :goto_4
    iput v0, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    .line 295
    iput v1, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    .line 296
    iget v0, p0, Lcom/radaee/view/PDFView;->m_w:I

    div-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/radaee/view/PDFView;->m_h:I

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v0, v1}, Lcom/radaee/view/PDFView;->vGetPage(II)I

    move-result v0

    .line 297
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v1, :cond_8

    iget v2, p0, Lcom/radaee/view/PDFView;->m_pageno:I

    if-eq v0, v2, :cond_8

    .line 299
    iput v0, p0, Lcom/radaee/view/PDFView;->m_pageno:I

    invoke-interface {v1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFPageChanged(I)V

    :cond_8
    :goto_5
    return-void
.end method

.method public final vGetDocH()I
    .locals 1

    .line 1076
    iget v0, p0, Lcom/radaee/view/PDFView;->m_doch:I

    return v0
.end method

.method public final vGetDocW()I
    .locals 1

    .line 1072
    iget v0, p0, Lcom/radaee/view/PDFView;->m_docw:I

    return v0
.end method

.method public vGetLock()I
    .locals 1

    .line 909
    iget v0, p0, Lcom/radaee/view/PDFView;->m_lock:I

    return v0
.end method

.method public vGetMaxScale()F
    .locals 1

    .line 853
    iget v0, p0, Lcom/radaee/view/PDFView;->m_scale_max:F

    return v0
.end method

.method public vGetMinScale()F
    .locals 1

    .line 849
    iget v0, p0, Lcom/radaee/view/PDFView;->m_scale_min:F

    return v0
.end method

.method protected vGetPage(II)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public vGetPage(I)Lcom/radaee/view/PDFVPage;
    .locals 3

    .line 744
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    if-ltz p1, :cond_2

    .line 745
    array-length v2, v0

    if-lt p1, v2, :cond_1

    goto :goto_0

    .line 746
    :cond_1
    aget-object p1, v0, p1

    return-object p1

    :cond_2
    :goto_0
    return-object v1
.end method

.method public vGetPos(II)Lcom/radaee/view/PDFView$PDFPos;
    .locals 4

    .line 761
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    array-length v0, v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 762
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/radaee/view/PDFView;->vGetPage(II)I

    move-result v0

    if-gez v0, :cond_1

    return-object v1

    .line 764
    :cond_1
    new-instance v1, Lcom/radaee/view/PDFView$PDFPos;

    invoke-direct {v1, p0}, Lcom/radaee/view/PDFView$PDFPos;-><init>(Lcom/radaee/view/PDFView;)V

    .line 765
    iput v0, v1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    .line 766
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v2, v2, v0

    int-to-float p1, p1

    iget-object v3, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, p1, v3}, Lcom/radaee/view/PDFVPage;->ToPDFX(FF)F

    move-result p1

    iput p1, v1, Lcom/radaee/view/PDFView$PDFPos;->x:F

    .line 767
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object p1, p1, v0

    int-to-float p2, p2

    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, p2, v0}, Lcom/radaee/view/PDFVPage;->ToPDFY(FF)F

    move-result p1

    iput p1, v1, Lcom/radaee/view/PDFView$PDFPos;->y:F

    :cond_2
    :goto_0
    return-object v1
.end method

.method public vGetScale()F
    .locals 1

    .line 845
    iget v0, p0, Lcom/radaee/view/PDFView;->m_scale:F

    return v0
.end method

.method public vGetSel()Ljava/lang/String;
    .locals 4

    .line 928
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 930
    :cond_0
    array-length v0, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 933
    iget-object v3, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/radaee/view/PDFVPage;->GetSel()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    return-object v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public final vGetWinH()I
    .locals 1

    .line 1068
    iget v0, p0, Lcom/radaee/view/PDFView;->m_h:I

    return v0
.end method

.method public final vGetWinW()I
    .locals 1

    .line 1064
    iget v0, p0, Lcom/radaee/view/PDFView;->m_w:I

    return v0
.end method

.method public final vGetX()I
    .locals 1

    .line 1056
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    return v0
.end method

.method public final vGetY()I
    .locals 1

    .line 1060
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    return v0
.end method

.method public vGotoPage(I)V
    .locals 3

    .line 791
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz v0, :cond_1

    if-ltz p1, :cond_1

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 792
    :cond_0
    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v0

    int-to-float v0, v0

    .line 793
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object p1, v1, p1

    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result p1

    int-to-float p1, p1

    .line 794
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 795
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->abortAnimation()V

    float-to-int v0, v0

    .line 796
    invoke-virtual {p0, v0}, Lcom/radaee/view/PDFView;->vSetX(I)V

    float-to-int p1, p1

    .line 797
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFView;->vSetY(I)V

    .line 798
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 799
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected vLayout()V
    .locals 0

    return-void
.end method

.method public vMovingFinished()Z
    .locals 1

    .line 229
    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected vOnFling(FFFF)Z
    .locals 9

    .line 803
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/radaee/view/PDFView;->m_lock:I

    const/4 p2, 0x3

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    neg-float p1, p3

    .line 804
    sget p2, Lcom/radaee/pdf/Global;->fling_dis:F

    mul-float p1, p1, p2

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    float-to-int v3, p1

    neg-float p1, p4

    .line 805
    sget p3, Lcom/radaee/pdf/Global;->fling_dis:F

    mul-float p1, p1, p3

    div-float/2addr p1, p2

    float-to-int v4, p1

    .line 806
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v2

    iget p1, p0, Lcom/radaee/view/PDFView;->m_docw:I

    iget p2, p0, Lcom/radaee/view/PDFView;->m_w:I

    sub-int v6, p1, p2

    iget p1, p0, Lcom/radaee/view/PDFView;->m_doch:I

    iget p2, p0, Lcom/radaee/view/PDFView;->m_h:I

    sub-int v8, p1, p2

    const/4 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method protected vOnMoveEnd(II)V
    .locals 0

    return-void
.end method

.method protected vOnTimer(Ljava/lang/Object;)V
    .locals 3

    .line 161
    iget p1, p0, Lcom/radaee/view/PDFView;->m_prange_start:I

    .line 162
    iget v0, p0, Lcom/radaee/view/PDFView;->m_prange_end:I

    .line 163
    iget-boolean v1, p0, Lcom/radaee/view/PDFView;->m_drawbmp:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    :goto_0
    if-ge p1, v0, :cond_1

    .line 167
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->NeedBmp()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-lt p1, v0, :cond_5

    .line 173
    iput-boolean v2, p0, Lcom/radaee/view/PDFView;->m_drawbmp:Z

    const/4 p1, 0x0

    :goto_2
    if-ge p1, v0, :cond_2

    .line 177
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->DeleteBmp()V

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 180
    :cond_2
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_5

    invoke-interface {p1, v2}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    return-void

    :cond_3
    :goto_3
    if-ge p1, v0, :cond_5

    .line 187
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lcom/radaee/view/PDFVPage;->IsFinished()Z

    move-result v1

    if-nez v1, :cond_4

    .line 189
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_5

    invoke-interface {p1, v2}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    return-void

    :cond_4
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_5
    return-void
.end method

.method protected vOnZoomEnd()V
    .locals 0

    return-void
.end method

.method public vOpen(Lcom/radaee/pdf/Document;IILcom/radaee/view/PDFView$PDFViewListener;)V
    .locals 1

    .line 419
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vClose()V

    .line 420
    iput-object p1, p0, Lcom/radaee/view/PDFView;->m_doc:Lcom/radaee/pdf/Document;

    .line 421
    new-instance p1, Lcom/radaee/view/PDFVThread;

    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_hand_ui:Landroid/os/Handler;

    invoke-direct {p1, v0}, Lcom/radaee/view/PDFVThread;-><init>(Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    .line 422
    invoke-virtual {p1}, Lcom/radaee/view/PDFVThread;->start()V

    .line 423
    iput p2, p0, Lcom/radaee/view/PDFView;->m_page_gap:I

    .line 424
    iput p3, p0, Lcom/radaee/view/PDFView;->m_back:I

    .line 425
    new-instance p1, Lcom/radaee/view/PDFVFinder;

    invoke-direct {p1}, Lcom/radaee/view/PDFVFinder;-><init>()V

    iput-object p1, p0, Lcom/radaee/view/PDFView;->m_finder:Lcom/radaee/view/PDFVFinder;

    .line 426
    iput-object p4, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    .line 427
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vLayout()V

    .line 428
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_0
    return-void
.end method

.method public vRenderAsync(Lcom/radaee/view/PDFVPage;)V
    .locals 1

    .line 870
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 882
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    .line 883
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFVThread;->start_render(Lcom/radaee/view/PDFVPage;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public vRenderSync(Lcom/radaee/view/PDFVPage;)V
    .locals 1

    .line 857
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 858
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    .line 859
    invoke-virtual {p1}, Lcom/radaee/view/PDFVPage;->RenderPrepare()I

    .line 860
    iget-object p1, p1, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    invoke-virtual {p1}, Lcom/radaee/view/PDFVCache;->Render()V

    .line 861
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    .line 862
    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public vResize(II)V
    .locals 2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 216
    iget v0, p0, Lcom/radaee/view/PDFView;->m_lock:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 217
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 218
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    .line 219
    iput p1, p0, Lcom/radaee/view/PDFView;->m_w:I

    .line 220
    iput p2, p0, Lcom/radaee/view/PDFView;->m_h:I

    .line 221
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vLayout()V

    .line 222
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_2

    const/4 p2, 0x0

    .line 224
    invoke-interface {p1, p2}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public vSetBackColor(I)V
    .locals 1

    .line 203
    iput p1, p0, Lcom/radaee/view/PDFView;->m_back:I

    .line 204
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_0
    return-void
.end method

.method public vSetBmpFormat(Landroid/graphics/Bitmap$Config;)V
    .locals 2

    .line 432
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    if-eq v0, p1, :cond_1

    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 433
    :cond_0
    iput-object p1, p0, Lcom/radaee/view/PDFView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    .line 434
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 436
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 437
    iget v0, p0, Lcom/radaee/view/PDFView;->m_w:I

    iget v1, p0, Lcom/radaee/view/PDFView;->m_h:I

    invoke-static {v0, v1, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/PDFView;->m_bmp:Landroid/graphics/Bitmap;

    .line 438
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public vSetLock(I)V
    .locals 0

    .line 896
    iput p1, p0, Lcom/radaee/view/PDFView;->m_lock:I

    return-void
.end method

.method public vSetPageGap(I)V
    .locals 1

    .line 208
    iput p1, p0, Lcom/radaee/view/PDFView;->m_page_gap:I

    const/4 p1, 0x0

    .line 209
    invoke-virtual {p0, p1, p1}, Lcom/radaee/view/PDFView;->vGetPos(II)Lcom/radaee/view/PDFView$PDFPos;

    move-result-object v0

    .line 210
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vLayout()V

    .line 211
    invoke-virtual {p0, v0, p1, p1}, Lcom/radaee/view/PDFView;->vSetPos(Lcom/radaee/view/PDFView$PDFPos;II)V

    .line 212
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_0
    return-void
.end method

.method public vSetPos(Lcom/radaee/view/PDFView$PDFPos;II)V
    .locals 3

    if-eqz p1, :cond_1

    .line 779
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-eqz v0, :cond_1

    iget v0, p1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    if-ltz v0, :cond_1

    iget v0, p1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v2, v1

    if-lt v0, v2, :cond_0

    goto :goto_0

    .line 780
    :cond_0
    iget v0, p1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    aget-object v0, v1, v0

    invoke-virtual {v0}, Lcom/radaee/view/PDFVPage;->GetX()I

    move-result v0

    int-to-float v0, v0

    iget v1, p1, Lcom/radaee/view/PDFView$PDFPos;->x:F

    iget v2, p0, Lcom/radaee/view/PDFView;->m_scale:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    int-to-float p2, p2

    sub-float/2addr v0, p2

    .line 781
    iget-object p2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget v1, p1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    aget-object p2, p2, v1

    invoke-virtual {p2}, Lcom/radaee/view/PDFVPage;->GetY()I

    move-result p2

    int-to-float p2, p2

    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p1, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v1

    iget p1, p1, Lcom/radaee/view/PDFView$PDFPos;->y:F

    sub-float/2addr v1, p1

    iget p1, p0, Lcom/radaee/view/PDFView;->m_scale:F

    mul-float v1, v1, p1

    add-float/2addr p2, v1

    int-to-float p1, p3

    sub-float/2addr p2, p1

    .line 782
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    const/4 p3, 0x1

    invoke-virtual {p1, p3}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 783
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->abortAnimation()V

    float-to-int p1, v0

    .line 784
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFView;->vSetX(I)V

    float-to-int p1, p2

    .line 785
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFView;->vSetY(I)V

    .line 786
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 787
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_1

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public vSetScale(FFF)V
    .locals 6

    .line 823
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    float-to-int p2, p2

    float-to-int p3, p3

    .line 824
    invoke-virtual {p0, p2, p3}, Lcom/radaee/view/PDFView;->vGetPos(II)Lcom/radaee/view/PDFView$PDFPos;

    move-result-object v0

    .line 826
    iget-object v1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    array-length v1, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 829
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v4, v4, v3

    iget-object v5, p0, Lcom/radaee/view/PDFView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v4, v5}, Lcom/radaee/view/PDFVPage;->CreateBmp(Landroid/graphics/Bitmap$Config;)V

    .line 830
    iget-object v4, p0, Lcom/radaee/view/PDFView;->m_thread:Lcom/radaee/view/PDFVThread;

    iget-object v5, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v5, v5, v3

    invoke-virtual {v4, v5}, Lcom/radaee/view/PDFVThread;->end_render(Lcom/radaee/view/PDFVPage;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    .line 833
    iput-boolean v1, p0, Lcom/radaee/view/PDFView;->m_drawbmp:Z

    .line 834
    iput p1, p0, Lcom/radaee/view/PDFView;->m_scale:F

    .line 835
    invoke-virtual {p0}, Lcom/radaee/view/PDFView;->vLayout()V

    .line 836
    invoke-virtual {p0, v0, p2, p3}, Lcom/radaee/view/PDFView;->vSetPos(Lcom/radaee/view/PDFView$PDFPos;II)V

    .line 837
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_2

    invoke-interface {p1, v2}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_2
    :goto_1
    return-void
.end method

.method public vSetSel(FFFF)V
    .locals 10

    .line 913
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    if-nez v0, :cond_0

    goto :goto_1

    .line 915
    :cond_0
    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 918
    iget-object v3, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/radaee/view/PDFVPage;->ClearSel()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    float-to-int v0, p1

    float-to-int v2, p2

    .line 921
    invoke-virtual {p0, v0, v2}, Lcom/radaee/view/PDFView;->vGetPos(II)Lcom/radaee/view/PDFView$PDFPos;

    move-result-object v0

    .line 922
    iget-object v2, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    iget v0, v0, Lcom/radaee/view/PDFView$PDFPos;->pageno:I

    aget-object v3, v2, v0

    .line 923
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v8

    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v9

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-virtual/range {v3 .. v9}, Lcom/radaee/view/PDFVPage;->SetSel(FFFFII)V

    .line 924
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_listener:Lcom/radaee/view/PDFView$PDFViewListener;

    if-eqz p1, :cond_2

    invoke-interface {p1, v1}, Lcom/radaee/view/PDFView$PDFViewListener;->OnPDFInvalidate(Z)V

    :cond_2
    :goto_1
    return-void
.end method

.method public vSetSelMarkup(I)Z
    .locals 4

    .line 965
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 967
    :cond_0
    array-length v0, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 970
    iget-object v3, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1}, Lcom/radaee/view/PDFVPage;->SetSelMarkup(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 972
    iget-object p1, p0, Lcom/radaee/view/PDFView;->m_pages:[Lcom/radaee/view/PDFVPage;

    aget-object p1, p1, v2

    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFView;->vRenderSync(Lcom/radaee/view/PDFVPage;)V

    const/4 p1, 0x1

    return p1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public vSetSelStatus(Z)V
    .locals 0

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    .line 954
    iput p1, p0, Lcom/radaee/view/PDFView;->m_status:I

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 956
    iput p1, p0, Lcom/radaee/view/PDFView;->m_status:I

    return-void
.end method

.method public vSetX(I)V
    .locals 3

    .line 1086
    iget v0, p0, Lcom/radaee/view/PDFView;->m_docw:I

    iget v1, p0, Lcom/radaee/view/PDFView;->m_w:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int p1, v0, v1

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 1088
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalX(I)V

    return-void
.end method

.method public vSetY(I)V
    .locals 3

    .line 1092
    iget v0, p0, Lcom/radaee/view/PDFView;->m_doch:I

    iget v1, p0, Lcom/radaee/view/PDFView;->m_h:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int p1, v0, v1

    :cond_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 1094
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0, p1}, Landroid/widget/Scroller;->setFinalY(I)V

    return-void
.end method

.method protected vSingleTap(FF)V
    .locals 0

    return-void
.end method

.method public vTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 725
    iget v0, p0, Lcom/radaee/view/PDFView;->m_status:I

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    .line 727
    iget v2, p0, Lcom/radaee/view/PDFView;->m_lock:I

    const/4 v3, 0x5

    if-eq v2, v3, :cond_1

    .line 728
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFView;->motionZoom(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_1
    const/4 v2, 0x3

    if-ne v0, v2, :cond_2

    .line 730
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFView;->motionSelect(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_2
    return v1

    .line 726
    :cond_3
    :goto_0
    invoke-virtual {p0, p1}, Lcom/radaee/view/PDFView;->motionNormal(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
