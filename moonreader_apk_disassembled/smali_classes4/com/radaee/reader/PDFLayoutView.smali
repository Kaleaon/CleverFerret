.class public Lcom/radaee/reader/PDFLayoutView;
.super Landroid/view/View;
.source "PDFLayoutView.java"

# interfaces
.implements Lcom/radaee/view/ILayoutView;
.implements Lcom/radaee/view/PDFLayout$LayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;,
        Lcom/radaee/reader/PDFLayoutView$OnAfterSelect;,
        Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;,
        Lcom/radaee/reader/PDFLayoutView$OnBeforeLinkJump;
    }
.end annotation


# static fields
.field public static final STA_ANNOT:I = 0x64

.field public static final STA_ARROW:I = 0x47

.field public static final STA_EDITBOX:I = 0x9

.field public static final STA_ELLIPSE:I = 0x5

.field public static final STA_FREETEXT:I = 0xc8

.field public static final STA_INK:I = 0x3

.field public static final STA_LINE:I = 0x7

.field public static final STA_NONE:I = 0x0

.field public static final STA_NOTE:I = 0x6

.field public static final STA_POLYGON:I = 0xa

.field public static final STA_POLYLINE:I = 0xb

.field public static final STA_RECT:I = 0x4

.field public static final STA_SELECT:I = 0x2

.field public static final STA_STAMP:I = 0x8

.field public static final STA_ZOOM:I = 0x1

.field public static inkStart:Z

.field private static tmp_idx:I


# instance fields
.field annotRectChanged:Z

.field public beforePageJump:Lcom/radaee/reader/PDFLayoutView$OnBeforeLinkJump;

.field public disableAnnotCheck:Z

.field flingStartTime:J

.field force_sel_end:I

.field force_sel_start:I

.field private mReadOnly:Z

.field private m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

.field private m_amgr:Landroid/app/ActivityManager;

.field public m_annot:Lcom/radaee/pdf/Page$Annotation;

.field public m_annot_page:Lcom/radaee/view/VPage;

.field public m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

