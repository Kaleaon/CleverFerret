.class public Lcom/radaee/view/PDFPageView;
.super Landroid/view/View;
.source "PDFPageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/PDFPageView$PDFGestureListener;,
        Lcom/radaee/view/PDFPageView$PageListener;
    }
.end annotation


# static fields
.field protected static final STA_NONE:I = 0x0

.field protected static final STA_ZOOM:I = 0x1

.field private static m_page_gap:I = 0xa


# instance fields
.field private m_amgr:Landroid/app/ActivityManager;

.field private m_bmp:Landroid/graphics/Bitmap;

.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_fit_type:I

.field private m_gesture:Landroid/view/GestureDetector;

.field private m_h:I

.field private m_hold_px:F

.field private m_hold_py:F

.field private m_hold_x:F

.field private m_hold_y:F

.field private m_info:Landroid/app/ActivityManager$MemoryInfo;

.field private m_info_paint:Landroid/graphics/Paint;

.field private m_margin_left:I

.field private m_margin_top:I

.field private m_pageno:I

.field private m_ph:I

.field private m_pw:I

.field private m_scale:F

.field private m_scale_max:F

.field private m_scale_min:F

.field private m_scroller:Landroid/widget/Scroller;

.field private m_status:I

.field private m_thread:Lcom/radaee/view/VThread;

.field private m_thread_cache:Lcom/radaee/view/VThread;

.field m_vpage:Lcom/radaee/view/VPage;

.field private m_w:I

.field private m_x:I

.field private m_y:I

.field private m_zoom_dis0:F

.field private m_zoom_pdfx:F

.field private m_zoom_pdfy:F

.field private m_zoom_scale:F

.field private m_zooming:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 77
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 33
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    .line 73
    new-instance v1, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v1}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    .line 74
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    .line 423
    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_gesture:Landroid/view/GestureDetector;

    const v1, -0x39e3c000    # -10000.0f

    .line 436
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    .line 437
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    .line 546
    iput-boolean v0, p0, Lcom/radaee/view/PDFPageView;->m_zooming:Z

    .line 78
    invoke-direct {p0}, Lcom/radaee/view/PDFPageView;->init()V

    .line 79
    sget-boolean v1, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v1, :cond_0

    .line 81
    const-string v1, "activity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    iput-object p1, p0, Lcom/radaee/view/PDFPageView;->m_amgr:Landroid/app/ActivityManager;

    .line 82
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {p1, v1, v1, v0, v0}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 83
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v0, 0x41f00000    # 30.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 88
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 33
    iput p2, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    .line 73
    new-instance v0, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v0}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFPageView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    .line 74
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/4 v0, 0x0

    .line 423
    iput-object v0, p0, Lcom/radaee/view/PDFPageView;->m_gesture:Landroid/view/GestureDetector;

    const v0, -0x39e3c000    # -10000.0f

    .line 436
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    .line 437
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    .line 546
    iput-boolean p2, p0, Lcom/radaee/view/PDFPageView;->m_zooming:Z

    .line 89
    invoke-direct {p0}, Lcom/radaee/view/PDFPageView;->init()V

    .line 90
    sget-boolean v0, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v0, :cond_0

    .line 92
    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    iput-object p1, p0, Lcom/radaee/view/PDFPageView;->m_amgr:Landroid/app/ActivityManager;

    .line 93
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/16 v0, 0xff

    invoke-virtual {p1, v0, v0, p2, p2}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 94
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 p2, 0x41f00000    # 30.0f

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    :cond_0
    return-void
.end method

.method private GetPDFX(F)F
    .locals 1

    .line 190
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    int-to-float v0, v0

    add-float/2addr p1, v0

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_margin_left:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    div-float/2addr p1, v0

    return p1
.end method

.method private GetPDFY(F)F
    .locals 2

    .line 194
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v0

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    int-to-float v1, v1

    add-float/2addr p1, v1

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_margin_top:I

    int-to-float v1, v1

    sub-float/2addr p1, v1

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    div-float/2addr p1, v1

    sub-float/2addr v0, p1

    return v0
.end method

.method private SetPDFX(FF)V
    .locals 1

    .line 198
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    mul-float p2, p2, v0

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_margin_left:I

    int-to-float v0, v0

    add-float/2addr p2, v0

    sub-float/2addr p2, p1

    float-to-int p1, p2

    .line 199
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFPageView;->SetX(I)V

    return-void
.end method

.method private SetPDFY(FF)V
    .locals 2

    .line 203
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v0

    sub-float/2addr v0, p2

    iget p2, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    mul-float v0, v0, p2

    iget p2, p0, Lcom/radaee/view/PDFPageView;->m_margin_top:I

    int-to-float p2, p2

    add-float/2addr v0, p2

    sub-float/2addr v0, p1

    float-to-int p1, v0

    .line 204
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFPageView;->SetY(I)V

    return-void
.end method

.method private SetScale(F)V
    .locals 4

    .line 208
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v0

    .line 209
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v1

    .line 210
    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_scale_min:F

    cmpg-float v3, p1, v2

    if-gez v3, :cond_0

    move p1, v2

    .line 212
    :cond_0
    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_scale_max:F

    cmpl-float v3, p1, v2

    if-lez v3, :cond_1

    move p1, v2

    .line 214
    :cond_1
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    mul-float v0, v0, p1

    float-to-int v0, v0

    mul-float p1, p1, v1

    float-to-int p1, p1

    .line 217
    sget v1, Lcom/radaee/view/PDFPageView;->m_page_gap:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_pw:I

    add-int/2addr p1, v1

    .line 218
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_ph:I

    .line 219
    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    if-lt v2, v0, :cond_2

    sub-int/2addr v2, v0

    add-int/2addr v2, v1

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/radaee/view/PDFPageView;->m_margin_left:I

    goto :goto_0

    .line 220
    :cond_2
    div-int/lit8 v0, v1, 0x2

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_margin_left:I

    .line 221
    :goto_0
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    if-lt v0, p1, :cond_3

    sub-int/2addr v0, p1

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_margin_top:I

    goto :goto_1

    .line 222
    :cond_3
    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_margin_top:I

    .line 223
    :goto_1
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    invoke-direct {p0, p1}, Lcom/radaee/view/PDFPageView;->SetX(I)V

    .line 224
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    invoke-direct {p0, p1}, Lcom/radaee/view/PDFPageView;->SetY(I)V

    .line 225
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_margin_left:I

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_margin_top:I

    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    const/4 v3, 0x1

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/radaee/view/VPage;->vLayout(IIFZ)V

    .line 226
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p1, v0, v3}, Lcom/radaee/view/VPage;->vClips(Lcom/radaee/pdf/VNPage$VNPageListener;Z)V

    return-void
.end method

.method private SetX(I)V
    .locals 3

    .line 174
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    .line 175
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_pw:I

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int/2addr v0, v1

    .line 176
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    .line 177
    :cond_0
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 178
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    :cond_1
    return-void
.end method

.method private SetY(I)V
    .locals 3

    .line 182
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    .line 183
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_ph:I

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    sub-int v2, v0, v1

    if-le p1, v2, :cond_0

    sub-int/2addr v0, v1

    .line 184
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    .line 185
    :cond_0
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 186
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    :cond_1
    return-void
.end method