.field private m_annot_rect:[F

.field private m_annot_rect0:[F

.field private m_annot_x0:F

.field private m_annot_y0:F

.field protected m_bmp_format:Landroid/graphics/Bitmap$Config;

.field private m_combo_item:I

.field public m_doc:Lcom/radaee/pdf/Document;

.field private m_edit_type:I

.field protected m_gesture:Landroid/view/GestureDetector;

.field protected m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

.field public m_hold:Z

.field private m_hold_docx:I

.field private m_hold_docy:I

.field private m_hold_x:F

.field private m_hold_y:F

.field private m_icon:Landroid/graphics/Bitmap;

.field private m_info:Landroid/app/ActivityManager$MemoryInfo;

.field private m_info_paint:Landroid/graphics/Paint;

.field private m_ink:Lcom/radaee/pdf/Ink;

.field public m_layout:Lcom/radaee/view/PDFLayout;

.field private m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

.field private m_note_indecs:[I

.field private m_note_pages:[Lcom/radaee/view/VPage;

.field private m_pCombo:Landroid/widget/PopupWindow;

.field public m_pageno:I

.field private m_rects:[F

.field private m_save_pos:Lcom/radaee/view/PDFLayout$PDFPos;

.field public m_sel:Lcom/radaee/view/VSel;

.field private m_sel_icon1:Landroid/graphics/Bitmap;

.field private m_sel_icon2:Landroid/graphics/Bitmap;

.field public m_status:I

.field private m_view_mode:I

.field private m_zoom_dis0:F

.field private m_zoom_pos:Lcom/radaee/view/PDFLayout$PDFPos;

.field private m_zoom_scale:F

.field private m_zooming:Z

.field public page_gap:I

.field priorDrawTime:J

.field priorPage:I

.field priorX:I

.field priorY:I

.field public scoll_lock:Z

.field scrollStartTime:J

.field public tapDownForAnnot:Z

.field themeBitmap:Landroid/graphics/Bitmap;

.field themeCanvas:Landroid/graphics/Canvas;

.field public ttsPara:Landroid/graphics/RectF;

.field public tts_annot_page:Lcom/radaee/view/VPage;

.field public tts_sel:Lcom/radaee/view/VSel;

.field vert_scroll_locked:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 550
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 82
    iput-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->tapDownForAnnot:Z

    .line 83
    iput-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->disableAnnotCheck:Z

    .line 84
    iput-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    .line 86
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    .line 89
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 90
    iput-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_zooming:Z

    .line 91
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    const/4 v1, 0x0

    .line 92
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 94
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_gesture:Landroid/view/GestureDetector;

    .line 95
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 96
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 97
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 103
    iput-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->mReadOnly:Z

    .line 104
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    .line 105
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_icon:Landroid/graphics/Bitmap;

    .line 111
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    .line 112
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_edit_type:I

    const/4 v2, -0x1

    .line 113
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_combo_item:I

    .line 114
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pCombo:Landroid/widget/PopupWindow;

    .line 115
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

    .line 116
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon1:Landroid/graphics/Bitmap;

    .line 117
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon2:Landroid/graphics/Bitmap;

    .line 546
    new-instance v3, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v3}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    iput-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    .line 547
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_info_paint:Landroid/graphics/Paint;

    .line 890
    iput-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold:Z

    .line 1006
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    .line 1007
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->tts_annot_page:Lcom/radaee/view/VPage;

    .line 1008
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_start:I

    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_end:I

    const/4 v2, 0x4

    .line 1449
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->page_gap:I

    .line 551
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    .line 552
    new-instance v1, Landroid/view/GestureDetector;

    new-instance v2, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    invoke-direct {v2, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;-><init>(Lcom/radaee/reader/PDFLayoutView;)V

    invoke-direct {v1, p1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_gesture:Landroid/view/GestureDetector;

    .line 553
    sget v1, Lcom/radaee/pdf/Global;->readerViewBgColor:I

    invoke-virtual {p0, v1}, Lcom/radaee/reader/PDFLayoutView;->setBackgroundColor(I)V

    .line 554
    sget-boolean v1, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v1, :cond_0

    .line 555
    const-string v1, "activity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_amgr:Landroid/app/ActivityManager;

    .line 556
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_info_paint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {p1, v1, v1, v0, v0}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 557
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v0, 0x41f00000    # 30.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 562
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 82
    iput-boolean p2, p0, Lcom/radaee/reader/PDFLayoutView;->tapDownForAnnot:Z

    .line 83
    iput-boolean p2, p0, Lcom/radaee/reader/PDFLayoutView;->disableAnnotCheck:Z

    .line 84
    iput-boolean p2, p0, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    .line 86
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    .line 89
    iput p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 90
    iput-boolean p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_zooming:Z

    .line 91
    iput p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    const/4 v0, 0x0

    .line 92
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 94
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_gesture:Landroid/view/GestureDetector;

    .line 95
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 96
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 97
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 103
    iput-boolean p2, p0, Lcom/radaee/reader/PDFLayoutView;->mReadOnly:Z

    .line 104
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    .line 105
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_icon:Landroid/graphics/Bitmap;

    .line 111
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    .line 112
    iput p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_edit_type:I

    const/4 v1, -0x1

    .line 113
    iput v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_combo_item:I

    .line 114
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_pCombo:Landroid/widget/PopupWindow;

    .line 115
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

    .line 116
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon1:Landroid/graphics/Bitmap;

    .line 117
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon2:Landroid/graphics/Bitmap;

    .line 546
    new-instance v2, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v2}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    iput-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    .line 547
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_info_paint:Landroid/graphics/Paint;

    .line 890
    iput-boolean p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold:Z

    .line 1006
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    .line 1007
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_annot_page:Lcom/radaee/view/VPage;

    .line 1008
    iput v1, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_start:I

    iput v1, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_end:I

    const/4 v1, 0x4

    .line 1449
    iput v1, p0, Lcom/radaee/reader/PDFLayoutView;->page_gap:I

    .line 563
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    .line 564
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    invoke-direct {v1, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;-><init>(Lcom/radaee/reader/PDFLayoutView;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_gesture:Landroid/view/GestureDetector;

    .line 565
    sget v0, Lcom/radaee/pdf/Global;->readerViewBgColor:I

    invoke-virtual {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->setBackgroundColor(I)V

    .line 566
    sget-boolean v0, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v0, :cond_0

    .line 567
    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_amgr:Landroid/app/ActivityManager;

    .line 568
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_info_paint:Landroid/graphics/Paint;

    const/16 v0, 0xff

    invoke-virtual {p1, v0, v0, p2, p2}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 569
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 p2, 0x41f00000    # 30.0f

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/radaee/reader/PDFLayoutView;)I
    .locals 0

    .line 63
    iget p0, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docx:I

    return p0
.end method

.method static synthetic access$100(Lcom/radaee/reader/PDFLayoutView;)I
    .locals 0

    .line 63
    iget p0, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docy:I

    return p0
.end method

.method static synthetic access$1100()I
    .locals 1

    .line 63
    sget v0, Lcom/radaee/reader/PDFLayoutView;->tmp_idx:I

    return v0
.end method

.method static synthetic access$1108()I
    .locals 2

    .line 63
    sget v0, Lcom/radaee/reader/PDFLayoutView;->tmp_idx:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/radaee/reader/PDFLayoutView;->tmp_idx:I

    return v0
.end method

.method static synthetic access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;
    .locals 0

    .line 63
    iget-object p0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/radaee/reader/PDFLayoutView;)[F
    .locals 0

    .line 63
    iget-object p0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    return-object p0
.end method

.method static synthetic access$302(Lcom/radaee/reader/PDFLayoutView;[F)[F
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    return-object p1
.end method

.method static synthetic access$400(Lcom/radaee/reader/PDFLayoutView;)Z
    .locals 0

    .line 63
    invoke-direct {p0}, Lcom/radaee/reader/PDFLayoutView;->executeAnnotJS()Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;
    .locals 0

    .line 63
    iget-object p0, p0, Lcom/radaee/reader/PDFLayoutView;->m_pCombo:Landroid/widget/PopupWindow;

    return-object p0
.end method

.method static synthetic access$502(Lcom/radaee/reader/PDFLayoutView;Landroid/widget/PopupWindow;)Landroid/widget/PopupWindow;
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pCombo:Landroid/widget/PopupWindow;

    return-object p1
.end method

.method static synthetic access$600(Lcom/radaee/reader/PDFLayoutView;F)I
    .locals 0

    .line 63
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->d(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/radaee/reader/PDFLayoutView;)I
    .locals 0

    .line 63
    iget p0, p0, Lcom/radaee/reader/PDFLayoutView;->m_combo_item:I

    return p0
.end method

.method static synthetic access$702(Lcom/radaee/reader/PDFLayoutView;I)I
    .locals 0

    .line 63
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_combo_item:I

    return p1
.end method

.method static synthetic access$800(Lcom/radaee/reader/PDFLayoutView;)I
    .locals 0

    .line 63
    iget p0, p0, Lcom/radaee/reader/PDFLayoutView;->m_edit_type:I

    return p0
.end method

.method static synthetic access$802(Lcom/radaee/reader/PDFLayoutView;I)I
    .locals 0

    .line 63
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_edit_type:I

    return p1
.end method

.method static synthetic access$900(Lcom/radaee/reader/PDFLayoutView;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Lcom/radaee/reader/PDFLayoutView;->clearAnnotState()V

    return-void
.end method

.method private allowDragAnnot(Lcom/radaee/pdf/Page$Annotation;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 2558
    :cond_0
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result p1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_2

    const/4 v2, 0x3

    if-eq p1, v2, :cond_2

    const/16 v2, 0xd

    if-eq p1, v2, :cond_2

    const/4 v2, 0x4

    if-eq p1, v2, :cond_2

    const/4 v2, 0x5

    if-eq p1, v2, :cond_2

    const/4 v2, 0x6

    if-eq p1, v2, :cond_2

    const/4 v2, 0x7

    if-eq p1, v2, :cond_2

    const/16 v2, 0x8

    if-eq p1, v2, :cond_2

    const/16 v2, 0xf

    if-ne p1, v2, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    return v1
.end method

.method private checkIfScrollToStartError()V
    .locals 13

    .line 855
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    const-wide/16 v1, 0x3e8

    const-wide/16 v3, 0x1f4

    const-wide/16 v5, 0x64

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v0, :cond_2

    .line 857
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v0

    if-nez v0, :cond_0

    .line 858
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->priorPage:I

    if-le v0, v7, :cond_0

    .line 859
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iget-wide v11, p0, Lcom/radaee/reader/PDFLayoutView;->priorDrawTime:J

    sub-long/2addr v9, v11

    cmp-long v0, v9, v5

    if-gez v0, :cond_0

    .line 860
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-wide v9, p0, Lcom/radaee/reader/PDFLayoutView;->scrollStartTime:J

    sub-long/2addr v5, v9

    cmp-long v0, v5, v3

    if-ltz v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/radaee/reader/PDFLayoutView;->flingStartTime:J

    sub-long/2addr v3, v5

    cmp-long v0, v3, v1

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    .line 866
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v0

    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->priorY:I

    :goto_1
    move v8, v7

    goto :goto_3

    .line 868
    :cond_2
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-eq v0, v7, :cond_3

    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    const/4 v9, 0x3

    if-ne v0, v9, :cond_6

    .line 870
    :cond_3
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v0

    if-nez v0, :cond_4

    .line 871
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->priorPage:I

    if-le v0, v7, :cond_4

    sget-boolean v0, Lcom/radaee/pdf/Global;->rtol:Z

    if-nez v0, :cond_4

    .line 872
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iget-wide v11, p0, Lcom/radaee/reader/PDFLayoutView;->priorDrawTime:J

    sub-long/2addr v9, v11

    cmp-long v0, v9, v5

    if-gez v0, :cond_4

    .line 873
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-wide v9, p0, Lcom/radaee/reader/PDFLayoutView;->scrollStartTime:J

    sub-long/2addr v5, v9

    cmp-long v0, v5, v3

    if-ltz v0, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/radaee/reader/PDFLayoutView;->flingStartTime:J

    sub-long/2addr v3, v5

    cmp-long v0, v3, v1

    if-gez v0, :cond_4

    goto :goto_2

    :cond_4
    const/4 v7, 0x0

    .line 879
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v0

    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->priorX:I

    goto :goto_1

    .line 882
    :cond_6
    :goto_3
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->priorPage:I

    .line 883
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/radaee/reader/PDFLayoutView;->priorDrawTime:J

    if-eqz v8, :cond_7

    .line 885
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_7

    .line 886
    const-string v1, "#err#"

    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpen3D(Ljava/lang/String;)V

    :cond_7
    return-void
.end method

.method private clearAnnotState()V
    .locals 1

    const/4 v0, 0x0

    .line 520
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 521
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 522
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    const/4 v0, 0x0

    .line 523
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void
.end method

.method private d(F)I
    .locals 1

    .line 2552
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private doOnDraw(Landroid/graphics/Canvas;)V
    .locals 6

    const-string v0, "AvialMem:"

    .line 822
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v1, :cond_2

    .line 824
    :try_start_0
    invoke-direct {p0}, Lcom/radaee/reader/PDFLayoutView;->checkIfScrollToStartError()V

    .line 825
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-boolean v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_zooming:Z

    const/4 v3, 0x1

    if-nez v2, :cond_1

    iget v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :cond_1
    :goto_0
    invoke-virtual {v1, p1, v3}, Lcom/radaee/view/PDFLayout;->vDraw(Landroid/graphics/Canvas;Z)V

    .line 826
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onDrawSelect(Landroid/graphics/Canvas;)V

    .line 827
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onDrawRect(Landroid/graphics/Canvas;)V

    .line 828
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onDrawEllipse(Landroid/graphics/Canvas;)V

    .line 829
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onDrawAnnot(Landroid/graphics/Canvas;)V

    .line 830
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onDrawLine(Landroid/graphics/Canvas;)V

    .line 831
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onDrawStamp(Landroid/graphics/Canvas;)V

    .line 832
    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    if-eqz v1, :cond_2

    const/4 v2, 0x0

    .line 833
    invoke-virtual {v1, p1, v2, v2}, Lcom/radaee/pdf/Ink;->OnDraw(Landroid/graphics/Canvas;FF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    .line 836
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 839
    :cond_2
    :goto_1
    sget-boolean v1, Lcom/radaee/pdf/Global;->debug_mode:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_amgr:Landroid/app/ActivityManager;

    if-eqz v1, :cond_3

    .line 841
    :try_start_1
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    invoke-virtual {v1, v2}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 842
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_info:Landroid/app/ActivityManager$MemoryInfo;

    iget-wide v2, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    const-wide/32 v4, 0x100000

    div-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " M"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_info_paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x43160000    # 150.0f

    invoke-virtual {p1, v0, v2, v3, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 844
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 845
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "####ERROR#######"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MR2"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_2
    return-void
.end method

.method private draw4DragPoint(Landroid/graphics/Canvas;FFFF)V
    .locals 2

    .line 2584
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    const v1, -0x66aaaaab

    .line 2585
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v1, 0x1

    .line 2586
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 2587
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, 0x3f800000    # 1.0f

    .line 2588
    invoke-direct {p0, v1}, Lcom/radaee/reader/PDFLayoutView;->d(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2589
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/radaee/reader/PDFLayoutView;->drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 2590
    invoke-direct {p0, p1, p2, p5, v0}, Lcom/radaee/reader/PDFLayoutView;->drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 2591
    invoke-direct {p0, p1, p4, p3, v0}, Lcom/radaee/reader/PDFLayoutView;->drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    .line 2592
    invoke-direct {p0, p1, p4, p5, v0}, Lcom/radaee/reader/PDFLayoutView;->drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawDragPoint(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V
    .locals 1

    const/high16 v0, 0x40a00000    # 5.0f

    .line 2596
    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->d(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, p2, p3, v0, p4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v0, 0x40e00000    # 7.0f

    .line 2597
    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->d(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, p2, p3, v0, p4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private executeAnnotJS()Z
    .locals 2

    .line 2478
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetJS()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 2479
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetJS()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->runJS(Ljava/lang/String;)V

    return v1

    .line 2482
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page$Annotation;->GetAdditionalJS(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2483
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page$Annotation;->GetAdditionalJS(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->runJS(Ljava/lang/String;)V

    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private getOtherLetterFont()Lcom/radaee/pdf/Document$DocFont;
    .locals 3

    .line 2624
    invoke-static {}, Lcom/radaee/pdf/Global;->getNotoCjkFontName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2626
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2, v0, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 2627
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "NotoSansCJK-Regular"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_1
    if-nez v0, :cond_2

    .line 2628
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "NotoSerifCJK-Regular"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_2
    if-nez v0, :cond_3

    .line 2629
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "Noto Sans CJK SC Regular"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_3
    if-nez v0, :cond_4

    .line 2630
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "DroidSansChinese"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_4
    if-nez v0, :cond_5

    .line 2631
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "DroidSansFallback"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_5
    if-nez v0, :cond_6

    .line 2632
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "Arimo"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_6
    if-nez v0, :cond_7

    .line 2633
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    const-string v2, "Roboto-Regular"

    invoke-virtual {v0, v2, v1}, Lcom/radaee/pdf/Document;->NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    :cond_7
    return-object v0
.end method

.method private inDragArea(FF)Z
    .locals 7

    .line 2573
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2575
    :cond_0
    aget v2, v0, v1

    const/4 v3, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x1

    cmpl-float v6, p1, v2

    if-lez v6, :cond_1

    aget v6, v0, v5

    cmpl-float v6, p2, v6

    if-lez v6, :cond_1

    aget v6, v0, v3

    cmpg-float v6, p1, v6

    if-gez v6, :cond_1

    aget v6, v0, v4

    cmpg-float v6, p2, v6

    if-gez v6, :cond_1

    return v5

    .line 2577
    :cond_1
    aget v0, v0, v5

    invoke-direct {p0, p1, p2, v2, v0}, Lcom/radaee/reader/PDFLayoutView;->inDragPoint(FFFF)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v2, v0, v1

    aget v0, v0, v4

    .line 2578
    invoke-direct {p0, p1, p2, v2, v0}, Lcom/radaee/reader/PDFLayoutView;->inDragPoint(FFFF)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v2, v0, v3

    aget v0, v0, v5

    .line 2579
    invoke-direct {p0, p1, p2, v2, v0}, Lcom/radaee/reader/PDFLayoutView;->inDragPoint(FFFF)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v2, v0, v3

    aget v0, v0, v4

    .line 2580
    invoke-direct {p0, p1, p2, v2, v0}, Lcom/radaee/reader/PDFLayoutView;->inDragPoint(FFFF)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    :goto_0
    return v5
.end method

.method private inDragPoint(FFFF)Z
    .locals 2

    .line 2565
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->allowDragAnnot(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    sub-float/2addr p3, p1

    .line 2567
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p1

    sub-float/2addr p4, p2

    .line 2568
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p2

    const/high16 p3, 0x41700000    # 15.0f

    .line 2569
    invoke-direct {p0, p3}, Lcom/radaee/reader/PDFLayoutView;->d(F)I

    move-result p4

    int-to-float p4, p4

    cmpg-float p1, p1, p4

    if-gez p1, :cond_1

    invoke-direct {p0, p3}, Lcom/radaee/reader/PDFLayoutView;->d(F)I

    move-result p1

    int-to-float p1, p1

    cmpg-float p1, p2, p1

    if-gez p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method private onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1422
    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 1423
    sget-object v0, Lcom/radaee/pdf/Global;->sAnnotAuthor:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1424
    sget-object v0, Lcom/radaee/pdf/Global;->sAnnotAuthor:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetPopupLabel(Ljava/lang/String;)Z

    :cond_0
    return-void
.end method

.method private onDrawAnnot(Landroid/graphics/Canvas;)V
    .locals 12

    .line 647
    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/16 v2, 0x64

    if-ne v1, v2, :cond_0

    sget-boolean v1, Lcom/radaee/pdf/Global;->highlight_annotation:Z

    if-eqz v1, :cond_0

    .line 648
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 649
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, 0x40000000    # 2.0f

    .line 650
    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/16 v1, 0x80

    const/4 v8, 0x0

    .line 651
    invoke-virtual {v7, v1, v8, v8, v8}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 652
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v3, v1, v8

    const/4 v9, 0x1

    aget v4, v1, v9

    const/4 v10, 0x2

    aget v5, v1, v10

    const/4 v11, 0x3

    aget v6, v1, v11

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 656
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-direct {p0, v1}, Lcom/radaee/reader/PDFLayoutView;->allowDragAnnot(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 657
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v2, v1, v8

    aget v3, v1, v9

    aget v4, v1, v10

    aget v5, v1, v11

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/radaee/reader/PDFLayoutView;->draw4DragPoint(Landroid/graphics/Canvas;FFFF)V

    :cond_0
    return-void
.end method

.method private onDrawEllipse(Landroid/graphics/Canvas;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 744
    iget v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_2

    iget-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v2, :cond_2

    .line 745
    array-length v2, v2

    .line 747
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 748
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 749
    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 750
    sget v5, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 751
    sget v5, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v5, v5, 0x18

    and-int/lit16 v5, v5, 0xff

    sget v6, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    sget v7, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v7, v7, 0x8

    and-int/lit16 v7, v7, 0xff

    sget v8, Lcom/radaee/pdf/Global;->inkColor:I

    and-int/lit16 v8, v8, 0xff

    invoke-virtual {v3, v5, v6, v7, v8}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 753
    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 754
    sget v5, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v5, v5, 0x18

    and-int/lit16 v5, v5, 0xff

    sget v6, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    sget v7, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v7, v7, 0x8

    and-int/lit16 v7, v7, 0xff

    sget v8, Lcom/radaee/pdf/Global;->fillColor:I

    and-int/lit16 v8, v8, 0xff

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/Paint;->setARGB(IIII)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v2, :cond_2

    const/4 v7, 0x4

    .line 757
    new-array v7, v7, [F

    .line 758
    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v9, v8, v6

    add-int/lit8 v10, v6, 0x2

    aget v11, v8, v10

    const/4 v12, 0x2

    cmpl-float v13, v9, v11

    if-lez v13, :cond_0

    .line 759
    aput v11, v7, v5

    .line 760
    aget v9, v8, v6

    aput v9, v7, v12

    goto :goto_1

    .line 762
    :cond_0
    aput v9, v7, v5

    .line 763
    aget v9, v8, v10

    aput v9, v7, v12

    :goto_1
    add-int/lit8 v9, v6, 0x1

    .line 765
    aget v10, v8, v9

    add-int/lit8 v11, v6, 0x3

    aget v13, v8, v11

    const/4 v14, 0x3

    const/4 v15, 0x1

    cmpl-float v16, v10, v13

    if-lez v16, :cond_1

    .line 766
    aput v13, v7, v15

    .line 767
    aget v8, v8, v9

    aput v8, v7, v14

    goto :goto_2

    .line 769
    :cond_1
    aput v10, v7, v15

    .line 770
    aget v8, v8, v11

    aput v8, v7, v14

    .line 772
    :goto_2
    new-instance v8, Landroid/graphics/RectF;

    invoke-direct {v8}, Landroid/graphics/RectF;-><init>()V

    .line 773
    aget v9, v7, v5

    iput v9, v8, Landroid/graphics/RectF;->left:F

    .line 774
    aget v9, v7, v15

    iput v9, v8, Landroid/graphics/RectF;->top:F

    .line 775
    aget v9, v7, v12

    iput v9, v8, Landroid/graphics/RectF;->right:F

    .line 776
    aget v7, v7, v14

    iput v7, v8, Landroid/graphics/RectF;->bottom:F

    .line 777
    invoke-virtual {v1, v8, v3}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 778
    iget v7, v8, Landroid/graphics/RectF;->left:F

    const/high16 v9, 0x3fc00000    # 1.5f

    add-float/2addr v7, v9

    iput v7, v8, Landroid/graphics/RectF;->left:F

    .line 779
    iget v7, v8, Landroid/graphics/RectF;->top:F

    add-float/2addr v7, v9

    iput v7, v8, Landroid/graphics/RectF;->top:F

    .line 780
    iget v7, v8, Landroid/graphics/RectF;->right:F

    sub-float/2addr v7, v9

    iput v7, v8, Landroid/graphics/RectF;->right:F

    .line 781
    iget v7, v8, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v7, v9

    iput v7, v8, Landroid/graphics/RectF;->bottom:F

    .line 782
    invoke-virtual {v1, v8, v4}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    add-int/lit8 v6, v6, 0x4

    goto :goto_0

    :cond_2
    return-void
.end method

.method private onDrawLine(Landroid/graphics/Canvas;)V
    .locals 8

    .line 697
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    const/16 v1, 0x47

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v0, :cond_1

    .line 698
    array-length v0, v0

    .line 700
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 701
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 702
    sget v1, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 703
    sget v1, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v1, v1, 0x18

    and-int/lit16 v1, v1, 0xff

    sget v2, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v2, v2, 0x10

    and-int/lit16 v2, v2, 0xff

    sget v3, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v3, v3, 0x8

    and-int/lit16 v3, v3, 0xff

    sget v4, Lcom/radaee/pdf/Global;->inkColor:I

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v6, v1, v2, v3, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    const/4 v1, 0x0

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v0, :cond_1

    .line 706
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v2, v1, v7

    add-int/lit8 v3, v7, 0x1

    aget v3, v1, v3

    add-int/lit8 v4, v7, 0x2

    aget v4, v1, v4

    add-int/lit8 v5, v7, 0x3

    aget v5, v1, v5

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v7, v7, 0x4

    goto :goto_0

    :cond_1
    return-void
.end method

.method private onDrawRect(Landroid/graphics/Canvas;)V
    .locals 17

    move-object/from16 v0, p0

    .line 662
    iget v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_2

    iget-object v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v1, :cond_2

    .line 663
    array-length v1, v1

    .line 665
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    .line 666
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    .line 667
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 668
    sget v3, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 669
    sget v3, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v3, v3, 0x18

    and-int/lit16 v3, v3, 0xff

    sget v4, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v4, v4, 0x10

    and-int/lit16 v4, v4, 0xff

    sget v5, Lcom/radaee/pdf/Global;->inkColor:I

    shr-int/lit8 v5, v5, 0x8

    and-int/lit16 v5, v5, 0xff

    sget v6, Lcom/radaee/pdf/Global;->inkColor:I

    and-int/lit16 v6, v6, 0xff

    invoke-virtual {v8, v3, v4, v5, v6}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 671
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v14, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 672
    sget v3, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v3, v3, 0x18

    and-int/lit16 v3, v3, 0xff

    sget v4, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v4, v4, 0x10

    and-int/lit16 v4, v4, 0xff

    sget v5, Lcom/radaee/pdf/Global;->fillColor:I

    shr-int/lit8 v5, v5, 0x8

    and-int/lit16 v5, v5, 0xff

    sget v6, Lcom/radaee/pdf/Global;->fillColor:I

    and-int/lit16 v6, v6, 0xff

    invoke-virtual {v14, v3, v4, v5, v6}, Landroid/graphics/Paint;->setARGB(IIII)V

    const/4 v15, 0x0

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v1, :cond_2

    .line 675
    new-array v10, v2, [F

    .line 676
    iget-object v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v4, v3, v9

    add-int/lit8 v5, v9, 0x2

    aget v6, v3, v5

    const/4 v11, 0x2

    cmpl-float v7, v4, v6

    if-lez v7, :cond_0

    .line 677
    aput v6, v10, v15

    .line 678
    aget v4, v3, v9

    aput v4, v10, v11

    goto :goto_1

    .line 680
    :cond_0
    aput v4, v10, v15

    .line 681
    aget v4, v3, v5

    aput v4, v10, v11

    :goto_1
    add-int/lit8 v4, v9, 0x1

    .line 683
    aget v5, v3, v4

    add-int/lit8 v6, v9, 0x3

    aget v7, v3, v6

    const/4 v12, 0x3

    const/4 v13, 0x1

    cmpl-float v16, v5, v7

    if-lez v16, :cond_1

    .line 684
    aput v7, v10, v13

    .line 685
    aget v3, v3, v4

    aput v3, v10, v12

    goto :goto_2

    .line 687
    :cond_1
    aput v5, v10, v13

    .line 688
    aget v3, v3, v6

    aput v3, v10, v12

    .line 690
    :goto_2
    aget v4, v10, v15

    aget v5, v10, v13

    aget v6, v10, v11

    aget v7, v10, v12

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 691
    aget v3, v10, v15

    const/high16 v4, 0x3fc00000    # 1.5f

    add-float/2addr v3, v4

    aget v5, v10, v13

    add-float/2addr v5, v4

    aget v6, v10, v11

    sub-float/2addr v6, v4

    aget v7, v10, v12

    sub-float v13, v7, v4

    move v10, v3

    move v11, v5

    move v12, v6

    move v3, v9

    move-object/from16 v9, p1

    invoke-virtual/range {v9 .. v14}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v9, v3, 0x4

    goto :goto_0

    :cond_2
    return-void
.end method

.method private onDrawSelect(Landroid/graphics/Canvas;)V
    .locals 11

    .line 595
    :try_start_0
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_start:I

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eq v0, v1, :cond_7

    .line 596
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_annot_page:Lcom/radaee/view/VPage;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v0

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFGetCurrPage()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 597
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    invoke-virtual {v0}, Lcom/radaee/view/VSel;->Clear()V

    .line 598
    iput-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    .line 600
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFGetCurrPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_annot_page:Lcom/radaee/view/VPage;

    if-nez v0, :cond_1

    goto/16 :goto_0

    .line 603
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    if-nez v0, :cond_2

    .line 604
    new-instance v0, Lcom/radaee/view/VSel;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFGetCurrPage()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/radaee/view/VSel;-><init>(Lcom/radaee/pdf/Page;)V

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    .line 605
    :cond_2
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_start:I

    iput v1, v0, Lcom/radaee/view/VSel;->m_index1:I

    .line 606
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_end:I

    iput v1, v0, Lcom/radaee/view/VSel;->m_index2:I

    .line 608
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_annot_page:Lcom/radaee/view/VPage;

    if-nez v0, :cond_3

    goto/16 :goto_0

    .line 610
    :cond_3
    invoke-virtual {v0, v3}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result v0

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v1}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v1

    sub-int v7, v0, v1

    .line 611
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_annot_page:Lcom/radaee/view/VPage;

    if-nez v0, :cond_4

    goto/16 :goto_0

    .line 613
    :cond_4
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result v0

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v1}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v1

    sub-int v8, v0, v1

    .line 614
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetScale()F

    move-result v5

    .line 615
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->tts_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v6

    .line 617
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    if-nez v0, :cond_5

    goto/16 :goto_0

    .line 619
    :cond_5
    iget-boolean v0, v0, Lcom/radaee/view/VSel;->m_ok:Z

    if-nez v0, :cond_6

    .line 620
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    iget-object v0, v0, Lcom/radaee/view/VSel;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 621
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    iput-boolean v2, v0, Lcom/radaee/view/VSel;->m_ok:Z

    .line 623
    :cond_6
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Lcom/radaee/view/VSel;->DrawSel(Landroid/graphics/Canvas;FFII)V

    .line 624
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    if-eqz p1, :cond_8

    .line 625
    iget-object p1, p1, Lcom/radaee/view/VSel;->drawPara:Landroid/graphics/RectF;

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->ttsPara:Landroid/graphics/RectF;

    return-void

    :cond_7
    move-object v6, p1

    .line 627
    iget p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_8

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    if-eqz p1, :cond_8

    .line 628
    invoke-virtual {p1, v3}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result p1

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v1}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v1

    sub-int v9, p1, v1

    .line 629
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v1

    invoke-virtual {p1, v1}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result p1

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v1}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v1

    sub-int v10, p1, v1

    .line 630
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vGetScale()F

    move-result v7

    .line 631
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    .line 632
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual/range {v5 .. v10}, Lcom/radaee/view/VSel;->DrawSel(Landroid/graphics/Canvas;FFII)V

    .line 633
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual {p1, v7, v8, v9, v10}, Lcom/radaee/view/VSel;->GetRect1(FFII)[I

    move-result-object p1

    .line 634
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual {v1, v7, v8, v9, v10}, Lcom/radaee/view/VSel;->GetRect2(FFII)[I

    move-result-object v1

    if-eqz p1, :cond_8

    if-eqz v1, :cond_8

    .line 635
    sget-boolean v3, Lcom/radaee/pdf/Global;->useSelIcons:Z

    if-eqz v3, :cond_8

    .line 636
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon1:Landroid/graphics/Bitmap;

    const/4 v5, 0x0

    aget v5, p1, v5

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    sub-int/2addr v5, v7

    int-to-float v5, v5

    aget p1, p1, v2

    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon1:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    sub-int/2addr p1, v2

    int-to-float p1, p1

    invoke-virtual {v6, v3, v5, p1, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 637
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon2:Landroid/graphics/Bitmap;

    aget v0, v1, v0

    int-to-float v0, v0

    const/4 v2, 0x3

    aget v1, v1, v2

    int-to-float v1, v1

    invoke-virtual {v6, p1, v0, v1, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 641
    const-string v0, "MR2"

    const-string v1, "####ERROR#### PDF onDrawSelect"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_8
    :goto_0
    return-void
.end method

.method private onDrawStamp(Landroid/graphics/Canvas;)V
    .locals 0

    return-void
.end method

.method private onTouchAnnot(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 1197
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/16 v1, 0x64

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 1198
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v0, :cond_a

    if-eq v0, v4, :cond_6

    if-eq v0, v3, :cond_1

    if-eq v0, v1, :cond_6

    goto/16 :goto_2

    .line 1215
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result v0

    if-nez v0, :cond_c

    .line 1216
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 1217
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 1218
    iget v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_x0:F

    sub-float v5, v0, v5

    .line 1219
    iget v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_y0:F

    sub-float v6, p1, v6

    .line 1220
    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v8, v7, v2

    aget v7, v7, v4

    invoke-direct {p0, v0, p1, v8, v7}, Lcom/radaee/reader/PDFLayoutView;->inDragPoint(FFFF)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1221
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    aget v1, v0, v2

    add-float/2addr v1, v5

    aput v1, p1, v2

    .line 1222
    aget v0, v0, v4

    add-float/2addr v0, v6

    aput v0, p1, v4

    goto :goto_0

    .line 1223
    :cond_2
    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v8, v7, v2

    aget v7, v7, v1

    invoke-direct {p0, v0, p1, v8, v7}, Lcom/radaee/reader/PDFLayoutView;->inDragPoint(FFFF)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1224
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    aget v3, v0, v2

    add-float/2addr v3, v5

    aput v3, p1, v2

    .line 1225
    aget v0, v0, v1

    add-float/2addr v0, v6

    aput v0, p1, v1

    goto :goto_0

    .line 1226
    :cond_3
    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v8, v7, v3

    aget v7, v7, v4

    invoke-direct {p0, v0, p1, v8, v7}, Lcom/radaee/reader/PDFLayoutView;->inDragPoint(FFFF)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1227
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    aget v1, v0, v4

    add-float/2addr v1, v6

    aput v1, p1, v4

    .line 1228
    aget v0, v0, v3

    add-float/2addr v0, v5

    aput v0, p1, v3

    goto :goto_0

    .line 1229
    :cond_4
    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v8, v7, v3

    aget v7, v7, v1

    invoke-direct {p0, v0, p1, v8, v7}, Lcom/radaee/reader/PDFLayoutView;->inDragPoint(FFFF)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 1230
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    aget v2, v0, v3

    add-float/2addr v2, v5

    aput v2, p1, v3

    .line 1231
    aget v0, v0, v1

    add-float/2addr v0, v6

    aput v0, p1, v1

    goto :goto_0

    .line 1233
    :cond_5
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    aget v7, v0, v2

    add-float/2addr v7, v5

    aput v7, p1, v2

    .line 1234
    aget v2, v0, v4

    add-float/2addr v2, v6

    aput v2, p1, v4

    .line 1235
    aget v2, v0, v3

    add-float/2addr v2, v5

    aput v2, p1, v3

    .line 1236
    aget v0, v0, v1

    add-float/2addr v0, v6

    aput v0, p1, v1

    .line 1238
    :goto_0
    iput-boolean v4, p0, Lcom/radaee/reader/PDFLayoutView;->annotRectChanged:Z

    goto/16 :goto_2

    .line 1243
    :cond_6
    iget-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->annotRectChanged:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1244
    iput-boolean v2, p0, Lcom/radaee/reader/PDFLayoutView;->annotRectChanged:Z

    .line 1245
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 1246
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 1247
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    float-to-int v0, v0

    float-to-int p1, p1

    invoke-virtual {v5, v0, p1}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    .line 1252
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v0

    iget v5, p1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    if-ne v0, v5, :cond_7

    .line 1253
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v5, v5, v2

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0, v5, v6}, Lcom/radaee/view/VPage;->ToPDFX(FF)F

    move-result v0

    aput v0, p1, v2

    .line 1254
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v5, v5, v1

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0, v5, v6}, Lcom/radaee/view/VPage;->ToPDFY(FF)F

    move-result v0

    aput v0, p1, v4

    .line 1255
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v5, v5, v3

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0, v5, v6}, Lcom/radaee/view/VPage;->ToPDFX(FF)F

    move-result v0

    aput v0, p1, v3

    .line 1256
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v5, v5, v4

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0, v5, v6}, Lcom/radaee/view/VPage;->ToPDFY(FF)F

    move-result v0

    aput v0, p1, v1

    .line 1258
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    .line 1260
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    aget v2, v0, v2

    aget v5, v0, v4

    aget v3, v0, v3

    aget v0, v0, v1

    invoke-virtual {p1, v2, v5, v3, v0}, Lcom/radaee/pdf/Page$Annotation;->SetRect(FFFF)V

    .line 1261
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 1262
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {p1, v0}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 1263
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_9

    .line 1264
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    goto/16 :goto_1

    .line 1266
    :cond_7
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget p1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object p1

    .line 1267
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v5

    invoke-virtual {v0, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 1269
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1270
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v6, v6, v2

    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v7}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Lcom/radaee/view/VPage;->ToPDFX(FF)F

    move-result v6

    aput v6, v5, v2

    .line 1271
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v5, v5, v1

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p1, v5, v6}, Lcom/radaee/view/VPage;->ToPDFY(FF)F

    move-result v5

    aput v5, v2, v4

    .line 1272
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v5, v5, v3

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p1, v5, v6}, Lcom/radaee/view/VPage;->ToPDFX(FF)F

    move-result v5

    aput v5, v2, v3

    .line 1273
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v3, v3, v4

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v5}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p1, v3, v5}, Lcom/radaee/view/VPage;->ToPDFY(FF)F

    move-result v3

    aput v3, v2, v1

    .line 1275
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    .line 1277
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    invoke-virtual {v1, v0, v2}, Lcom/radaee/pdf/Page$Annotation;->MoveToPage(Lcom/radaee/pdf/Page;[F)Z

    .line 1278
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 1280
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 1282
    :cond_8
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 1283
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 1284
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_9

    .line 1285
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 1286
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result p1

    invoke-interface {v0, p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 1290
    :cond_9
    :goto_1
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFEndAnnot()V

    goto :goto_2

    .line 1200
    :cond_a
    iput-boolean v2, p0, Lcom/radaee/reader/PDFLayoutView;->annotRectChanged:Z

    .line 1201
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_x0:F

    .line 1202
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_y0:F

    .line 1205
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_x0:F

    invoke-direct {p0, v0, p1}, Lcom/radaee/reader/PDFLayoutView;->inDragArea(FF)Z

    move-result p1

    if-eqz p1, :cond_b

    const/4 p1, 0x4

    .line 1206
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    .line 1207
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect:[F

    aget v5, v0, v2

    aput v5, p1, v2

    .line 1208
    aget v2, v0, v4

    aput v2, p1, v4

    .line 1209
    aget v2, v0, v3

    aput v2, p1, v3

    .line 1210
    aget v0, v0, v1

    aput v0, p1, v1

    goto :goto_2

    :cond_b
    const/4 p1, 0x0

    .line 1212
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_rect0:[F

    .line 1293
    :cond_c
    :goto_2
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return v4
.end method

.method private onTouchEllipse(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1166
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x5

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 1168
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v0, :cond_1

    array-length v0, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1170
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eqz v1, :cond_4

    if-eq v1, v4, :cond_3

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2

    if-eq v1, v3, :cond_3

    goto :goto_2

    .line 1182
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1183
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    .line 1187
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1188
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    :cond_4
    add-int/lit8 v1, v0, 0x4

    .line 1172
    new-array v1, v1, [F

    :goto_1
    if-ge v2, v0, :cond_5

    .line 1174
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v5, v5, v2

    aput v5, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1175
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    aput v0, v1, v2

    add-int/lit8 v0, v2, 0x1

    .line 1176
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    aput v5, v1, v0

    add-int/lit8 v0, v2, 0x2

    .line 1177
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    aput v5, v1, v0

    add-int/2addr v2, v3

    .line 1178
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v2

    .line 1179
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 1191
    :goto_2
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return v4
.end method

.method private onTouchInk(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1113
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 v0, 0x1

    .line 1114
    sput-boolean v0, Lcom/radaee/reader/PDFLayoutView;->inkStart:Z

    .line 1115
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-eqz v2, :cond_3

    if-eq v2, v0, :cond_2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    if-eq v2, v1, :cond_2

    goto :goto_0

    .line 1124
    :cond_1
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v1, v2, p1}, Lcom/radaee/pdf/Ink;->OnMove(FF)V

    goto :goto_0

    .line 1128
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v1, v2, p1}, Lcom/radaee/pdf/Ink;->OnUp(FF)V

    goto :goto_0

    .line 1117
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    if-nez v1, :cond_4

    .line 1118
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v1

    .line 1119
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v1, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v2, v1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 1121
    :cond_4
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v1, v2, p1}, Lcom/radaee/pdf/Ink;->OnDown(FF)V

    .line 1131
    :goto_0
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return v0
.end method

.method private onTouchLine(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1298
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x7

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/16 v1, 0x47

    if-eq v0, v1, :cond_0

    return v2

    .line 1300
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v0, :cond_1

    array-length v0, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1302
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eqz v1, :cond_4

    if-eq v1, v4, :cond_3

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2

    if-eq v1, v3, :cond_3

    goto :goto_2

    .line 1314
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1315
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    .line 1319
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1320
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    :cond_4
    add-int/lit8 v1, v0, 0x4

    .line 1304
    new-array v1, v1, [F

    :goto_1
    if-ge v2, v0, :cond_5

    .line 1306
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v5, v5, v2

    aput v5, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1307
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    aput v0, v1, v2

    add-int/lit8 v0, v2, 0x1

    .line 1308
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    aput v5, v1, v0

    add-int/lit8 v0, v2, 0x2

    .line 1309
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    aput v5, v1, v0

    add-int/2addr v2, v3

    .line 1310
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v2

    .line 1311
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 1323
    :goto_2
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return v4
.end method

.method private onTouchNone(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 901
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 902
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_gesture:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 903
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_10

    if-eq v0, v2, :cond_a

    const/4 v3, 0x2

    if-eq v0, v3, :cond_3

    const/4 v4, 0x3

    if-eq v0, v4, :cond_a

    const/4 v4, 0x5

    if-eq v0, v4, :cond_2

    goto/16 :goto_2

    .line 951
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v3, :cond_11

    .line 952
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 953
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float/2addr v0, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v0, v3

    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    .line 954
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    add-float/2addr v0, v4

    div-float/2addr v0, v3

    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    .line 955
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    float-to-int v4, v4

    float-to-int v0, v0

    invoke-virtual {v3, v4, v0}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 956
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 957
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    .line 958
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_dis0:F

    .line 959
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vGetZoom()F

    move-result p1

    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_scale:F

    .line 960
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 961
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vZoomStart()V

    .line 962
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_11

    .line 963
    invoke-interface {p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFZoomStart()V

    goto/16 :goto_2

    .line 915
    :cond_3
    iget-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold:Z

    if-eqz v0, :cond_11

    .line 916
    iget-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    if-eqz v0, :cond_5

    .line 917
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-nez v0, :cond_4

    .line 918
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docy:I

    int-to-float v1, v1

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vSetY(I)V

    goto :goto_0

    .line 919
    :cond_4
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-ne v0, v2, :cond_9

    .line 920
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docx:I

    int-to-float v1, v1

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vSetX(I)V

    goto :goto_0

    .line 922
    :cond_5
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->vert_scroll_locked:Ljava/lang/Boolean;

    if-nez v0, :cond_7

    .line 923
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-nez v0, :cond_6

    .line 924
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v3, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    sub-float/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v5, v0

    const-wide v7, 0x3fe6666666666666L    # 0.7

    mul-double v5, v5, v7

    cmpl-double v0, v3, v5

    if-lez v0, :cond_6

    const/4 v1, 0x1

    .line 923
    :cond_6
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->vert_scroll_locked:Ljava/lang/Boolean;

    .line 925
    :cond_7
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->vert_scroll_locked:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_8

    .line 926
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docx:I

    int-to-float v1, v1

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr v1, v3

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vSetX(I)V

    .line 927
    :cond_8
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docy:I

    int-to-float v1, v1

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    add-float/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vSetY(I)V

    .line 929
    :cond_9
    :goto_0
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    goto/16 :goto_2

    .line 934
    :cond_a
    iget-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold:Z

    if-eqz v0, :cond_11

    .line 935
    iget-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    if-eqz v0, :cond_c

    .line 936
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-nez v0, :cond_b

    .line 937
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docy:I

    int-to-float v3, v3

    iget v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vSetY(I)V

    goto :goto_1

    .line 938
    :cond_b
    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-ne v0, v2, :cond_f

    .line 939
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docx:I

    int-to-float v3, v3

    iget v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vSetX(I)V

    goto :goto_1

    .line 941
    :cond_c
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->vert_scroll_locked:Ljava/lang/Boolean;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_e

    .line 942
    :cond_d
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docx:I

    int-to-float v3, v3

    iget v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    sub-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/radaee/view/PDFLayout;->vSetX(I)V

    .line 943
    :cond_e
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docy:I

    int-to-float v3, v3

    iget v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float/2addr v3, p1

    float-to-int p1, v3

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vSetY(I)V

    .line 945
    :cond_f
    :goto_1
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 946
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vMoveEnd()V

    .line 947
    iput-boolean v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold:Z

    goto :goto_2

    .line 905
    :cond_10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    .line 906
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    .line 907
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result p1

    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docx:I

    .line 908
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result p1

    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_docy:I

    .line 909
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vScrollAbort()V

    .line 910
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 911
    iput-boolean v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold:Z

    const/4 p1, 0x0

    .line 912
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->vert_scroll_locked:Ljava/lang/Boolean;

    :cond_11
    :goto_2
    return v2
.end method

.method private onTouchNote(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1358
    iget p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v0, 0x6

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private onTouchRect(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1136
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 1138
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v0, :cond_1

    array-length v0, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1140
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eqz v1, :cond_4

    if-eq v1, v4, :cond_3

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2

    if-eq v1, v3, :cond_3

    goto :goto_2

    .line 1152
    :cond_2
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1153
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    .line 1157
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    add-int/lit8 v2, v0, -0x2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v1, v2

    .line 1158
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    sub-int/2addr v0, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v0

    goto :goto_2

    :cond_4
    add-int/lit8 v1, v0, 0x4

    .line 1142
    new-array v1, v1, [F

    :goto_1
    if-ge v2, v0, :cond_5

    .line 1144
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v5, v5, v2

    aput v5, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1145
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    aput v0, v1, v2

    add-int/lit8 v0, v2, 0x1

    .line 1146
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    aput v5, v1, v0

    add-int/lit8 v0, v2, 0x2

    .line 1147
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    aput v5, v1, v0

    add-int/2addr v2, v3

    .line 1148
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    aput p1, v1, v2

    .line 1149
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 1161
    :goto_2
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return v4
.end method

.method private onTouchSelect(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1075
    iget p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private onTouchStamp(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1328
    iget p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private onTouchZoom(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 971
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    return v1

    .line 972
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x2

    if-eq v0, v2, :cond_2

    if-eq v0, v3, :cond_1

    const/4 v4, 0x3

    if-eq v0, v4, :cond_2

    const/4 v4, 0x6

    if-eq v0, v4, :cond_2

    goto/16 :goto_0

    .line 974
    :cond_1
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne v0, v2, :cond_3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-lt v0, v3, :cond_3

    .line 975
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 976
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v1, p1

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    .line 977
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    .line 978
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    float-to-int v1, v1

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    float-to-int v3, v3

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_scale:F

    mul-float v5, v5, p1

    iget p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_dis0:F

    div-float/2addr v5, p1

    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/radaee/view/PDFLayout;->vZoomSet(IILcom/radaee/view/PDFLayout$PDFPos;F)V

    .line 979
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    goto :goto_0

    .line 985
    :cond_2
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne v0, v2, :cond_3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ne v0, v3, :cond_3

    .line 986
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float/2addr v0, v3

    .line 987
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v3, p1

    mul-float v0, v0, v0

    mul-float v3, v3, v3

    add-float/2addr v0, v3

    .line 988
    invoke-static {v0}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result p1

    .line 989
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    float-to-int v3, v3

    iget v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    float-to-int v4, v4

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_scale:F

    mul-float v6, v6, p1

    iget p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_zoom_dis0:F

    div-float/2addr v6, p1

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/radaee/view/PDFLayout;->vZoomSet(IILcom/radaee/view/PDFLayout$PDFPos;F)V

    const p1, -0x39e3c000    # -10000.0f

    .line 990
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    .line 991
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    .line 992
    iput v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 993
    iput-boolean v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_zooming:Z

    .line 994
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vZoomConfirmed()V

    .line 995
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 996
    iput-boolean v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold:Z

    .line 997
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_3

    .line 998
    invoke-interface {p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFZoomEnd()V

    :cond_3
    :goto_0
    return v2
.end method

.method private runJS(Ljava/lang/String;)V
    .locals 2

    .line 2491
    :try_start_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    new-instance v1, Lcom/radaee/reader/PDFLayoutView$1;

    invoke-direct {v1, p0}, Lcom/radaee/reader/PDFLayoutView$1;-><init>(Lcom/radaee/reader/PDFLayoutView;)V

    invoke-virtual {v0, p1, v1}, Lcom/radaee/pdf/Document;->RunJS(Ljava/lang/String;Lcom/radaee/pdf/Document$PDFJSDelegate;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 2520
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2521
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "####ERROR#######"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MR2"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public BundleRestorePos(Landroid/os/Bundle;)V
    .locals 2

    .line 2377
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_2

    .line 2378
    new-instance v0, Lcom/radaee/view/PDFLayout$PDFPos;

    invoke-direct {v0}, Lcom/radaee/view/PDFLayout$PDFPos;-><init>()V

    .line 2379
    const-string v1, "view_page"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    .line 2380
    const-string v1, "view_x"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    .line 2381
    const-string v1, "view_y"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result p1

    iput p1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    .line 2382
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vGetHeight()I

    move-result p1

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vGetWidth()I

    move-result p1

    if-gtz p1, :cond_0

    goto :goto_0

    .line 2385
    :cond_0
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v1, v0}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    .line 2386
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 2383
    :cond_1
    :goto_0
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    :cond_2
    return-void
.end method

.method public BundleSavePos(Landroid/os/Bundle;)V
    .locals 3

    .line 2368
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 2369
    invoke-virtual {v0, v1, v1}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v0

    .line 2370
    const-string v1, "view_page"

    iget v2, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2371
    const-string v1, "view_x"

    iget v2, v0, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 2372
    const-string v1, "view_y"

    iget v0, v0, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    :cond_0
    return-void
.end method

.method public GetScreenX(FI)I
    .locals 1

    .line 2743
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p2}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object p2

    .line 2744
    invoke-virtual {p2, p1}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result p1

    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p2}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result p2

    sub-int/2addr p1, p2

    return p1
.end method

.method public GetScreenY(FI)I
    .locals 1

    .line 2749
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p2}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object p2

    .line 2750
    invoke-virtual {p2, p1}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result p1

    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p2}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result p2

    sub-int/2addr p1, p2

    return p1
.end method

.method public OnCacheRendered(I)V
    .locals 0

    .line 1695
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public OnFound(Z)V
    .locals 3

    if-eqz p1, :cond_0

    .line 1699
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    goto :goto_0

    .line 1700
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->no_more_found:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1701
    :goto_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_1

    .line 1702
    invoke-interface {v0, p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFSearchFinished(Z)V

    :cond_1
    return-void
.end method

.method public OnPageChanged(I)V
    .locals 1

    .line 1682
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    .line 1683
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_0

    .line 1684
    invoke-interface {v0, p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageChanged(I)V

    :cond_0
    return-void
.end method

.method public OnPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/VPage;)V
    .locals 1

    .line 1706
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/ILayoutView$IVPage;)V

    :cond_0
    return-void
.end method

.method public OnPageRendered(I)V
    .locals 2

    .line 1688
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 1689
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v1, :cond_0

    .line 1690
    invoke-virtual {v1, p1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageRendered(Lcom/radaee/view/ILayoutView$IVPage;)V

    :cond_0
    return-void
.end method

.method public OnTimer()V
    .locals 2

    .line 1710
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 1711
    iget-boolean v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_zooming:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vZoomEnd()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 1712
    iput-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_zooming:Z

    .line 1713
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    :cond_0
    return-void
.end method

.method public final PDFCanSave()Z
    .locals 1

    .line 2396
    iget-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->mReadOnly:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->CanSave()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public PDFCancelAnnot()V
    .locals 0

    return-void
.end method

.method public PDFClose()V
    .locals 1

    .line 1666
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 1667
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFCancelAnnot()V

    .line 1668
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFEndAnnot()V

    .line 1669
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vClose()V

    const/4 v0, 0x0

    .line 1670
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    const/4 v0, 0x0

    .line 1671
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1672
    iput-boolean v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_zooming:Z

    const/4 v0, -0x1

    .line 1673
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    :cond_0
    return-void
.end method

.method public PDFCloseOnUI()V
    .locals 1

    .line 1658
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 1660
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFCancelAnnot()V

    .line 1661
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFEndAnnot()V

    :cond_0
    return-void
.end method

.method public PDFEndAnnot()V
    .locals 4

    .line 2148
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_0

    return-void

    .line 2149
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/radaee/annotui/UIAnnotMenu;->hide()V

    :cond_1
    const/4 v0, 0x0

    .line 2150
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 2151
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 2152
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 2154
    :try_start_0
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pCombo:Landroid/widget/PopupWindow;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pCombo:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 2156
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2157
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "####ERROR#######"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MR2"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2159
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v1, :cond_3

    const/4 v2, -0x1

    .line 2160
    invoke-interface {v1, v2, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFAnnotTapped(ILcom/radaee/pdf/Page$Annotation;)V

    :cond_3
    const/4 v0, 0x0

    .line 2161
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 2162
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public final PDFFind(I)V
    .locals 1

    .line 2313
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vFind(I)I

    return-void
.end method

.method public final PDFFindEnd()V
    .locals 1

    .line 2317
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vFindEnd()V

    .line 2318
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public final PDFFindStart(Ljava/lang/String;ZZ)V
    .locals 1

    .line 2305
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p1, p2, p3}, Lcom/radaee/view/PDFLayout;->vFindStart(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public final PDFFindStart(Ljava/lang/String;ZZZ)V
    .locals 1

    .line 2309
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/radaee/view/PDFLayout;->vFindStart(Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public final PDFGetCurrPage()I
    .locals 1

    .line 2351
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    return v0
.end method

.method public final PDFGetDoc()Lcom/radaee/pdf/Document;
    .locals 1

    .line 2392
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    return-object v0
.end method

.method public PDFGetMinScale()F
    .locals 1

    .line 2436
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 2437
    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetMinScale()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public final PDFGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;
    .locals 1

    .line 2355
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 2356
    invoke-virtual {v0, p1, p2}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public PDFGetScale()F
    .locals 1

    .line 2430
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 2431
    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetScale()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public PDFGetX()F
    .locals 1

    .line 2442
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v0

    int-to-float v0, v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public PDFGetY()F
    .locals 1

    .line 2446
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v0

    int-to-float v0, v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public PDFGetZoom()F
    .locals 1

    .line 2472
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetZoom()F

    move-result v0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public PDFGotoPage(I)V
    .locals 2

    .line 1630
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-nez v0, :cond_0

    return-void

    .line 1631
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetHeight()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetWidth()I

    move-result v0

    if-gtz v0, :cond_1

    goto :goto_0

    .line 1637
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vGotoPage(I)V

    .line 1638
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 1632
    :cond_2
    :goto_0
    new-instance v0, Lcom/radaee/view/PDFLayout$PDFPos;

    invoke-direct {v0}, Lcom/radaee/view/PDFLayout$PDFPos;-><init>()V

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 1633
    iput p1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    .line 1634
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    const/4 v1, 0x0

    iput v1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    .line 1635
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr p1, v1

    iput p1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    return-void
.end method

.method public PDFIsOpen()Z
    .locals 1

    .line 1678
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;)V
    .locals 2

    const/4 v0, 0x4

    .line 1612
    sget v1, Lcom/radaee/pdf/Global;->readerViewBgColor:I

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/radaee/reader/PDFLayoutView;->PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;II)V

    return-void
.end method

.method public PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;II)V
    .locals 0

    .line 1601
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    .line 1602
    iput-object p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    .line 1603
    iput p3, p0, Lcom/radaee/reader/PDFLayoutView;->page_gap:I

    .line 1604
    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    invoke-virtual {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->PDFSetView(I)V

    .line 1605
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iput p4, p1, Lcom/radaee/view/PDFLayout;->m_back_color:I

    return-void
.end method

.method public PDFPerformAnnot()V
    .locals 0

    .line 2301
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->executeAnnotation()Z

    return-void
.end method

.method public PDFRedo()V
    .locals 0

    return-void
.end method

.method public PDFRemoveAnnot()V
    .locals 2

    .line 2132
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_2

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFCanSave()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2134
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    .line 2135
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2137
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 2139
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->RemoveFromPage()Z

    const/4 v0, 0x0

    .line 2140
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 2141
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 2142
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v0, :cond_1

    .line 2143
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2144
    :cond_1
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFEndAnnot()V

    :cond_2
    :goto_0
    return-void
.end method

.method public PDFRestoreView()V
    .locals 10

    .line 1538
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_view_mode:I

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x6

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-eq v0, v4, :cond_5

    if-eq v0, v3, :cond_4

    if-eq v0, v2, :cond_2

    if-eq v0, v1, :cond_0

    .line 1573
    new-instance v0, Lcom/radaee/view/PDFLayoutVert;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/radaee/view/PDFLayoutVert;-><init>(Landroid/content/Context;)V

    .line 1574
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    goto :goto_2

    .line 1555
    :cond_0
    new-instance v0, Lcom/radaee/view/PDFLayoutDual;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v0, v7}, Lcom/radaee/view/PDFLayoutDual;-><init>(Landroid/content/Context;)V

    .line 1556
    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v7

    new-array v8, v7, [Z

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v7, :cond_1

    .line 1559
    aput-boolean v4, v8, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 1562
    :cond_1
    sget-boolean v4, Lcom/radaee/pdf/Global;->rtol:Z

    invoke-virtual {v0, v5, v8, v4, v6}, Lcom/radaee/view/PDFLayoutDual;->vSetLayoutPara([Z[ZZZ)V

    .line 1563
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    goto :goto_2

    .line 1543
    :cond_2
    new-instance v0, Lcom/radaee/view/PDFLayoutDual;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/radaee/view/PDFLayoutDual;-><init>(Landroid/content/Context;)V

    .line 1544
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v4}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v4

    new-array v7, v4, [Z

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v4, :cond_3

    .line 1547
    aput-boolean v6, v7, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1550
    :cond_3
    sget-boolean v4, Lcom/radaee/pdf/Global;->rtol:Z

    invoke-virtual {v0, v5, v7, v4, v6}, Lcom/radaee/view/PDFLayoutDual;->vSetLayoutPara([Z[ZZZ)V

    .line 1551
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    goto :goto_2

    .line 1567
    :cond_4
    new-instance v0, Lcom/radaee/view/PDFLayoutDual;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/radaee/view/PDFLayoutDual;-><init>(Landroid/content/Context;)V

    .line 1568
    sget-boolean v4, Lcom/radaee/pdf/Global;->rtol:Z

    invoke-virtual {v0, v5, v5, v4, v6}, Lcom/radaee/view/PDFLayoutDual;->vSetLayoutPara([Z[ZZZ)V

    .line 1569
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    goto :goto_2

    .line 1540
    :cond_5
    new-instance v0, Lcom/radaee/view/PDFLayoutHorz;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/radaee/view/PDFLayoutHorz;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    .line 1578
    :goto_2
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0, v4, p0}, Lcom/radaee/view/PDFLayout;->vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFLayout$LayoutListener;)V

    .line 1579
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    sget-object v4, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-eq v0, v4, :cond_6

    .line 1580
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v4}, Lcom/radaee/view/PDFLayout;->vSetBmpFormat(Landroid/graphics/Bitmap$Config;)V

    .line 1581
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    .line 1583
    :cond_6
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getWidth()I

    move-result v0

    if-lez v0, :cond_a

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getHeight()I

    move-result v0

    if-lez v0, :cond_a

    .line 1584
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getHeight()I

    move-result v7

    invoke-virtual {v0, v4, v7}, Lcom/radaee/view/PDFLayout;->vResize(II)V

    .line 1585
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    if-eqz v0, :cond_7

    .line 1586
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v1, v6, v6, v0}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    .line 1587
    iput-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 1588
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    goto :goto_5

    .line 1589
    :cond_7
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_save_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    if-eqz v0, :cond_a

    .line 1590
    iget v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_view_mode:I

    if-eq v4, v2, :cond_9

    if-eq v4, v1, :cond_9

    if-ne v4, v3, :cond_8

    goto :goto_3

    .line 1593
    :cond_8
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v1, v6, v6, v0}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    goto :goto_4

    .line 1591
    :cond_9
    :goto_3
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v0, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v1, v0}, Lcom/radaee/view/PDFLayout;->vGotoPage(I)V

    .line 1594
    :goto_4
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vMoveEnd()V

    .line 1597
    :cond_a
    :goto_5
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public PDFSave()Z
    .locals 1

    .line 2731
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->Save()Z

    move-result v0

    return v0
.end method

.method public PDFSaveView()V
    .locals 4

    .line 1523
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getWidth()I

    move-result v0

    .line 1524
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getHeight()I

    move-result v1

    .line 1525
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    shr-int/lit8 v0, v0, 0x1

    shr-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_save_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    goto :goto_0

    .line 1526
    :cond_0
    iput-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_save_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    :goto_0
    const/4 v0, 0x2

    .line 1527
    invoke-virtual {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->PDFSetEditbox(I)V

    .line 1528
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_1

    .line 1530
    iput-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    .line 1531
    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vClose()V

    :cond_1
    return-void
.end method

.method public PDFScrolltoPage(I)V
    .locals 2

    .line 1644
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-nez v0, :cond_0

    return-void

    .line 1645
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetHeight()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vGetWidth()I

    move-result v0

    if-gtz v0, :cond_1

    goto :goto_0

    .line 1651
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vScrolltoPage(I)V

    .line 1652
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 1646
    :cond_2
    :goto_0
    new-instance v0, Lcom/radaee/view/PDFLayout$PDFPos;

    invoke-direct {v0}, Lcom/radaee/view/PDFLayout$PDFPos;-><init>()V

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 1647
    iput p1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    .line 1648
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    const/4 v1, 0x0

    iput v1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    .line 1649
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr p1, v1

    iput p1, v0, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    return-void
.end method

.method public PDFSetArrow(I)V
    .locals 1

    const/4 v0, 0x1

    .line 1969
    invoke-virtual {p0, p1, v0}, Lcom/radaee/reader/PDFLayoutView;->PDFSetLineOrArrow(IZ)V

    return-void
.end method

.method public PDFSetAttachment(Ljava/lang/String;)Z
    .locals 3

    .line 1720
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v2, 0x4

    .line 1722
    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-virtual {v0, p1, v1, v2}, Lcom/radaee/pdf/Page;->AddAnnotAttachment(Ljava/lang/String;I[F)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1723
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_0

    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 1724
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    return p1

    :cond_1
    return v1

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public PDFSetBmpFormat(Landroid/graphics/Bitmap$Config;)V
    .locals 1

    .line 1620
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 1621
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_1

    .line 1622
    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vSetBmpFormat(Landroid/graphics/Bitmap$Config;)V

    .line 1623
    sget-object p1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    .line 1624
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 1625
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    if-eq v0, p1, :cond_2

    .line 1626
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    :cond_2
    :goto_0
    return-void
.end method

.method public PDFSetEditbox(I)V
    .locals 0

    return-void
.end method

.method public PDFSetEllipse(I)V
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p1

    if-nez v1, :cond_0

    const/4 v1, 0x5

    .line 1841
    iput v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void

    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v4, :cond_7

    .line 1844
    iget-object v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v1, :cond_6

    .line 1845
    array-length v1, v1

    .line 1847
    new-instance v5, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;

    invoke-direct {v5, v0, v1}, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;-><init>(Lcom/radaee/reader/PDFLayoutView;I)V

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v1, :cond_4

    .line 1849
    iget-object v7, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v9, v8, v6

    float-to-int v9, v9

    add-int/lit8 v10, v6, 0x1

    aget v8, v8, v10

    float-to-int v8, v8

    invoke-virtual {v7, v9, v8}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v7

    .line 1850
    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v7, v7, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v8, v7}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v7

    .line 1851
    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 1853
    invoke-virtual {v8}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1854
    iget-object v9, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v9}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v9

    int-to-float v9, v9

    iget-object v11, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v11}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v7, v9, v11}, Lcom/radaee/view/VPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v9

    const/4 v11, 0x4

    .line 1855
    new-array v11, v11, [F

    .line 1856
    iget-object v12, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v13, v12, v6

    add-int/lit8 v14, v6, 0x2

    aget v15, v12, v14

    const/16 v16, 0x2

    cmpl-float v17, v13, v15

    if-lez v17, :cond_1

    .line 1857
    aput v15, v11, v3

    .line 1858
    aget v13, v12, v6

    aput v13, v11, v16

    goto :goto_1

    .line 1860
    :cond_1
    aput v13, v11, v3

    .line 1861
    aget v13, v12, v14

    aput v13, v11, v16

    .line 1863
    :goto_1
    aget v13, v12, v10

    add-int/lit8 v14, v6, 0x3

    aget v15, v12, v14

    const/16 v16, 0x3

    cmpl-float v17, v13, v15

    if-lez v17, :cond_2

    .line 1864
    aput v15, v11, v4

    .line 1865
    aget v10, v12, v10

    aput v10, v11, v16

    goto :goto_2

    .line 1867
    :cond_2
    aput v13, v11, v4

    .line 1868
    aget v10, v12, v14

    aput v10, v11, v16

    .line 1870
    :goto_2
    invoke-virtual {v9, v11}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    .line 1871
    sget v10, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v7, v10}, Lcom/radaee/view/VPage;->ToPDFSize(F)F

    move-result v10

    sget v12, Lcom/radaee/pdf/Global;->inkColor:I

    sget v13, Lcom/radaee/pdf/Global;->fillColor:I

    invoke-virtual {v8, v11, v10, v12, v13}, Lcom/radaee/pdf/Page;->AddAnnotEllipse([FFII)Z

    .line 1872
    invoke-virtual {v9}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 1873
    invoke-virtual {v8}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v9

    sub-int/2addr v9, v4

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v9

    invoke-direct {v0, v9}, Lcom/radaee/reader/PDFLayoutView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 1876
    invoke-virtual {v8}, Lcom/radaee/pdf/Page;->Close()V

    .line 1877
    invoke-virtual {v5, v7}, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->Insert(Lcom/radaee/view/VPage;)V

    :cond_3
    add-int/lit8 v6, v6, 0x4

    goto/16 :goto_0

    :cond_4
    const/4 v1, 0x0

    .line 1880
    :goto_3
    iget v4, v5, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages_cnt:I

    if-ge v1, v4, :cond_6

    .line 1881
    iget-object v4, v5, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v1

    .line 1882
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6, v4}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 1883
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v6, :cond_5

    .line 1884
    invoke-virtual {v4}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v4

    invoke-interface {v6, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 1887
    :cond_6
    iput v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1888
    iput-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 1889
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 1892
    :cond_7
    iput v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1893
    iput-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 1894
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public PDFSetInk(I)V
    .locals 5

    if-nez p1, :cond_0

    const/4 p1, 0x3

    .line 1732
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1733
    new-instance p1, Lcom/radaee/pdf/Ink;

    sget v0, Lcom/radaee/pdf/Global;->inkWidth:F

    sget v1, Lcom/radaee/pdf/Global;->inkColor:I

    invoke-direct {p1, v0, v1}, Lcom/radaee/pdf/Ink;-><init>(FI)V

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_3

    .line 1736
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1737
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    if-eqz p1, :cond_1

    .line 1738
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1740
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1741
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v3}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v4}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0, v3, v4}, Lcom/radaee/view/VPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v0

    .line 1742
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {v0, v3}, Lcom/radaee/pdf/Matrix;->TransformInk(Lcom/radaee/pdf/Ink;)V

    .line 1743
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1, v3}, Lcom/radaee/pdf/Page;->AddAnnotInk(Lcom/radaee/pdf/Ink;)Z

    .line 1744
    invoke-virtual {v0}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 1745
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 1748
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 1749
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    .line 1750
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_1

    .line 1751
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 1754
    :cond_1
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/radaee/pdf/Ink;->Destroy()V

    .line 1755
    :cond_2
    iput-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    .line 1756
    iput-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 1757
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 1760
    :cond_3
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1761
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    invoke-virtual {p1}, Lcom/radaee/pdf/Ink;->Destroy()V

    .line 1762
    iput-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_ink:Lcom/radaee/pdf/Ink;

    .line 1763
    iput-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 1764
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public PDFSetLine(I)V
    .locals 1

    const/4 v0, 0x0

    .line 1966
    invoke-virtual {p0, p1, v0}, Lcom/radaee/reader/PDFLayoutView;->PDFSetLineOrArrow(IZ)V

    return-void
.end method

.method public PDFSetLineOrArrow(IZ)V
    .locals 20

    move-object/from16 v0, p0

    move/from16 v1, p1

    if-nez v1, :cond_1

    if-nez p2, :cond_0

    const/4 v1, 0x7

    goto :goto_0

    :cond_0
    const/16 v1, 0x47

    .line 1974
    :goto_0
    iput v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void

    :cond_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v4, :cond_6

    .line 1977
    iget-object v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v1, :cond_5

    .line 1978
    array-length v1, v1

    .line 1982
    new-instance v5, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;

    invoke-direct {v5, v0, v1}, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;-><init>(Lcom/radaee/reader/PDFLayoutView;I)V

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v1, :cond_3

    .line 1984
    iget-object v7, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v9, v8, v6

    float-to-int v9, v9

    add-int/lit8 v10, v6, 0x1

    aget v8, v8, v10

    float-to-int v8, v8

    invoke-virtual {v7, v9, v8}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v7

    .line 1985
    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v7, v7, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v8, v7}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v7

    .line 1986
    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v9, v8, v6

    .line 1987
    aget v10, v8, v10

    const/4 v11, 0x2

    new-array v13, v11, [F

    aput v9, v13, v3

    aput v10, v13, v4

    add-int/lit8 v9, v6, 0x2

    .line 1988
    aget v9, v8, v9

    add-int/lit8 v10, v6, 0x3

    .line 1989
    aget v8, v8, v10

    new-array v14, v11, [F

    aput v9, v14, v3

    aput v8, v14, v4

    .line 1990
    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v12

    if-eqz v12, :cond_2

    .line 1992
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1993
    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v8}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v8

    int-to-float v8, v8

    iget-object v9, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v9}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v7, v8, v9}, Lcom/radaee/view/VPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v8

    .line 1994
    invoke-virtual {v8, v13}, Lcom/radaee/pdf/Matrix;->TransformPoint([F)V

    .line 1995
    invoke-virtual {v8, v14}, Lcom/radaee/pdf/Matrix;->TransformPoint([F)V

    .line 1999
    sget v9, Lcom/radaee/pdf/Global;->inkWidth:F

    .line 2000
    invoke-virtual {v7, v9}, Lcom/radaee/view/VPage;->ToPDFSize(F)F

    move-result v17

    sget v18, Lcom/radaee/pdf/Global;->inkColor:I

    sget v19, Lcom/radaee/pdf/Global;->fillColor:I

    const/4 v15, 0x0

    move/from16 v16, p2

    .line 1997
    invoke-virtual/range {v12 .. v19}, Lcom/radaee/pdf/Page;->AddAnnotLine([F[FIIFII)Z

    .line 2003
    invoke-virtual {v8}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2004
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v8

    sub-int/2addr v8, v4

    invoke-virtual {v12, v8}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v8

    invoke-direct {v0, v8}, Lcom/radaee/reader/PDFLayoutView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2007
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->Close()V

    .line 2008
    invoke-virtual {v5, v7}, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->Insert(Lcom/radaee/view/VPage;)V

    :cond_2
    add-int/lit8 v6, v6, 0x4

    goto/16 :goto_1

    :cond_3
    const/4 v1, 0x0

    .line 2011
    :goto_2
    iget v4, v5, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages_cnt:I

    if-ge v1, v4, :cond_5

    .line 2012
    iget-object v4, v5, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v1

    .line 2013
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6, v4}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 2014
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v6, :cond_4

    .line 2015
    invoke-virtual {v4}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v4

    invoke-interface {v6, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 2018
    :cond_5
    iput v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 2019
    iput-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 2020
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 2023
    :cond_6
    iput v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 2024
    iput-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 2025
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public PDFSetNote(I)V
    .locals 7

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1921
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    .line 1922
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_indecs:[I

    const/4 p1, 0x6

    .line 1923
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void

    :cond_0
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_2

    .line 1926
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    if-eqz p1, :cond_1

    .line 1928
    array-length p1, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_1

    .line 1930
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v4

    invoke-interface {v3, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1934
    :cond_1
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    .line 1935
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_indecs:[I

    .line 1936
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void

    .line 1939
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    if-eqz p1, :cond_5

    .line 1942
    array-length p1, p1

    const/4 v1, 0x0

    :goto_1
    if-ge v1, p1, :cond_4

    .line 1944
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    aget-object v3, v3, v1

    .line 1945
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v3}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v4

    .line 1946
    invoke-virtual {v4}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1947
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_indecs:[I

    aget v5, v5, v1

    .line 1949
    :goto_2
    invoke-virtual {v4, v5}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 1950
    invoke-virtual {v6}, Lcom/radaee/pdf/Page$Annotation;->RemoveFromPage()Z

    goto :goto_2

    .line 1953
    :cond_3
    invoke-virtual {v4}, Lcom/radaee/pdf/Page;->Close()V

    .line 1954
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v4, v3}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1957
    :cond_4
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    .line 1958
    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_indecs:[I

    .line 1959
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 1961
    :cond_5
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void
.end method

.method public PDFSetPolygon(I)V
    .locals 0

    return-void
.end method

.method public PDFSetPolyline(I)V
    .locals 0

    return-void
.end method

.method public final PDFSetPos(Lcom/radaee/view/PDFLayout$PDFPos;II)V
    .locals 1

    .line 2361
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 2362
    invoke-virtual {v0, p2, p3, p1}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    .line 2363
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    :cond_0
    return-void
.end method

.method public PDFSetRect(I)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x4

    if-nez v1, :cond_0

    .line 1781
    iput v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void

    :cond_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v1, v5, :cond_7

    .line 1784
    iget-object v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v1, :cond_6

    .line 1785
    array-length v1, v1

    .line 1787
    new-instance v6, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;

    invoke-direct {v6, v0, v1}, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;-><init>(Lcom/radaee/reader/PDFLayoutView;I)V

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v1, :cond_4

    .line 1789
    iget-object v8, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v9, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v10, v9, v7

    float-to-int v10, v10

    add-int/lit8 v11, v7, 0x1

    aget v9, v9, v11

    float-to-int v9, v9

    invoke-virtual {v8, v10, v9}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v8

    .line 1790
    iget-object v9, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v8, v8, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v9, v8}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v8

    .line 1791
    iget-object v9, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 1793
    invoke-virtual {v9}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1794
    iget-object v10, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v10}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v10

    int-to-float v10, v10

    iget-object v12, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v12}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v8, v10, v12}, Lcom/radaee/view/VPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v10

    .line 1795
    new-array v12, v2, [F

    .line 1796
    iget-object v13, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v14, v13, v7

    add-int/lit8 v15, v7, 0x2

    aget v16, v13, v15

    const/16 v17, 0x2

    cmpl-float v18, v14, v16

    if-lez v18, :cond_1

    .line 1797
    aput v16, v12, v4

    .line 1798
    aget v14, v13, v7

    aput v14, v12, v17

    goto :goto_1

    .line 1800
    :cond_1
    aput v14, v12, v4

    .line 1801
    aget v14, v13, v15

    aput v14, v12, v17

    .line 1803
    :goto_1
    aget v14, v13, v11

    add-int/lit8 v15, v7, 0x3

    aget v16, v13, v15

    const/16 v17, 0x3

    cmpl-float v18, v14, v16

    if-lez v18, :cond_2

    .line 1804
    aput v16, v12, v5

    .line 1805
    aget v11, v13, v11

    aput v11, v12, v17

    goto :goto_2

    .line 1807
    :cond_2
    aput v14, v12, v5

    .line 1808
    aget v11, v13, v15

    aput v11, v12, v17

    .line 1810
    :goto_2
    invoke-virtual {v10, v12}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    .line 1811
    sget v11, Lcom/radaee/pdf/Global;->inkWidth:F

    invoke-virtual {v8, v11}, Lcom/radaee/view/VPage;->ToPDFSize(F)F

    move-result v11

    sget v13, Lcom/radaee/pdf/Global;->inkColor:I

    sget v14, Lcom/radaee/pdf/Global;->fillColor:I

    invoke-virtual {v9, v12, v11, v13, v14}, Lcom/radaee/pdf/Page;->AddAnnotRect([FFII)Z

    .line 1812
    invoke-virtual {v10}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 1813
    invoke-virtual {v9}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v10

    sub-int/2addr v10, v5

    invoke-virtual {v9, v10}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v10

    invoke-direct {v0, v10}, Lcom/radaee/reader/PDFLayoutView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 1816
    invoke-virtual {v6, v8}, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->Insert(Lcom/radaee/view/VPage;)V

    .line 1817
    invoke-virtual {v9}, Lcom/radaee/pdf/Page;->Close()V

    :cond_3
    add-int/lit8 v7, v7, 0x4

    goto/16 :goto_0

    :cond_4
    const/4 v1, 0x0

    .line 1820
    :goto_3
    iget v2, v6, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages_cnt:I

    if-ge v1, v2, :cond_6

    .line 1821
    iget-object v2, v6, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, v1

    .line 1822
    iget-object v5, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v5, v2}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 1823
    iget-object v5, v0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v5, :cond_5

    .line 1824
    invoke-virtual {v2}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v2

    invoke-interface {v5, v2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 1827
    :cond_6
    iput v4, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1828
    iput-object v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 1829
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 1832
    :cond_7
    iput v4, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1833
    iput-object v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 1834
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public PDFSetSelMarkup(I)Z
    .locals 1

    const/4 v0, 0x0

    .line 2322
    invoke-virtual {p0, p1, v0}, Lcom/radaee/reader/PDFLayoutView;->PDFSetSelMarkup(ILjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public PDFSetSelMarkup(ILjava/lang/String;)Z
    .locals 4

    .line 2326
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    if-eqz v0, :cond_3

    invoke-virtual {v0, p1}, Lcom/radaee/view/VSel;->SetSelMarkup(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2328
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual {v0}, Lcom/radaee/view/VSel;->GetPage()Lcom/radaee/pdf/Page;

    move-result-object v0

    .line 2329
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v1

    const/4 v3, 0x1

    sub-int/2addr v1, v3

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-nez p1, :cond_0

    if-eqz v0, :cond_0

    .line 2332
    sget p1, Lcom/radaee/pdf/Global;->highlight_color:I

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    :cond_0
    if-eqz p2, :cond_1

    if-eqz v0, :cond_1

    .line 2335
    invoke-virtual {v0, p2}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    .line 2336
    :cond_1
    invoke-direct {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2338
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {p1, p2}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 2339
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_2

    .line 2340
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {p2}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_2
    const/4 p1, 0x0

    .line 2341
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    .line 2342
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 2343
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return v3

    :cond_3
    return v2
.end method

.method public PDFSetSelect()V
    .locals 4

    .line 1899
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    .line 1900
    sget-boolean v0, Lcom/radaee/pdf/Global;->useSelIcons:Z

    if-eqz v0, :cond_0

    .line 1901
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon1:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1902
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon2:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1903
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon1:Landroid/graphics/Bitmap;

    .line 1904
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon2:Landroid/graphics/Bitmap;

    .line 1906
    :cond_0
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    const/4 v0, 0x0

    .line 1907
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 1908
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void

    .line 1910
    :cond_1
    sget-boolean v0, Lcom/radaee/pdf/Global;->useSelIcons:Z

    if-eqz v0, :cond_2

    .line 1911
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/radaee/viewlib/R$drawable;->pt_start:I

    invoke-static {v0, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon1:Landroid/graphics/Bitmap;

    .line 1912
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/radaee/viewlib/R$drawable;->pt_end:I

    invoke-static {v0, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel_icon2:Landroid/graphics/Bitmap;

    .line 1914
    :cond_2
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 1915
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void
.end method

.method public PDFSetStamp(I)V
    .locals 1

    const/4 v0, 0x0

    .line 2030
    invoke-virtual {p0, p1, v0, v0}, Lcom/radaee/reader/PDFLayoutView;->PDFSetStamp(ILandroid/view/MotionEvent;Landroid/graphics/Bitmap;)Z

    return-void
.end method

.method public PDFSetStamp(ILandroid/view/MotionEvent;Landroid/graphics/Bitmap;)Z
    .locals 20

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p3

    const/4 v3, 0x0

    if-nez v1, :cond_0

    const/16 v1, 0x8

    .line 2036
    iput v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    goto/16 :goto_4

    :cond_0
    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v1, v5, :cond_8

    const/4 v1, 0x4

    .line 2045
    new-array v6, v1, [F

    iput-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 2046
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    aput v7, v6, v3

    .line 2047
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    aput v7, v6, v5

    .line 2048
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    const/high16 v8, 0x42c80000    # 100.0f

    invoke-direct {v0, v8}, Lcom/radaee/reader/PDFLayoutView;->d(F)I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v7, v9

    const/4 v9, 0x2

    aput v7, v6, v9

    .line 2049
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-direct {v0, v8}, Lcom/radaee/reader/PDFLayoutView;->d(F)I

    move-result v8

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    mul-int v8, v8, v10

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    div-int/2addr v8, v10

    int-to-float v8, v8

    add-float/2addr v7, v8

    const/4 v8, 0x3

    aput v7, v6, v8

    .line 2050
    iput-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_icon:Landroid/graphics/Bitmap;

    .line 2051
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v6, v2, v5}, Lcom/radaee/pdf/Document;->NewImage(Landroid/graphics/Bitmap;Z)Lcom/radaee/pdf/Document$DocImage;

    move-result-object v2

    .line 2053
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    if-eqz v6, :cond_6

    if-eqz v2, :cond_6

    .line 2054
    array-length v6, v6

    .line 2056
    new-instance v7, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;

    invoke-direct {v7, v0, v6}, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;-><init>(Lcom/radaee/reader/PDFLayoutView;I)V

    const/4 v10, 0x0

    :goto_0
    if-ge v10, v6, :cond_4

    .line 2058
    iget-object v11, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v12, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v13, v12, v10

    float-to-int v13, v13

    add-int/lit8 v14, v10, 0x1

    aget v12, v12, v14

    float-to-int v12, v12

    invoke-virtual {v11, v13, v12}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v11

    .line 2059
    iget-object v12, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v11, v11, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v12, v11}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v11

    .line 2060
    iget-object v12, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v11}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v12

    if-eqz v12, :cond_3

    .line 2062
    iget-object v13, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v13}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v13

    int-to-float v13, v13

    iget-object v15, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v15}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v11, v13, v15}, Lcom/radaee/view/VPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v13

    .line 2063
    new-array v15, v1, [F

    .line 2064
    iget-object v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    aget v16, v1, v10

    add-int/lit8 v17, v10, 0x2

    aget v18, v1, v17

    cmpl-float v19, v16, v18

    if-lez v19, :cond_1

    .line 2065
    aput v18, v15, v3

    .line 2066
    aget v16, v1, v10

    aput v16, v15, v9

    goto :goto_1

    .line 2068
    :cond_1
    aput v16, v15, v3

    .line 2069
    aget v16, v1, v17

    aput v16, v15, v9

    .line 2071
    :goto_1
    aget v16, v1, v14

    add-int/lit8 v17, v10, 0x3

    aget v18, v1, v17

    cmpl-float v19, v16, v18

    if-lez v19, :cond_2

    .line 2072
    aput v18, v15, v5

    .line 2073
    aget v1, v1, v14

    aput v1, v15, v8

    goto :goto_2

    .line 2075
    :cond_2
    aput v16, v15, v5

    .line 2076
    aget v1, v1, v17

    aput v1, v15, v8

    .line 2078
    :goto_2
    invoke-virtual {v13, v15}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    .line 2079
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2080
    invoke-virtual {v12, v2, v15}, Lcom/radaee/pdf/Page;->AddAnnotBitmap(Lcom/radaee/pdf/Document$DocImage;[F)Z

    .line 2081
    invoke-virtual {v13}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 2082
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v1

    sub-int/2addr v1, v5

    invoke-virtual {v12, v1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/radaee/reader/PDFLayoutView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    .line 2085
    invoke-virtual {v12}, Lcom/radaee/pdf/Page;->Close()V

    .line 2086
    invoke-virtual {v7, v11}, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->Insert(Lcom/radaee/view/VPage;)V

    :cond_3
    add-int/lit8 v10, v10, 0x4

    const/4 v1, 0x4

    goto/16 :goto_0

    :cond_4
    const/4 v1, 0x0

    .line 2089
    :goto_3
    iget v2, v7, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages_cnt:I

    if-ge v1, v2, :cond_6

    .line 2090
    iget-object v2, v7, Lcom/radaee/reader/PDFLayoutView$PDFVPageSet;->pages:[Lcom/radaee/view/VPage;

    aget-object v2, v2, v1

    .line 2091
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6, v2}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 2092
    iget-object v6, v0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v6, :cond_5

    .line 2093
    invoke-virtual {v2}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v2

    invoke-interface {v6, v2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 2096
    :cond_6
    iput v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 2097
    iput-object v4, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 2098
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 2099
    iget-object v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_icon:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_7

    .line 2100
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 2101
    :cond_7
    iput-object v4, v0, Lcom/radaee/reader/PDFLayoutView;->m_icon:Landroid/graphics/Bitmap;

    return v5

    .line 2105
    :cond_8
    iput v3, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 2106
    iput-object v4, v0, Lcom/radaee/reader/PDFLayoutView;->m_rects:[F

    .line 2107
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 2108
    iget-object v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_icon:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_9

    .line 2109
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 2110
    :cond_9
    iput-object v4, v0, Lcom/radaee/reader/PDFLayoutView;->m_icon:Landroid/graphics/Bitmap;

    :goto_4
    return v3
.end method

.method public PDFSetView(I)V
    .locals 11

    .line 1452
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 1453
    invoke-virtual {v0, v1, v1}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v2

    .line 1454
    :goto_0
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_view_mode:I

    .line 1455
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFClose()V

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x6

    const/4 v6, 0x1

    if-eq p1, v6, :cond_6

    if-eq p1, v5, :cond_5

    if-eq p1, v4, :cond_3

    if-eq p1, v3, :cond_1

    .line 1491
    new-instance v6, Lcom/radaee/view/PDFLayoutVert;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/radaee/view/PDFLayoutVert;-><init>(Landroid/content/Context;)V

    .line 1492
    iput-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    goto :goto_3

    .line 1473
    :cond_1
    new-instance v7, Lcom/radaee/view/PDFLayoutDual;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/radaee/view/PDFLayoutDual;-><init>(Landroid/content/Context;)V

    .line 1474
    iget-object v8, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v8

    new-array v9, v8, [Z

    const/4 v10, 0x0

    :goto_1
    if-ge v10, v8, :cond_2

    .line 1477
    aput-boolean v6, v9, v10

    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 1480
    :cond_2
    sget-boolean v6, Lcom/radaee/pdf/Global;->rtol:Z

    invoke-virtual {v7, v2, v9, v6, v1}, Lcom/radaee/view/PDFLayoutDual;->vSetLayoutPara([Z[ZZZ)V

    .line 1481
    iput-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    goto :goto_3

    .line 1461
    :cond_3
    new-instance v6, Lcom/radaee/view/PDFLayoutDual;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/radaee/view/PDFLayoutDual;-><init>(Landroid/content/Context;)V

    .line 1462
    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v7

    new-array v8, v7, [Z

    const/4 v9, 0x0

    :goto_2
    if-ge v9, v7, :cond_4

    .line 1465
    aput-boolean v1, v8, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 1468
    :cond_4
    sget-boolean v7, Lcom/radaee/pdf/Global;->rtol:Z

    invoke-virtual {v6, v2, v8, v7, v1}, Lcom/radaee/view/PDFLayoutDual;->vSetLayoutPara([Z[ZZZ)V

    .line 1469
    iput-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    goto :goto_3

    .line 1485
    :cond_5
    new-instance v6, Lcom/radaee/view/PDFLayoutDual;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/radaee/view/PDFLayoutDual;-><init>(Landroid/content/Context;)V

    .line 1486
    sget-boolean v7, Lcom/radaee/pdf/Global;->rtol:Z

    invoke-virtual {v6, v2, v2, v7, v1}, Lcom/radaee/view/PDFLayoutDual;->vSetLayoutPara([Z[ZZZ)V

    .line 1487
    iput-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    goto :goto_3

    .line 1458
    :cond_6
    new-instance v6, Lcom/radaee/view/PDFLayoutHorz;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/radaee/view/PDFLayoutHorz;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    .line 1496
    :goto_3
    sput p1, Lcom/radaee/pdf/Global;->def_view:I

    .line 1497
    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v7, p0, Lcom/radaee/reader/PDFLayoutView;->page_gap:I

    iput v7, v6, Lcom/radaee/view/PDFLayout;->m_page_gap:I

    .line 1498
    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v6, v7, p0}, Lcom/radaee/view/PDFLayout;->vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/PDFLayout$LayoutListener;)V

    .line 1499
    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    sget-object v7, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-eq v6, v7, :cond_7

    .line 1500
    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v6, v7}, Lcom/radaee/view/PDFLayout;->vSetBmpFormat(Landroid/graphics/Bitmap$Config;)V

    .line 1501
    sget-object v6, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    iput-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    .line 1503
    :cond_7
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getWidth()I

    move-result v6

    if-lez v6, :cond_b

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getHeight()I

    move-result v6

    if-lez v6, :cond_b

    .line 1504
    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getWidth()I

    move-result v7

    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getHeight()I

    move-result v8

    invoke-virtual {v6, v7, v8}, Lcom/radaee/view/PDFLayout;->vResize(II)V

    .line 1505
    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    if-eqz v6, :cond_8

    .line 1506
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1, v1, v1, v6}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    .line 1507
    iput-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 1508
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    goto :goto_6

    :cond_8
    if-eqz v0, :cond_b

    if-eq p1, v4, :cond_a

    if-eq p1, v3, :cond_a

    if-ne p1, v5, :cond_9

    goto :goto_4

    .line 1513
    :cond_9
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1, v1, v1, v0}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    goto :goto_5

    .line 1511
    :cond_a
    :goto_4
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v0, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {p1, v0}, Lcom/radaee/view/PDFLayout;->vGotoPage(I)V

    .line 1514
    :goto_5
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vMoveEnd()V

    .line 1517
    :cond_b
    :goto_6
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public PDFSetZoom(IILcom/radaee/view/PDFLayout$PDFPos;F)V
    .locals 1

    .line 2468
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/radaee/view/PDFLayout;->vZoomSet(IILcom/radaee/view/PDFLayout$PDFPos;F)V

    :cond_0
    return-void
.end method

.method public PDFUndo()V
    .locals 0

    return-void
.end method

.method public PDFUpdateCurrPage()V
    .locals 2

    .line 2450
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_1

    .line 2451
    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 2452
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    iget v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    if-eq v0, v1, :cond_0

    .line 2453
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v1, v1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 2454
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    :cond_1
    return-void
.end method

.method public PDFUpdatePage(I)V
    .locals 1

    .line 2736
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 2737
    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 2738
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return-void
.end method

.method public addFreeText(Landroid/view/MotionEvent;Ljava/lang/String;)V
    .locals 13

    .line 2638
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 2639
    sget v1, Lcom/radaee/pdf/Global;->freeTextSize:F

    .line 2640
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 2641
    invoke-virtual {p0, p2, v0}, Lcom/radaee/reader/PDFLayoutView;->getFreeTextWidth(Ljava/lang/String;Landroid/text/TextPaint;)F

    move-result v0

    const/high16 v2, 0x42d20000    # 105.0f

    mul-float v0, v0, v2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v0, v2

    .line 2642
    invoke-virtual {p0, p2}, Lcom/radaee/reader/PDFLayoutView;->getFreeTextLineCount(Ljava/lang/String;)I

    move-result v3

    .line 2644
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v4, v5, p1}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    .line 2645
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v5, p1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v4, v5}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v4

    .line 2646
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v4}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v4

    invoke-virtual {v5, v4}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v6

    const/4 v4, 0x4

    .line 2648
    new-array v7, v4, [F

    .line 2649
    iget v4, p1, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    const/4 v5, 0x0

    aput v4, v7, v5

    .line 2650
    iget p1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    const/high16 v4, 0x42480000    # 50.0f

    mul-float v4, v4, v1

    div-float/2addr v4, v2

    sub-float/2addr p1, v4

    const/4 v2, 0x1

    aput p1, v7, v2

    .line 2651
    aget v4, v7, v5

    add-float/2addr v4, v0

    const/high16 v0, 0x41000000    # 8.0f

    add-float/2addr v4, v0

    const/4 v0, 0x2

    aput v4, v7, v0

    int-to-float v0, v3

    mul-float v0, v0, v1

    add-float/2addr p1, v0

    const/high16 v0, 0x40800000    # 4.0f

    add-float/2addr p1, v0

    const/4 v0, 0x3

    .line 2652
    aput p1, v7, v0

    .line 2654
    invoke-virtual {v6}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2655
    sget v11, Lcom/radaee/pdf/Global;->freeTextSize:F

    sget v12, Lcom/radaee/pdf/Global;->inkColor:I

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v6 .. v12}, Lcom/radaee/pdf/Page;->AddAnnotEditbox([FIFIFI)Z

    .line 2656
    invoke-virtual {v6}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result p1

    sub-int/2addr p1, v2

    invoke-virtual {v6, p1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 2659
    :cond_0
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    .line 2660
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetEditTextColor(I)Z

    .line 2661
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    .line 2662
    sget v0, Lcom/radaee/pdf/Global;->inkColor:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeColor(I)Z

    .line 2663
    invoke-virtual {p0, p2, p1}, Lcom/radaee/reader/PDFLayoutView;->setEditFontIfHasOtherLetter(Ljava/lang/String;Lcom/radaee/pdf/Page$Annotation;)V

    .line 2665
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFUpdateCurrPage()V

    return-void
.end method

.method public addNoteAtPoint(Landroid/view/MotionEvent;Ljava/lang/String;)Z
    .locals 9

    .line 1368
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v0, v1, p1}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    .line 1369
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget v1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v0

    .line 1370
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    .line 1372
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1373
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    const/4 v4, 0x1

    if-nez v3, :cond_0

    .line 1374
    new-array v3, v4, [Lcom/radaee/view/VPage;

    iput-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    .line 1375
    new-array v5, v4, [I

    iput-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_indecs:[I

    .line 1376
    aput-object v0, v3, v2

    .line 1377
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v3

    aput v3, v5, v2

    goto :goto_3

    .line 1380
    :cond_0
    array-length v3, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_2

    .line 1382
    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    aget-object v6, v6, v5

    if-ne v6, v0, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-lt v5, v3, :cond_4

    add-int/lit8 v5, v3, 0x1

    .line 1387
    new-array v6, v5, [Lcom/radaee/view/VPage;

    .line 1388
    new-array v5, v5, [I

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v3, :cond_3

    .line 1390
    iget-object v8, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    aget-object v8, v8, v7

    aput-object v8, v6, v7

    .line 1391
    iget-object v8, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_indecs:[I

    aget v8, v8, v7

    aput v8, v5, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 1393
    :cond_3
    aput-object v0, v6, v3

    .line 1394
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v7

    aput v7, v5, v3

    .line 1395
    iput-object v6, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_pages:[Lcom/radaee/view/VPage;

    .line 1396
    iput-object v5, p0, Lcom/radaee/reader/PDFLayoutView;->m_note_indecs:[I

    .line 1400
    :cond_4
    :goto_3
    iget v3, p1, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    .line 1401
    iget p1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    const/4 v5, 0x2

    new-array v5, v5, [F

    aput v3, v5, v2

    aput p1, v5, v4

    .line 1402
    invoke-virtual {v1, v5}, Lcom/radaee/pdf/Page;->AddAnnotText([F)Z

    .line 1403
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result p1

    sub-int/2addr p1, v4

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    .line 1404
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onAnnotCreated(Lcom/radaee/pdf/Page$Annotation;)V

    if-eqz p1, :cond_5

    if-eqz p2, :cond_5

    .line 1406
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    .line 1409
    :cond_5
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1, v0}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 1410
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 1411
    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    .line 1413
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_6

    .line 1414
    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_6
    return v4

    :cond_7
    return v2
.end method

.method public computeScroll()V
    .locals 1

    .line 1445
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/view/PDFLayout;->vScrollCompute()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1446
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    :cond_0
    return-void
.end method

.method public delForceSel(Z)V
    .locals 3

    .line 1017
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_start:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1018
    :goto_0
    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_end:I

    iput v2, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_start:I

    .line 1019
    iput v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/4 v1, 0x0

    .line 1020
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->tts_annot_page:Lcom/radaee/view/VPage;

    .line 1021
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->ttsPara:Landroid/graphics/RectF;

    .line 1022
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    if-eqz v2, :cond_1

    .line 1023
    invoke-virtual {v2}, Lcom/radaee/view/VSel;->Clear()V

    .line 1024
    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->tts_sel:Lcom/radaee/view/VSel;

    :cond_1
    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    .line 1027
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    :cond_2
    return-void
.end method

.method public doTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1429
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1430
    :cond_0
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchNone(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    return v1

    .line 1431
    :cond_1
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchZoom(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 1432
    :cond_2
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchSelect(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    .line 1433
    :cond_3
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchInk(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_4

    return v1

    .line 1434
    :cond_4
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchRect(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_5

    return v1

    .line 1435
    :cond_5
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchEllipse(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_6

    return v1

    .line 1436
    :cond_6
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchNote(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_7

    return v1

    .line 1437
    :cond_7
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchLine(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_8

    return v1

    .line 1438
    :cond_8
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchStamp(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_9

    return v1

    .line 1439
    :cond_9
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->onTouchAnnot(Landroid/view/MotionEvent;)Z

    return v1
.end method

.method public executeAnnotation()Z
    .locals 11

    .line 2207
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/16 v1, 0x64

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    goto/16 :goto_1

    .line 2208
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 2209
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-nez v1, :cond_1

    goto/16 :goto_1

    .line 2210
    :cond_1
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 2211
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetDest()I

    move-result v1

    const/4 v3, 0x1

    if-ltz v1, :cond_3

    .line 2213
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->beforePageJump:Lcom/radaee/reader/PDFLayoutView$OnBeforeLinkJump;

    if-eqz v2, :cond_2

    .line 2214
    invoke-interface {v2, v1}, Lcom/radaee/reader/PDFLayoutView$OnBeforeLinkJump;->beforePageJump(I)V

    .line 2215
    :cond_2
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v2, v1}, Lcom/radaee/view/PDFLayout;->vGotoPage(I)V

    .line 2216
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 2217
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return v3

    .line 2220
    :cond_3
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetJS()Ljava/lang/String;

    move-result-object v1

    .line 2221
    sget-boolean v4, Lcom/radaee/pdf/Global;->sExecuteAnnotJS:Z

    if-eqz v4, :cond_4

    .line 2222
    invoke-direct {p0}, Lcom/radaee/reader/PDFLayoutView;->executeAnnotJS()Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v2, 0x1

    .line 2224
    :cond_4
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v4, :cond_5

    if-eqz v1, :cond_5

    .line 2225
    invoke-interface {v4, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenJS(Ljava/lang/String;)V

    .line 2226
    :cond_5
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetURI()Ljava/lang/String;

    move-result-object v1

    .line 2227
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v4, :cond_6

    if-eqz v1, :cond_6

    .line 2228
    invoke-interface {v4, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenURI(Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 2232
    :cond_6
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetMovie()Ljava/lang/String;

    move-result-object v1

    const/16 v4, 0x3a

    .line 2233
    const-string v5, "/"

    const/16 v6, 0x2f

    const/16 v7, 0x5c

    if-eqz v1, :cond_a

    .line 2235
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    if-gez v2, :cond_7

    .line 2236
    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    :cond_7
    if-gez v2, :cond_8

    .line 2237
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 2238
    :cond_8
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/radaee/pdf/Global;->tmp_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2239
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2, v1}, Lcom/radaee/pdf/Page$Annotation;->GetMovieData(Ljava/lang/String;)Z

    .line 2240
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_9

    .line 2241
    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenMovie(Ljava/lang/String;)V

    :cond_9
    const/4 v2, 0x1

    .line 2244
    :cond_a
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetSound()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_e

    const/4 v2, 0x4

    .line 2246
    new-array v2, v2, [I

    .line 2248
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    if-gez v8, :cond_b

    .line 2249
    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    :cond_b
    if-gez v8, :cond_c

    .line 2250
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    .line 2251
    :cond_c
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v10, Lcom/radaee/pdf/Global;->tmp_path:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr v8, v3

    invoke-virtual {v1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2252
    iget-object v8, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v8, v2, v1}, Lcom/radaee/pdf/Page$Annotation;->GetSoundData([ILjava/lang/String;)Z

    .line 2253
    iget-object v8, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v8, :cond_d

    .line 2254
    invoke-interface {v8, v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenSound([ILjava/lang/String;)V

    :cond_d
    const/4 v2, 0x1

    .line 2257
    :cond_e
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetAttachment()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_12

    .line 2260
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    if-gez v2, :cond_f

    .line 2261
    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    :cond_f
    if-gez v2, :cond_10

    .line 2262
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 2263
    :cond_10
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/radaee/pdf/Global;->tmp_path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2264
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2, v1}, Lcom/radaee/pdf/Page$Annotation;->GetAttachmentData(Ljava/lang/String;)Z

    .line 2265
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_11

    .line 2266
    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenAttachment(Ljava/lang/String;)V

    :cond_11
    const/4 v2, 0x1

    .line 2269
    :cond_12
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->Get3D()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_16

    .line 2272
    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    if-gez v2, :cond_13

    .line 2273
    invoke-virtual {v1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    :cond_13
    if-gez v2, :cond_14

    .line 2274
    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 2275
    :cond_14
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/radaee/pdf/Global;->tmp_path:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2276
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2, v1}, Lcom/radaee/pdf/Page$Annotation;->Get3DData(Ljava/lang/String;)Z

    .line 2277
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_15

    .line 2278
    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpen3D(Ljava/lang/String;)V

    :cond_15
    const/4 v2, 0x1

    .line 2282
    :cond_16
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetReset()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 2283
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFCanSave()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 2284
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->SetReset()Z

    .line 2285
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v1, v4}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 2286
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v1, :cond_17

    .line 2287
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v4}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v4

    invoke-interface {v1, v4}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 2289
    :cond_17
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetSubmitTarget()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_18

    .line 2291
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz v2, :cond_19

    .line 2292
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "?"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetSubmitTarget()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFOpenURI(Ljava/lang/String;)V

    goto :goto_0

    :cond_18
    move v3, v2

    .line 2295
    :cond_19
    :goto_0
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    return v3

    :cond_1a
    :goto_1
    return v2
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 2425
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFClose()V

    .line 2426
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public getFreeTextLineCount(Ljava/lang/String;)I
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 2688
    :goto_0
    const-string v3, "\n"

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    add-int/2addr v1, v0

    if-nez v1, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public getFreeTextWidth(Ljava/lang/String;Landroid/text/TextPaint;)F
    .locals 5

    const/high16 v0, -0x40800000    # -1.0f

    const/4 v1, 0x0

    .line 2672
    :goto_0
    const-string v2, "\n"

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 2673
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    goto :goto_1

    :cond_0
    move v4, v2

    .line 2674
    :goto_1
    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v1

    cmpl-float v4, v1, v0

    if-lez v4, :cond_1

    move v0, v1

    :cond_1
    if-ne v2, v3, :cond_2

    return v0

    :cond_2
    add-int/lit8 v1, v2, 0x1

    goto :goto_0
.end method

.method public hasOtherLetter(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2606
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 2607
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->getType(C)I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public isAnnotFreeText(Lcom/radaee/pdf/Page$Annotation;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 516
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isFreeTextAnnot(Lcom/radaee/pdf/Page$Annotation;)Z
    .locals 1

    if-eqz p1, :cond_1

    .line 2697
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 792
    sget-boolean v0, Lcom/radaee/pdf/Global;->textReflow:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 794
    :cond_0
    sget v0, Lcom/radaee/pdf/Global;->pdf_theme:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/radaee/pdf/Global;->dark_mode:Z

    .line 795
    sget v0, Lcom/radaee/pdf/Global;->pdf_theme:I

    if-le v0, v1, :cond_3

    .line 797
    :try_start_0
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getWidth()I

    move-result v0

    .line 798
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->getHeight()I

    move-result v1

    .line 799
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    if-nez v3, :cond_2

    .line 800
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

    .line 801
    new-instance v3, Landroid/graphics/Canvas;

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    .line 803
    :cond_2
    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView;->themeCanvas:Landroid/graphics/Canvas;

    invoke-direct {p0, v3}, Lcom/radaee/reader/PDFLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    .line 804
    new-instance v3, Landroid/graphics/ColorMatrix;

    invoke-direct {v3}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 805
    sget v4, Lcom/radaee/pdf/Global;->pdf_theme:I

    invoke-static {v4}, Lcom/radaee/pdf/Global;->getThemeArray(I)[F

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/ColorMatrix;->set([F)V

    .line 806
    new-instance v4, Landroid/graphics/ColorMatrixColorFilter;

    invoke-direct {v4, v3}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 807
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 808
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 809
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView;->themeBitmap:Landroid/graphics/Bitmap;

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v2, v2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v2, v2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v4, v5, v6, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 814
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 815
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    goto :goto_1

    .line 812
    :catch_1
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    :goto_1
    return-void

    .line 818
    :cond_3
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->doOnDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 1

    .line 575
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    if-eq p1, p3, :cond_2

    if-ne p2, p4, :cond_0

    goto :goto_0

    .line 578
    :cond_0
    iget-object p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz p3, :cond_2

    iget p4, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    const/16 v0, 0x64

    if-eq p4, v0, :cond_2

    if-lez p1, :cond_2

    if-lez p2, :cond_2

    .line 579
    invoke-virtual {p3, p1, p2}, Lcom/radaee/view/PDFLayout;->vResize(II)V

    .line 581
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 582
    iget p1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    .line 583
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    invoke-virtual {p1, p2, p2, p3}, Lcom/radaee/view/PDFLayout;->vSetPos(IILcom/radaee/view/PDFLayout$PDFPos;)V

    const/4 p1, 0x0

    .line 584
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_goto_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 585
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 588
    :cond_1
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Lcom/radaee/view/PDFLayout;->vGetWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    iget-object p4, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p4}, Lcom/radaee/view/PDFLayout;->vGetHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p2, p2}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p2

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, p3, p4, p2, v0}, Lcom/radaee/view/PDFLayout;->vZoomSet(IILcom/radaee/view/PDFLayout$PDFPos;F)V

    .line 589
    iget p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    invoke-virtual {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->PDFGotoPage(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public refreshPageAsync(I)V
    .locals 1

    .line 2459
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 2460
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFLayout;->vRenderAsync(Lcom/radaee/view/VPage;)V

    :cond_0
    return-void
.end method

.method public setAnnotMenu(Lcom/radaee/annotui/UIAnnotMenu;)V
    .locals 0

    .line 1616
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_aMenu:Lcom/radaee/annotui/UIAnnotMenu;

    return-void
.end method

.method public setEditFontIfHasOtherLetter(Ljava/lang/String;Lcom/radaee/pdf/Page$Annotation;)V
    .locals 0

    .line 2601
    invoke-virtual {p0, p1}, Lcom/radaee/reader/PDFLayoutView;->hasOtherLetter(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2602
    invoke-virtual {p0, p2}, Lcom/radaee/reader/PDFLayoutView;->setEditFontWithOtherLetter(Lcom/radaee/pdf/Page$Annotation;)V

    :cond_0
    return-void
.end method

.method public setEditFontWithOtherLetter(Lcom/radaee/pdf/Page$Annotation;)V
    .locals 1

    .line 2614
    :try_start_0
    invoke-direct {p0}, Lcom/radaee/reader/PDFLayoutView;->getOtherLetterFont()Lcom/radaee/pdf/Document$DocFont;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2616
    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetEditFont(Lcom/radaee/pdf/Document$DocFont;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 2618
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    return-void
.end method

.method public setForceSel(II)V
    .locals 0

    .line 1011
    iput p1, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_start:I

    .line 1012
    iput p2, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_end:I

    .line 1013
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->postInvalidate()V

    return-void
.end method

.method public setReadOnly(Z)V
    .locals 0

    .line 2464
    iput-boolean p1, p0, Lcom/radaee/reader/PDFLayoutView;->mReadOnly:Z

    return-void
.end method

.method public toPDFRect([F)[F
    .locals 3

    .line 2721
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz v0, :cond_0

    .line 2722
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->PDFGetCurrPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v0

    .line 2723
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v1}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v2}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/radaee/view/VPage;->CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;

    move-result-object v0

    .line 2724
    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Matrix;->TransformRect([F)V

    :cond_0
    return-object p1
.end method

.method public updateFreeText(Lcom/radaee/pdf/Page$Annotation;Ljava/lang/String;)V
    .locals 0

    .line 2706
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    .line 2707
    invoke-virtual {p0, p2, p1}, Lcom/radaee/reader/PDFLayoutView;->setEditFontIfHasOtherLetter(Ljava/lang/String;Lcom/radaee/pdf/Page$Annotation;)V

    .line 2708
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetFillColor()I

    move-result p2

    if-eqz p2, :cond_0

    .line 2709
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetFillColor()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetEditTextColor(I)Z

    :cond_0
    const/4 p2, 0x0

    .line 2710
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    .line 2711
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeColor(I)Z

    return-void
.end method

.method public zSetSelect(ZZIIIILcom/radaee/reader/PDFLayoutView$OnAfterSelect;)V
    .locals 6

    .line 1035
    iget v0, p0, Lcom/radaee/reader/PDFLayoutView;->force_sel_start:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    .line 1036
    invoke-virtual {p0, v0}, Lcom/radaee/reader/PDFLayoutView;->delForceSel(Z)V

    :cond_0
    const/4 v0, 0x2

    .line 1039
    iput v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    int-to-float p3, p3

    .line 1040
    iput p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    int-to-float p3, p4

    .line 1041
    iput p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    .line 1042
    iget-object p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    if-eqz p3, :cond_1

    if-eqz p1, :cond_4

    :cond_1
    if-eqz p3, :cond_2

    .line 1044
    invoke-virtual {p3}, Lcom/radaee/view/VSel;->Clear()V

    const/4 p1, 0x0

    .line 1045
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    .line 1047
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_x:F

    float-to-int p3, p3

    iget p4, p0, Lcom/radaee/reader/PDFLayoutView;->m_hold_y:F

    float-to-int p4, p4

    invoke-virtual {p1, p3, p4}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    if-nez p1, :cond_3

    goto/16 :goto_0

    .line 1050
    :cond_3
    iget-object p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget p1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {p3, p1}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 1051
    new-instance p1, Lcom/radaee/view/VSel;

    iget-object p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object p4, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget p4, p4, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {p3, p4}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p3

    invoke-direct {p1, p3}, Lcom/radaee/view/VSel;-><init>(Lcom/radaee/pdf/Page;)V

    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    .line 1054
    :cond_4
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v2, p1, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    int-to-float p3, p5

    iget-object p4, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    .line 1055
    invoke-virtual {p4}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result p4

    int-to-float p4, p4

    invoke-virtual {p1, p3, p4}, Lcom/radaee/view/VPage;->ToPDFX(FF)F

    move-result v3

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    int-to-float p3, p6

    iget-object p4, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    .line 1056
    invoke-virtual {p4}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result p4

    int-to-float p4, p4

    invoke-virtual {p1, p3, p4}, Lcom/radaee/view/VPage;->ToPDFY(FF)F

    move-result v4

    move v5, p2

    .line 1054
    invoke-virtual/range {v0 .. v5}, Lcom/radaee/view/VSel;->SetSel(FFFFZ)V

    .line 1057
    invoke-virtual {p0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 1058
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_listener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    if-eqz p1, :cond_5

    .line 1059
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual {p2}, Lcom/radaee/view/VSel;->GetSelString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFSelectEnd(Ljava/lang/String;)V

    :cond_5
    if-eqz p7, :cond_6

    .line 1063
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result p1

    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p2}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result p2

    sub-int/2addr p1, p2

    .line 1064
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p2}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result p4

    invoke-virtual {p3, p4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p3

    invoke-virtual {p2, p3}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result p2

    iget-object p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p3}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result p3

    sub-int/2addr p2, p3

    .line 1065
    iget-object p3, p0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p3}, Lcom/radaee/view/PDFLayout;->vGetScale()F

    move-result p3

    .line 1066
    iget-object p4, p0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object p5, p0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {p5}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result p5

    invoke-virtual {p4, p5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p4

    .line 1067
    iget-object p5, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    invoke-virtual {p5}, Lcom/radaee/view/VSel;->GetSelString()Ljava/lang/String;

    move-result-object v1

    iget-object p5, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    iget v2, p5, Lcom/radaee/view/VSel;->m_index1:I

    iget-object p5, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    iget v3, p5, Lcom/radaee/view/VSel;->m_index2:I

    iget-object p5, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    .line 1069
    invoke-virtual {p5, p3, p4, p1, p2}, Lcom/radaee/view/VSel;->GetRect1(FFII)[I

    move-result-object v4

    iget-object p5, p0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    .line 1070
    invoke-virtual {p5, p3, p4, p1, p2}, Lcom/radaee/view/VSel;->GetRect2(FFII)[I

    move-result-object v5

    move-object v0, p7

    .line 1067
    invoke-interface/range {v0 .. v5}, Lcom/radaee/reader/PDFLayoutView$OnAfterSelect;->onAfterSelect(Ljava/lang/String;II[I[I)V

    :cond_6
    :goto_0
    return-void
.end method