.method static synthetic access$000(Lcom/radaee/view/PDFPageView;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    return p0
.end method

.method static synthetic access$100(Lcom/radaee/view/PDFPageView;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    return p0
.end method

.method static synthetic access$200(Lcom/radaee/view/PDFPageView;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/radaee/view/PDFPageView;->m_pw:I

    return p0
.end method

.method static synthetic access$300(Lcom/radaee/view/PDFPageView;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    return p0
.end method

.method static synthetic access$400(Lcom/radaee/view/PDFPageView;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    return p0
.end method

.method static synthetic access$500(Lcom/radaee/view/PDFPageView;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/radaee/view/PDFPageView;->m_ph:I

    return p0
.end method

.method static synthetic access$600(Lcom/radaee/view/PDFPageView;)Landroid/widget/Scroller;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/radaee/view/PDFPageView;->m_scroller:Landroid/widget/Scroller;

    return-object p0
.end method

.method private final init()V
    .locals 3

    .line 58
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/radaee/view/PDFPageView;->m_scroller:Landroid/widget/Scroller;

    .line 59
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/radaee/view/PDFPageView$PDFGestureListener;

    invoke-direct {v2, p0}, Lcom/radaee/view/PDFPageView$PDFGestureListener;-><init>(Lcom/radaee/view/PDFPageView;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/radaee/view/PDFPageView;->m_gesture:Landroid/view/GestureDetector;

    .line 60
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/16 v2, 0xff

    .line 62
    invoke-virtual {v0, v2, v2, v1, v1}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 63
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41f00000    # 30.0f

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    :cond_0
    const/4 v0, 0x0

    .line 65
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    .line 66
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    .line 67
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    .line 68
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    .line 69
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    const/4 v0, 0x0

    .line 70
    iput-object v0, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    return-void
.end method

.method private onTouchZoom(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 549
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    return v1

    .line 550
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x2

    if-eq v0, v2, :cond_3

    if-eq v0, v3, :cond_1

    const/4 v4, 0x3

    if-eq v0, v4, :cond_3

    const/4 v4, 0x6

    if-eq v0, v4, :cond_3

    .line 588
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    if-ge p1, v3, :cond_4

    .line 590
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    return v1

    .line 553
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ge v0, v3, :cond_2

    .line 555
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    return v1

    .line 558
    :cond_2
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    if-ne v0, v2, :cond_4

    .line 560
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 561
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    .line 562
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    .line 563
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_zoom_scale:F

    mul-float v0, v0, p1

    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_zoom_dis0:F

    div-float/2addr v0, p1

    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->SetScale(F)V

    .line 564
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_zoom_pdfx:F

    invoke-direct {p0, p1, v0}, Lcom/radaee/view/PDFPageView;->SetPDFX(FF)V

    .line 565
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_zoom_pdfy:F

    invoke-direct {p0, p1, v0}, Lcom/radaee/view/PDFPageView;->SetPDFY(FF)V

    .line 566
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->invalidate()V

    goto :goto_0

    .line 572
    :cond_3
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    if-ne v0, v2, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-gt v0, v3, :cond_4

    .line 574
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 575
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v3, p1

    mul-float v0, v0, v0

    mul-float v3, v3, v3

    add-float/2addr v0, v3

    .line 576
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    .line 577
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_zoom_scale:F

    mul-float v0, v0, p1

    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_zoom_dis0:F

    div-float/2addr v0, p1

    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->SetScale(F)V

    .line 578
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_zoom_pdfx:F

    invoke-direct {p0, p1, v0}, Lcom/radaee/view/PDFPageView;->SetPDFX(FF)V

    .line 579
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_zoom_pdfy:F

    invoke-direct {p0, p1, v0}, Lcom/radaee/view/PDFPageView;->SetPDFY(FF)V

    .line 580
    iget-object v3, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object v4, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    iget v5, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    iget v6, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    iget v7, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    iget v8, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    invoke-virtual/range {v3 .. v8}, Lcom/radaee/view/VPage;->vZoomConfirmed(Lcom/radaee/pdf/VNPage$VNPageListener;IIII)V

    const p1, -0x39e3c000    # -10000.0f

    .line 581
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    .line 582
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    .line 583
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    .line 584
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->invalidate()V

    :cond_4
    :goto_0
    return v2
.end method

.method private touchNone(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 444
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 445
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_gesture:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 447
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_10

    const v3, -0x39e3c000    # -10000.0f

    if-eq v0, v2, :cond_a

    const/4 v4, 0x2

    if-eq v0, v4, :cond_4

    const/4 v5, 0x3

    if-eq v0, v5, :cond_a

    const/4 v3, 0x5

    if-eq v0, v3, :cond_2

    goto :goto_0

    .line 524
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v4, :cond_3

    .line 526
    iput v2, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    .line 527
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v0, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v0, v3

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    .line 528
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    add-float/2addr v0, v4

    div-float/2addr v0, v3

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    .line 529
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->GetPDFX(F)F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_zoom_pdfx:F

    .line 530
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->GetPDFY(F)F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_zoom_pdfy:F

    .line 532
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 533
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    .line 534
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_zoom_dis0:F

    .line 535
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_zoom_scale:F

    .line 536
    iput v2, p0, Lcom/radaee/view/PDFPageView;->m_status:I

    .line 537
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v0}, Lcom/radaee/view/VPage;->vZoomStart(Landroid/graphics/Bitmap$Config;)V

    .line 538
    iput-boolean v2, p0, Lcom/radaee/view/PDFPageView;->m_zooming:Z

    :cond_3
    :goto_0
    return v2

    .line 458
    :cond_4
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    cmpg-float v4, v0, v3

    if-gtz v4, :cond_5

    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    cmpg-float v3, v4, v3

    if-gtz v3, :cond_5

    .line 460
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    .line 461
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    .line 462
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    int-to-float p1, p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_px:F

    .line 463
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    int-to-float p1, p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_py:F

    return v2

    .line 467
    :cond_5
    iget v3, p0, Lcom/radaee/view/PDFPageView;->m_hold_px:F

    add-float/2addr v3, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    sub-float/2addr v3, v0

    float-to-int v0, v3

    .line 468
    iget v3, p0, Lcom/radaee/view/PDFPageView;->m_hold_py:F

    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    .line 469
    iget v3, p0, Lcom/radaee/view/PDFPageView;->m_pw:I

    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    sub-int v5, v3, v4

    if-le v0, v5, :cond_6

    sub-int v0, v3, v4

    const/4 v2, 0x0

    :cond_6
    if-gez v0, :cond_7

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 479
    :cond_7
    iget v3, p0, Lcom/radaee/view/PDFPageView;->m_ph:I

    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    sub-int v5, v3, v4

    if-le p1, v5, :cond_8

    sub-int p1, v3, v4

    :cond_8
    if-gez p1, :cond_9

    goto :goto_1

    :cond_9
    move v1, p1

    .line 483
    :goto_1
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    .line 484
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    .line 485
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->invalidate()V

    return v2

    .line 490
    :cond_a
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    cmpg-float v4, v0, v3

    if-gtz v4, :cond_b

    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    cmpg-float v4, v4, v3

    if-gtz v4, :cond_b

    .line 492
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    .line 493
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    .line 494
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    int-to-float p1, p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_px:F

    .line 495
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    int-to-float p1, p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_py:F

    goto :goto_3

    .line 499
    :cond_b
    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_hold_px:F

    add-float/2addr v4, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    sub-float/2addr v4, v0

    float-to-int v0, v4

    .line 500
    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_hold_py:F

    iget v5, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    add-float/2addr v4, v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v4, p1

    float-to-int p1, v4

    .line 501
    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_pw:I

    iget v5, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    sub-int v6, v4, v5

    if-le v0, v6, :cond_c

    sub-int v0, v4, v5

    const/4 v2, 0x0

    :cond_c
    if-gez v0, :cond_d

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 511
    :cond_d
    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_ph:I

    iget v5, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    sub-int v6, v4, v5

    if-le p1, v6, :cond_e

    sub-int p1, v4, v5

    :cond_e
    if-gez p1, :cond_f

    goto :goto_2

    :cond_f
    move v1, p1

    .line 515
    :goto_2
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    .line 516
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    .line 517
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->invalidate()V

    .line 520
    :goto_3
    iput v3, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    .line 521
    iput v3, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    return v2

    .line 450
    :cond_10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_hold_x:F

    .line 451
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_y:F

    .line 452
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    int-to-float p1, p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_px:F

    .line 453
    iget p1, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    int-to-float p1, p1

    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_hold_py:F

    .line 455
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->invalidate()V

    return v2
.end method

.method private vDrawNormal(Landroid/graphics/Canvas;II)V
    .locals 3

    .line 293
    new-instance v0, Lcom/radaee/pdf/BMP;

    invoke-direct {v0}, Lcom/radaee/pdf/BMP;-><init>()V

    .line 294
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 295
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object v2, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v1, v2, v0, p2, p3}, Lcom/radaee/view/VPage;->vDraw(Lcom/radaee/pdf/VNPage$VNPageListener;Lcom/radaee/pdf/BMP;II)V

    .line 296
    iget-object p2, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p2}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 297
    new-instance p2, Landroid/graphics/Canvas;

    iget-object p3, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-direct {p2, p3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 298
    iget-object p3, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p3, v1, p2}, Lcom/radaee/view/VPage;->vDrawStep1(Lcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;)Z

    .line 299
    iget-object p2, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p2}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 301
    iget-object p2, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    invoke-virtual {p2, v0}, Lcom/radaee/view/VPage;->vDrawStep2(Lcom/radaee/pdf/BMP;)V

    .line 302
    sget-boolean p2, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz p2, :cond_0

    .line 303
    invoke-virtual {v0}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 305
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p2}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 306
    iget-object p2, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    const/4 p3, 0x0

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0, v0, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 307
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->vDrawEnd()V

    return-void
.end method

.method private vDrawZoom(Landroid/graphics/Canvas;II)V
    .locals 3

    .line 280
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 281
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object v2, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v1, v2, v0, p2, p3}, Lcom/radaee/view/VPage;->vDraw(Lcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;II)V

    .line 282
    sget-boolean p2, Lcom/radaee/pdf/Global;->dark_mode:Z

    if-eqz p2, :cond_0

    .line 284
    new-instance p2, Lcom/radaee/pdf/BMP;

    invoke-direct {p2}, Lcom/radaee/pdf/BMP;-><init>()V

    .line 285
    iget-object p3, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, p3}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 286
    invoke-virtual {p2}, Lcom/radaee/pdf/BMP;->Invert()V

    .line 287
    iget-object p3, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p2, p3}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V

    .line 289
    :cond_0
    iget-object p2, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    const/4 p3, 0x0

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0, v0, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private vLayout()V
    .locals 7

    .line 230
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    if-lez v0, :cond_5

    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    if-lez v0, :cond_5

    .line 232
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_5

    .line 234
    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v0

    .line 235
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v1

    .line 236
    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    sget v3, Lcom/radaee/view/PDFPageView;->m_page_gap:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    div-float/2addr v2, v0

    .line 237
    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    sub-int/2addr v4, v3

    int-to-float v3, v4

    div-float/2addr v3, v1

    .line 238
    iget v4, p0, Lcom/radaee/view/PDFPageView;->m_fit_type:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_2

    const/4 v5, 0x2

    if-eq v4, v5, :cond_1

    cmpl-float v4, v2, v3

    if-lez v4, :cond_0

    move v2, v3

    .line 248
    :cond_0
    iput v2, p0, Lcom/radaee/view/PDFPageView;->m_scale_min:F

    goto :goto_0

    .line 244
    :cond_1
    iput v3, p0, Lcom/radaee/view/PDFPageView;->m_scale_min:F

    goto :goto_0

    .line 241
    :cond_2
    iput v2, p0, Lcom/radaee/view/PDFPageView;->m_scale_min:F

    :goto_0
    const/high16 v3, 0x41400000    # 12.0f

    mul-float v2, v2, v3

    .line 251
    iput v2, p0, Lcom/radaee/view/PDFPageView;->m_scale_max:F

    .line 252
    iget-object v2, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    if-nez v2, :cond_4

    cmpl-float v2, v0, v1

    if-lez v2, :cond_3

    .line 254
    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_scale_min:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    goto :goto_1

    :cond_3
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_scale_min:F

    mul-float v1, v1, v0

    float-to-int v0, v1

    :goto_1
    move v4, v0

    .line 255
    new-instance v1, Lcom/radaee/view/VPage;

    iget-object v2, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    iget v3, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move v5, v4

    invoke-direct/range {v1 .. v6}, Lcom/radaee/view/VPage;-><init>(Lcom/radaee/pdf/Document;IIILandroid/graphics/Bitmap$Config;)V

    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    .line 257
    :cond_4
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_scale_min:F

    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->SetScale(F)V

    :cond_5
    return-void
.end method


# virtual methods
.method public final PDFGetPageNO()I
    .locals 1

    .line 170
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    return v0
.end method

.method public computeScroll()V
    .locals 1

    .line 427
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 429
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->SetX(I)V

    .line 430
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_scroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->SetY(I)V

    .line 431
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->invalidate()V

    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 630
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->vClose()V

    .line 631
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    const-string v0, "AvialMem:"

    .line 312
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    if-eqz v1, :cond_3

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    if-lez v1, :cond_3

    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    if-gtz v2, :cond_0

    goto :goto_1

    .line 313
    :cond_0
    iget-object v3, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    if-nez v3, :cond_1

    .line 315
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    .line 317
    :cond_1
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    const v2, -0x333334

    invoke-virtual {v1, v2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 318
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object v2, p0, Lcom/radaee/view/PDFPageView;->m_thread_cache:Lcom/radaee/view/VThread;

    invoke-virtual {v1, v2}, Lcom/radaee/view/VPage;->vCacheStart1(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 326
    iget-boolean v1, p0, Lcom/radaee/view/PDFPageView;->m_zooming:Z

    if-eqz v1, :cond_2

    .line 328
    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    invoke-direct {p0, p1, v1, v2}, Lcom/radaee/view/PDFPageView;->vDrawZoom(Landroid/graphics/Canvas;II)V

    goto :goto_0

    .line 344
    :cond_2
    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    invoke-direct {p0, p1, v1, v2}, Lcom/radaee/view/PDFPageView;->vDrawNormal(Landroid/graphics/Canvas;II)V

    .line 355
    :goto_0
    sget-boolean v1, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_amgr:Landroid/app/ActivityManager;

    if-eqz v1, :cond_3

    .line 358
    :try_start_0
    iget-object v2, p0, Lcom/radaee/view/PDFPageView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    invoke-virtual {v1, v2}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 359
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    iget-wide v2, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    const-wide/32 v4, 0x100000

    div-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " M"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x43160000    # 150.0f

    invoke-virtual {p1, v0, v2, v3, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 363
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3
    :goto_1
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 264
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    const/4 p3, 0x0

    .line 265
    iput p3, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    .line 266
    iput p3, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    .line 267
    iput p1, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    .line 268
    iput p2, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    .line 269
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    .line 271
    iget-object p3, p0, Lcom/radaee/view/PDFPageView;->m_thread_cache:Lcom/radaee/view/VThread;

    invoke-virtual {p1, p3}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 272
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object p3, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {p1, p3}, Lcom/radaee/view/VPage;->vDestroy(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 273
    iput-object p2, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    .line 275
    :cond_0
    iget-object p1, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    iput-object p2, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    .line 276
    :cond_1
    invoke-direct {p0}, Lcom/radaee/view/PDFPageView;->vLayout()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 602
    :try_start_0
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFPageView;->onTouchZoom(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 603
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v0

    .line 606
    :cond_0
    invoke-direct {p0, p1}, Lcom/radaee/view/PDFPageView;->touchNone(Landroid/view/MotionEvent;)Z

    move-result p1

    .line 607
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    const/4 p1, 0x0

    return p1
.end method

.method public vClose()V
    .locals 3

    .line 153
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 155
    iget-object v2, p0, Lcom/radaee/view/PDFPageView;->m_thread_cache:Lcom/radaee/view/VThread;

    invoke-virtual {v0, v2}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 156
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object v2, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v0, v2}, Lcom/radaee/view/VPage;->vDestroy(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 157
    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 161
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 162
    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    .line 164
    :cond_1
    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    .line 165
    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_thread_cache:Lcom/radaee/view/VThread;

    .line 166
    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    return-void
.end method

.method public vFreeCache()V
    .locals 4

    .line 125
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v0

    .line 126
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v1

    .line 127
    iget v2, p0, Lcom/radaee/view/PDFPageView;->m_scale_min:F

    iput v2, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    mul-float v0, v0, v2

    float-to-int v0, v0

    mul-float v2, v2, v1

    float-to-int v1, v2

    .line 130
    sget v2, Lcom/radaee/view/PDFPageView;->m_page_gap:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_pw:I

    add-int/2addr v1, v2

    .line 131
    iput v1, p0, Lcom/radaee/view/PDFPageView;->m_ph:I

    .line 132
    iget v3, p0, Lcom/radaee/view/PDFPageView;->m_w:I

    if-lt v3, v0, :cond_0

    sub-int/2addr v3, v0

    add-int/2addr v3, v2

    div-int/lit8 v3, v3, 0x2

    iput v3, p0, Lcom/radaee/view/PDFPageView;->m_margin_left:I

    goto :goto_0

    .line 133
    :cond_0
    div-int/lit8 v0, v2, 0x2

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_margin_left:I

    .line 134
    :goto_0
    iget v0, p0, Lcom/radaee/view/PDFPageView;->m_h:I

    if-lt v0, v1, :cond_1

    sub-int/2addr v0, v1

    add-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_margin_top:I

    goto :goto_1

    .line 135
    :cond_1
    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/radaee/view/PDFPageView;->m_margin_top:I

    :goto_1
    const/4 v0, 0x0

    .line 136
    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->SetX(I)V

    .line 137
    invoke-direct {p0, v0}, Lcom/radaee/view/PDFPageView;->SetY(I)V

    .line 138
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    if-eqz v0, :cond_2

    .line 140
    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v0, v1}, Lcom/radaee/view/VPage;->vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 141
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    iget-object v1, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    invoke-virtual {v0, v1}, Lcom/radaee/view/VPage;->vEndPage(Lcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 144
    :cond_2
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 146
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 147
    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_bmp:Landroid/graphics/Bitmap;

    .line 149
    :cond_3
    iput-object v1, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    return-void
.end method

.method public vIsOpened()Z
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public vIsRenderFinish()Z
    .locals 1

    .line 617
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 618
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/view/VPage;->vFinished()Z

    move-result v0

    return v0
.end method

.method public vOpen(Lcom/radaee/view/VThread;Lcom/radaee/view/VThread;Lcom/radaee/pdf/Document;II)V
    .locals 1

    .line 108
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->vClose()V

    const/4 v0, 0x0

    .line 109
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_scale:F

    const/4 v0, 0x0

    .line 110
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_x:I

    .line 111
    iput v0, p0, Lcom/radaee/view/PDFPageView;->m_y:I

    .line 112
    iput-object p3, p0, Lcom/radaee/view/PDFPageView;->m_doc:Lcom/radaee/pdf/Document;

    .line 113
    iput p4, p0, Lcom/radaee/view/PDFPageView;->m_pageno:I

    .line 114
    iput-object p1, p0, Lcom/radaee/view/PDFPageView;->m_thread:Lcom/radaee/view/VThread;

    .line 115
    iput-object p2, p0, Lcom/radaee/view/PDFPageView;->m_thread_cache:Lcom/radaee/view/VThread;

    .line 116
    iput p5, p0, Lcom/radaee/view/PDFPageView;->m_fit_type:I

    .line 117
    invoke-direct {p0}, Lcom/radaee/view/PDFPageView;->vLayout()V

    return-void
.end method

.method public vRenderFinish()V
    .locals 1

    .line 622
    iget-object v0, p0, Lcom/radaee/view/PDFPageView;->m_vpage:Lcom/radaee/view/VPage;

    if-nez v0, :cond_0

    return-void

    .line 623
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/view/VPage;->vZoomEnd()V

    const/4 v0, 0x0

    .line 624
    iput-boolean v0, p0, Lcom/radaee/view/PDFPageView;->m_zooming:Z

    .line 625
    invoke-virtual {p0}, Lcom/radaee/view/PDFPageView;->invalidate()V

    return-void
.end method
